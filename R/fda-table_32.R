#' FDA Table 32: Percentage of Patients With Maximum Diastolic Blood Pressure by Category of Blood Pressure
#'   Postbaseline, Safety Population, Pooled Analysis
#'
#' @details
#' * `advs` must contain `USUBJID`, `AVISITN`, `PARAMCD`, `AVAL`, `AVALU`, and the variables specified by
#'   `arm_var` and `saffl_var`.
#' * If specified, `alt_counts_df` must contain `USUBJID` and the variables specified by `arm_var` and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are not removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @name make_table_32
NULL

#' @describeIn make_table_32 Create FDA table 32 using functions from `rtables` and `tern`.
#'
#' @return
#' * `make_table_32` returns an `rtables` table object.
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' advs <- random.cdisc.data::cadvs
#'
#' tbl <- make_table_32(advs = advs, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_32 <- function(advs,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          lbl_overall = NULL,
                          risk_diff = NULL,
                          prune_0 = FALSE,
                          annotations = NULL) {
  checkmate::assert_subset(c(
    "USUBJID", "AVISITN", "PARAMCD", "AVAL", "AVALU", arm_var, saffl_var
  ), names(advs))
  assert_flag_variables(advs, saffl_var)

  advs <- advs %>%
    filter(
      .data[[saffl_var]] == "Y",
      AVISITN >= 1,
      PARAMCD == "DIABP"
    ) %>%
    df_explicit_na() %>%
    group_by(USUBJID, PARAMCD) %>%
    mutate(MAX_DIABP = max(AVAL)) %>%
    ungroup() %>%
    mutate(
      L60 = with_label(MAX_DIABP < 60, "<60"),
      G60 = with_label(MAX_DIABP > 60, ">60"),
      G90 = with_label(MAX_DIABP > 90, ">90"),
      G110 = with_label(MAX_DIABP > 110, ">110"),
      GE120 = with_label(MAX_DIABP >= 120, ">=120")
    )

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = c("L60", "G60", "G90", "G110", "GE120"),
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_topleft(c("Diastolic Blood Pressure", paste0("(", unique(advs$AVALU)[1], ")")))

  tbl <- build_table(lyt, df = advs, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}

#' @describeIn make_table_32 Create FDA table 32 using functions from `gtsummary`.
#'
#' @return
#' * `make_table_32_gtsum` returns a `gt` object
#'
#' @examples
#' tbl <- make_table_32_gtsum(advs = advs)
#' tbl
#'
#' @export
make_table_32_gtsum <- function(advs,
                                adsl,
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                lbl_overall = NULL) {
  checkmate::assert_subset(c(
    saffl_var, "USUBJID", "AVISITN", "PARAMCD", "AVAL", "AVALU", arm_var
  ), names(advs))
  assert_flag_variables(advs, saffl_var)

  advs <- advs %>%
    filter(
      .data[[saffl_var]] == "Y",
      AVISITN >= 1,
      PARAMCD == "DIABP"
    ) %>%
    df_explicit_na() %>%
    group_by(USUBJID, PARAMCD) %>%
    mutate(MAX_DIABP = max(AVAL)) %>%
    ungroup() %>%
    mutate(
      L60 = with_label(MAX_DIABP < 60, "<60"),
      G60 = with_label(MAX_DIABP > 60, ">60"),
      G90 = with_label(MAX_DIABP > 90, ">90"),
      G110 = with_label(MAX_DIABP > 110, ">110"),
      GE120 = with_label(MAX_DIABP >= 120, ">=120")
    ) %>%
    distinct(USUBJID, .keep_all = TRUE) %>%
    select(L60, G60, G90, G110, GE120, arm_var, AVALU)

  avalu <- unique(advs$AVALU)[1]
  advs <- advs %>% select(-AVALU)

  tbl <- advs %>%
    tbl_summary(
      by = arm_var,
      statistic = list(all_categorical() ~ "{n} ({p}%)"),
      digits = everything() ~ 1
    ) %>%
    modify_header(label ~ paste0("**Diastolic Blood Pressure (", avalu, ")**")) %>%
    modify_header(all_stat_cols() ~ "**{level}**  \n (N={n})")

  if (!is.null(lbl_overall)) {
    tbl <- tbl %>%
      add_overall(last = TRUE, col_label = paste0("**", lbl_overall, "**  \n (N={n})"))
  }

  tbl <- tbl %>% modify_footnote(update = everything() ~ NA)

  tbl
}
