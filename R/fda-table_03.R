#' FDA Table 3: Patient Screening and Enrollment, Trials A and B
#'
#' @description
#' Creates FDA Table 3 showing patient screening and enrollment, including patients screened,
#' screening failures and reasons, patients enrolled, and patients randomized.
#'
#' @param df (`data.frame`)\cr dataset (typically ADSL) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator. If `NULL`,
#'   `df` is used.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param scrnfl_var (`character`)\cr name of the screen flag variable. Defaults to `"SCRNFL"`.
#' @param scrnfailfl_var (`character`)\cr name of the screening failure flag variable.
#'   Defaults to `"SCRNFAILFL"`.
#' @param scrnfail_var (`character`)\cr name of the screening failure reason variable.
#'   Defaults to `"SCRNFRS"`.
#'
#' @details
#' * `df` must contain `ENRLDT`, `RANDDT`, and the variables specified by `id_var`, `arm_var`,
#'   `scrnfl_var`, `scrnfailfl_var`, and `scrnfail_var`.
#' * Patients are considered enrolled if they have an enrollment date (`ENRLDT` is not missing),
#'   and are considered randomized if they have a randomization date (`RANDDT` is not missing).
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
#' adsl <- random.cdisc.data::cadsl
#'
#' set.seed(1)
#' adsl$RANDDT[sample(seq_len(nrow(adsl)), 100)] <- NA
#' scrnfail_reas_lvls <- c(
#'   "Inclusion/exclusion criteria not met", "Patient noncompliance",
#'   "Consent withdrawn", "Other"
#' )
#' adsl <- adsl |>
#'   mutate(
#'     ENRLDT = RANDDT,
#'     SCRNFL = "Y",
#'     SCRNFRS = factor(
#'       sample(scrnfail_reas_lvls, size = nrow(adsl), replace = TRUE),
#'       levels = scrnfail_reas_lvls
#'     ),
#'     SCRNFAILFL = ifelse(is.na(ENRLDT), "Y", "N")
#'   )
#' adsl$SCRNFRS[!is.na(adsl$ENRLDT)] <- NA
#'
#' result <- make_table_03(df = adsl, denominator = adsl, arm_var = "ARM")
#' result$table
#'
#' @importFrom dplyr filter mutate select all_of
#' @importFrom gtsummary tbl_summary add_overall gather_ard
#' @export
make_table_03 <- function(df,
                           denominator = NULL,
                           return_ard = TRUE,
                           id_var = "USUBJID",
                           arm_var = "TRT01A",
                           scrnfl_var = "SCRNFL",
                           scrnfailfl_var = "SCRNFAILFL",
                           scrnfail_var = "SCRNFRS") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(arm_var, id_var, scrnfl_var, scrnfailfl_var, scrnfail_var, "ENRLDT", "RANDDT") %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
  }

  df <- df |>
    dplyr::mutate(
      SCRNFL_flag = .data[[scrnfl_var]] == "Y",
      SCRNFAILFL_flag = .data[[scrnfailfl_var]] == "Y",
      ENRLFL = !is.na(ENRLDT),
      RANDFL = !is.na(RANDDT)
    )

  if (is.null(denominator)) {
    denominator <- df
  }

  include_vars <- c("SCRNFL_flag", scrnfail_var, "ENRLFL", "RANDFL")

  tbl <- df |>
    gtsummary::tbl_summary(
      by = dplyr::all_of(arm_var),
      include = dplyr::all_of(include_vars),
      statistic = list(gtsummary::all_categorical() ~ "{n} ({p}%)"),
      label = list(
        SCRNFL_flag ~ "Patients screened",
        ENRLFL ~ "Patients enrolled",
        RANDFL ~ "Patients randomized"
      ),
      missing = "no"
    ) |>
    gtsummary::modify_header(label ~ "**Disposition**")

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
