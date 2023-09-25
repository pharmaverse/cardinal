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
                          lbl_overall = NULL,
                          prune_0 = TRUE,
                          annotations = NULL) {
  checkmate::assert_subset(c(
    "USUBJID",
    "SCRNFL", "SCRNFLRS", "ENRLFL", "RANDFL",
    arm_var
  ), names(df))

  df <- df %>%
    df_explicit_na()

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(df[, "SCRNFL"]),
      table_names = "scrn",
    ) %>%
    analyze_num_patients(
      vars = "USUBJID",
      .stats = "unique",
      .labels = c(unique = "Screening failures"),
      show_labels = "hidden"
    ) %>%
    count_occurrences(
      vars = "SCRNFLRS",
      .indent_mods = 1,
      denom = "n"
    ) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(df[, "ENRLFL"]),
      table_names = "enrl"
    ) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(df[, "RANDFL"]),
      table_names = "rand"
    ) %>%
    append_topleft(c("", "Disposition"))

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
