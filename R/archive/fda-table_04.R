#' FDA Table 4: Patient Disposition, Pooled Analyses
#'
#' @details
#' * `df` must contain `EOTSTT`, `DCSREAS`, `EOSSTT`, `DCSREAS` and the variables specified by `arm_var`, `id_var`,
#'   and `pop_vars`.
#' * If specified, `alt_counts_df` must contain the variable specified by `arm_var`, `id_var`, and `pop_vars`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * All-zero rows are not removed by default (see `prune_0` argument).
#'
#' @param pop_vars (`vector` of `character`)\cr population variables from `df` to include in the table.
#' @param lbl_pop_vars (`vector` of `character`)\cr labels corresponding to variables in `pop_vars` to print
#'   in the table. Labels should be ordered according to the order of variables in `pop_vars`.
#' @inheritParams argument_convention
#'
#' @return An `rtable` object.
#'
#' @examples
#' library(dplyr)
#'
#' adsl <- random.cdisc.data::cadsl %>%
#'   mutate(test = rbinom(400, 1, 0.5)) %>%
#'   mutate(
#'     RANDFL = ifelse(test == 0, "N", "Y"),
#'     PPROTFL = ifelse(test == 0, "N", "Y"),
#'     DCSREAS = if_else(DCSREAS %in% c(
#'       "ADVERSE EVENT", "LACK OF EFFICACY", "PROTOCOL VIOLATION",
#'       "DEATH", "WITHDRAWAL BY PARENT/GUARDIAN"
#'     ), DCSREAS, "OTHER")
#'   )
#'
#' tbl <- make_table_04(
#'   df = adsl, pop_vars = c("RANDFL", "ITTFL", "SAFFL", "PPROTFL"),
#'   lbl_pop_vars = c(
#'     "Patients randomized", "ITT/mITT population", "Safety population", "Per-protocol population"
#'   )
#' )
#' tbl
#'
#' @export
make_table_04 <- function(df,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          id_var = "USUBJID",
                          pop_vars = c("SAFFL"),
                          lbl_pop_vars = c("Safety population"),
                          lbl_overall = NULL,
                          prune_0 = FALSE,
                          risk_diff = NULL,
                          annotations = NULL) {
  assert_subset(c(
    id_var, arm_var, pop_vars,
    "EOTSTT", "DCSREAS", "EOSSTT", "DCSREAS"
  ), names(df))
  assert_flag_variables(df, pop_vars)


  df <- df %>%
    as_tibble() %>%
    df_explicit_na() %>%
    mutate(
      across(all_of(pop_vars), ~ with_label(. == "Y", lbl_pop_vars[match(cur_column(), pop_vars)])),
      DISCSD = with_label(EOTSTT == "DISCONTINUED", "Discontinued study drug"),
      DISCSD_AE = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "ADVERSE EVENT", "Adverse event"),
      DISCSD_LOE = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "LACK OF EFFICACY", "Lack of efficacy"),
      DISCSD_PD = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "PROTOCOL DEVIATION", "Protocol deviation"),
      DISCSD_DT = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "DEATH", "Death"),
      DISCSD_WBS = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "WITHDRAWAL BY SUBJECT", "Withdrawal by subject"),
      DISCSD_OTH = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "OTHER", "Other"),
      DISCS = with_label(EOSSTT == "DISCONTINUED", "Discontinued study"),
      DISCS_DT = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "DEATH", "Death"),
      DISCS_LFU = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "LOST TO FOLLOW-UP", "Lost to follow-up"),
      DISCS_WBS = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "WITHDRAWAL BY SUBJECT", "Withdrawal by subject"),
      DISCS_PHD = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "PHYSICIAN DECISION", "Physician decision"),
      DISCS_PD = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "PROTOCOL VIOLATION", "Protocol deviation"),
      DISCS_OTH = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "OTHER", "Other")
    )

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = var_labels(df[, pop_vars]),
      riskdiff = !is.null(risk_diff),
      table_names = "pop"
    ) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = "DISCSD",
      riskdiff = !is.null(risk_diff),
      table_names = "discsd"
    ) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("DISCSD_AE", "DISCSD_LOE", "DISCSD_PD", "DISCSD_DT", "DISCSD_WBS", "DISCSD_OTH"),
      riskdiff = !is.null(risk_diff),
      .indent_mods = 1L,
      table_names = "discsd_fl"
    ) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = "DISCS",
      riskdiff = !is.null(risk_diff),
      table_names = "discs"
    ) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("DISCS_DT", "DISCS_LFU", "DISCS_WBS", "DISCS_PHD", "DISCS_PD", "DISCS_OTH"),
      riskdiff = !is.null(risk_diff),
      .indent_mods = 1L,
      table_names = "discs_fl"
    )

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
