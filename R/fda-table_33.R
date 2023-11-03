#' FDA Table 33: Percentage of Patients Meeting Specific Hypotension Levels Postbaseline,
#'   Safety Population, Pooled Analysis
#'
#' @details
#' * `advs` must contain `USUBJID`, `AVISITN`, `PARAMCD`, `AVAL`, `AVALU`, and the variables specified by `arm_var`
#'   and `saffl_var`.
#' * If specified, `alt_counts_df` must contain `USUBJID` and the variables specified by `arm_var` and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table for non-numeric variables represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are not removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @return An `rtable` object.
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' tbl <- make_table_33(advs = advs, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_33 <- function(advs,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          lbl_overall = NULL,
                          risk_diff = NULL,
                          prune_0 = FALSE,
                          annotations = NULL) {
  checkmate::assert_subset(c("USUBJID", "AVISITN", "PARAMCD", "AVAL", "AVALU", arm_var, saffl_var), names(advs))
  assert_flag_variables(advs, saffl_var)

  advs <- advs %>%
    filter(
      .data[[saffl_var]] == "Y",
      AVISITN >= 1,
      PARAMCD %in% c("DIABP", "SYSBP")
    ) %>%
    group_by(USUBJID, PARAMCD) %>%
    mutate(
      MAX_DIABP = if_else(PARAMCD == "DIABP", max(AVAL), NA_real_),
      MAX_SYSBP = if_else(PARAMCD == "SYSBP", max(AVAL), NA_real_)
    ) %>%
    ungroup() %>%
    mutate(
      SBP90 = formatters::with_label(PARAMCD == "SYSBP" & MAX_SYSBP < 90, "SBP <90"),
      DBP60 = formatters::with_label(PARAMCD == "DIABP" & MAX_DIABP < 60, "DBP <60")
    )

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = c("SBP90", "DBP60"),
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_topleft(c("Blood Pressure", paste0("(", unique(advs$AVALU)[1], ")")))

  tbl <- build_table(lyt, df = advs, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
