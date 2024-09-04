#' FDA Table 33: Percentage of Patients Meeting Specific Hypotension Levels Postbaseline,
#'   Safety Population, Pooled Analysis
#'
#' @details
#' * `df` must contain `PARAMCD`, `AVAL`, `AVALU`, and the variables specified by `saffl_var`, `arm_var`, and `id_var`.
#'   `saffl_var` must be a flag variable.
#' * `table_engine` must be one of `gtsummary` or `rtables`.
#' * `return_ard` set to `TRUE` or `FALSE`; whether the intermediate ARD object should be returned.
#'
#' @inheritParams argument_convention
#'
#' @param subset (`filter condition`)\cr selection of both PARAMCD and definition of baseline
#'
#' @name make_table_33
NULL

#' @describeIn make_table_33 Create FDA table 33 using an ARD.
#'
#' @return
#' * `make_table_33` returns an object matching the selected `table_engine` argument.
#' The intermediary `ARD` object can also be returned with `return_ard` set to `TRUE`.
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' tbl <- make_table_33(
#'   df = advs,
#'   alt_counts_df = adsl,
#'   table_engine = "gtsummary",
#'   subset = (PARAMCD %in% c("DIABP", "SYSBP") & AVISITN >= 1)
#' )
#' tbl
#'
#' @export
make_table_33 <- function(df,
                          alt_counts_df = NULL,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          subset,
                          lbl_overall = NULL,
                          table_engine = c("rtables", "gtsummary"),
                          return_ard = TRUE,
                          ...) {
  # warnings
  if (is.null(table_engine) && !return_ard) {
    warning(
      "No object returned. Set a value for `table_engine` to return ",
      "a table or `return_ard = TRUE` to return an ARD."
    )
    return(NULL)
  }
  if (!is.null(table_engine)) {
    if (!(table_engine %in% c("gtsummary", "rtables"))) {
      warning("There is currently no `", table_engine, "` function available for FDA table 33.")
    } else {
      table_engine <- match.arg(table_engine)
    }
  }

  subset <- enquo(subset)

  if (return_ard) {
    ard <- make_ard_33(
      df = df,
      alt_counts_df = alt_counts_df,
      id_var = id_var,
      arm_var = arm_var,
      saffl_var = saffl_var,
      subset = !!subset,
      lbl_overall = lbl_overall
    )
    if (is.null(table_engine)) {
      return(ard) # nocov
    }
  }
  if (!is.null(table_engine)) {
    if (table_engine == "gtsummary") {
      tbl <- make_table_33_gtsum(
        df = df,
        alt_counts_df = alt_counts_df,
        id_var = id_var,
        arm_var = arm_var,
        saffl_var = saffl_var,
        subset = !!subset,
        lbl_overall = lbl_overall,
        ...
      )
    }
    if (table_engine == "rtables") {
      tbl <- make_table_33_rtables(
        df = df,
        alt_counts_df = alt_counts_df,
        id_var = id_var,
        arm_var = arm_var,
        saffl_var = saffl_var,
        subset = !!subset,
        lbl_overall = lbl_overall,
        ...
      )
    }
    if (!return_ard) {
      return(tbl) # nocov
    }
  }

  list(table = tbl, ard = ard)
}

#' @keywords Internal
make_ard_33 <- function(df,
                        alt_counts_df = NULL,
                        id_var = "USUBJID",
                        arm_var = "ARM",
                        subset,
                        saffl_var = "SAFFL",
                        lbl_overall = NULL) {
  assert_subset(c(
    saffl_var, "PARAMCD", "AVAL", "AVALU", arm_var, id_var
  ), names(df))
  assert_flag_variables(df, saffl_var)

  subset <-
    admiraldev::assert_filter_cond(enexpr(subset), arg_name = "subset")

  advs_all <- df %>%
    filter(.data[[saffl_var]] == "Y") %>%
    filter(!!subset) %>%
    group_by(.data[[id_var]], PARAMCD) %>%
    mutate(
      MIN_DIABP = if_else(PARAMCD == "DIABP", min(AVAL), NA_real_),
      MIN_SYSBP = if_else(PARAMCD == "SYSBP", min(AVAL), NA_real_)
    ) %>%
    ungroup() %>%
    mutate(
      SBP90 = if_else(MIN_SYSBP < 90, "SBP <90", "Not", missing = "Not"),
      DBP60 = if_else(MIN_DIABP < 60, "DBP <60", "Not", missing = "Not")
    ) %>%
    mutate(
      SBP90 = formatters::with_label(SBP90 == "SBP <90", "SBP <90"),
      DBP60 = formatters::with_label(DBP60 == "DBP <60", "DBP <60")
    )

  advs_diabp <- advs_all %>%
    filter(PARAMCD == "DIABP") %>%
    distinct(.data[[id_var]], .keep_all = TRUE) %>%
    select(all_of(c(id_var, "DBP60", "ARM", "AVALU")))

  advs_sysbp <- advs_all %>%
    filter(PARAMCD == "SYSBP") %>%
    distinct(.data[[id_var]], .keep_all = TRUE) %>%
    select(all_of(c(id_var, "SBP90")))

  advs_combined <-
    full_join(advs_diabp, advs_sysbp, by = id_var) %>%
    select(all_of(c("SBP90", "DBP60", "ARM", "AVALU", id_var, arm_var)))

  if (!is.null(alt_counts_df)) {
    adsl <- alt_counts_df %>%
      filter(.data[[saffl_var]] == "Y") %>%
      select(all_of(c(id_var, arm_var, saffl_var)))

    advs_combined <-
      advs_combined %>%
      select(!all_of(arm_var)) %>%
      right_join(adsl, by = id_var)
  } else {
    advs_combined <- advs_combined
  }


  avalu <- unique(advs_combined$AVALU)[1]
  advs_combined <- advs_combined %>%
    select(SBP90, DBP60, all_of(arm_var))

  ard <-
    ard_stack(
      data = advs_combined,
      .by = arm_var,
      ard_categorical(variables = c("SBP90", "DBP60")),
      .attributes = TRUE
    )

  return(ard)
}

#' @keywords Internal
make_table_33_rtables <- function(df,
                                  alt_counts_df = NULL,
                                  show_colcounts = TRUE,
                                  id_var = "USUBJID",
                                  arm_var = "ARM",
                                  saffl_var = "SAFFL",
                                  subset,
                                  lbl_overall = NULL,
                                  risk_diff = NULL,
                                  prune_0 = FALSE,
                                  annotations = NULL) {
  assert_subset(c("PARAMCD", "AVAL", "AVALU", arm_var, id_var, saffl_var), names(df))
  assert_flag_variables(df, saffl_var)

  subset <-
    admiraldev::assert_filter_cond(enexpr(subset), arg_name = "subset")

  df <- df %>%
    filter(.data[[saffl_var]] == "Y") %>%
    filter(!!subset) %>%
    group_by(.data[[id_var]], PARAMCD) %>%
    mutate(
      MIN_DIABP = if_else(PARAMCD == "DIABP", min(AVAL), NA_real_),
      MIN_SYSBP = if_else(PARAMCD == "SYSBP", min(AVAL), NA_real_)
    ) %>%
    ungroup() %>%
    mutate(
      SBP90 = formatters::with_label(PARAMCD == "SYSBP" & MIN_SYSBP < 90, "SBP <90"),
      DBP60 = formatters::with_label(PARAMCD == "DIABP" & MIN_DIABP < 60, "DBP <60")
    )

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("SBP90", "DBP60"),
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_topleft(c("Blood Pressure", paste0("(", unique(df$AVALU)[1], ")")))

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}

#' @keywords Internal
make_table_33_gtsum <- function(df,
                                alt_counts_df = NULL,
                                id_var = "USUBJID",
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                subset,
                                lbl_overall = NULL) {
  assert_subset(c(
    saffl_var, "PARAMCD", "AVAL", "AVALU", arm_var, id_var
  ), names(df))
  assert_flag_variables(df, saffl_var)

  subset <-
    admiraldev::assert_filter_cond(enexpr(subset), arg_name = "subset")

  advs_all <- df %>%
    filter(.data[[saffl_var]] == "Y") %>%
    filter(!!subset) %>%
    group_by(.data[[id_var]], PARAMCD) %>%
    mutate(
      MIN_DIABP = if_else(PARAMCD == "DIABP", min(AVAL), NA_real_),
      MIN_SYSBP = if_else(PARAMCD == "SYSBP", min(AVAL), NA_real_)
    ) %>%
    ungroup() %>%
    mutate(
      SBP90 = if_else(MIN_SYSBP < 90, "SBP <90", "Not", missing = "Not"),
      DBP60 = if_else(MIN_DIABP < 60, "DBP <60", "Not", missing = "Not")
    ) %>%
    mutate(
      SBP90 = formatters::with_label(SBP90 == "SBP <90", "SBP <90"),
      DBP60 = formatters::with_label(DBP60 == "DBP <60", "DBP <60")
    )

  advs_diabp <- advs_all %>%
    filter(PARAMCD == "DIABP") %>%
    distinct(.data[[id_var]], .keep_all = TRUE) %>%
    select(all_of(c(id_var, "DBP60", "ARM", "AVALU")))

  advs_sysbp <- advs_all %>%
    filter(PARAMCD == "SYSBP") %>%
    distinct(.data[[id_var]], .keep_all = TRUE) %>%
    select(all_of(c(id_var, "SBP90")))

  advs_combined <-
    full_join(advs_diabp, advs_sysbp, by = id_var) %>%
    select(all_of(c("SBP90", "DBP60", "ARM", "AVALU", id_var, arm_var)))

  if (!is.null(alt_counts_df)) {
    adsl <- alt_counts_df %>%
      filter(.data[[saffl_var]] == "Y") %>%
      select(all_of(c(id_var, arm_var, saffl_var)))

    advs_combined <-
      advs_combined %>%
      select(!all_of(arm_var)) %>%
      right_join(adsl, by = id_var)
  } else {
    advs_combined <- advs_combined
  }


  avalu <- unique(advs_combined$AVALU)[1]
  advs_combined <- advs_combined %>%
    select(SBP90, DBP60, all_of(arm_var))

  tbl <- advs_combined %>%
    tbl_summary(
      by = arm_var,
      statistic = list(all_categorical() ~ "{n} ({p}%)"),
      digits = everything() ~ c(0, 1),
      missing = "no"
    ) %>%
    modify_header(label ~ paste0("**Blood Pressure (", avalu, ")**")) %>%
    modify_header(all_stat_cols() ~ "**{level}**  \nN = {n}") %>%
    gtsummary::modify_column_alignment(columns = all_stat_cols(), align = "right")

  if (!is.null(lbl_overall)) {
    tbl <- tbl %>%
      add_overall(last = TRUE, col_label = paste0("**", lbl_overall, "**  \n N = {n}"))
  }

  tbl <- tbl %>% modify_footnote(update = everything() ~ NA)

  gtsummary::with_gtsummary_theme(
    x = gtsummary::theme_gtsummary_compact(),
    expr = as_gt(tbl)
  )
}
