#' FDA Table 9: Patients With Serious Adverse Events by System Organ Class and Preferred Term,
#'   Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain `SAFFL`, `USUBJID`, `AESER`, `AESOC`, and the variables specified
#'   by `pref_var` and `arm_var`.
#' * If specified, `alt_counts_df` must contain `SAFFL`, `USUBJID`, and the variable specified by `arm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#'
#' tbl <- make_table_09(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_09 <- function(adae,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          pref_var = "AETERM",
                          lbl_pref_var = formatters::var_labels(adae, fill = TRUE)[pref_var],
                          lbl_overall = NULL,
                          prune_0 = TRUE,
                          annotations = NULL) {
  checkmate::assert_subset(c("SAFFL", "USUBJID", "AESER", "AESOC", arm_var, pref_var), names(adae))
  assert_flag_variables(adae, "SAFFL")

  adae <- adae %>%
    filter(SAFFL == "Y", AESER == "Y") %>%
    df_explicit_na()

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    analyze_num_patients(
      vars = "USUBJID",
      .stats = "unique",
      .labels = c(unique = "Any SAE")
    ) %>%
    split_rows_by(
      var = "AESOC",
      split_fun = drop_split_levels,
      split_label = "System Organ Class",
      label_pos = "topleft"
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = "unique",
      .labels = c(unique = NULL)
    ) %>%
    count_occurrences(vars = pref_var) %>%
    append_topleft(paste(" ", lbl_pref_var))

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
