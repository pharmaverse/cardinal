#' FDA Table 21: Overview of Serious Adverse Events by Demographic Subgroup, Safety Population,
#'   Pooled Analysis
#'
#' @description
#' Creates FDA Table 21 showing an overview of serious adverse events (SAEs) by demographic subgroup,
#' including any SAE and counts by subgroup categories.
#'
#' @param df (`data.frame`)\cr dataset (typically ADAE joined with ADSL) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator (typically ADSL).
#'   If `NULL`, `df` is used.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param vars (`character`)\cr demographic subgroup variables to include in the table.
#'   Defaults to `c("SEX", "AGEGR1", "RACE", "ETHNIC")`.
#' @param lbl_overall (`character` or `NULL`)\cr label for the overall column. If `NULL` (default),
#'   no overall column is added.
#'
#' @details
#' * `df` must contain `AESER`, and the variables specified by `vars`, `arm_var`, `id_var`,
#'   and `saffl_var`.
#' * Information from ADSL is typically joined into `df` prior to calling this function to provide
#'   demographic variables.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#'   Missing values in flag variables are treated as `"N"`.
#' * Numbers represent the absolute number of patients with an SAE and fraction of `N`.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("random.cdisc.data", quietly = TRUE) && requireNamespace("dplyr", quietly = TRUE)
#' library(dplyr)
#'
#' adsl <- random.cdisc.data::cadsl |>
#'   mutate(AGEGR1 = as.factor(case_when(
#'     AGE >= 17 & AGE < 65 ~ ">=17 to <65",
#'     AGE >= 65 ~ ">=65"
#'   )))
#'
#' adae <- random.cdisc.data::cadae |>
#'   filter(AESER == "Y")
#'
#' df <- left_join(adsl, adae, by = intersect(names(adsl), names(adae)))
#'
#' result <- make_table_21(df = df, denominator = adsl, arm_var = "ARM")
#' result$table
#'
#' @importFrom dplyr filter mutate all_of
#' @importFrom gtsummary tbl_summary add_overall gather_ard all_categorical
#' @export
make_table_21 <- function(df,
                           denominator = NULL,
                           return_ard = TRUE,
                           id_var = "USUBJID",
                           arm_var = "TRT01A",
                           saffl_var = "SAFFL",
                           vars = c("SEX", "AGEGR1", "RACE", "ETHNIC"),
                           lbl_overall = NULL) {
  stopifnot(is.data.frame(df))
  stopifnot(all(c("AESER", id_var, arm_var, saffl_var, vars) %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
    stopifnot(all(c(arm_var, id_var, saffl_var) %in% names(denominator)))
  }

  df <- df |>
    dplyr::filter(.data[[saffl_var]] == "Y", AESER == "Y") |>
    dplyr::mutate(
      ANY_SAE = TRUE
    )

  include_vars <- c("ANY_SAE", vars)

  tbl <- df |>
    gtsummary::tbl_summary(
      by = dplyr::all_of(arm_var),
      include = dplyr::all_of(include_vars),
      statistic = list(gtsummary::all_categorical() ~ "{n} ({p}%)"),
      label = list(ANY_SAE ~ "Any SAE"),
      missing = "no"
    )

  if (!is.null(lbl_overall)) {
    tbl <- tbl |> gtsummary::add_overall(last = TRUE, col_label = paste0("**", lbl_overall, "**  \nN = {N}"))
  }

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
