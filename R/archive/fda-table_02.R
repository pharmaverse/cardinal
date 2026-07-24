#' Engine-Specific Functions: Table 2 (rtables)
#'
#' @description
#' Creates FDA Table 2 using the `rtables` engine. This is an internal helper
#' and is not exported; see `make_table_02()` for the primary interface.
#'
#' @param df (`data.frame`)\cr dataset (typically ADSL) required to build the table.
#' @param show_colcounts (`flag`)\cr whether column counts should be printed.
#' @param arm_var (`character`)\cr name of the treatment arm variable.
#' @param saffl_var (`character`)\cr name of the safety flag variable.
#' @param vars (`character`)\cr variables to include in the table.
#' @param lbl_vars (`character`)\cr labels for `vars`.
#' @param lbl_overall (`character`)\cr label for the overall column.
#' @param na_rm (`flag`)\cr whether `NA` levels should be removed.
#' @param prune_0 (`flag`)\cr whether all-zero rows should be removed.
#' @param annotations (named `list`)\cr annotations to add to the table.
#'
#' @keywords internal
make_table_02_rtables <- function(df,
                                  show_colcounts = TRUE,
                                  arm_var = "ARM",
                                  saffl_var = "SAFFL",
                                  vars = c("SEX", "AGE", "AGEGR1", "RACE", "ETHNIC", "COUNTRY"),
                                  lbl_vars = formatters::var_labels(df, fill = TRUE)[vars],
                                  lbl_overall = "Total Population",
                                  na_rm = FALSE,
                                  prune_0 = TRUE,
                                  annotations = NULL) {
  rlang::check_installed("tern")

  assert_subset(c(vars, arm_var, saffl_var), names(df))
  assert_flag_variables(df, saffl_var)

  df <- df |>
    dplyr::filter(.data[[saffl_var]] == "Y") |>
    tern::df_explicit_na()

  lyt <- tern::basic_table_annot(show_colcounts, annotations) |>
    tern::split_cols_by_arm(arm_var, lbl_overall) |>
    tern::analyze_vars(
      vars = vars,
      var_labels = lbl_vars,
      show_labels = "visible",
      .stats = c("mean_sd", "median_range", "count_fraction"),
      .formats = NULL,
      na.rm = na_rm
    ) |>
    tern::append_topleft("Characteristic")

  tbl <- rtables::build_table(lyt, df = df)
  if (prune_0) tbl <- rtables::prune_table(tbl)

  tbl
}
