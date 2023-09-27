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
#' @param scrnfailreas_var (`character`)\cr variable from `df` that contains reasons for screening failure.
#'
#' @examples
#' library(dplyr)
#'
#' set.seed(1)
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adsl$RANDDT[sample(1:nrow(adsl), 100)] <- NA
#' adsl <- adsl %>%
#'   mutate(
#'     ENRLDT = RANDDT,
#'     SCRNFL = "Y",
#'     SCRNFRS = factor(sample(
#'       c("Inclusion/exclusion criteria not met", "Patient noncompliance", "Consent withdrawn", "Other"),
#'       size = nrow(adsl), replace = TRUE
#'     ), levels = c("Inclusion/exclusion criteria not met", "Patient noncompliance", "Consent withdrawn", "Other")),
#'     SCRNFAILFL = ifelse(is.na(ENRLDT), "Y", "N")
#'   )
#' adsl$SCRNFRS[adsl$SCRNFL == "N" | !is.na(adsl$ENRLDT)] <- NA
#'
#' tbl <- make_table_03(df = adsl, scrnfl_var = "SCRNFL", scrnfailfl_var = "SCRNFAILFL", scrnfailreas_var = "SCRNFRS")
#' tbl
#'
#' @export
make_table_03 <- function(df,
                          alt_counts_df = NULL,
                          show_colcounts = FALSE,
                          arm_var = "ARM",
                          scrnfl_var,
                          scrnfailfl_var,
                          scrnfailreas_var,
                          lbl_overall = NULL,
                          prune_0 = TRUE,
                          annotations = NULL) {
  checkmate::assert_subset(c("USUBJID", scrnfl_var, scrnfailreas_var, "ENRLDT", "RANDDT", arm_var), names(df))
  assert_flag_variables(df, c(scrnfl_var, scrnfailfl_var))

  df <- df %>%
    mutate(
      SCRNFL = with_label(.data[[scrnfl_var]] == "Y", "Patients screened"),
      ENRLFL = with_label(!is.na(ENRLDT), "Patients enrolled"),
      RANDFL = with_label(!is.na(RANDDT), "Patients randomized")
    ) %>%
    df_explicit_na()

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = "SCRNFL",
      .stats = "count"
    ) %>%
    split_rows_by(scrnfailfl_var, split_fun = keep_split_levels("Y")) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = "unique",
      .labels = c(unique = "Screening failures")
    ) %>%
    count_occurrences(vars = scrnfailreas_var) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = c("ENRLFL", "RANDFL"),
      nested = FALSE
    ) %>%
    append_topleft(c("", "Disposition"))

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
