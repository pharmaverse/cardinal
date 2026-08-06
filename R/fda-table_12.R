#' FDA Table 12: Patients With Adverse Events Leading to Treatment Discontinuation
#'   by System Organ Class and Preferred Term, Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 12 showing patients with adverse events leading to treatment discontinuation
#' by system organ class and preferred term for the safety population.
#'
#' @param df (`data.frame`)\cr dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator for proportion
#'   calculations. If `NULL`, `df` is used. Typically ADSL.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param pref_var (`character`)\cr name of the preferred term variable. Defaults to `"AEDECOD"`.
#'
#' @details
#' * `df` must contain `DCSREAS`, `AEBODSYS`, and the variables specified by `arm_var`, `id_var`,
#'   `saffl_var`, and `pref_var`.
#' * If specified, `denominator` must contain `USUBJID` and the variables specified by `arm_var`
#'   and `saffl_var`.
#' * A patient is defined as having at least one adverse event leading to treatment discontinuation
#'   when they have at least one record with `DCSREAS = "ADVERSE EVENT"`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#'   Missing values in flag variables are treated as `"N"`.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE) && requireNamespace("dplyr", quietly = TRUE)
#' library(dplyr)
#'
#' adsl <- pharmaverseadam::adsl |>
#'   filter(TRT01A != "Screen Failure")
#'
#' adae <- pharmaverseadam::adae |>
#'   filter(SAFFL == "Y") |>
#'   mutate(DCSREAS = ifelse(is.na(DCSREAS), "ADVERSE EVENT", DCSREAS))
#'
#' result <- make_table_12(df = adae, denominator = adsl)
#' result$table
#'
#' @importFrom dplyr filter select all_of ungroup
#' @importFrom cards ard_hierarchical
#' @importFrom gtsummary tbl_hierarchical gather_ard
#' @export
make_table_12 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          pref_var = "AEDECOD") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c("AEBODSYS", "DCSREAS", arm_var, id_var, saffl_var, pref_var) %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
    stopifnot(all(c(id_var, arm_var) %in% names(denominator)))
  }

  id_dcsae <- df |>
    dplyr::filter(.data[["DCSREAS"]] == "ADVERSE EVENT") |>
    dplyr::select(dplyr::all_of(id_var)) |>
    unlist()

  df <- df |>
    dplyr::filter(.data[[saffl_var]] == "Y", .data[[id_var]] %in% id_dcsae)

  if (is.null(denominator)) {
    denominator <- df
  } else {
    denominator <- denominator |>
      dplyr::filter(.data[[saffl_var]] == "Y")
  }

  tbl <- gtsummary::tbl_hierarchical(
    data = df,
    variables = dplyr::all_of(c("AEBODSYS", pref_var)),
    by = dplyr::all_of(arm_var),
    id = dplyr::all_of(id_var),
    denominator = denominator,
    overall_row = TRUE,
    label = list("..ard_hierarchical_overall.." ~ "Patients with at least one AE leading to discontinuation")
  )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
