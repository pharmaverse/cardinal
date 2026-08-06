#' FDA Table 14: Patients With Adverse Events by System Organ Class and FDA Medical Query,
#'   Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 14 showing patients with adverse events by system organ class and
#' FDA Medical Query (split by scope) for the safety population.
#'
#' @param df (`data.frame`)\cr dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator (typically ADSL).
#'   If `NULL`, `df` is used.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param soc_var (`character`)\cr name of the system organ class variable. Defaults to `"AEBODSYS"`.
#' @param fmqsc_var (`character`)\cr name of the FMQ scope variable. Defaults to `"FMQ01SC"`.
#' @param fmqnam_var (`character`)\cr name of the FMQ name variable. Defaults to `"FMQ01NAM"`.
#' @param na_level (`character`)\cr string used to label missing values. Defaults to `"<Missing>"`.
#'
#' @details
#' * `df` must contain the variables specified by `arm_var`, `saffl_var`, `id_var`, `soc_var`,
#'   `fmqsc_var`, and `fmqnam_var`.
#' * If specified, `denominator` must contain the variables specified by `arm_var`, `id_var`,
#'   and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#'   Missing values in flag variables are treated as `"N"`.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("random.cdisc.data", quietly = TRUE) && requireNamespace("dplyr", quietly = TRUE)
#' library(dplyr)
#'
#' adae <- random.cdisc.data::cadae
#' adae <- dplyr::rename(adae, FMQ01SC = SMQ01SC, FMQ01NAM = SMQ01NAM)
#' levels(adae$FMQ01SC) <- c("BROAD", "NARROW")
#' adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
#'
#' result <- make_table_14(df = adae, arm_var = "ARM")
#' result$table
#'
#' @importFrom dplyr filter all_of
#' @importFrom gtsummary tbl_hierarchical gather_ard
#' @export
make_table_14 <- function(df,
                           denominator = NULL,
                           return_ard = TRUE,
                           id_var = "USUBJID",
                           arm_var = "TRT01A",
                           saffl_var = "SAFFL",
                           soc_var = "AEBODSYS",
                           fmqsc_var = "FMQ01SC",
                           fmqnam_var = "FMQ01NAM",
                           na_level = "<Missing>") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(id_var, soc_var, arm_var, saffl_var, fmqsc_var, fmqnam_var) %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
    stopifnot(all(c(arm_var, id_var) %in% names(denominator)))
  }

  df <- df |>
    dplyr::filter(.data[[saffl_var]] == "Y")

  if (is.null(denominator)) {
    denominator <- df
  } else {
    denominator <- denominator |>
      dplyr::filter(.data[[saffl_var]] == "Y")
  }

  tbl <- gtsummary::tbl_hierarchical(
    data = df,
    variables = dplyr::all_of(c(fmqsc_var, soc_var, fmqnam_var)),
    by = dplyr::all_of(arm_var),
    id = dplyr::all_of(id_var),
    include = fmqnam_var,
    denominator = denominator,
    overall_row = FALSE
  )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
