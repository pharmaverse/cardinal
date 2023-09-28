#' FDA Table 20: Adverse Events of Special Interest Assessment, Safety Population, Pooled Analysis (or Trial X)
#'
#' @details
#' * `adae` must contain `SAFFL`, `USUBJID`, `AESEV`, `AESER`, `AESDTH`, `EOSSTT`, `AEREL`, and the
#'   variables specified by `pref_var`, `aesifl_var`, `aelabfl_var`, and `arm_var`.
#' * If specified, `alt_counts_df` must contain `SAFFL`, `USUBJID`, and the variable specified by `arm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#' @param aesifl_var (`character`)\cr variable from `adae` that indicates adverse events of special interest.
#' @param aelabfl_var (`character`)\cr variable from `adae` that indicates a laboratory assessment.
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#'
#' set.seed(1)
#' adae$AESIFL <- ifelse(adae$AESOC %in% c("cl A", "cl D"), "Y", "N")
#' adae$AELABFL <- sample(c("Y", "N"), nrow(adae), replace = TRUE)
#'
#' tbl <- make_table_20(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_20 <- function(adae,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          pref_var = "AEDECOD",
                          aesifl_var = "AESIFL",
                          aelabfl_var = "AELABFL",
                          lbl_overall = NULL,
                          prune_0 = TRUE,
                          annotations = NULL) {
  checkmate::assert_subset(c(
    "SAFFL", "USUBJID", "AESEV", "AESER", "AESDTH", "EOSSTT", "AEREL",
    pref_var, aesifl_var, aelabfl_var, arm_var
  ), names(adae))
  assert_flag_variables(adae, c("SAFFL", aesifl_var, aelabfl_var))

  adae <- adae %>%
    filter(SAFFL == "Y", AESIFL == "Y") %>%
    df_explicit_na()

  adae[[aesifl_var]] <- adae[[aesifl_var]] == "Y"
  adae[[aelabfl_var]] <- adae[[aelabfl_var]] == "Y"
  var_lbls <- c("AE grouping related to AESI", "Laboratory Assessment")
  names(var_lbls) <- c(aesifl_var, aelabfl_var)

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    count_patients_with_flags(
      "USUBJID",
      flag_variables = var_lbls[1],
      denom = "N_col",
      table_names = "tbl_aesi"
    ) %>%
    count_occurrences(
      pref_var,
      .indent_mods = 1L
    ) %>%
    count_occurrences_by_grade(
      "AESEV",
      var_labels = "Maximum severity",
      show_labels = "visible"
    ) %>%
    count_patients_with_event(
      "USUBJID",
      filters = c("AESER" = "Y"),
      .labels = "Serious",
      table_names = "tbl_ser"
    ) %>%
    count_patients_with_event(
      "USUBJID",
      filters = c("AESDTH" = "Y"),
      .labels = "Deaths",
      .indent_mods = 1L,
      table_names = "tbl_death"
    ) %>%
    count_patients_with_event(
      vars = "USUBJID",
      filters = c("EOSSTT" = "DISCONTINUED"),
      .labels = "Resulting in discontinuation",
      table_names = "tbl_dis"
    ) %>%
    count_patients_with_event(
      "USUBJID",
      filters = c("AEREL" = "Y"),
      .labels = "Relatedness",
      table_names = "tbl_rel"
    ) %>%
    count_patients_with_flags(
      "USUBJID",
      flag_variables = var_lbls[2],
      denom = "N_col",
      table_names = "tbl_lab"
    ) %>%
    append_topleft(c("", "AESI Assessment"))

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
