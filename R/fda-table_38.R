#' FDA Table 38: Percentage of Patients Meeting Specific Hypotension Criteria Postbaseline,
#'   Safety Population, Pooled Analysis
#'
#' @description
#' Creates FDA Table 38 showing the percentage of patients meeting specific hypotension criteria
#' (systolic BP < 90 and diastolic BP < 60) based on the minimum postbaseline value per subject
#' per parameter.
#'
#' @param df (`data.frame`)\cr vital signs dataset (typically ADVS) required to build the table.
#' @param denominator (`data.frame`)\cr dataset used as the denominator for header N values.
#'   Typically ADSL pre-filtered to the safety population. Must contain `arm_var`.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param avisitn_min (`numeric`)\cr minimum value of `AVISITN` for the postbaseline filter.
#'   Defaults to `2`.
#'
#' @details
#' * `df` must contain `PARAMCD`, `AVAL`, `AVISITN`, `VSORRESU`, and the variables specified by
#'   `saffl_var`, `arm_var`, and `id_var`.
#' * Rows are filtered to safety population (`saffl_var == "Y"`),
#'   `PARAMCD %in% c("DIABP", "SYSBP")`, and `AVISITN >= avisitn_min`.
#'   The minimum `AVAL` per subject per `PARAMCD` is selected.
#' * Two hypotension flags are derived: `SBP90` (`PARAMCD == "SYSBP" & AVAL < 90`) and
#'   `DBP60` (`PARAMCD == "DIABP" & AVAL < 60`).
#' * `denominator` should already be pre-filtered to the safety population.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE)
#' library(dplyr)
#'
#' adsl <- pharmaverseadam::adsl |> filter(SAFFL == "Y")
#' advs <- pharmaverseadam::advs
#'
#' result <- make_table_38(df = advs, denominator = adsl)
#' result$table
#'
#' @importFrom dplyr filter slice_min mutate distinct all_of
#' @importFrom cards bind_ard ard_tabulate_value ard_tabulate
#' @importFrom gtsummary tbl_ard_summary modify_header all_stat_cols gather_ard
#' @export
make_table_38 <- function(df,
                          denominator,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          avisitn_min = 2) {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(id_var, arm_var, saffl_var, "PARAMCD", "AVAL", "AVISITN", "VSORRESU") %in% names(df)))
  stopifnot(is.data.frame(denominator))
  stopifnot(all(arm_var %in% names(denominator)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)

  data <- df |>
    dplyr::filter(
      .data[[saffl_var]] == "Y",
      PARAMCD %in% c("DIABP", "SYSBP"),
      AVISITN >= avisitn_min
    ) |>
    dplyr::slice_min(AVAL, n = 1L, by = dplyr::all_of(c(id_var, "PARAMCD"))) |>
    dplyr::mutate(
      SBP90 = PARAMCD == "SYSBP" & AVAL < 90,
      DBP60 = PARAMCD == "DIABP" & AVAL < 60
    )

  vsorresu <- data$VSORRESU[1]

  ard <- cards::bind_ard(
    cards::ard_tabulate_value(
      data,
      variables = c(SBP90, DBP60),
      by = dplyr::all_of(arm_var),
      statistic = ~ c("n", "p"),
      denominator = data |> dplyr::select(dplyr::all_of(c(id_var, arm_var))) |> dplyr::distinct()
    ),
    cards::ard_tabulate(denominator, variables = dplyr::all_of(arm_var))
  )

  tbl <- gtsummary::tbl_ard_summary(
    ard,
    by = dplyr::all_of(arm_var),
    label = list(
      SBP90 = "SBP<90",
      DBP60 = "DBP<60"
    )
  ) |>
    gtsummary::modify_header(
      label ~ paste0("**Blood Pressure (", vsorresu, ")**"),
      gtsummary::all_stat_cols() ~ "**{level}**  \nN = {n}"
    )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
