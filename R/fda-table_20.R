#' FDA Table 20: Adverse Events of Special Interest Assessment, Safety Population, Pooled Analysis (or Trial X)
#'
#' @details
#' * `adae` must contain `AESEV`, `AESER`, `AESDTH`, `EOSSTT`, `AEREL`, and the variables specified by
#'   `id_var`, `pref_var`, `aesifl_var`, `aelabfl_var`, `arm_var`, and `saffl_var`.
#' * If specified, `alt_counts_df` must contain the variables specified by `arm_var`, `id_var`, and `saffl_var`.
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
#' @return An `rtable` object.
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' adae <- random.cdisc.data::cadae
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
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          pref_var = "AEDECOD",
                          aesifl_var = "AESIFL",
                          aelabfl_var = "AELABFL",
                          lbl_overall = NULL,
                          risk_diff = NULL,
                          prune_0 = TRUE,
                          annotations = NULL) {
  checkmate::assert_subset(c(
    "AESEV", "AESER", "AESDTH", "EOSSTT", "AEREL", id_var, pref_var, aesifl_var, aelabfl_var, arm_var, saffl_var
  ), names(adae))
  assert_flag_variables(adae, c(saffl_var, aesifl_var, aelabfl_var))

  adae <- adae %>%
    as_tibble() %>%
    filter(.data[[saffl_var]] == "Y", AESIFL == "Y") %>%
    df_explicit_na()

  adae[[aesifl_var]] <- with_label(adae[[aesifl_var]] == "Y", "AE grouping related to AESI")
  adae[[aelabfl_var]] <- with_label(adae[[aelabfl_var]] == "Y", "Laboratory Assessment")

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    count_patients_with_flags(
      id_var,
      flag_variables = aesifl_var,
      denom = "N_col",
      riskdiff = !is.null(risk_diff),
      table_names = "tbl_aesi"
    ) %>%
    count_occurrences(
      pref_var,
      riskdiff = !is.null(risk_diff),
      .indent_mods = 1L
    ) %>%
    count_occurrences_by_grade(
      "AESEV",
      var_labels = "Maximum severity",
      show_labels = "visible",
      riskdiff = !is.null(risk_diff)
    ) %>%
    count_patients_with_event(
      id_var,
      filters = c("AESER" = "Y"),
      riskdiff = !is.null(risk_diff),
      .labels = "Serious",
      table_names = "tbl_ser"
    ) %>%
    count_patients_with_event(
      id_var,
      filters = c("AESDTH" = "Y"),
      riskdiff = !is.null(risk_diff),
      .labels = "Deaths",
      .indent_mods = 1L,
      table_names = "tbl_death"
    ) %>%
    count_patients_with_event(
      vars = id_var,
      filters = c("EOSSTT" = "DISCONTINUED"),
      riskdiff = !is.null(risk_diff),
      .labels = "Resulting in discontinuation",
      table_names = "tbl_dis"
    ) %>%
    count_patients_with_event(
      id_var,
      filters = c("AEREL" = "Y"),
      riskdiff = !is.null(risk_diff),
      .labels = "Relatedness",
      table_names = "tbl_rel"
    ) %>%
    count_patients_with_flags(
      id_var,
      flag_variables = aelabfl_var,
      denom = "N_col",
      riskdiff = !is.null(risk_diff),
      table_names = "tbl_lab"
    ) %>%
    append_topleft(c("", "AESI Assessment"))

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
