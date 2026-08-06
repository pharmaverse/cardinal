#' FDA Table 33: Percentage of Patients Meeting Specific Hypotension Levels Postbaseline,
#'   Safety Population, Pooled Analysis
#'
#' @description
#' Creates FDA Table 33 showing the percentage of patients meeting specific hypotension criteria,
#' including systolic BP < 90 and diastolic BP < 60, based on postbaseline values.
#'
#' @param df (`data.frame`)\cr vital signs dataset (typically ADVS) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator (typically ADSL).
#'   If `NULL`, `df` is used.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
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
#' * Hypotension criteria: systolic BP < 90 (`PARAMCD == "SYSBP"`) and diastolic BP < 60
#'   (`PARAMCD == "DIABP"`), based on minimum postbaseline values per patient.
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
#' result <- make_table_33(df = advs, denominator = adsl, arm_var = "ARM")
#' result$table
#'
#' @importFrom dplyr filter mutate group_by ungroup distinct select full_join left_join all_of if_else
#' @importFrom gtsummary tbl_summary add_overall gather_ard all_categorical
#' @export
make_table_33 <- function(df,
                           denominator = NULL,
                           return_ard = TRUE,
                           id_var = "USUBJID",
                           arm_var = "TRT01A",
                           saffl_var = "SAFFL",
                           avisitn_min = 1,
                           lbl_overall = NULL) {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(saffl_var, "PARAMCD", "AVAL", "AVALU", "AVISITN", arm_var, id_var) %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
    stopifnot(all(c(arm_var, id_var, saffl_var) %in% names(denominator)))
  }

  df_post <- df |>
    dplyr::filter(
      .data[[saffl_var]] == "Y",
      PARAMCD %in% c("DIABP", "SYSBP"),
      AVISITN >= avisitn_min
    ) |>
    dplyr::group_by(.data[[id_var]], PARAMCD) |>
    dplyr::mutate(
      MIN_DIABP = dplyr::if_else(PARAMCD == "DIABP", min(AVAL), NA_real_),
      MIN_SYSBP = dplyr::if_else(PARAMCD == "SYSBP", min(AVAL), NA_real_)
    ) |>
    dplyr::ungroup()

  advs_diabp <- df_post |>
    dplyr::filter(PARAMCD == "DIABP") |>
    dplyr::distinct(.data[[id_var]], .keep_all = TRUE) |>
    dplyr::select(dplyr::all_of(c(id_var, arm_var, "MIN_DIABP", "AVALU"))) |>
    dplyr::mutate(DBP60 = !is.na(MIN_DIABP) & MIN_DIABP < 60)

  advs_sysbp <- df_post |>
    dplyr::filter(PARAMCD == "SYSBP") |>
    dplyr::distinct(.data[[id_var]], .keep_all = TRUE) |>
    dplyr::select(dplyr::all_of(c(id_var, "MIN_SYSBP"))) |>
    dplyr::mutate(SBP90 = !is.na(MIN_SYSBP) & MIN_SYSBP < 90)

  df_proc <- dplyr::full_join(advs_diabp, advs_sysbp, by = id_var)

  avalu_val <- unique(df_proc$AVALU)[1]

  if (!is.null(denominator)) {
    adsl_safe <- denominator |>
      dplyr::filter(.data[[saffl_var]] == "Y") |>
      dplyr::select(dplyr::all_of(c(id_var, arm_var)))

    df_proc <- df_proc |> dplyr::select(-dplyr::all_of(arm_var))
    df_proc <- dplyr::left_join(adsl_safe, df_proc, by = id_var)
  }

  tbl <- df_proc |>
    gtsummary::tbl_summary(
      by = dplyr::all_of(arm_var),
      include = c("SBP90", "DBP60"),
      statistic = list(gtsummary::all_categorical() ~ "{n} ({p}%)"),
      label = list(
        SBP90 ~ paste0("SBP <90 (", avalu_val, ")"),
        DBP60 ~ paste0("DBP <60 (", avalu_val, ")")
      ),
      missing = "no"
    ) |>
    gtsummary::modify_header(label ~ "**Blood Pressure**")

  if (!is.null(lbl_overall)) {
    tbl <- tbl |> gtsummary::add_overall(last = TRUE, col_label = paste0("**", lbl_overall, "**  \nN = {N}"))
  }

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
