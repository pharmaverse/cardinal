#' Table 35. Patients With Adverse Events by System Organ Class,
#'   Safety Population, Pooled Analysis (or Trial X)
#'
#' @details
#' * `df` must contain the variables specified by
#'   `arm_var`, `id_var`, `soc_var` and `saffl_var`.
#' * `return_ard` set to `TRUE` (default) or `FALSE`; whether the intermediate ARD object should be returned.
#'
#' @inheritParams argument_convention
#' @param soc_var (`character`)\cr Name of the variable that contains the SOC to describe.
#'
#' @return A `gtsummary` table and, if `return_ard = TRUE`, an ARD.
#'   If `return_ard = TRUE`, they will be returned as a list with named elements `table` and `ard`.
#'
#' @seealso [`tbl_make_table_35`]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' adae <- random.cdisc.data::cadae
#'
#' tbl <- make_table_35(df = adae, denominator = adsl)
#' tbl
#'
#' @export
make_table_35 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          soc_var = "AEBODSYS",
                          lbl_overall = NULL,
                          na_level = "<Missing>") {
  tbl <- make_table_35_gtsummary(
    df = df,
    denominator = denominator,
    id_var = id_var,
    arm_var = arm_var,
    saffl_var = saffl_var,
    soc_var = soc_var,
    lbl_overall = lbl_overall,
    na_level = na_level
  )

  if (return_ard) {
    ard <- gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  } else {
    return(tbl) # nocov
  }
}

#' Pre-Process Data for Table 35 Creation
#'
#' @keywords internal
preproc_df_table_35 <- function(df,
                                id_var = "USUBJID",
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                soc_var = "AEBODSYS",
                                na_level = "<Missing>") {
  assert_subset(c(soc_var, arm_var, id_var, saffl_var), names(df))
  assert_flag_variables(df, saffl_var)

  df <- df |>
    filter(.data[[saffl_var]] == "Y") |>
    arrange(soc_var) |>
    df_explicit_na(na_level = na_level)

  df
}


#' Engine-Specific Functions: Table 35
#'
#' The table engine used by each engine-specific function is identified by its suffix.
#'
#' @inheritParams argument_convention
#'
#' @details
#' * `df` must contain the variables the variables specified by
#'   `arm_var`, `id_var`, `saffl_var`, and `soc_var`.
#' * If specified, `denominator` (or `alt_counts_df`) must contain `USUBJID` and the variables specified by `arm_var`
#'   and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default by `make_table_35_rtables()` (see `prune_0` argument).
#'
#' @return
#' * `make_table_35_gtsummary()` returns a `gtsummary` object.
#' * `make_table_35_rtables()` returns an `rtable` object.
#'
#' @seealso [make_table_35()]
#'
#' @examples
#'
#' adsl <- random.cdisc.data::cadsl
#' adae <- random.cdisc.data::cadae
#'
#' # gtsummary table --------------
#' tbl_gtsummary <- make_table_35_gtsummary(df = adae, denominator = adsl)
#' tbl_gtsummary
#'
#' # rtables table ----------------
#' tbl_rtables <- make_table_35_rtables(df = adae, alt_counts_df = adsl)
#' tbl_rtables
#'
#' @export
#' @name tbl_make_table_35
make_table_35_gtsummary <- function(df,
                                    denominator = NULL,
                                    id_var = "USUBJID",
                                    arm_var = "ARM",
                                    saffl_var = "SAFFL",
                                    soc_var = "AEBODSYS",
                                    lbl_overall = NULL,
                                    na_level = "<Missing>") {
  df <- preproc_df_table_35(df, id_var, arm_var, saffl_var, soc_var, na_level)

  if (is.null(denominator)) {
    denominator <- df # nocov
  } else {
    denominator <- alt_counts_df_preproc(
      denominator,
      id_var,
      arm_var,
      saffl_var
    )
  }

  tbl_gts <- tbl_hierarchical(
    data = df,
    variables = soc_var,
    by = arm_var,
    denominator = denominator,
    id = id_var
  ) |>
    modify_header(label ~ paste0("**System Organ Class**")) |>
    modify_header(all_stat_cols() ~ "**{level}**  \nN = {n}") |>
    modify_column_alignment(columns = all_stat_cols(), align = "right")

  if (!is.null(lbl_overall)) {
    tbl_gts_ovrl <- tbl_hierarchical(
      data = df,
      variables = soc_var,
      denominator = denominator,
      id = id_var
    ) |>
      modify_header(label ~ paste0("**System Organ Class**")) |>
      modify_header(
        all_stat_cols() ~ paste0("**", lbl_overall, "**  \nN = {n}")
      ) |>
      modify_column_alignment(columns = all_stat_cols(), align = "right")

    tbl_merged <- tbl_merge(list(tbl_gts, tbl_gts_ovrl), tab_spanner = FALSE)

    tbl <- gtsummary::with_gtsummary_theme(
      x = gtsummary::theme_gtsummary_compact(),
      expr = tbl_merged
    )
  } else {
    tbl <- with_gtsummary_theme(
      x = theme_gtsummary_compact(),
      expr = tbl_gts
    )
  }

  return(tbl)
}

#' @export
#' @rdname tbl_make_table_35
make_table_35_rtables <- function(df,
                                  alt_counts_df = NULL,
                                  show_colcounts = TRUE,
                                  id_var = "USUBJID",
                                  arm_var = "ARM",
                                  saffl_var = "SAFFL",
                                  soc_var = "AEBODSYS",
                                  lbl_soc_var = formatters::var_labels(df, fill = TRUE)[soc_var],
                                  lbl_overall = NULL,
                                  risk_diff = NULL,
                                  prune_0 = FALSE,
                                  na_level = "<Missing>",
                                  annotations = NULL) {
  df <- preproc_df_table_35(df, id_var, arm_var, saffl_var, soc_var, na_level)
  alt_counts_df <-
    alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) |>
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) |>
    count_occurrences(
      vars = soc_var,
      drop = FALSE,
      riskdiff = !is.null(risk_diff)
    ) |>
    append_topleft(c("", lbl_soc_var))

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df) |>
    sort_at_path(
      path = c(soc_var),
      scorefun = score_occurrences_cols(col_names = levels(adae[[arm_var]]))
    )
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
