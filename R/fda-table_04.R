#' FDA Table 4: Patient Disposition, Pooled Analyses
#'
#' @details
#' * `df` must contain `SAFFL`, `USUBJID`, and the variables specified by `arm_var`
#'   and `trtedtm_var`.
#' * If specified, `alt_counts_df` must contain `SAFFL`, `USUBJID`, and the variable specified by `arm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table "Patients Treated" section are the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are not removed by default (see `prune_0` argument).
#' * Records with missing treatment start and/or end datetime are excluded from all calculations.
#'
#' @inheritParams argument_convention

#' @examples
# adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#'
#' tbl <- make_table_04(df = adsl)
#' tbl
#'
#' @export
make_table_04 <- function(df,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          lbl_overall = NULL,
                          prune_0 = FALSE,
                          annotations = NULL) {
  checkmate::assert_subset(c(
    "USUBJID", "ARM",
    "RANDFL", "ITTFL", "SAFFL", "PPROTFL",
    "EOTSTT", "DCTREAS", "EOSSTT", "DCSREAS"
  ), names(df))
  assert_flag_variables(df, c("RANDFL", "ITTFL", "SAFFL", "PPROTFL"))

  df <- df %>%
    filter(SAFFL == "Y") %>%
    df_explicit_na() %>%
    mutate(
      RAN = with_label(RANDFL == "Y", "Patients randomized"), # need to create
      ITT = with_label(ITTFL == "Y", "ITT/mITT population"),
      SAF = with_label(SAFFL == "Y", "Safety population"),
      PPP = with_label(PPROTFL == "Y", "Per-protocol population"),
      DISCSD = with_label(EOTSTT == "DISCONTINUED", "Discontinued study drug"),
      DISCSD_AE = with_label(EOTSTT == "DISCONTINUED" & DCTREAS == "ADVERSE EVENT", "Adverse event"),
      DISCSD_LOE = with_label(EOTSTT == "DISCONTINUED" & DCTREAS == "LACK OF EFFICACY", "Lack of efficacy"),
      DISCSD_PD = with_label(EOTSTT == "DISCONTINUED" & DCTREAS == "PROTOCOL DEVIATION", "Protocol deviation"),
      DISCSD_DT = with_label(EOTSTT == "DISCONTINUED" & DCTREAS == "DEATH", "Death"),
      DISCSD_WBS = with_label(EOTSTT == "DISCONTINUED" & DCTREAS == "WITHDRAWAL BY SUBJECT", "Withdrawal by subject"),
      DISCSD_OTH = with_label(EOTSTT == "DISCONTINUED" & DCTREAS == "OTHER", "Other"),
      DISCS = with_label(EOSSTT == "DISCONTINUED", "Discontinued study"),
      DISCS_DT = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "DEATH", "Death"),
      DISCS_LFU = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "LOST TO FOLLOW-UP", "Lost to follow-up"),
      DISCS_WBS = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "WITHDRAWAL BY SUBJECT", "Withdrawal by subject"),
      DISCS_PHD = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "PHYSICIAN DECISION", "Physician decision"),
      DISCS_PD = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "PROTOCOL VIOLATION", "Protocol deviation"),
      DISCS_OTH = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "OTHER", "Other")
    )
  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(df[, "RAN"]),
      table_names = "ran"
    ) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(df[, c("ITT", "SAF", "PPP")]),
      .indent_mods = 1L,
      table_names = "ran_fl"
    ) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(df[, "DISCSD"]),
      table_names = "discsd"
    ) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(df[, c("DISCSD_AE", "DISCSD_LOE", "DISCSD_PD", "DISCSD_DT", "DISCSD_WBS", "DISCSD_OTH")]),
      .indent_mods = 1L,
      table_names = "discsd_fl"
    ) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(df[, "DISCS"]),
      table_names = "discs"
    ) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(df[, c("DISCS_DT", "DISCS_LFU", "DISCS_WBS", "DISCS_PHD", "DISCS_PD", "DISCS_OTH")]),
      .indent_mods = 1L,
      table_names = "discs_fl"
    )

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
