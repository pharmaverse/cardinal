#' FDA Table 2: Baseline Demographic and Clinical Characteristics Safety Population, Pooled Analyses
#'
#' @details
#' * `adsl` must contain `SAFFL` and the variables specified by `vars` and `arm_var`.
#' * If specified, `alt_counts_df` must contain `SAFFL`, `USUBJID`, and the variable specified by `arm_var`.
#' * Columns are split by arm. Overall population column is included by default (see `lbl_overall` argument).
#' * Information from either ADSUB or ADVS is generally included into `adsl` prior to analysis.
#' * Numbers in table for non-numeric variables represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @examples
#' library(dplyr)
#'
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl") %>%
#'   mutate(AGEGR1 = as.factor(case_when(
#'     AGE >= 17 & AGE < 65 ~ ">=17 to <65",
#'     AGE >= 65 ~ ">=65",
#'     AGE >= 65 & AGE < 75 ~ ">=65 to <75",
#'     AGE >= 75 ~ ">=75"
#'   )) %>% formatters::with_label("Age Group, years")) %>%
#'   formatters::var_relabel(
#'     AGE = "Age, years"
#'   )
#'
#' tbl <- make_table_02(adsl = adsl)
#' tbl
#'
#' @export
make_table_02 <- function(adsl,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          vars = c("SEX", "AGE", "AGEGR1", "RACE", "ETHNIC", "COUNTRY"),
                          lbl_vars = formatters::var_labels(adsl, fill = TRUE)[vars],
                          lbl_overall = "Total Population",
                          .stats = c("mean_sd", "median_range", "count_fraction"),
                          .formats = NULL,
                          na_rm = FALSE,
                          prune_0 = TRUE,
                          annotations = NULL) {
  checkmate::assert_subset(c("SAFFL", vars, arm_var), names(adsl))

  adsl <- adsl %>%
    filter(SAFFL == "Y") %>%
    df_explicit_na()

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    summarize_vars(
      vars = vars,
      var_labels = lbl_vars,
      show_labels = "visible",
      .stats = .stats,
      .formats = .formats,
      na.rm = na_rm
    ) %>%
    append_topleft(c("", "Characteristic"))

  tbl <- build_table(lyt, df = adsl, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
