#' FDA Table 7: Deaths, Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 7 showing deaths split by treatment-emergent and non-treatment-emergent,
#' with cause of death breakdown for the safety population.
#'
#' @param adae (`data.frame`)\cr dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator (typically ADSL).
#'   If `NULL`, `adae` is used.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#'
#' @details
#' * `adae` must contain `TRTEMFL`, `DTHFL`, `DTHCAUS`, and the variables specified by `arm_var`,
#'   `id_var`, and `saffl_var`.
#' * If specified, `denominator` must contain the variables specified by `arm_var`, `id_var`,
#'   and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#'   Missing values in flag variables are treated as `"N"`.
#' * Rows are filtered to safety population and patients with `DTHFL == "Y"`.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N` for category
#'   summary rows and fraction of `n` for all other rows.
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
#'   filter(DTHFL == "Y")
#'
#' result <- make_table_07(adae = adae, denominator = adsl)
#' result$table
#'
#' @importFrom dplyr filter mutate all_of
#' @importFrom gtsummary tbl_hierarchical tbl_stack gather_ard
#' @export
make_table_07 <- function(adae,
                          denominator = NULL,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL") {
  stopifnot(is.data.frame(adae))
  stopifnot(all(c("TRTEMFL", "DTHFL", "DTHCAUS", arm_var, id_var, saffl_var) %in% names(adae)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
    stopifnot(all(c(arm_var, id_var) %in% names(denominator)))
  }

  if (is.null(denominator)) denominator <- adae

  df <- adae |>
    dplyr::filter(.data[[saffl_var]] == "Y", .data[["DTHFL"]] == "Y") |>
    dplyr::mutate(
      TRTEM_GROUP = dplyr::case_when(
        TRTEMFL == "Y" ~ "Treatment-emergent deaths",
        TRUE ~ "Non-treatment-emergent deaths"
      )
    )

  tbl_trtem <- gtsummary::tbl_hierarchical(
    data = df |> dplyr::filter(TRTEMFL == "Y"),
    variables = dplyr::all_of("DTHCAUS"),
    by = dplyr::all_of(arm_var),
    id = dplyr::all_of(id_var),
    denominator = denominator,
    overall_row = TRUE,
    label = list("..ard_hierarchical_overall.." ~ "Treatment-emergent deaths")
  )

  tbl_nontrtem <- gtsummary::tbl_hierarchical(
    data = df |> dplyr::filter(TRTEMFL != "Y"),
    variables = dplyr::all_of("DTHCAUS"),
    by = dplyr::all_of(arm_var),
    id = dplyr::all_of(id_var),
    denominator = denominator,
    overall_row = TRUE,
    label = list("..ard_hierarchical_overall.." ~ "Non-treatment-emergent deaths")
  )

  tbl_total <- gtsummary::tbl_hierarchical(
    data = df,
    variables = dplyr::all_of("DTHCAUS"),
    by = dplyr::all_of(arm_var),
    id = dplyr::all_of(id_var),
    denominator = denominator,
    overall_row = TRUE,
    label = list("..ard_hierarchical_overall.." ~ "Total deaths")
  )

  tbl <- gtsummary::tbl_stack(list(tbl_total, tbl_trtem, tbl_nontrtem), quiet = TRUE) |>
    gtsummary::modify_table_styling(
      columns = dplyr::all_of("label"),
      label = "**Deaths**"
    )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
