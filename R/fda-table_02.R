#' FDA Table 2: Baseline Demographic and Clinical Characteristics, Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 2 showing baseline demographic and clinical characteristics
#' for the safety population.
#'
#' @param df (`data.frame`)\cr dataset (typically ADSL) required to build the table.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param vars (`character`)\cr variables from `df` to include in the table.
#'   Defaults to `c("SEX", "AGE", "AGEGR1", "RACE", "ETHNIC")`.
#'
#' @details
#' * `df` must contain the variables specified by `arm_var`, `saffl_var`, and all variables in `vars`.
#' * Rows with `saffl_var != "Y"` are excluded from the table.
#' * Continuous variables are summarised with mean (SD) and median (min - max).
#' * Categorical variables are summarised with n (%).
#' * When `return_ard = TRUE`, returns a named list with elements `table` (a `gtsummary` object)
#'   and `ard` (the intermediate ARD); otherwise returns the `gtsummary` table directly.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE) && requireNamespace("dplyr", quietly = TRUE)
#' library(dplyr)
#'
#' adsl <- pharmaverseadam::adsl |>
#'   filter(TRT01A != "Screen Failure")
#'
#' result <- make_table_02(df = adsl)
#' result$table
#'
#' @importFrom dplyr filter select all_of everything
#' @importFrom gtsummary tbl_summary bold_labels modify_header all_stat_cols
#' @importFrom gtsummary add_overall add_stat_label all_continuous all_continuous2
#' @importFrom gtsummary all_categorical modify_footnote modify_column_alignment gather_ard
#' @export
make_table_02 <- function(df,
                          return_ard = TRUE,
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          vars = c("SEX", "AGE", "AGEGR1", "RACE", "ETHNIC")) {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(arm_var, saffl_var, vars) %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)

  df <- df |>
    dplyr::filter(.data[[saffl_var]] == "Y") |>
    dplyr::select(dplyr::all_of(c(vars, arm_var)))

  tbl <- df |>
    gtsummary::tbl_summary(
      by = arm_var,
      type = gtsummary::all_continuous() ~ "continuous2",
      statistic = list(
        gtsummary::all_continuous() ~ c(
          "{mean} ({sd})",
          "{median} ({min} - {max})"
        ),
        gtsummary::all_categorical() ~ "{n} ({p}%)"
      ),
      digits = gtsummary::all_continuous() ~ 2,
      missing = "no"
    ) |>
    gtsummary::bold_labels() |>
    gtsummary::modify_header(gtsummary::all_stat_cols() ~ "**{level}**  \nN = {n}") |>
    gtsummary::add_overall(last = TRUE, col_label = "**Total Population**  \nN = {n}") |>
    gtsummary::add_stat_label(
      label = gtsummary::all_continuous2() ~ c("Mean (SD)", "Median (min - max)")
    ) |>
    gtsummary::modify_footnote(dplyr::everything() ~ NA) |>
    gtsummary::modify_column_alignment(columns = gtsummary::all_stat_cols(), align = "right")

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}

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
