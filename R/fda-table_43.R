#' FDA Table 43: Patients With Adverse Events by System Organ Class, FDA Medical Query (Broad)
#'   and Preferred Term, Safety Population, Pooled Analysis
#'
#' @description
#' Creates FDA Table 43 showing patients with adverse events by SOC, FDA Medical Query (OCMQ,
#' Broad scope) and Preferred Term for the safety population.
#'
#' @param df (`data.frame`)\cr dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame`)\cr dataset used as the denominator for proportion calculations.
#'   Typically safety-filtered ADSL. Cannot be `NULL`.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable. Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param trtemfl_var (`character`)\cr name of the treatment-emergent flag variable.
#'   Defaults to `"TRTEMFL"`.
#' @param soc_var (`character`)\cr name of the system organ class (body system) variable.
#'   Defaults to `"AEBODSYS"`.
#' @param ocmqsc_var (`character`)\cr name of the OCMQ scope variable. Defaults to `"OCMQ01SC"`.
#' @param ocmqnam_var (`character`)\cr name of the OCMQ name variable. Defaults to `"OCMQ01NAM"`.
#' @param pref_var (`character`)\cr name of the preferred term variable. Defaults to `"AEDECOD"`.
#' @param ocmq_scope (`character`)\cr OCMQ scope to filter on: `"NARROW"` or `"BROAD"`.
#'   Defaults to `"BROAD"`.
#'
#' @details
#' * `df` must contain the variables specified by `id_var`, `arm_var`, `saffl_var`,
#'   `trtemfl_var`, `soc_var`, `ocmqsc_var`, `ocmqnam_var`, and `pref_var`.
#' * `denominator` must contain the variables specified by `id_var` and `arm_var`.
#' * Rows are filtered to safety population (`saffl_var == "Y"`) and treatment-emergent AEs
#'   (`trtemfl_var == "Y"`) with the specified OCMQ scope.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE)
#' set.seed(1)
#' adsl <- pharmaverseadam::adsl |>
#'   dplyr::filter(SAFFL == "Y")
#' adae <- pharmaverseadam::adae |>
#'   dplyr::mutate(
#'     OCMQ01NAM = sample(c("OCMQ1", "OCMQ2", "OCMQ3"), dplyr::n(), replace = TRUE),
#'     OCMQ01SC = sample(c("BROAD", "NARROW"), dplyr::n(), replace = TRUE)
#'   )
#'
#' result <- make_table_43(df = adae, denominator = adsl)
#' result$table
#'
#' @importFrom dplyr filter all_of
#' @importFrom gtsummary tbl_ard_hierarchical gather_ard
#' @importFrom cards ard_stack_hierarchical
#' @export
make_table_43 <- function(df,
                          denominator,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          trtemfl_var = "TRTEMFL",
                          soc_var = "AEBODSYS",
                          ocmqsc_var = "OCMQ01SC",
                          ocmqnam_var = "OCMQ01NAM",
                          pref_var = "AEDECOD",
                          ocmq_scope = "BROAD") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(
    id_var, arm_var, saffl_var, trtemfl_var, soc_var,
    ocmqsc_var, ocmqnam_var, pref_var
  ) %in% names(df)))
  stopifnot(is.data.frame(denominator))
  stopifnot(all(c(id_var, arm_var) %in% names(denominator)))
  stopifnot(toupper(ocmq_scope) %in% c("NARROW", "BROAD"))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)

  df <- df |>
    dplyr::filter(
      .data[[saffl_var]] == "Y",
      .data[[trtemfl_var]] == "Y",
      .data[[ocmqsc_var]] == toupper(ocmq_scope)
    )

  scope_label <- tools::toTitleCase(tolower(ocmq_scope))

  ard_data <- cards::ard_stack_hierarchical(
    df,
    variables = dplyr::all_of(c(soc_var, ocmqnam_var, pref_var)),
    by = dplyr::all_of(arm_var),
    id = dplyr::all_of(id_var),
    denominator = denominator,
    include = dplyr::all_of(c(ocmqnam_var, pref_var))
  )

  tbl <- gtsummary::tbl_ard_hierarchical(
    ard_data,
    variables = dplyr::all_of(c(soc_var, ocmqnam_var, pref_var)),
    by = dplyr::all_of(arm_var),
    include = dplyr::all_of(c(ocmqnam_var, pref_var)),
    label = list(
      "..ard_hierarchical_overall.." ~ "Organ System",
      dplyr::all_of(ocmqnam_var) ~ paste0("OCMQ (", scope_label, ")"),
      dplyr::all_of(pref_var) ~ "Preferred Term"
    )
  )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
