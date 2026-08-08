#' Roche LBT01: Laboratory Test Results by Visit, Safety Population
#'
#' @description
#' Creates a laboratory baseline-change table (Roche LBT01) showing results and changes from
#' baseline by visit for selected lab parameters.
#'
#' @param df (`data.frame`)\cr laboratory dataset (typically ADLB) required to build the table.
#' @param denominator (`data.frame`)\cr ADSL dataset used as the denominator for proportion
#'   calculations. Typically filtered to exclude screen failures.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param arm_var (`character`)\cr name of the treatment arm variable. Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param paramcd_filter (`character`)\cr vector of `PARAMCD` values to include.
#'   Defaults to `c("ALT", "BILI", "CREAT")`.
#' @param visits (`character`)\cr vector of visit labels to include. Defaults to
#'   `c("Baseline", "Week 4")`.
#' @param baseline_level (`character`)\cr visit label used as the baseline. Defaults to
#'   `"Baseline"`.
#'
#' @details
#' * `df` must contain `PARAMCD`, `AVISIT`, `saffl_var`, and `arm_var`.
#' * `denominator` must contain `arm_var` and must be pre-filtered to exclude screen failures
#'   (the table uses `denominator` as-is for N calculation).
#' * Requires the `crane` package for `tbl_baseline_chg`.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE) && requireNamespace("crane", quietly = TRUE)
#' library(dplyr)
#'
#' adsl <- pharmaverseadam::adsl |> filter(TRT01A != "Screen Failure")
#' adlb <- pharmaverseadam::adlb
#'
#' result <- make_table_roche_lbt01(df = adlb, denominator = adsl)
#' result$table
#'
#' @importFrom dplyr filter all_of
#' @importFrom gtsummary tbl_strata_nested_stack modify_bold modify_header modify_spanning_header
#' @importFrom gtsummary all_stat_cols gather_ard
#' @export
make_table_roche_lbt01 <- function(df,
                                   denominator,
                                   return_ard = TRUE,
                                   arm_var = "TRT01A",
                                   saffl_var = "SAFFL",
                                   paramcd_filter = c("ALT", "BILI", "CREAT"),
                                   visits = c("Baseline", "Week 4"),
                                   baseline_level = "Baseline") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(arm_var, saffl_var, "PARAMCD", "AVISIT") %in% names(df)))
  stopifnot(is.data.frame(denominator))
  stopifnot(all(arm_var %in% names(denominator)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)

  data <- df |>
    dplyr::filter(
      .data[[saffl_var]] == "Y",
      PARAMCD %in% paramcd_filter
    )

  tbl <- data |>
    dplyr::filter(AVISIT %in% visits) |>
    gtsummary::tbl_strata_nested_stack(
      strata = PARAM,
      ~ .x |>
        crane::tbl_baseline_chg(
          baseline_level = baseline_level,
          by = arm_var,
          denominator = denominator
        )
    ) |>
    gtsummary::modify_bold(columns = label, rows = tbl_indent_id1 > 0L) |>
    gtsummary::modify_header(label = "**Lab  \n\U00A0\U00A0\U00A0\U00A0 Visit**") |>
    gtsummary::modify_spanning_header(
      gtsummary::all_stat_cols() ~ "**{level}**  \nN = {n}"
    )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
