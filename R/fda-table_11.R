#' FDA Table 11: Patients with FDA Medical Query (Narrow) Leading to Treatment
#'   Discontinuation, Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 11 showing patients with FDA Medical Query events leading to treatment
#' discontinuation, by system organ class and FMQ, for the safety population.
#'
#' @param df (`data.frame`)\cr dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator (typically ADSL).
#'   If `NULL`, `df` is used.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param fmqsc_var (`character`)\cr name of the FMQ scope variable. Defaults to `"FMQ01SC"`.
#' @param fmqnam_var (`character`)\cr name of the FMQ name variable. Defaults to `"FMQ01NAM"`.
#' @param fmq_scope (`character`)\cr FMQ scope to display: `"NARROW"` or `"BROAD"`. Defaults to
#'   `"NARROW"`.
#' @param na_level (`character`)\cr string used to label missing values. Defaults to `"<Missing>"`.
#'
#' @details
#' * `df` must contain the variables `AEBODSYS`, `DCSREAS`, and the variables specified by
#'   `arm_var`, `id_var`, `saffl_var`, `fmqsc_var`, and `fmqnam_var`.
#' * If specified, `denominator` must contain `USUBJID` and the variables specified by `arm_var`
#'   and `saffl_var`.
#' * A patient is defined as having at least one AE leading to treatment discontinuation when they
#'   have at least one record with `DCSREAS = "ADVERSE EVENT"`.
#' * `fmqsc_var` must contain `"BROAD"` or `"NARROW"` values.
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
#' adae <- random.cdisc.data::cadae
#'
#' set.seed(1)
#' adae <- adae |>
#'   rename(FMQ01SC = SMQ01SC) |>
#'   mutate(
#'     AESER = sample(c("Y", "N"), size = nrow(adae), replace = TRUE),
#'     FMQ01NAM = sample(c("FMQ1", "FMQ2", "FMQ3"), size = nrow(adae), replace = TRUE)
#'   )
#' adae$DCSREAS[is.na(adae$DCSREAS)] <- "ADVERSE EVENT"
#' adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
#'
#' result <- make_table_11(df = adae, denominator = adsl, arm_var = "ARM")
#' result$table
#'
#' @importFrom dplyr filter select all_of
#' @importFrom gtsummary tbl_hierarchical gather_ard
#' @export
make_table_11 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          fmqsc_var = "FMQ01SC",
                          fmqnam_var = "FMQ01NAM",
                          fmq_scope = "NARROW",
                          na_level = "<Missing>") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c("AEBODSYS", "DCSREAS", arm_var, id_var, saffl_var, fmqsc_var, fmqnam_var) %in% names(df)))
  stopifnot(toupper(fmq_scope) %in% c("NARROW", "BROAD"))
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
    dplyr::filter(
      .data[[saffl_var]] == "Y",
      .data[[id_var]] %in% id_dcsae,
      .data[[fmqsc_var]] == toupper(fmq_scope)
    )

  df[[fmqnam_var]] <- paste0("FMQ (", tools::toTitleCase(tolower(fmq_scope)), ")")

  if (is.null(denominator)) {
    denominator <- df
  } else {
    denominator <- denominator |>
      dplyr::filter(.data[[saffl_var]] == "Y")
  }

  tbl <- gtsummary::tbl_hierarchical(
    data = df,
    variables = dplyr::all_of(c("AEBODSYS", fmqnam_var)),
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
