#' FDA Table 12: Patients With Adverse Events Leading to Treatment Discontinuation
#'   by System Organ Class and Preferred Term, Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain `DCSREAS`, `AESOC`, and the variables specified by `arm_var`, `id_var`, `saffl_var`,
#'   and `pref_var`.
#' * If specified, `alt_counts_df` must contain `USUBJID` and the variables specified by `arm_var` and `saffl_var`.
#' * A patient is defined as having at least one adverse event leading to treatment discontinuation when they have at
#'   least one record with `DCSREAS = "ADVERSE EVENT"`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @return An `rtable` object.
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#' adae$DCSREAS[is.na(adae$DCSREAS)] <- "ADVERSE EVENT"
#'
#' tbl <- make_table_12(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_12 <- function(adae,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          pref_var = "AEDECOD",
                          lbl_overall = NULL,
                          risk_diff = NULL,
                          prune_0 = TRUE,
                          annotations = NULL) {
  checkmate::assert_subset(c(
    "AEBODSYS", "DCSREAS", arm_var, id_var, saffl_var, pref_var
  ), names(adae))
  assert_flag_variables(adae, saffl_var)

  id_dcsae <- adae %>%
    filter(DCSREAS == "ADVERSE EVENT") %>%
    select(all_of(c(id_var))) %>%
    unlist()

  adae <- adae %>%
    filter(.data[[saffl_var]] == "Y", .data[[id_var]] %in% id_dcsae) %>%
    df_explicit_na()

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    analyze_num_patients(
      vars = id_var,
      riskdiff = !is.null(risk_diff),
      .stats = c("unique"),
      .labels = c(unique = "Patients with at least one AE leading to discontinuation")
    ) %>%
    split_rows_by(
      "AEBODSYS",
      label_pos = "topleft",
      split_label = obj_label(adae$AEBODSYS)
    ) %>%
    summarize_num_patients(
      var = id_var,
      riskdiff = !is.null(risk_diff),
      .stats = "unique",
      .labels = c(unique = NULL)
    ) %>%
    count_occurrences(
      vars = pref_var,
      drop = FALSE,
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_varlabels(adae, pref_var, indent = 1L)

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
