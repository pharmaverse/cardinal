#' FDA Table 33: Percentage of Patients Meeting Specific Hypotension Levels Postbaseline,
#'   Safety Population, Pooled Analysis
#'
#' @details
#' * `advs` must contain `SAFFL`, `USUBJID`, `AVISITN`, `PARAMCD`, `AVAL`, `AVALU`, and the variable
#'   specified by `arm_var`.
#' * If specified, `alt_counts_df` must contain variables `SAFFL` and `USUBJID`, and the variable
#'   specified by `arm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table for non-numeric variables represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are not removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' advs <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "advs")
#'
#' tbl <- make_table_33(advs = advs, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_33 <- function(advs,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          lbl_overall = NULL,
                          prune_0 = FALSE,
                          annotations = NULL) {
  checkmate::assert_subset(c("SAFFL", "USUBJID", "AVISITN", "PARAMCD", "AVAL", "AVALU"), names(advs))
  assert_flag_variables(advs, "SAFFL")

  advs <- advs %>%
    filter(
      SAFFL == "Y",
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

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(advs[, c("SBP90", "DBP60")])
    ) %>%
    append_topleft(c("Blood Pressure", paste0("(", unique(advs$AVALU)[1], ")")))

  tbl <- build_table(lyt, df = advs, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
