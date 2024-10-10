#' FDA Table 32: Percentage of Patients With Maximum Diastolic Blood Pressure by Category of Blood Pressure
#'   Postbaseline, Safety Population, Pooled Analysis
#'
#' @details
#' * `df` must contain `PARAMCD`, `AVAL`, `AVALU`, and the variables specified by `saffl_var`, `arm_var`, and `id_var`.
#'   `saffl_var` must be a flag variable.
#' * `return_ard` set to `TRUE` or `FALSE`; whether the intermediate ARD object should be returned.
#'
#' @inheritParams tbl_make_table_32
#' @inheritParams argument_convention
#'
#' @return A `gtsummary` table and, if `return_ard = TRUE`, an ARD.
#'   If `return_ard = TRUE`, they will be returned as a list with named elements `table` and `ard`.
#'
#' @seealso [`tbl_make_table_32`]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' tbl <- make_table_32(df = advs, denominator = adsl)
#' tbl
#'
#' @export
make_table_32 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          lbl_overall = NULL) {
  ard <- ard_table_32(
    df = df,
    denominator = denominator,
    id_var = id_var,
    arm_var = arm_var,
    saffl_var = saffl_var,
    lbl_overall = lbl_overall
  )

  tbl <- make_table_32_gtsummary(
    df = df,
    ard = ard,
    denominator = denominator,
    id_var = id_var,
    arm_var = arm_var,
    saffl_var = saffl_var,
    lbl_overall = lbl_overall
  )

  if (return_ard) {
    return(list(table = tbl, ard = ard))
  } else {
    return(tbl)
  }
}

#' Pre-Process Data for Table 32 Creation
#'
#' @param subset (`string`)\cr selection of both PARAMCD and definition of baseline.
#'
#' @keywords internal
preproc_df_table_32 <- function(df,
                                denominator = NULL,
                                id_var = "USUBJID",
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                subset = "PARAMCD == 'DIABP' & AVISITN >= 1") {
  assert_subset(c(
    saffl_var, "PARAMCD", "AVAL", "AVALU", arm_var, id_var
  ), names(df))
  assert_flag_variables(df, saffl_var)

  df <- df |>
    filter(rlang::eval_tidy(rlang::parse_expr(subset))) |>
    filter(.data[[saffl_var]] == "Y") |>
    df_explicit_na() |>
    group_by(.data[[id_var]], PARAMCD) |>
    mutate(MAX_DIABP = max(AVAL)) |>
    ungroup() |>
    distinct(.data[[id_var]], .keep_all = TRUE) |>
    select(all_of(id_var), MAX_DIABP, AVALU, all_of(arm_var))

  if (!is.null(denominator)) {
    adsl <- denominator |>
      filter(.data[[saffl_var]] == "Y") |>
      select(all_of(id_var), all_of(arm_var), all_of(saffl_var))

    df <- df |> select(!all_of(arm_var))
    df <- adsl |>
      left_join(df, by = id_var)
  }

  df <- df |>
    mutate(
      L60 = case_when(MAX_DIABP < 60 ~ "true", TRUE ~ "false"),
      G60 = case_when(MAX_DIABP > 60 ~ "true", TRUE ~ "false"),
      G90 = case_when(MAX_DIABP > 90 ~ "true", TRUE ~ "false"),
      G110 = case_when(MAX_DIABP > 110 ~ "true", TRUE ~ "false"),
      GE120 = case_when(MAX_DIABP >= 120 ~ "true", TRUE ~ "false")
    ) |>
    mutate(
      L60 = with_label(L60 == "true", "<60"),
      G60 = with_label(G60 == "true", ">60"),
      G90 = with_label(G90 == "true", ">90"),
      G110 = with_label(G110 == "true", ">110"),
      GE120 = with_label(GE120 == "true", ">=120")
    ) |>
    mutate(!!arm_var := as.character(.data[[arm_var]])) |>
    select(L60, G60, G90, G110, GE120, AVALU, all_of(c(arm_var, id_var)))

  df
}

#' Make ARD: Table 32
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' ard <- cardinal:::ard_table_32(df = advs, denominator = adsl)
#' ard
#'
#' @keywords internal
#' @name ard_make_table_32
ard_table_32 <- function(df,
                         denominator = NULL,
                         id_var = "USUBJID",
                         arm_var = "ARM",
                         saffl_var = "SAFFL",
                         lbl_overall = NULL) {
  df <- preproc_df_table_32(df, denominator, id_var, arm_var, saffl_var)

  ard <-
    ard_stack(
      data = df,
      ard_dichotomous(variables = c("L60", "G60", "G90", "G110", "GE120")),
      .by = all_of(arm_var),
      .attributes = TRUE,
      .total_n = TRUE
    )

  ard
}

#' Engine-Specific Functions: Table 32
#'
#' The table engine used by each engine-specific function is identified by its suffix.
#'
#' @inheritParams argument_convention
#'
#' @details
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table "Patients Treated" section are the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are not removed by default (see `prune_0` argument).
#' * Records with missing treatment start and/or end datetime are excluded from all calculations.
#'
#' @return
#' * `make_table_32_gtsummary()` returns a `gtsummary` object.
#' * `make_table_32_rtables()` returns an `rtable` object.
#'
#' @seealso [make_table_32()]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' # gtsummary table --------------
#' ard <- cardinal:::ard_table_32(df = advs, denominator = adsl)
#' tbl_gtsummary <- cardinal::make_table_32_gtsummary(
#'   df = advs,
#'   ard = ard,
#'   denominator = adsl
#' )
#' tbl_gtsummary
#'
#' # rtables table ----------------
#' tbl_rtables <- cardinal::make_table_32_rtables(df = advs, alt_counts_df = adsl)
#' tbl_rtables
#'
#' @export
#' @name tbl_make_table_32
make_table_32_gtsummary <- function(df,
                                    ard,
                                    denominator = NULL,
                                    id_var = "USUBJID",
                                    arm_var = "ARM",
                                    saffl_var = "SAFFL",
                                    lbl_overall = NULL) {
  df <- preproc_df_table_32(df, denominator, id_var, arm_var, saffl_var)
  avalu <- unique(df$AVALU)[1]

  tbl <- ard |>
    tbl_ard_summary(
      by = all_of(arm_var),
      missing = "no"
    ) |>
    modify_header(label ~ paste0("**Diastolic Blood Pressure  \n (", avalu, ")**")) |>
    modify_header(all_stat_cols() ~ "**{level}**  \nN = {n}")

  tbl
}

#' @export
#' @rdname tbl_make_table_32
make_table_32_rtables <- function(df,
                                  alt_counts_df = NULL,
                                  show_colcounts = TRUE,
                                  id_var = "USUBJID",
                                  arm_var = "ARM",
                                  saffl_var = "SAFFL",
                                  lbl_overall = NULL,
                                  risk_diff = NULL,
                                  prune_0 = FALSE,
                                  annotations = NULL) {
  df <- preproc_df_table_32(df, alt_counts_df, id_var, arm_var, saffl_var)
  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)
  avalu <- unique(df$AVALU)[1]

  lyt <- basic_table_annot(show_colcounts, annotations) |>
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) |>
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("L60", "G60", "G90", "G110", "GE120"),
      riskdiff = !is.null(risk_diff)
    ) |>
    append_topleft(c("Diastolic Blood Pressure", paste0("(", avalu, ")")))

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
