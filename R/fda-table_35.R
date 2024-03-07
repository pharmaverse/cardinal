#' Table 35. Patients With Adverse Events by System Organ Class,
#'   Safety Population, Pooled Analysis (or Trial X)
#'
#' @details
#' * `adae` must contain the variables specified by
#'   `arm_var`, `id_var`, `soc_var` and `saffl_var`.
#' * If specified, `alt_counts_df` must contain the variables specified by `arm_var`, `id_var`, and `saffl_var`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' adae <- random.cdisc.data::cadae
#'
#' tbl <- make_table_35(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_35 <- function(adae,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          soc_var = "AESOC",
                          lbl_soc_var = formatters::var_labels(adae, fill = TRUE)[soc_var],
                          lbl_overall = NULL,
                          risk_diff = NULL,
                          prune_0 = FALSE,
                          annotations = NULL) {
  checkmate::assert_subset(c(soc_var, arm_var, id_var, saffl_var), names(adae))
  assert_flag_variables(adae, saffl_var)

  adae <- adae %>%
    filter(.data[[saffl_var]] == "Y") %>%
    arrange(soc_var) %>%
    df_explicit_na()

  alt_counts_df <-
    alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    count_occurrences(
      vars = soc_var,
      drop = FALSE,
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_topleft(c("", lbl_soc_var))

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df) %>%
    sort_at_path(
      path = c(soc_var),
      scorefun = score_occurrences_cols(col_names = levels(adae[[arm_var]]))
    )
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
