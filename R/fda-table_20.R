#' FDA Table 20: Adverse Events of Special Interest Assessment, Safety Population, Pooled Analysis
#'
#' @description
#' Creates FDA Table 20 showing adverse events of special interest (AESI) assessment, including
#' AESI groupings, preferred terms, maximum severity, seriousness, deaths, discontinuations,
#' relatedness, and laboratory assessments.
#'
#' @param df (`data.frame`)\cr adverse events dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator (typically ADSL).
#'   If `NULL`, `df` is used.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param pref_var (`character`)\cr name of the preferred term variable. Defaults to `"AEDECOD"`.
#' @param aesifl_var (`character`)\cr name of the AESI flag variable. Defaults to `"AESIFL"`.
#' @param aelabfl_var (`character`)\cr name of the laboratory assessment flag variable.
#'   Defaults to `"AELABFL"`.
#' @param lbl_overall (`character` or `NULL`)\cr label for the overall column. If `NULL` (default),
#'   no overall column is added.
#'
#' @details
#' * `df` must contain `AESEV`, `AESER`, `AESDTH`, `EOSSTT`, `AEREL`, and the variables specified
#'   by `id_var`, `pref_var`, `aesifl_var`, `aelabfl_var`, `arm_var`, and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#'   Missing values in flag variables are treated as `"N"`.
#' * Only records where `aesifl_var == "Y"` are included.
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
#' adae$AESIFL <- ifelse(adae$AESOC %in% c("cl A", "cl D"), "Y", "N")
#' adae$AELABFL <- sample(c("Y", "N"), nrow(adae), replace = TRUE)
#'
#' result <- make_table_20(df = adae, denominator = adsl, arm_var = "ARM")
#' result$table
#'
#' @importFrom dplyr filter mutate all_of
#' @importFrom gtsummary tbl_hierarchical tbl_summary tbl_stack add_overall gather_ard all_categorical
#' @export
make_table_20 <- function(df,
                           denominator = NULL,
                           return_ard = TRUE,
                           id_var = "USUBJID",
                           arm_var = "TRT01A",
                           saffl_var = "SAFFL",
                           pref_var = "AEDECOD",
                           aesifl_var = "AESIFL",
                           aelabfl_var = "AELABFL",
                           lbl_overall = NULL) {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(
    "AESEV", "AESER", "AESDTH", "EOSSTT", "AEREL",
    id_var, pref_var, aesifl_var, aelabfl_var, arm_var, saffl_var
  ) %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
    stopifnot(all(c(arm_var, id_var) %in% names(denominator)))
  }

  if (is.null(denominator)) {
    denominator <- df |> dplyr::filter(.data[[saffl_var]] == "Y")
  } else {
    denominator <- denominator |> dplyr::filter(.data[[saffl_var]] == "Y")
  }

  df <- df |>
    dplyr::filter(.data[[saffl_var]] == "Y", .data[[aesifl_var]] == "Y") |>
    dplyr::mutate(
      AESI_flag = TRUE,
      AESEV = factor(AESEV, levels = c("MILD", "MODERATE", "SEVERE")),
      AESER_flag = AESER == "Y",
      AESDTH_flag = AESDTH == "Y",
      DISC_flag = EOSSTT == "DISCONTINUED",
      AEREL_flag = AEREL == "Y",
      AELABFL_flag = .data[[aelabfl_var]] == "Y"
    )

  tbl_any <- gtsummary::tbl_hierarchical(
    data = df,
    variables = dplyr::all_of(c(pref_var)),
    by = dplyr::all_of(arm_var),
    id = dplyr::all_of(id_var),
    denominator = denominator,
    overall_row = TRUE,
    label = list("..ard_hierarchical_overall.." ~ "AE grouping related to AESI")
  )

  flag_vars <- c("AESER_flag", "AESDTH_flag", "DISC_flag", "AEREL_flag", "AELABFL_flag")
  tbl_flags <- df |>
    gtsummary::tbl_summary(
      by = dplyr::all_of(arm_var),
      include = dplyr::all_of(flag_vars),
      statistic = list(gtsummary::all_categorical() ~ "{n} ({p}%)"),
      label = list(
        AESER_flag ~ "Serious",
        AESDTH_flag ~ "Deaths",
        DISC_flag ~ "Resulting in discontinuation",
        AEREL_flag ~ "Relatedness",
        AELABFL_flag ~ "Laboratory Assessment"
      ),
      missing = "no"
    )

  tbl <- gtsummary::tbl_stack(list(tbl_any, tbl_flags), quiet = TRUE)

  if (!is.null(lbl_overall)) {
    tbl <- tbl |> gtsummary::add_overall(last = TRUE, col_label = paste0("**", lbl_overall, "**  \nN = {N}"))
  }

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
