#' FDA Table 5: Duration of Treatment Exposure, Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 5 showing duration of treatment exposure, including summary statistics and
#' patient counts by duration category.
#'
#' @param df (`data.frame`)\cr dataset (typically ADSL) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator. If `NULL`,
#'   `df` is used.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param trtsdtm_var (`character`)\cr name of the treatment start datetime variable. Defaults to `"TRTSDTM"`.
#' @param trtedtm_var (`character`)\cr name of the treatment end datetime variable. Defaults to `"TRTEDTM"`.
#' @param u_trtdur (`character`)\cr unit for treatment duration. One of `"days"`, `"weeks"`,
#'   `"months"`, or `"years"`. Defaults to `"days"`.
#'
#' @details
#' * `df` must contain the variables specified by `arm_var`, `saffl_var`, `id_var`, `trtsdtm_var`,
#'   and `trtedtm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#'   Missing values in flag variables are treated as `"N"`.
#' * Records with missing treatment start and/or end datetime are excluded from all calculations.
#' * Duration categories are based on months (regardless of `u_trtdur`).
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE) && requireNamespace("dplyr", quietly = TRUE) && requireNamespace("lubridate", quietly = TRUE)
#' library(dplyr)
#'
#' adsl <- pharmaverseadam::adsl |>
#'   filter(TRT01A != "Screen Failure")
#'
#' result <- make_table_05(df = adsl)
#' result$table
#'
#' @importFrom dplyr filter mutate all_of
#' @importFrom gtsummary tbl_summary tbl_stack all_categorical gather_ard
#' @importFrom lubridate interval ymd_hms
#' @export
make_table_05 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          trtsdtm_var = "TRTSDTM",
                          trtedtm_var = "TRTEDTM",
                          u_trtdur = "days") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(id_var, arm_var, saffl_var, trtsdtm_var, trtedtm_var) %in% names(df)))
  stopifnot(u_trtdur %in% c("days", "weeks", "months", "years"))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
  }

  df <- df |>
    dplyr::filter(.data[[saffl_var]] == "Y") |>
    dplyr::mutate(
      TRTDUR_interval = lubridate::interval(
        lubridate::ymd_hms(.data[[trtsdtm_var]]),
        lubridate::ymd_hms(.data[[trtedtm_var]])
      ),
      TRTDUR_MONTHS = as.numeric(TRTDUR_interval, "months"),
      TRTDUR = as.numeric(TRTDUR_interval, u_trtdur),
      D_ANY = TRTDUR_MONTHS > 0,
      D_LT1 = TRTDUR_MONTHS < 1,
      D_GT1 = TRTDUR_MONTHS >= 1,
      D_GT3 = TRTDUR_MONTHS >= 3,
      D_GT6 = TRTDUR_MONTHS >= 6,
      D_GT12 = TRTDUR_MONTHS >= 12
    ) |>
    dplyr::filter(!is.na(TRTDUR))

  tbl_cts <- df |>
    gtsummary::tbl_summary(
      by = dplyr::all_of(arm_var),
      include = "TRTDUR",
      type = "TRTDUR" ~ "continuous2",
      statistic = "TRTDUR" ~ c(
        "{mean} ({sd})",
        "{median} ({min}, {max})",
        "{p25} - {p75}"
      ),
      label = list(TRTDUR ~ paste("Duration of Treatment,", u_trtdur)),
      missing = "no",
      digits = "TRTDUR" ~ 2
    )

  cat_vars <- c("D_ANY", "D_LT1", "D_GT1", "D_GT3", "D_GT6", "D_GT12")
  tbl_cat <- df |>
    gtsummary::tbl_summary(
      by = dplyr::all_of(arm_var),
      include = dplyr::all_of(cat_vars),
      statistic = list(gtsummary::all_categorical() ~ "{n} ({p}%)"),
      label = list(
        D_ANY ~ "Any duration (at least 1 dose)",
        D_LT1 ~ "<1 month",
        D_GT1 ~ ">=1 month",
        D_GT3 ~ ">=3 months",
        D_GT6 ~ ">=6 months",
        D_GT12 ~ ">=12 months"
      ),
      missing = "no"
    )

  tbl <- gtsummary::tbl_stack(
    list(tbl_cts, tbl_cat),
    quiet = TRUE
  )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
