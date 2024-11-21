#' FDA Table 33: Percentage of Patients Meeting Specific Hypotension Levels Postbaseline,
#'   Safety Population, Pooled Analysis
#'
#' @details
#' * `df` must contain `PARAMCD`, `AVAL`, `AVALU`, and the variables specified by `saffl_var`, `arm_var`, and `id_var`.
#'   `saffl_var` must be a flag variable.
#' * `return_ard` set to `TRUE` or `FALSE`; whether the intermediate ARD object should be returned.
#'
#' @inheritParams argument_convention
#' @param subset (`string`)\cr selection of both PARAMCD and definition of baseline.
#'
#' @return A `gtsummary` table and, if `return_ard = TRUE`, an ARD.
#'   If `return_ard = TRUE`, they will be returned as a list with named elements `table` and `ard`.
#'
#' @seealso [`tbl_make_table_33`]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' tbl <- make_table_33(df = advs, denominator = adsl)
#' tbl
#'
#' @export
make_table_33 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          lbl_overall = NULL,
                          subset = NULL) {
  if (is.null(subset)) {
    subset <- as.character(formals(preproc_df_table_33)$subset)
  }

  df <- preproc_df_table_33(df, denominator, id_var, arm_var, saffl_var, subset)
  avalu <- unique(df$AVALU)[1]

  df <- df %>% select(-id_var, -AVALU)

  tbl_gts <- df |>
    tbl_summary(
      by = arm_var,
      statistic = list(all_categorical() ~ "{n} ({p}%)"),
      digits = list(all_continuous() ~ c(0, 1), all_categorical() ~ c(0, 1)),
      missing = "no"
    ) |>
    modify_header(label ~ paste0("**Diastolic Blood Pressure (", avalu, ")**")) |>
    modify_header(all_stat_cols() ~ "**{level}**  \nN = {n}") |>
    gtsummary::modify_column_alignment(columns = all_stat_cols(), align = "right")

  if (!is.null(lbl_overall)) {
    tbl_gts <- tbl_gts |>
      add_overall(last = TRUE, col_label = paste0("**", lbl_overall, "**  \n N = {n}"))
  }

  tbl <- gtsummary::with_gtsummary_theme(
    x = gtsummary::theme_gtsummary_compact(),
    expr = as_gt(tbl_gts)
  )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl_gts)
    return(list(table = tbl, ard = ard))
  } else {
    return(tbl) # nocov
  }
}

#' Pre-Process Data for Table 33 Creation
#'
#' @param subset (`string`)\cr selection of both PARAMCD and definition of baseline.
#'
#' @keywords internal
preproc_df_table_33 <- function(df,
                                denominator = NULL,
                                id_var = "USUBJID",
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                subset =
                                  "PARAMCD %in% c('DIABP', 'SYSBP') & AVISITN >= 1") {
  subset_c <-
    sapply(
      unlist(admiraldev::extract_vars(rlang::parse_exprs(subset))),
      as.character
    )
  assert_subset(c(
    saffl_var, "PARAMCD", "AVAL", "AVALU", arm_var, id_var, subset_c
  ), names(df))
  assert_flag_variables(df, saffl_var)

  advs_all <- df |>
    filter(rlang::eval_tidy(rlang::parse_expr(subset))) |>
    filter(.data[[saffl_var]] == "Y") |>
    group_by(.data[[id_var]], PARAMCD) |>
    mutate(
      MIN_DIABP = if_else(PARAMCD == "DIABP", min(AVAL), NA_real_),
      MIN_SYSBP = if_else(PARAMCD == "SYSBP", min(AVAL), NA_real_)
    ) |>
    ungroup() |>
    mutate(
      SBP90 = if_else(MIN_SYSBP < 90, "SBP <90", "Not", missing = "Not"),
      DBP60 = if_else(MIN_DIABP < 60, "DBP <60", "Not", missing = "Not")
    ) |>
    mutate(
      SBP90 = formatters::with_label(SBP90 == "SBP <90", "SBP <90"),
      DBP60 = formatters::with_label(DBP60 == "DBP <60", "DBP <60")
    )

  advs_diabp <- advs_all |>
    filter(PARAMCD == "DIABP") |>
    distinct(.data[[id_var]], .keep_all = TRUE) |>
    select(all_of(c(id_var, "DBP60", "ARM", "AVALU")))

  advs_sysbp <- advs_all |>
    filter(PARAMCD == "SYSBP") |>
    distinct(.data[[id_var]], .keep_all = TRUE) |>
    select(all_of(c(id_var, "SBP90")))

  df <-
    full_join(advs_diabp, advs_sysbp, by = id_var) |>
    select(all_of(c("SBP90", "DBP60", "ARM", "AVALU", id_var, arm_var)))

  if (!is.null(denominator)) {
    adsl <- denominator |>
      filter(.data[[saffl_var]] == "Y") |>
      select(all_of(c(id_var, arm_var, saffl_var)))

    df <-
      df |>
      select(!all_of(arm_var)) |>
      right_join(adsl, by = id_var)
  } else {
    df <- df
  }

  df <- df |>
    select(SBP90, DBP60, AVALU, all_of(arm_var), all_of(id_var))
}

#' Engine-Specific Functions: Table 32
#'
#' The table engine used by each engine-specific function is identified by its suffix.
#'
#' @inheritParams argument_convention
#' @param subset (`string`)\cr selection of both PARAMCD and definition of baseline.
#'
#' @details
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table "Patients Treated" section are the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are not removed by default (see `prune_0` argument).
#' * Records with missing treatment start and/or end datetime are excluded from all calculations.
#'
#' @return
#' * `make_table_33_rtables()` returns an `rtable` object.
#'
#' @seealso [make_table_33()]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' # rtables table ----------------
#' tbl_rtables <- cardinal::make_table_33_rtables(df = advs, alt_counts_df = adsl)
#' tbl_rtables
#' @export
#' @name tbl_make_table_33
make_table_33_rtables <- function(df,
                                  alt_counts_df = NULL,
                                  show_colcounts = TRUE,
                                  id_var = "USUBJID",
                                  arm_var = "ARM",
                                  saffl_var = "SAFFL",
                                  subset = NULL,
                                  lbl_overall = NULL,
                                  risk_diff = NULL,
                                  prune_0 = FALSE,
                                  annotations = NULL) {
  if (is.null(subset)) {
    subset <- as.character(formals(preproc_df_table_33)$subset)
  }
  df <- preproc_df_table_33(df, denominator = alt_counts_df, id_var, arm_var, saffl_var, subset)
  avalu <- unique(df$AVALU)[1]

  lyt <- basic_table_annot(show_colcounts, annotations) |>
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) |>
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("SBP90", "DBP60"),
      riskdiff = !is.null(risk_diff)
    ) |>
    append_topleft(c("Blood Pressure", paste0("(", unique(df$AVALU)[1], ")")))

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
