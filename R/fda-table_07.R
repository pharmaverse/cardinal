#' FDA Table 7: Deaths, Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain `SAFFL`, `USUBJID`, `TRTEMFL`, `DTHFL`, `DTHCAUS`, and the variable specified by `arm_var`.
#' * If specified, `alt_counts_df` must contain `SAFFL`, `USUBJID`, and the variable specified by `arm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N` for category summary rows and
#'   fraction of `n` (number of patients in current category) for all other rows.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @return An `rtable` object.
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#'
#' set.seed(1)
#' adae$TRTEMFL <- ifelse(
#'   adae$USUBJID %in% sample(adsl$USUBJID, size = as.integer(nrow(adsl) / 3)), "N", "Y"
#' )
#'
#' tbl <- make_table_07(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_07 <- function(adae,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          lbl_overall = NULL,
                          risk_diff = NULL,
                          prune_0 = TRUE,
                          na_level = "MISSING",
                          annotations = NULL) {
  checkmate::assert_subset(c(
    "SAFFL", "USUBJID", "TRTEMFL", "DTHFL", "DTHCAUS", arm_var
  ), names(adae))
  assert_flag_variables(adae, c("SAFFL", "TRTEMFL", "DTHFL"), na_level = na_level)

  adae <- adae %>%
    filter(SAFFL == "Y", DTHFL == "Y") %>%
    mutate(
      TRTEMFL = ifelse(TRTEMFL == "Y", "Y", "N") %>% factor(levels = c("Y", "N")),
      trtem_lab = ifelse(TRTEMFL == "Y", "Treatment-emergent deaths", "Nontreatment-emergent deaths")
    ) %>%
    df_explicit_na(na_level = na_level)

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    split_rows_by(
      "TRTEMFL",
      labels_var = "trtem_lab",
      split_fun = add_overall_level("Total deaths")
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      riskdiff = !is.null(risk_diff),
      .stats = "unique",
      .labels = c(unique = NULL)
    ) %>%
    count_occurrences(
      vars = "DTHCAUS",
      denom = "n",
      drop = FALSE,
      riskdiff = !is.null(risk_diff)
    ) %>%
    rtables::append_topleft(c("", "Deaths"))

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
