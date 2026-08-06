#' FDA Table 32: Percentage of Patients With Maximum Diastolic Blood Pressure by Category
#'   Postbaseline, Safety Population, Pooled Analysis
#'
#' @description
#' Creates FDA Table 32 showing the percentage of patients in each diastolic blood pressure
#' category based on maximum postbaseline values.
#'
#' @param df (`data.frame`)\cr vital signs dataset (typically ADVS) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator (typically ADSL).
#'   If `NULL`, `df` is used.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param paramcd_val (`character`)\cr value of `PARAMCD` to filter on. Defaults to `"DIABP"`.
#' @param avisitn_min (`numeric`)\cr minimum value of `AVISITN` to include (postbaseline filter).
#'   Defaults to `1`.
#' @param lbl_overall (`character` or `NULL`)\cr label for the overall column. If `NULL` (default),
#'   no overall column is added.
#'
#' @details
#' * `df` must contain `PARAMCD`, `AVAL`, `AVALU`, `AVISITN`, and the variables specified by
#'   `saffl_var`, `arm_var`, and `id_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#'   Missing values in flag variables are treated as `"N"`.
#' * The maximum diastolic BP per patient is computed and categorized into: `<60`, `>60`, `>90`,
#'   `>110`, `>=120`.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("random.cdisc.data", quietly = TRUE) && requireNamespace("dplyr", quietly = TRUE)
#' library(dplyr)
#'
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' result <- make_table_32(df = advs, denominator = adsl, arm_var = "ARM")
#' result$table
#'
#' @importFrom dplyr filter mutate group_by ungroup distinct select left_join all_of case_when
#' @importFrom gtsummary tbl_summary add_overall gather_ard all_categorical
#' @export
make_table_32 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          paramcd_val = "DIABP",
                          avisitn_min = 1,
                          lbl_overall = NULL) {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(saffl_var, "PARAMCD", "AVAL", "AVALU", "AVISITN", arm_var, id_var) %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
    stopifnot(all(c(arm_var, id_var, saffl_var) %in% names(denominator)))
  }

  df_proc <- df |>
    dplyr::filter(
      .data[[saffl_var]] == "Y",
      PARAMCD == paramcd_val,
      AVISITN >= avisitn_min
    ) |>
    dplyr::group_by(.data[[id_var]], PARAMCD) |>
    dplyr::mutate(MAX_DIABP = max(AVAL)) |>
    dplyr::ungroup() |>
    dplyr::distinct(.data[[id_var]], .keep_all = TRUE) |>
    dplyr::select(dplyr::all_of(c(id_var, arm_var, "MAX_DIABP", "AVALU"))) |>
    dplyr::mutate(
      L60 = MAX_DIABP < 60,
      G60 = MAX_DIABP > 60,
      G90 = MAX_DIABP > 90,
      G110 = MAX_DIABP > 110,
      GE120 = MAX_DIABP >= 120
    )

  if (!is.null(denominator)) {
    adsl_safe <- denominator |>
      dplyr::filter(.data[[saffl_var]] == "Y") |>
      dplyr::select(dplyr::all_of(c(id_var, arm_var)))

    avalu_val <- unique(df_proc$AVALU)[1]

    df_proc <- df_proc |> dplyr::select(-dplyr::all_of(arm_var))
    df_proc <- dplyr::left_join(adsl_safe, df_proc, by = id_var)
    df_proc$AVALU <- avalu_val
  }

  avalu <- unique(df_proc$AVALU)[1]

  tbl <- df_proc |>
    gtsummary::tbl_summary(
      by = dplyr::all_of(arm_var),
      include = c("L60", "G60", "G90", "G110", "GE120"),
      statistic = list(gtsummary::all_categorical() ~ "{n} ({p}%)"),
      label = list(
        L60 ~ "<60",
        G60 ~ ">60",
        G90 ~ ">90",
        G110 ~ ">110",
        GE120 ~ ">=120"
      ),
      missing = "no"
    ) |>
    gtsummary::modify_header(
      label ~ paste0("**Diastolic Blood Pressure (", avalu, ")**")
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
