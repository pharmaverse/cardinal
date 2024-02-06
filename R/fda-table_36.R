#' Table 36. Patients With Adverse Events by System Organ Class and Preferred Term, Safety
#' Population, Pooled Analysis (or Trial X)
#'
#'
#' @details
#' * `adae` must contain the variables specified by `id_var`, `arm_var`, `saffl_var`, `soc_var`,
#'   and `pref_var`.
#' * If specified, `alt_counts_df` must contain the variables specified by `arm_var`, `id_var`, and `saffl_var`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @return
#' * `make_table_36` returns an `rtables` table object.
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' adae <- random.cdisc.data::cadae
#'
#' tbl <- make_table_35(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_36 <- function(
  adae,
  alt_counts_df = NULL,
  show_colcounts = TRUE,
  id_var = "USUBJID",
  arm_var = "ARM",
  saffl_var = "SAFFL",
  soc_var = "AESOC",
  pref_var = "AEDECOD",
  lbl_soc_var = formatters::var_labels(adae, fill = TRUE)[soc_var],
  lbl_overall = NULL,
  risk_diff = NULL,
  prune_0 = FALSE,
  annotations = NULL
) {

  adae <- adae %>%
    filter(.data[[saffl_var]] == "Y") %>%
    df_explicit_na()

  alt_counts_df <- alt_counts_df_preproc(
    alt_counts_df,
    id_var,
    arm_var,
    saffl_var
  )

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    split_rows_by(
      soc_var,
      label_pos = "topleft",
      split_label = lbl_soc_var
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
    )

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
