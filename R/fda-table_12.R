#' FDA Table 12: Patients With Adverse Events Leading to Treatment Discontinuation
#'   by System Organ Class and Preferred Term, Safety Population, Pooled Analyses
#'
#' @details
#' * `df` must contain `DCSREAS`, `AESOC`, and the variables specified by `arm_var`, `id_var`, `saffl_var`,
#'   and `pref_var`.
#' * If specified, `denominator` must contain `USUBJID` and the variables specified by `arm_var` and `saffl_var`.
#' * A patient is defined as having at least one adverse event leading to treatment discontinuation when they have at
#'   least one record with `DCSREAS = "ADVERSE EVENT"`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#'
#' @inheritParams tbl_make_table_12
#' @inheritParams argument_convention
#'
#' @return A `gtsummary` table and, if `return_ard = TRUE`, an ARD.
#'   If `return_ard = TRUE`, they will be returned as a list with named elements `table` and `ard`.
#'
#' @seealso [`tbl_make_table_12`]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' adae <- random.cdisc.data::cadae
#' adae$DCSREAS[is.na(adae$DCSREAS)] <- "ADVERSE EVENT"
#'
#' tbl <- make_table_12(df = adae, denominator = adsl)
#' tbl
#'
#' @export
make_table_12 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          pref_var = "AEDECOD") {
  ard <- ard_table_12(
    df = df,
    denominator = denominator,
    id_var = id_var,
    arm_var = arm_var,
    saffl_var = saffl_var,
    pref_var = pref_var
  )

  tbl <- make_table_12_gtsummary(
    df = df,
    denominator = denominator,
    id_var = id_var,
    arm_var = arm_var,
    saffl_var = saffl_var,
    pref_var = pref_var
  )

  if (return_ard) {
    return(list(table = tbl, ard = ard))
  } else {
    return(tbl)
  }
}

#' Pre-Process Data for Table 12 Creation
#'
#' @keywords internal
preproc_df_table_12 <- function(df,
                                id_var = "USUBJID",
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                pref_var = "AEDECOD") {
  assert_subset(c(
    "AEBODSYS", "DCSREAS", arm_var, id_var, saffl_var, pref_var
  ), names(df))
  assert_flag_variables(df, saffl_var)

  id_dcsae <- df %>%
    filter(DCSREAS == "ADVERSE EVENT") %>%
    select(all_of(c(id_var))) %>%
    unlist()

  df <- df %>%
    filter(.data[[saffl_var]] == "Y", .data[[id_var]] %in% id_dcsae) %>%
    df_explicit_na()

  df
}

#' Make ARD: Table 12
#'
#' @examples
#' library(dplyr)
#'
#' adsl <- random.cdisc.data::cadsl
#' adae <- random.cdisc.data::cadae
#'
#' set.seed(1)
#' adae <- adae %>%
#'   rename(FMQ01SC = SMQ01SC) %>%
#'   mutate(
#'     AESER = sample(c("Y", "N"), size = nrow(adae), replace = TRUE),
#'     FMQ01NAM = sample(c("FMQ1", "FMQ2", "FMQ3"), size = nrow(adae), replace = TRUE)
#'   )
#' adae$DCSREAS[is.na(adae$DCSREAS)] <- "ADVERSE EVENT"
#' adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
#'
#' ard <- cardinal:::ard_table_12(adae, adsl)
#' ard
#'
#' @keywords internal
#' @name ard_make_table_12
ard_table_12 <- function(df,
                         denominator = NULL,
                         id_var = "USUBJID",
                         arm_var = "ARM",
                         saffl_var = "SAFFL",
                         pref_var = "AEDECOD") {
  df <- preproc_df_table_12(df, id_var, arm_var, saffl_var, pref_var)

  if (is.null(denominator)) {
    denominator <- df
  } else {
    denominator <- alt_counts_df_preproc(denominator, id_var, arm_var, saffl_var)
  }

  ard <- ard_hierarchical(
    data = df,
    variables = all_of(c("AEBODSYS", pref_var)),
    by = all_of(arm_var),
    denominator = denominator,
    id = all_of(id_var)
  )

  ard
}

#' Engine-Specific Functions: Table 12
#'
#' The table engine used by each engine-specific function is identified by its suffix.
#'
#' @inheritParams argument_convention
#'
#' @details
#' * `df` must contain `DCSREAS`, `AESOC`, and the variables specified by `arm_var`, `id_var`, `saffl_var`,
#'   and `pref_var`.
#' * If specified, `denominator` must contain `USUBJID` and the variables specified by `arm_var` and `saffl_var`.
#' * A patient is defined as having at least one adverse event leading to treatment discontinuation when they have at
#'   least one record with `DCSREAS = "ADVERSE EVENT"`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default by `make_table_12_rtables()` (see `prune_0` argument).
#'
#' @return
#' * `make_table_12_gtsummary()` returns a `gtsummary` object.
#' * `make_table_12_rtables()` returns an `rtable` object.
#'
#' @seealso [make_table_12()]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' adae <- random.cdisc.data::cadae
#' adae$DCSREAS[is.na(adae$DCSREAS)] <- "ADVERSE EVENT"
#'
#' # gtsummary table --------------
#' tbl_gtsummary <- cardinal:::make_table_12_gtsummary(df = adae, denominator = adsl)
#' tbl_gtsummary
#'
#' # rtables table ----------------
#' tbl_rtables <- cardinal:::make_table_12_rtables(df = adae, alt_counts_df = adsl)
#' tbl_rtables
#'
#' @export
#' @name tbl_make_table_12
make_table_12_gtsummary <- function(df,
                                    denominator = NULL,
                                    id_var = "USUBJID",
                                    arm_var = "ARM",
                                    saffl_var = "SAFFL",
                                    pref_var = "AEDECOD") {
  df <- preproc_df_table_12(df, id_var, arm_var, saffl_var, pref_var)

  if (is.null(denominator)) {
    denominator <- df
  } else {
    denominator <- alt_counts_df_preproc(denominator, id_var, arm_var, saffl_var)
  }

  tbl <- tbl_hierarchical(
    df,
    variables = all_of(c("AEBODSYS", pref_var)),
    by = all_of(arm_var),
    id = all_of(id_var),
    denominator = denominator,
    overall_row = TRUE,
    label = list(overall = "Patients with at least one AE leading to discontinuation")
  )

  tbl
}

#' @export
#' @rdname tbl_make_table_12
make_table_12_rtables <- function(df,
                                  alt_counts_df = NULL,
                                  show_colcounts = TRUE,
                                  id_var = "USUBJID",
                                  arm_var = "ARM",
                                  saffl_var = "SAFFL",
                                  pref_var = "AEDECOD",
                                  lbl_overall = NULL,
                                  risk_diff = NULL,
                                  prune_0 = TRUE,
                                  annotations = NULL) {
  df <- preproc_df_table_12(df, id_var, arm_var, saffl_var, pref_var)
  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    analyze_num_patients(
      vars = id_var,
      riskdiff = !is.null(risk_diff),
      .stats = c("unique"),
      .labels = c(unique = "Patients with at least one AE leading to discontinuation")
    ) %>%
    split_rows_by(
      "AEBODSYS",
      label_pos = "topleft",
      split_label = obj_label(df$AEBODSYS)
    ) %>%
    summarize_num_patients(
      var = id_var,
      riskdiff = !is.null(risk_diff),
      .stats = "unique",
      .labels = c(unique = NULL)
    ) %>%
    count_occurrences(
      vars = pref_var,
      drop = FALSE,
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_varlabels(df, pref_var, indent = 1L)

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
