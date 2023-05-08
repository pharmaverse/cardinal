#' FDA Table 13: Patients With Common Adverse Events Occurring at >=XX% Frequency, Safety Population, Pooled Analyses
#'
#' @details
#' * `df` is typically ADAE.
#' * `alt_counts_df` is typically ADSL.
#' * `df` must contain `SAFFL` and the variables specified by `pt_var` and `arm_var`.
#' * Columns are split by arm. Overall population column is not included by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#'
#' @inheritParams argument_convention
#' @param min_freq (`proportion`)\cr minimum % frequency (fraction of `N`) required in any column to include each row.
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#'
#' tbl <- make_table_13(df = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_13 <- function(df,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          min_freq = 0.05,
                          arm_var = "ARM",
                          pt_var = "AETERM",
                          lbl_pt_var = formatters::var_labels(df, fill = TRUE)[pt_var],
                          lbl_overall = NULL,
                          annotations = NULL) {
  df <- df %>% filter(SAFFL == "Y")

  lyt <- basic_table(
    show_colcounts = show_colcounts,
    title = if (!is.null(annotations$title)) annotations$title else "",
    subtitles = if (!is.null(annotations$subtitles)) annotations$subtitles else character(),
    main_footer = if (!is.null(annotations$main_footer)) annotations$main_footer else character(),
    prov_footer = if (!is.null(annotations$prov_footer)) annotations$prov_footer else character()
  ) %>%
    split_cols_by(arm_var)

  if (!is.null(lbl_overall)) lyt <- lyt %>% add_overall_col(lbl_overall)

  lyt <- lyt %>%
    count_occurrences(vars = pt_var) %>%
    append_topleft(c("", lbl_pt_var))

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)

  row_condition <- has_fraction_in_any_col(
    atleast = min_freq,
    col_names = names(table(df[[arm_var]]))
  )
  tbl <- prune_table(tbl, keep_rows(row_condition))

  tbl
}
