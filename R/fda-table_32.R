#' FDA Table 32: Percentage of Patients With Maximum Diastolic Blood Pressure by Category of Blood Pressure
#'   Postbaseline, Safety Population, Pooled Analysis
#'
#' @details
#' * `data` must contain the variables specified by `continuous_vars`, and `categorical_vars`.
#' * `tbl_engine` must be one of `gtsummary`, `rtables`, `tplyr`.
#' * `return_ard` set to `TRUE` or `FALSE`; whether the intermediate ARD object should be returned.
#'
#' @inheritParams argument_convention
#'
#' @name make_table_32
NULL

#' @describeIn make_table_32 Create FDA table 32 using an ARD.
#'
#' @return
#' * `make_table_32` returns an object matching the selected `tbl_engine` argument.
#' The intermediary `ARD` object can also be returned with `return_ard` set to `TRUE`.
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' tbl <- make_table_32(data = advs, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_32 <- function(data,
                          ...,
                          tbl_engine = "gtsummary",
                          return_ard = TRUE) {

  # check data viability
  # assert_subset(categorical_vars, names(data))

  if (tbl_engine == "gtsummary") {
    tbl <- make_table_32_gtsum(...)
    ard <- make_ard_32(...)
  }
  if (tbl_engine == "rtables") {
    ard <- "ARD not available for {rtables}"
    tbl <- make_table_32_rtables(df = data)
  }
  if (tbl_engine == "tplyr") {
    tbl <- make_table_32_tplyr(ard, ...)
  }

  if (return_ard) {
    res <- list(tbl, ard)
  } else {
    res <- tbl
  }

  return(res)
}

#' @keywords Internal
make_ard_32 <- function(df,
                        alt_counts_df = NULL,
                        id_var = "USUBJID",
                        arm_var = "ARM",
                        saffl_var = "SAFFL",
                        lbl_overall = NULL) {

  assert_subset(c(
    saffl_var, "AVISITN", "PARAMCD", "AVAL", "AVALU", arm_var, id_var
  ), names(df))
  assert_flag_variables(df, saffl_var)


  df <- df %>%
    filter(
      .data[[saffl_var]] == "Y",
      AVISITN >= 1,
      PARAMCD == "DIABP"
    ) %>%
    df_explicit_na() %>%
    group_by(.data[[id_var]], PARAMCD) %>%
    mutate(MAX_DIABP = max(AVAL)) %>%
    ungroup() %>%
    distinct(.data[[id_var]], .keep_all = TRUE) %>%
    select(all_of(id_var), MAX_DIABP, AVALU, all_of(arm_var))

  if (!is.null(alt_counts_df)) {
    adsl <- alt_counts_df %>%
      filter(.data[[saffl_var]] == "Y") %>%
      select(all_of(id_var), all_of(arm_var), all_of(saffl_var))

    df <- df %>% select(!all_of(arm_var))
    df <-
      adsl %>%
      left_join(df, by = id_var)
  } else {
    df <- df
  }

  df <- df %>%
    mutate(
      L60 = case_when(MAX_DIABP < 60 ~ "true", TRUE ~ "false"),
      G60 = case_when(MAX_DIABP > 60 ~ "true", TRUE ~ "false"),
      G90 = case_when(MAX_DIABP > 90 ~ "true", TRUE ~ "false"),
      G110 = case_when(MAX_DIABP > 110 ~ "true", TRUE ~ "false"),
      GE120 = case_when(MAX_DIABP >= 120 ~ "true", TRUE ~ "false")
    ) %>%
    mutate(
      L60 = with_label(L60 == "true", "<60"),
      G60 = with_label(G60 == "true", ">60"),
      G90 = with_label(G90 == "true", ">90"),
      G110 = with_label(G110 == "true", ">110"),
      GE120 = with_label(GE120 == "true", ">=120")
    ) %>%
    mutate(
      ARM = as.character(ARM)
    ) %>%
    select(L60, G60, G90, G110, GE120, AVALU, arm_var)

  avalu <- unique(df$AVALU)[1]
  df <- df %>% select(-AVALU)

  ard <-
    ard_stack(
      data = df,
      by = arm_var,
      ard_categorical(variables = c("L60", "G60", "G90", "G110", "GE120")),
      # .attributes = TRUE
    )

  return(ard)
}

#' @keywords Internal
make_table_32 <- function(advs,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          lbl_overall = NULL,
                          risk_diff = NULL,
                          prune_0 = FALSE,
                          annotations = NULL) {
  assert_subset(c(
    "AVISITN", "PARAMCD", "AVAL", "AVALU", arm_var, id_var, saffl_var
  ), names(advs))
  assert_flag_variables(advs, saffl_var)

  advs <- advs %>%
    filter(
      .data[[saffl_var]] == "Y",
      AVISITN >= 1,
      PARAMCD == "DIABP"
    ) %>%
    df_explicit_na() %>%
    group_by(.data[[id_var]], PARAMCD) %>%
    mutate(MAX_DIABP = max(AVAL)) %>%
    ungroup() %>%
    mutate(
      L60 = with_label(MAX_DIABP < 60, "<60"),
      G60 = with_label(MAX_DIABP > 60, ">60"),
      G90 = with_label(MAX_DIABP > 90, ">90"),
      G110 = with_label(MAX_DIABP > 110, ">110"),
      GE120 = with_label(MAX_DIABP >= 120, ">=120")
    )

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("L60", "G60", "G90", "G110", "GE120"),
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_topleft(c("Diastolic Blood Pressure", paste0("(", unique(advs$AVALU)[1], ")")))

  tbl <- build_table(lyt, df = advs, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}

#' @keywords Internal
make_table_32_gtsum <- function(advs,
                                alt_counts_df = NULL,
                                id_var = "USUBJID",
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                lbl_overall = NULL) {
  assert_subset(c(
    saffl_var, "AVISITN", "PARAMCD", "AVAL", "AVALU", arm_var, id_var
  ), names(advs))
  assert_flag_variables(advs, saffl_var)

  advs <- advs %>%
    filter(
      .data[[saffl_var]] == "Y",
      AVISITN >= 1,
      PARAMCD == "DIABP"
    ) %>%
    df_explicit_na() %>%
    group_by(.data[[id_var]], PARAMCD) %>%
    mutate(MAX_DIABP = max(AVAL)) %>%
    ungroup() %>%
    distinct(.data[[id_var]], .keep_all = TRUE) %>%
    select(all_of(id_var), MAX_DIABP, AVALU, all_of(arm_var))

  if (!is.null(alt_counts_df)) {
    adsl <- alt_counts_df %>%
      filter(.data[[saffl_var]] == "Y") %>%
      select(all_of(id_var), all_of(arm_var), all_of(saffl_var))

    advs <- advs %>% select(!all_of(arm_var))
    advs <-
      adsl %>%
      left_join(advs, by = id_var)
  } else {
    advs <- advs
  }

  advs <- advs %>%
    mutate(
      L60 = case_when(MAX_DIABP < 60 ~ "true", TRUE ~ "false"),
      G60 = case_when(MAX_DIABP > 60 ~ "true", TRUE ~ "false"),
      G90 = case_when(MAX_DIABP > 90 ~ "true", TRUE ~ "false"),
      G110 = case_when(MAX_DIABP > 110 ~ "true", TRUE ~ "false"),
      GE120 = case_when(MAX_DIABP >= 120 ~ "true", TRUE ~ "false")
    ) %>%
    mutate(
      L60 = with_label(L60 == "true", "<60"),
      G60 = with_label(G60 == "true", ">60"),
      G90 = with_label(G90 == "true", ">90"),
      G110 = with_label(G110 == "true", ">110"),
      GE120 = with_label(GE120 == "true", ">=120")
    ) %>%
    select(L60, G60, G90, G110, GE120, AVALU, arm_var)

  avalu <- unique(advs$AVALU)[1]
  advs <- advs %>% select(-AVALU)

  tbl <- advs %>%
    tbl_summary(
      by = arm_var,
      statistic = list(all_categorical() ~ "{n} ({p}%)"),
      digits = everything() ~ c(0, 1),
      missing = "no"
    ) %>%
    modify_header(label ~ paste0("**Diastolic Blood Pressure (", avalu, ")**")) %>%
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
