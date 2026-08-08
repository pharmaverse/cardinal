#' FDA Table 29: Patients With Serious Adverse Events by System Organ Class, OCMQ (Narrow Scope)
#'   and Preferred Term, Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 29 showing patients with serious adverse events by system organ class,
#' oncology condition medical query (OCMQ, narrow scope) and preferred term for the safety
#' population.
#'
#' @param df (`data.frame`)\cr adverse events dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame`)\cr dataset used as the denominator for proportion calculations.
#'   Typically ADSL pre-filtered to the safety population. Must contain `id_var` and `arm_var`.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param ser_var (`character`)\cr name of the variable indicating serious adverse events.
#'   Defaults to `"AESER"`.
#' @param trtemfl_var (`character`)\cr name of the treatment-emergent AE flag variable.
#'   Defaults to `"TRTEMFL"`.
#' @param soc_var (`character`)\cr name of the system organ class variable. Defaults to `"AEBODSYS"`.
#' @param ocmqsc_var (`character`)\cr name of the OCMQ scope variable. Defaults to `"OCMQ01SC"`.
#' @param ocmqnam_var (`character`)\cr name of the OCMQ name variable. Defaults to `"OCMQ01NAM"`.
#' @param pref_var (`character`)\cr name of the preferred term variable. Defaults to `"AEDECOD"`.
#' @param ocmq_scope (`character`)\cr OCMQ scope to filter on: `"NARROW"` or `"BROAD"`.
#'   Defaults to `"NARROW"`.
#'
#' @details
#' * `df` must contain the variables specified by `id_var`, `arm_var`, `saffl_var`, `ser_var`,
#'   `trtemfl_var`, `soc_var`, `ocmqsc_var`, `ocmqnam_var`, and `pref_var`.
#' * `denominator` must contain the variables specified by `id_var` and `arm_var` and should be
#'   pre-filtered to the safety population before passing to this function.
#' * Rows in `df` are filtered to safety population (`saffl_var == "Y"`), serious AEs
#'   (`ser_var == "Y"`), treatment-emergent AEs (`trtemfl_var == "Y"`), and the specified OCMQ
#'   scope (`ocmqsc_var == toupper(ocmq_scope)`).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE)
#' library(dplyr)
#'
#' set.seed(1)
#' adae <- pharmaverseadam::adae |>
#'   rename(OCMQ01SC = AEHLTCD) |>
#'   mutate(
#'     AESER = sample(c("Y", "N"), size = nrow(pharmaverseadam::adae), replace = TRUE),
#'     OCMQ01NAM = sample(c("OCMQ1", "OCMQ2", "OCMQ3"), size = nrow(pharmaverseadam::adae), replace = TRUE)
#'   ) |>
#'   filter(AESOC == "VASCULAR DISORDERS")
#' adae$OCMQ01SC[is.na(adae$OCMQ01SC)] <- "NARROW"
#'
#' adsl <- pharmaverseadam::adsl |> filter(SAFFL == "Y")
#'
#' result <- make_table_29(df = adae, denominator = adsl)
#' result$table
#'
#' @importFrom dplyr filter all_of
#' @importFrom cards ard_stack_hierarchical
#' @importFrom gtsummary tbl_ard_hierarchical modify_header gather_ard
#' @export
make_table_29 <- function(df,
                          denominator,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          ser_var = "AESER",
                          trtemfl_var = "TRTEMFL",
                          soc_var = "AEBODSYS",
                          ocmqsc_var = "OCMQ01SC",
                          ocmqnam_var = "OCMQ01NAM",
                          pref_var = "AEDECOD",
                          ocmq_scope = "NARROW") {
  stopifnot(is.data.frame(df))
  stopifnot(
    all(c(id_var, arm_var, saffl_var, ser_var, trtemfl_var, soc_var, ocmqsc_var, ocmqnam_var, pref_var) %in% names(df))
  )
  stopifnot(is.data.frame(denominator))
  stopifnot(all(c(id_var, arm_var) %in% names(denominator)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  stopifnot(toupper(ocmq_scope) %in% c("NARROW", "BROAD"))

  data <- df |>
    dplyr::filter(
      .data[[saffl_var]] == "Y",
      .data[[ser_var]] == "Y",
      .data[[trtemfl_var]] == "Y",
      .data[[ocmqsc_var]] == toupper(ocmq_scope)
    )

  ard <- cards::ard_stack_hierarchical(
    data,
    variables = dplyr::all_of(c(soc_var, ocmqnam_var, pref_var)),
    by = dplyr::all_of(arm_var),
    id = dplyr::all_of(id_var),
    denominator = denominator,
    include = dplyr::all_of(c(ocmqnam_var, pref_var))
  )

  tbl <- gtsummary::tbl_ard_hierarchical(
    ard,
    variables = dplyr::all_of(c(soc_var, ocmqnam_var, pref_var)),
    by = dplyr::all_of(arm_var),
    include = dplyr::all_of(c(ocmqnam_var, pref_var))
  ) |>
    gtsummary::modify_header(label = "**Organ System**")

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
