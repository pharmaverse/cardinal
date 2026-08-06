#' FDA Table 35: Patients With Adverse Events by System Organ Class,
#'   Safety Population, Pooled Analysis (or Trial X)
#'
#' @description
#' Creates FDA Table 35 showing patients with adverse events by system organ class
#' for the safety population.
#'
#' @param df (`data.frame`)\cr dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator for proportion
#'   calculations. If `NULL`, `df` is used. Typically ADSL.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param soc_var (`character`)\cr name of the system organ class variable. Defaults to `"AEBODSYS"`.
#' @param lbl_overall (`character` or `NULL`)\cr label for the overall column. If `NULL` (default),
#'   no overall column is added.
#' @param na_level (`character`)\cr string used to label missing values. Defaults to `"<Missing>"`.
#'
#' @details
#' * `df` must contain the variables specified by `arm_var`, `id_var`, `soc_var`, and `saffl_var`.
#' * If specified, `denominator` must contain the variables specified by `id_var` and `arm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#' * Rows are filtered to the safety population (`saffl_var == "Y"`).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE)
#' library(dplyr)
#'
#' adsl <- pharmaverseadam::adsl |>
#'   filter(TRT01A != "Screen Failure")
#'
#' adae <- pharmaverseadam::adae |>
#'   filter(SAFFL == "Y")
#'
#' result <- make_table_35(df = adae, denominator = adsl)
#' result$table
#'
#' @importFrom dplyr filter arrange all_of
#' @importFrom gtsummary tbl_hierarchical gather_ard
#' @export
make_table_35 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          soc_var = "AEBODSYS",
                          lbl_overall = NULL,
                          na_level = "<Missing>") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(soc_var, arm_var, id_var, saffl_var) %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
    stopifnot(all(c(id_var, arm_var) %in% names(denominator)))
  }

  df <- df |>
    dplyr::filter(.data[[saffl_var]] == "Y") |>
    dplyr::arrange(dplyr::all_of(soc_var))

  if (is.null(denominator)) denominator <- df

  tbl <- gtsummary::tbl_hierarchical(
    data = df,
    variables = dplyr::all_of(soc_var),
    by = dplyr::all_of(arm_var),
    id = dplyr::all_of(id_var),
    denominator = denominator,
    overall_row = TRUE,
    label = list("..ard_hierarchical_overall.." ~ "Any adverse event")
  )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
