#' FDA Table 3: Patient Screening and Enrollment, Trials A and B
#'
#' @details
#' * `adsl` must contain `USUBJID` and the variables specified by `vars` and `arm_var`.
#' * If specified, `alt_counts_df` must contain `USUBJID`, and the variable specified by `arm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm.
#' * Numbers in table for non-numeric variables represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#' @param scrnfl_var (`character`)\cr variable from `df` that indicates whether patients were screened.
#' @param scrnfailfl_var (`character`)\cr variable from `df` that indicates screening failure.
#' @param scrn_dcsreas_var (`character`)\cr variable from `df` that contains reasons for screening failure.
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#'
#' adsl <- adsl %>%
#'   dplyr::mutate(
#'     SCRNFL = sample(c(TRUE, NA), size = nrow(adsl), replace = TRUE),
#'     SCRNFLRS = sample(c(
#'       "Inclusion/exclusion criteria not met",
#'       "Patient noncompliance",
#'       "Consent withdrawn",
#'       "Other"
#'     ), size = nrow(adsl), replace = TRUE),
#'     ENRLFL = sample(c(TRUE, NA), size = nrow(adsl), replace = TRUE),
#'     RANDFL = sample(c(TRUE, NA), size = nrow(adsl), replace = TRUE)
#'   )
#'
#' labels <- c(
#'   "SCRNFL" = "Patients screened",
#'   "SCRNFLRS" = "Reason for SCRNFL=N",
#'   "ENRLFL" = "Patients enrolled",
#'   "RANDFL" = "Patients randomized"
#' )
#'
#' formatters::var_labels(adsl)[names(labels)] <- labels
#'
#' make_table_03(df = adsl)
#'
#' @export
make_table_03 <- function(df,
                          alt_counts_df = NULL,
                          show_colcounts = FALSE,
                          arm_var = "ARM",
                          scrnfl_var,
                          scrnfailfl_var,
                          scrn_dcsreas_var,
                          lbl_overall = NULL,
                          prune_0 = TRUE,
                          annotations = NULL) {
  checkmate::assert_subset(c("USUBJID", scrnfl_var, scrn_dcsreas_var, "ENRLDT", "RANDDT", arm_var), names(df))
  assert_flag_variables(df, c(scrnfl_var, scrnfailfl_var))

  df <- df %>%
    mutate(
      SCRNFL = with_label(scrnfl_var == "Y", "Patients screened"),
      ENRLFL = with_label(!is.na(ENRLDT), "Patients enrolled"),
      RANDFL = with_label(!is.na(RANDDT), "Patients randomized")
    ) %>%
    df_explicit_na()

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = scrnfl_var
    ) %>%
    split_rows_by(scrnfailfl_var, split_fun = keep_split_levels("Y")) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = "unique",
      .labels = c(unique = "Screening failures")
    ) %>%
    count_occurrences(vars = scrn_dcsreas_var) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = c("ENRLFL", "RANDFL"),
      nested = FALSE
    ) %>%
    append_topleft("Disposition")

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
