#' FDA Table 12: Patients With Adverse Events Leading to Treatment Discontinuation
#' by System Organ Class and Preferred Term, Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain `SAFFL`, `USUBJID`, `AEACN`, `AESOC`, and the variables specified
#'   by `pref_var` and `arm_var`.
#' * If specified, `alt_counts_df` must contain `SAFFL`, `USUBJID`, and the variable specified by `arm_var`.
#' * the function output `pref_var` with Treatment Discontinuation (`AEACN` = "DRUG WITHDRAWN").
#' * By default, `pref_var` is AEDECOD.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @examples
#' library(dplyr)
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#'
#' tbl <- make_table_12(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_12 <- function(adae,
                          alt_counts_df = adsl,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          pref_var = "AEDECOD",
                          lbl_overall = NULL,
                          prune_0 = TRUE,
                          annotations = NULL
                          ){
  checkmate::assert_subset(c(
    "SAFFL", "USUBJID", "AEBODSYS", pref_var, "AEACN", arm_var), names(adae))
  assert_flag_variables(adae, "SAFFL")

  adae <- adae %>%
    filter(SAFFL == "Y", AEACN == "DRUG WITHDRAWN") %>%
    df_explicit_na()
  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    analyze_num_patients(
      vars = "USUBJID",
      .stats = c("unique"),
      .labels = c(
        unique = "Patients with at least one AE leading to discontinuation"
      )
    ) %>%
    split_rows_by(
      "AEBODSYS",
      label_pos = "topleft",
      split_label = obj_label(adae$AEBODSYS)
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = "unique",
      .labels = c(unique = NULL)
    ) %>%
    count_occurrences(vars = pref_var, drop = FALSE) %>%
    append_varlabels(adae, pref_var, indent = 1L)

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
