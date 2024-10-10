#' FDA Table 32: Percentage of Patients With Maximum Diastolic Blood Pressure by Category of Blood Pressure
#'   Postbaseline, Safety Population, Pooled Analysis
#'
#' @details
#' * `df` must contain `PARAMCD`, `AVAL`, `AVALU`, and the variables specified by `saffl_var`, `arm_var`, and `id_var`.
#'   `saffl_var` must be a flag variable.
#' * `return_ard` set to `TRUE` or `FALSE`; whether the intermediate ARD object should be returned.
#'
#' @inheritParams tbl_make_table_32
#' @inheritParams argument_convention
#' @param subset (`filter condition`)\cr selection of both PARAMCD and definition of baseline
#'
#' @return A `gtsummary` table and, if `return_ard = TRUE`, an ARD.
#'   If `return_ard = TRUE`, they will be returned as a list with named elements `table` and `ard`.
#'
#' @seealso [`tbl_make_table_32`]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' tbl <- make_table_32(
#'   df = advs,
#'   alt_counts_df = adsl,
#'   subset = (PARAMCD == "DIABP" & AVISITN >= 1)
#' )
#' tbl
#'
#' @export
make_table_32 <- function(df,
                          alt_counts_df = NULL,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          subset,
                          lbl_overall = NULL,
                          return_ard = TRUE) {
  subset <- enquo(subset)

  ard <- ard_table_32(
    df = df,
    alt_counts_df = alt_counts_df,
    id_var = id_var,
    arm_var = arm_var,
    saffl_var = saffl_var,
    subset = !!subset,
    lbl_overall = lbl_overall
  )

  tbl <- make_table_32_gtsummary(
    df = df,
    alt_counts_df = alt_counts_df,
    id_var = id_var,
    arm_var = arm_var,
    saffl_var = saffl_var,
    subset = !!subset,
    lbl_overall = lbl_overall
  )

  if (return_ard) {
    return(list(table = tbl, ard = ard))
  } else {
    return(tbl)
  }
}

#' Make ARD: Table 32
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' ard <- cardinal:::ard_table_32(
#'   df = advs,
#'   alt_counts_df = adsl,
#'   subset = (PARAMCD == "DIABP" & AVISITN >= 1)
#' )
#' ard
#'
#' @keywords internal
#' @name ard_make_table_32
ard_table_32 <- function(df,
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

  df <- df |>
    filter(.data[[saffl_var]] == "Y") |>
    filter(!!subset) |>
    df_explicit_na() |>
    group_by(.data[[id_var]], PARAMCD) |>
    mutate(MAX_DIABP = max(AVAL)) |>
    ungroup() |>
    distinct(.data[[id_var]], .keep_all = TRUE) |>
    select(all_of(id_var), MAX_DIABP, AVALU, all_of(arm_var))

  if (!is.null(alt_counts_df)) {
    adsl <- alt_counts_df |>
      filter(.data[[saffl_var]] == "Y") |>
      select(all_of(id_var), all_of(arm_var), all_of(saffl_var))

    df <- df |> select(!all_of(arm_var))
    df <-
      adsl |>
      left_join(df, by = id_var)
  } else {
    df <- df
  }

  df <- df |>
    mutate(
      L60 = case_when(MAX_DIABP < 60 ~ "true", TRUE ~ "false"),
      G60 = case_when(MAX_DIABP > 60 ~ "true", TRUE ~ "false"),
      G90 = case_when(MAX_DIABP > 90 ~ "true", TRUE ~ "false"),
      G110 = case_when(MAX_DIABP > 110 ~ "true", TRUE ~ "false"),
      GE120 = case_when(MAX_DIABP >= 120 ~ "true", TRUE ~ "false")
    ) |>
    mutate(
      L60 = with_label(L60 == "true", "<60"),
      G60 = with_label(G60 == "true", ">60"),
      G90 = with_label(G90 == "true", ">90"),
      G110 = with_label(G110 == "true", ">110"),
      GE120 = with_label(GE120 == "true", ">=120")
    ) |>
    mutate(
      ARM = as.character(ARM)
    ) |>
    select(L60, G60, G90, G110, GE120, AVALU, arm_var)

  avalu <- unique(df$AVALU)[1]
  df <- df |> select(-AVALU)

  ard <-
    ard_stack(
      data = df,
      .by = arm_var,
      ard_categorical(variables = c("L60", "G60", "G90", "G110", "GE120")),
      .attributes = TRUE
    )

  return(ard)
}





#' Engine-Specific Functions: Table 32
#'
#' The table engine used by each engine-specific function is identified by its suffix.
#'
#' @inheritParams argument_convention
#'
#' @details
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table "Patients Treated" section are the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are not removed by default (see `prune_0` argument).
#' * Records with missing treatment start and/or end datetime are excluded from all calculations.
#'
#' @return
#' * `make_table_32_gtsummary()` returns a `gtsummary` object.
#' * `make_table_32_rtables()` returns an `rtable` object.
#'
#' @seealso [make_table_32()]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' # gtsummary table --------------
#' ard <- cardinal:::ard_table_32(
#'   df = advs,
#'   alt_counts_df = adsl,
#'   subset = (PARAMCD == "DIABP" & AVISITN >= 1)
#' )
#' tbl_gtsummary <- cardinal::make_table_32_gtsummary(
#'   df = advs,
#'   alt_counts_df = adsl,
#'   subset = (PARAMCD == "DIABP" & AVISITN >= 1)
#' )
#' tbl_gtsummary
#'
#' # rtables table ----------------
#' tbl_rtables <- cardinal::make_table_32_rtables(
#'   df = advs,
#'   alt_counts_df = adsl,
#'   subset = (PARAMCD == "DIABP" & AVISITN >= 1)
#' )
#' tbl_rtables
#'
#' @export
#' @name tbl_make_table_32
make_table_32_gtsummary <- function(df,
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

  df <- df |>
    filter(.data[[saffl_var]] == "Y") |>
    filter(!!subset) |>
    df_explicit_na() |>
    group_by(.data[[id_var]], PARAMCD) |>
    mutate(MAX_DIABP = max(AVAL)) |>
    ungroup() |>
    distinct(.data[[id_var]], .keep_all = TRUE) |>
    select(all_of(id_var), MAX_DIABP, AVALU, all_of(arm_var))

  if (!is.null(alt_counts_df)) {
    adsl <- alt_counts_df |>
      filter(.data[[saffl_var]] == "Y") |>
      select(all_of(id_var), all_of(arm_var), all_of(saffl_var))

    df <- df |> select(!all_of(arm_var))
    df <-
      adsl |>
      left_join(df, by = id_var)
  } else {
    df <- df
  }

  df <- df |>
    mutate(
      L60 = case_when(MAX_DIABP < 60 ~ "true", TRUE ~ "false"),
      G60 = case_when(MAX_DIABP > 60 ~ "true", TRUE ~ "false"),
      G90 = case_when(MAX_DIABP > 90 ~ "true", TRUE ~ "false"),
      G110 = case_when(MAX_DIABP > 110 ~ "true", TRUE ~ "false"),
      GE120 = case_when(MAX_DIABP >= 120 ~ "true", TRUE ~ "false")
    ) |>
    mutate(
      L60 = with_label(L60 == "true", "<60"),
      G60 = with_label(G60 == "true", ">60"),
      G90 = with_label(G90 == "true", ">90"),
      G110 = with_label(G110 == "true", ">110"),
      GE120 = with_label(GE120 == "true", ">=120")
    ) |>
    select(L60, G60, G90, G110, GE120, AVALU, arm_var)

  avalu <- unique(df$AVALU)[1]
  df <- df |> select(-AVALU)

  tbl <- df |>
    tbl_summary(
      by = arm_var,
      statistic = list(all_categorical() ~ "{n} ({p}%)"),
      digits = everything() ~ c(0, 1),
      missing = "no"
    ) |>
    modify_header(label ~ paste0("**Diastolic Blood Pressure (", avalu, ")**")) |>
    modify_header(all_stat_cols() ~ "**{level}**  \nN = {n}") |>
    gtsummary::modify_column_alignment(columns = all_stat_cols(), align = "right")

  if (!is.null(lbl_overall)) {
    tbl <- tbl |>
      add_overall(last = TRUE, col_label = paste0("**", lbl_overall, "**  \n N = {n}"))
  }

  tbl <- tbl |> modify_footnote(update = everything() ~ NA)

  gtsummary::with_gtsummary_theme(
    x = gtsummary::theme_gtsummary_compact(),
    expr = as_gt(tbl)
  )
}

#' @export
#' @rdname tbl_make_table_32
make_table_32_rtables <- function(df,
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
  assert_subset(c(
    "PARAMCD", "AVAL", "AVALU", arm_var, id_var, saffl_var
  ), names(df))
  assert_flag_variables(df, saffl_var)

  subset <-
    admiraldev::assert_filter_cond(enexpr(subset), arg_name = "subset")

  df <- df |>
    filter(.data[[saffl_var]] == "Y") |>
    filter(!!subset) |>
    df_explicit_na() |>
    group_by(.data[[id_var]], PARAMCD) |>
    mutate(MAX_DIABP = max(AVAL)) |>
    ungroup() |>
    mutate(
      L60 = with_label(MAX_DIABP < 60, "<60"),
      G60 = with_label(MAX_DIABP > 60, ">60"),
      G90 = with_label(MAX_DIABP > 90, ">90"),
      G110 = with_label(MAX_DIABP > 110, ">110"),
      GE120 = with_label(MAX_DIABP >= 120, ">=120")
    )

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) |>
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) |>
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("L60", "G60", "G90", "G110", "GE120"),
      riskdiff = !is.null(risk_diff)
    ) |>
    append_topleft(c("Diastolic Blood Pressure", paste0("(", unique(df$AVALU)[1], ")")))

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}

#' @keywords Internal
