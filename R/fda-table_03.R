#' FDA Table 3: Patient Screening and Enrollment, Trials A and B
#'
#' @details
#' * `adsl` must contain `ENRLDT`, `RANDDT`, and the variables specified by `id_var`, `arm_var`, `scrnfl_var`,
#'   `scrnfailfl_var`, and `scrnfail_var`.
#' * If specified, `alt_counts_df` must contain the variables specified by `arm_var` and `id_var`.
#' * Patients are considered enrolled in they have an enrollment date (`ENRLDT` is not missing), and are considered
#'   randomized if they have a randomization date (`RANDDT` is not missing).
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#' @param scrnfl_var (`character`)\cr variable from `df` that indicates whether patients were screened.
#' @param scrnfailfl_var (`character`)\cr variable from `df` that indicates screening failure.
#' @param scrnfail_var (`character`)\cr variable from `df` that contains reasons for screening failure.
#'
#' @examples
#' library(dplyr)
#'
#' set.seed(1)
#' adsl <- random.cdisc.data::cadsl
#' adsl$RANDDT[sample(seq_len(nrow(adsl)), 100)] <- NA
#' scrnfail_reas_lvls <- c(
#'   "Inclusion/exclusion criteria not met", "Patient noncompliance", "Consent withdrawn", "Other"
#' )
#' adsl <- adsl %>%
#'   mutate(
#'     ENRLDT = RANDDT,
#'     SCRNFL = "Y",
#'     SCRNFRS = factor(sample(scrnfail_reas_lvls, size = nrow(adsl), replace = TRUE),
#'       levels = scrnfail_reas_lvls
#'     ),
#'     SCRNFAILFL = ifelse(is.na(ENRLDT), "Y", "N")
#'   )
#' adsl$SCRNFRS[adsl$SCRNFL == "N" | !is.na(adsl$ENRLDT)] <- NA
#'
#' tbl <- make_table_03(
#'   df = adsl, scrnfl_var = "SCRNFL", scrnfailfl_var = "SCRNFAILFL", scrnfail_var = "SCRNFRS"
#' )
#' tbl
#'
#' @export
make_table_03 <- function(df,
                          alt_counts_df = NULL,
                          show_colcounts = FALSE,
                          arm_var = "ARM",
                          id_var = "USUBJID",
                          scrnfl_var,
                          scrnfailfl_var,
                          scrnfail_var,
                          lbl_overall = NULL,
                          prune_0 = TRUE,
                          annotations = NULL) {
  checkmate::assert_subset(
    c(id_var, scrnfl_var, scrnfailfl_var, scrnfail_var, "ENRLDT", "RANDDT", arm_var), names(df)
  )
  assert_flag_variables(df, c(scrnfl_var, scrnfailfl_var))

  df <- df %>%
    mutate(
      SCRNFL = with_label(.data[[scrnfl_var]] == "Y", "Patients screened"),
      ENRLFL = with_label(!is.na(ENRLDT), "Patients enrolled"),
      RANDFL = with_label(!is.na(RANDDT), "Patients randomized")
    ) %>%
    df_explicit_na()

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = "SCRNFL",
      .stats = "count"
    ) %>%
    split_rows_by(scrnfailfl_var, split_fun = keep_split_levels("Y")) %>%
    summarize_num_patients(
      var = id_var,
      .stats = "unique",
      .labels = c(unique = "Screening failures")
    ) %>%
    count_occurrences(vars = scrnfail_var) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("ENRLFL", "RANDFL"),
      nested = FALSE
    ) %>%
    append_topleft(c("", "Disposition"))

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
