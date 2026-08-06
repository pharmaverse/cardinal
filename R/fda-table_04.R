#' FDA Table 4: Patient Disposition, Pooled Analyses
#'
#' @description
#' Creates FDA Table 4 showing patient disposition including population counts, study drug
#' discontinuation reasons, and study discontinuation reasons.
#'
#' @param df (`data.frame`)\cr dataset (typically ADSL) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator. If `NULL`,
#'   `df` is used.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param pop_vars (`character`)\cr population flag variables to include in the table.
#'   Defaults to `c("SAFFL")`.
#' @param lbl_pop_vars (`character`)\cr labels for the population variables. Defaults to
#'   `c("Safety population")`.
#'
#' @details
#' * `df` must contain `EOTSTT`, `DCSREAS`, `EOSSTT`, and the variables specified by `arm_var`,
#'   `id_var`, `saffl_var`, and `pop_vars`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#'   Missing values in flag variables are treated as `"N"`.
#' * Discontinuation reasons are derived from `EOTSTT` and `DCSREAS` combinations.
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
#' result <- make_table_04(df = adsl)
#' result$table
#'
#' @importFrom dplyr filter mutate across all_of case_when
#' @importFrom gtsummary tbl_summary add_overall gather_ard
#' @export
make_table_04 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          pop_vars = c("SAFFL"),
                          lbl_pop_vars = c("Safety population")) {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(id_var, arm_var, pop_vars, "EOTSTT", "DCSREAS", "EOSSTT") %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
  }

  df <- df |>
    dplyr::mutate(
      dplyr::across(dplyr::all_of(pop_vars), ~ . == "Y"),
      DISCSD = EOTSTT == "DISCONTINUED",
      DISCSD_AE = EOTSTT == "DISCONTINUED" & DCSREAS == "ADVERSE EVENT",
      DISCSD_LOE = EOTSTT == "DISCONTINUED" & DCSREAS == "LACK OF EFFICACY",
      DISCSD_PD = EOTSTT == "DISCONTINUED" & DCSREAS == "PROTOCOL DEVIATION",
      DISCSD_DT = EOTSTT == "DISCONTINUED" & DCSREAS == "DEATH",
      DISCSD_WBS = EOTSTT == "DISCONTINUED" & DCSREAS == "WITHDRAWAL BY SUBJECT",
      DISCSD_OTH = EOTSTT == "DISCONTINUED" & DCSREAS == "OTHER",
      DISCS = EOSSTT == "DISCONTINUED",
      DISCS_DT = EOSSTT == "DISCONTINUED" & DCSREAS == "DEATH",
      DISCS_LFU = EOSSTT == "DISCONTINUED" & DCSREAS == "LOST TO FOLLOW-UP",
      DISCS_WBS = EOSSTT == "DISCONTINUED" & DCSREAS == "WITHDRAWAL BY SUBJECT",
      DISCS_PHD = EOSSTT == "DISCONTINUED" & DCSREAS == "PHYSICIAN DECISION",
      DISCS_PD = EOSSTT == "DISCONTINUED" & DCSREAS == "PROTOCOL VIOLATION",
      DISCS_OTH = EOSSTT == "DISCONTINUED" & DCSREAS == "OTHER"
    )

  include_vars <- c(
    pop_vars,
    "DISCSD", "DISCSD_AE", "DISCSD_LOE", "DISCSD_PD", "DISCSD_DT", "DISCSD_WBS", "DISCSD_OTH",
    "DISCS", "DISCS_DT", "DISCS_LFU", "DISCS_WBS", "DISCS_PHD", "DISCS_PD", "DISCS_OTH"
  )

  pop_label <- setNames(as.list(lbl_pop_vars), pop_vars)
  other_labels <- list(
    DISCSD = "Discontinued study drug",
    DISCSD_AE = "  Adverse event",
    DISCSD_LOE = "  Lack of efficacy",
    DISCSD_PD = "  Protocol deviation",
    DISCSD_DT = "  Death",
    DISCSD_WBS = "  Withdrawal by subject",
    DISCSD_OTH = "  Other",
    DISCS = "Discontinued study",
    DISCS_DT = "  Death",
    DISCS_LFU = "  Lost to follow-up",
    DISCS_WBS = "  Withdrawal by subject",
    DISCS_PHD = "  Physician decision",
    DISCS_PD = "  Protocol deviation",
    DISCS_OTH = "  Other"
  )

  all_labels <- c(pop_label, other_labels)

  tbl <- df |>
    gtsummary::tbl_summary(
      by = dplyr::all_of(arm_var),
      include = dplyr::all_of(include_vars),
      statistic = list(gtsummary::all_categorical() ~ "{n} ({p}%)"),
      label = all_labels,
      missing = "no"
    ) |>
    gtsummary::add_overall(last = TRUE, col_label = "**Total Population**  \nN = {N}")

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
