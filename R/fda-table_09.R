#' FDA Table 9: Patients With Serious Adverse Events by System Organ Class and Preferred Term,
#'   Safety Population, Pooled Analyses
#'
#' @details
#' * `df` is typically ADAE.
#' * `alt_counts_df` is typically ADSL.
#' * `df` must contain `SAFFL`, `AESER`, `USUBJID`, `"AESOC"`, and the variables specified by `var` and `arm_var`.
#' * Columns are split by arm. Overall population column is not included by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#'
#' tbl <- make_table_09(df = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_09 <- function(df,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          pt_var = "AETERM",
                          lbl_pt_var = formatters::var_labels(df, fill = TRUE)[pt_var],
                          lbl_overall = NULL,
                          prune_0 = TRUE,
                          annotations = NULL) {
  df <- df %>% filter(SAFFL == "Y", AESER == "Y")

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
    count_occurrences(vars = pt_var) %>%
    append_topleft(paste(" ", lbl_pt_var))

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
