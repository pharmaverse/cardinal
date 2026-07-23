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
#'   Defaults to `c("SEX", "AGE", "AGEGR1", "ETHNIC", "RACE")`.
#' @param label (named `list`)\cr variable labels passed to `gtsummary::tbl_summary()`.
#'   Defaults to `list()`.
#'
#' @details
#' * `df` must contain the variables specified by `arm_var`, `saffl_var`, and all variables in `vars`.
#' * Rows with `saffl_var != "Y"` are excluded from the table (safety population filter applied internally).
#' * Data-specific preprocessing (e.g. joining additional variables, deriving new columns) should be
#'   performed by the caller before passing `df` to this function.
#' * Continuous variables are summarised with mean (SD) and median (min, max).
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
#' @importFrom dplyr filter all_of everything
#' @importFrom gtsummary tbl_summary all_continuous all_categorical add_overall
#' @importFrom gtsummary remove_footnote_header gather_ard
#' @export
make_table_02 <- function(df,
                          return_ard = TRUE,
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          vars = c("SEX", "AGE", "AGEGR1", "ETHNIC", "RACE"),
                          label = list()) {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(arm_var, saffl_var, vars) %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)

  df <- df |>
    dplyr::filter(.data[[saffl_var]] == "Y")

  tbl <- df |>
    gtsummary::tbl_summary(
      by = arm_var,
      include = dplyr::all_of(vars),
      type = gtsummary::all_continuous() ~ "continuous2",
      statistic = list(
        gtsummary::all_continuous() ~ c(
          "{mean} ({sd})",
          "{median} ({min}, {max})"
        ),
        gtsummary::all_categorical() ~ "{n} ({p}%)"
      ),
      label = label
    ) |>
    gtsummary::add_overall(last = TRUE, col_label = "**Total Population**  \nN = {N}") |>
    gtsummary::remove_footnote_header(columns = dplyr::everything())

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
