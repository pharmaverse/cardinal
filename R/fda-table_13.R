#' FDA Table 13: Patients With Common Adverse Events Occurring at >=XX% Frequency,
#'   Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 13 showing patients with common adverse events (at or above a specified
#' frequency threshold) by preferred term for the safety population.
#'
#' @param df (`data.frame`)\cr dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator (typically ADSL).
#'   If `NULL`, `df` is used.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param min_freq (`proportion`)\cr minimum frequency (fraction of `N`) required in any column to
#'   include each row. Defaults to `0.05`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param pref_var (`character`)\cr name of the preferred term variable. Defaults to `"AEDECOD"`.
#'
#' @details
#' * `df` must contain the variables specified by `arm_var`, `id_var`, `saffl_var`, and `pref_var`.
#' * If specified, `denominator` must contain `USUBJID` and the variables specified by `arm_var`
#'   and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#'   Missing values in flag variables are treated as `"N"`.
#' * Rows are filtered to safety population (`saffl_var == "Y"`).
#' * Rows are pruned to include only preferred terms with at least `min_freq` frequency in any column.
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
#' adae <- pharmaverseadam::adae
#'
#' result <- make_table_13(df = adae, denominator = adsl)
#' result$table
#'
#' @importFrom dplyr filter all_of group_by summarise ungroup
#' @importFrom gtsummary tbl_hierarchical gather_ard
#' @export
make_table_13 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          min_freq = 0.05,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          pref_var = "AEDECOD") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(id_var, arm_var, saffl_var, pref_var) %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  stopifnot(is.numeric(min_freq), min_freq >= 0, min_freq <= 1)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
    stopifnot(all(c(id_var, arm_var) %in% names(denominator)))
  }

  df <- df |>
    dplyr::filter(.data[[saffl_var]] == "Y")

  if (is.null(denominator)) {
    denominator <- df
  } else {
    denominator <- denominator |>
      dplyr::filter(.data[[saffl_var]] == "Y")
  }

  n_by_arm <- denominator |>
    dplyr::group_by(.data[[arm_var]]) |>
    dplyr::summarise(n = dplyr::n_distinct(.data[[id_var]]), .groups = "drop")

  pt_counts <- df |>
    dplyr::group_by(.data[[arm_var]], .data[[pref_var]]) |>
    dplyr::summarise(n_pt = dplyr::n_distinct(.data[[id_var]]), .groups = "drop") |>
    dplyr::left_join(n_by_arm, by = arm_var) |>
    dplyr::mutate(freq = n_pt / n)

  keep_pts <- pt_counts |>
    dplyr::group_by(.data[[pref_var]]) |>
    dplyr::summarise(max_freq = max(freq), .groups = "drop") |>
    dplyr::filter(max_freq >= min_freq) |>
    dplyr::pull(.data[[pref_var]])

  df <- df |>
    dplyr::filter(.data[[pref_var]] %in% keep_pts)

  tbl <- gtsummary::tbl_hierarchical(
    data = df,
    variables = dplyr::all_of(pref_var),
    by = dplyr::all_of(arm_var),
    id = dplyr::all_of(id_var),
    denominator = denominator,
    overall_row = TRUE,
    label = list("..ard_hierarchical_overall.." ~ "Any AE")
  ) |>
    gtsummary::modify_table_styling(
      columns = dplyr::all_of("label"),
      label = paste0("**", pref_var, "**")
    )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
