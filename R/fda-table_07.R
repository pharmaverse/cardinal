#' FDA Table 7: Deaths, Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain `SAFFL`, `USUBJID`, `TRTEMFL`, `DTHFL`, `DTHCAUS`, and the variable specified by `arm_var`.
#' * If specified, `alt_counts_df` must contain `SAFFL`, `USUBJID`, and the variable specified by `arm_var`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N` for category summary rows and
#'   fraction of `n` (number of patients in current category) for all other rows.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#'
#' set.seed(1)
#' adae$TRTEMFL <- ifelse(adae$USUBJID %in% sample(adsl$USUBJID, size = as.integer(nrow(adsl) / 3)), "N", "Y")
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
                          prune_0 = TRUE,
                          annotations = NULL) {
  checkmate::assert_subset(c(
    "SAFFL", "USUBJID", "TRTEMFL", "DTHFL", "DTHCAUS", arm_var
  ), names(adae))

  adae <- adae %>%
    filter(SAFFL == "Y", DTHFL == "Y") %>%
    mutate(
      TRTEMFL = ifelse(TRTEMFL == "Y", "Y", "N") %>% factor(levels = c("Y", "N")),
      trtem_lab = ifelse(TRTEMFL == "Y", "Treatment-emergent deaths", "Nontreatment-emergent deaths")
    ) %>%
    df_explicit_na(na_level = "MISSING")

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    analyze_num_patients(
      vars = "USUBJID",
      .stats = "unique",
      .labels = c(unique = "Total deaths"),
      show_labels = "hidden"
    ) %>%
    count_occurrences(
      vars = "DTHCAUS",
      .indent_mods = 1,
      denom = "n"
    ) %>%
    split_rows_by("TRTEMFL", labels_var = "trtem_lab") %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = "unique",
      .labels = c(unique = NULL)
    ) %>%
    count_occurrences(
      vars = "DTHCAUS",
      denom = "n",
      drop = FALSE
    ) %>%
    rtables::append_topleft(c("", "Deaths"))

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
