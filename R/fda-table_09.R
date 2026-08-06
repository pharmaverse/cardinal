#' FDA Table 9: Patients With Serious Adverse Events by System Organ Class and Preferred Term,
#'   Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 9 showing patients with serious adverse events (SAEs) by system organ class
#' and preferred term for the safety population.
#'
#' @param df (`data.frame`)\cr dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator for proportion
#'   calculations. If `NULL`, `df` is used. Typically ADSL.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param ser_var (`character`)\cr name of the variable indicating serious adverse events.
#'   Defaults to `"AESER"`.
#' @param soc_var (`character`)\cr name of the system organ class variable. Defaults to `"AESOC"`.
#' @param pref_var (`character`)\cr name of the preferred term variable. Defaults to `"AEDECOD"`.
#' @param lbl_overall (`character` or `NULL`)\cr label for the overall column. If `NULL` (default),
#'   no overall column is added.
#'
#' @details
#' * `df` must contain the variables specified by `id_var`, `arm_var`, `saffl_var`, `ser_var`,
#'   `soc_var`, and `pref_var`.
#' * If specified, `denominator` must contain the variables specified by `id_var` and `arm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#' * Rows are filtered to safety population (`saffl_var == "Y"`) and serious AEs (`ser_var == "Y"`).
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
#' result <- make_table_09(df = adae, denominator = adsl)
#' result$table
#'
#' @importFrom dplyr filter all_of
#' @importFrom gtsummary tbl_hierarchical tbl_merge gather_ard
#' @export
make_table_09 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          ser_var = "AESER",
                          soc_var = "AESOC",
                          pref_var = "AEDECOD",
                          lbl_overall = NULL) {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(id_var, arm_var, saffl_var, ser_var, soc_var, pref_var) %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
    stopifnot(all(c(id_var, arm_var) %in% names(denominator)))
  }

  if (is.null(denominator)) denominator <- df

  df <- df |>
    dplyr::filter(.data[[saffl_var]] == "Y", .data[[ser_var]] == "Y")

  tbl <- df |>
    gtsummary::tbl_hierarchical(
      variables = dplyr::all_of(c(soc_var, pref_var)),
      by = dplyr::all_of(arm_var),
      id = dplyr::all_of(id_var),
      denominator = denominator,
      overall_row = TRUE,
      label = list("..ard_hierarchical_overall.." ~ "Any SAE")
    )

  if (!is.null(lbl_overall)) {
    total <- df |>
      gtsummary::tbl_hierarchical(
        variables = dplyr::all_of(c(soc_var, pref_var)),
        id = id_var,
        denominator = denominator,
        overall_row = TRUE
      )
    tbl <- gtsummary::tbl_merge(list(tbl, total), tab_spanner = FALSE)
  }

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
