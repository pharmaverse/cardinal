#' FDA Table 34: Patients With Serious Adverse Events by System Organ Class, FDA Medical Query
#'   (Narrow) and Preferred Term, Safety Population, Pooled Analysis
#'
#' @description
#' Creates FDA Table 34 showing patients with serious adverse events (SAEs) by System Organ Class
#' (SOC), FDA Medical Query (FMQ, Narrow scope) and Preferred Term (PT).
#'
#' @param df (`data.frame`)\cr adverse events dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator (typically ADSL).
#'   If `NULL`, `df` is used.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param soc_var (`character`)\cr name of the System Organ Class variable. Defaults to `"AEBODSYS"`.
#' @param fmqsc_var (`character`)\cr name of the FMQ scope variable. Defaults to `"FMQ01SC"`.
#' @param fmqnam_var (`character`)\cr name of the FMQ name variable. Defaults to `"FMQ01NAM"`.
#' @param fmq_scope (`character`)\cr FMQ scope to filter on: `"NARROW"` or `"BROAD"`.
#'   Defaults to `"NARROW"`.
#' @param pref_var (`character`)\cr name of the preferred term variable. Defaults to `"AEDECOD"`.
#' @param na_level (`character`)\cr string used to label missing values. Defaults to `"<Missing>"`.
#'
#' @details
#' * `df` must contain `AESER`, `AEBODSYS`, and the variables specified by `arm_var`, `id_var`,
#'   `saffl_var`, `fmqsc_var`, `fmqnam_var`, and `pref_var`.
#' * Only records with `AESER == "Y"` and `fmqsc_var == fmq_scope` are included.
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
#' adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
#'
#' result <- make_table_34(df = adae, denominator = adsl, arm_var = "ARM")
#' result$table
#'
#' @importFrom dplyr filter all_of
#' @importFrom gtsummary tbl_hierarchical gather_ard
#' @export
make_table_34 <- function(df,
                           denominator = NULL,
                           return_ard = TRUE,
                           id_var = "USUBJID",
                           arm_var = "TRT01A",
                           saffl_var = "SAFFL",
                           soc_var = "AEBODSYS",
                           fmqsc_var = "FMQ01SC",
                           fmqnam_var = "FMQ01NAM",
                           fmq_scope = "NARROW",
                           pref_var = "AEDECOD",
                           na_level = "<Missing>") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c("AESER", soc_var, arm_var, id_var, saffl_var, fmqsc_var, fmqnam_var, pref_var) %in% names(df)))
  stopifnot(toupper(fmq_scope) %in% c("NARROW", "BROAD"))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
    stopifnot(all(c(arm_var, id_var) %in% names(denominator)))
  }

  df <- df |>
    dplyr::filter(
      .data[[saffl_var]] == "Y",
      AESER == "Y",
      .data[[fmqsc_var]] == toupper(fmq_scope)
    )

  if (is.null(denominator)) {
    denominator <- df
  } else {
    denominator <- denominator |> dplyr::filter(.data[[saffl_var]] == "Y")
  }

  tbl <- gtsummary::tbl_hierarchical(
    data = df,
    variables = dplyr::all_of(c(soc_var, fmqnam_var, pref_var)),
    by = dplyr::all_of(arm_var),
    id = dplyr::all_of(id_var),
    denominator = denominator,
    overall_row = TRUE,
    label = list(
      "..ard_hierarchical_overall.." ~ paste0("Any SAE (FMQ ", tools::toTitleCase(tolower(fmq_scope)), ")")
    )
  )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
