#' FDA Table 32: Percentage of Patients With Maximum Diastolic Blood Pressure by Category of Blood Pressure
#'   Postbaseline, Safety Population, Pooled Analysis
#'
#' @details
#' * `advs` must contain `AVISITN`, `PARAMCD`, `AVAL`, `AVALU`, and the variables specified by
#'   `arm_var`, `id_var`, and `saffl_var`.
#' * If specified, `alt_counts_df` must contain the variables specified by `arm_var`, `id_var`, and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are not removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @name make_table_32
NULL

#' @describeIn make_table_32 Create FDA table 32 using functions from `rtables` and `tern`.
#'
#' @return
#' * `make_table_32` returns an `rtables` table object.
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' tbl <- make_table_32(advs = advs, alt_counts_df = adsl)
#' tbl
#'
#' @export
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
  checkmate::assert_subset(c(
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

#' @describeIn make_table_32 Create FDA table 32 using functions from `gtsummary`.
#'
#' @return
#' * `make_table_32_gtsum` returns a `gt` object
#'
#' @examples
#' tbl <- make_table_32_gtsum(advs = advs)
#' tbl
#'
#' @export
make_table_32_gtsum <- function(advs,
                                alt_counts_df = NULL,
                                id_var = "USUBJID",
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                lbl_overall = NULL) {

  checkmate::assert_subset(c(
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
  }
  else {
    advs <- advs
  }

  advs <- advs %>%
    mutate(
      L60f   = case_when(MAX_DIABP < 60   ~ "true", TRUE ~ "false"),
      G60f   = case_when(MAX_DIABP > 60   ~ "true", TRUE ~ "false"),
      G90f   = case_when(MAX_DIABP > 90   ~ "true", TRUE ~ "false"),
      G110f  = case_when(MAX_DIABP > 110  ~ "true", TRUE ~ "false"),
      GE120f = case_when(MAX_DIABP >= 120 ~ "true", TRUE ~ "false")
    ) %>%
    mutate(
      L60   = with_label(L60f   == "true", "<60"),
      G60   = with_label(G60f   == "true", ">60"),
      G90   = with_label(G90f   == "true", ">90"),
      G110  = with_label(G110f  == "true", ">110"),
      GE120 = with_label(GE120f == "true", ">=120")
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
