#' FDA Table 5: Duration of Treatment Exposure, Safety Population, Pooled Analyses
#'
#' @details
#' * `df` must contain the variables specified by `arm_var`, `saffl_var`, `id_var`, `trtsdtm_var`,
#'   and `trtedtm_var`.
#' * If specified, `denominator` must contain the variables specified by `arm_var`, `id_var` and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#'
#' @inheritParams tbl_make_table_05
#' @inheritParams argument_convention
#'
#' @return A `gtsummary` table and, if `return_ard = TRUE`, an ARD.
#'   If `return_ard = TRUE`, they will be returned as a list with named elements `table` and `ard`.
#'
#' @seealso [`tbl_make_table_05`]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#'
#' tbl <- make_table_05(df = adsl)
#' tbl
#'
#' @export
make_table_05 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          arm_var = "ARM",
                          id_var = "USUBJID",
                          saffl_var = "SAFFL",
                          trtsdtm_var = "TRTSDTM",
                          trtedtm_var = "TRTEDTM",
                          u_trtdur = "days") {
  assert_subset(c(id_var, arm_var, saffl_var, id_var, trtsdtm_var, trtedtm_var), names(df))
  assert_choice(u_trtdur, c("days", "weeks", "months", "years"))
  assert_flag_variables(df, saffl_var)

  ard <- ard_table_05(
    df = df,
    denominator = denominator,
    arm_var = arm_var,
    saffl_var = saffl_var,
    trtsdtm_var = trtsdtm_var,
    trtedtm_var = trtedtm_var,
    u_trtdur = u_trtdur
  )

  tbl <- make_table_05_gtsummary(
    df,
    ard,
    arm_var,
    saffl_var,
    trtsdtm_var,
    trtedtm_var,
    u_trtdur
  )

  if (return_ard) {
    return(list(table = tbl, ard = ard))
  } else {
    return(tbl)
  }
}

#' Pre-Process Data for Table 5 Creation
#'
#' @keywords internal
preproc_df_table_05 <- function(df,
                                saffl_var = "SAFFL",
                                trtsdtm_var = "TRTSDTM",
                                trtedtm_var = "TRTEDTM",
                                u_trtdur = "days") {
  df %>%
    as_tibble() %>%
    filter(.data[[saffl_var]] == "Y") %>%
    df_explicit_na() %>%
    mutate(
      TRTDUR = lubridate::interval(lubridate::ymd_hms(.data[[trtsdtm_var]]), lubridate::ymd_hms(.data[[trtedtm_var]]))
    ) %>%
    mutate(
      TRTDUR_MONTHS = TRTDUR %>% as.numeric("months"),
      TRTDUR = TRTDUR %>% as.numeric(u_trtdur)
    ) %>%
    mutate(
      D_ANY = (TRTDUR_MONTHS > 0) %>% with_label("Any duration (at least 1 dose)"),
      D_LT1 = (TRTDUR_MONTHS < 1) %>% with_label("<1 month"),
      D_GT1 = (TRTDUR_MONTHS >= 1) %>% with_label(">=1 month"),
      D_GT3 = (TRTDUR_MONTHS >= 3) %>% with_label(">=3 months"),
      D_GT6 = (TRTDUR_MONTHS >= 6) %>% with_label(">=6 months"),
      D_GT12 = (TRTDUR_MONTHS >= 12) %>% with_label(">=12 months"),
      DUR_LBL = "Patients Treated, by duration"
    )
}

#' Make ARD: Table 5
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' df <- cardinal:::preproc_df_table_05(
#'   adsl,
#'   saffl_var = "SAFFL",
#'   trtsdtm_var = "TRTSDTM",
#'   trtedtm_var = "TRTEDTM",
#'   u_trtdur = "days"
#' )
#'
#' ard <- cardinal:::ard_table_05(df = df)
#' ard
#'
#' @keywords internal
#' @name ard_make_table_05
ard_table_05 <- function(df,
                         denominator = NULL,
                         arm_var = "ARM",
                         saffl_var = "SAFFL",
                         trtsdtm_var = "TRTSDTM",
                         trtedtm_var = "TRTEDTM",
                         u_trtdur = "days") {
  df <- preproc_df_table_05(df, saffl_var, trtsdtm_var, trtedtm_var, u_trtdur)

  if (is.null(denominator)) {
    denominator <- df
  } else {
    denominator <- alt_counts_df_preproc(denominator, id_var, arm_var, saffl_var)
  }

  stats_trtdur <- df |>
    ard_continuous(
      variables = "TRTDUR",
      by = all_of(arm_var),
      statistic = everything() ~ continuous_summary_fns(
        summaries = c("mean", "sd", "median", "min", "max", "p25", "p75"),
        other_stats = list(
          tot_exposure = \(x) sum(x),
          person_yrs = \(x) as.numeric(lubridate::duration(sum(x), u_trtdur), "years")
        )
      ),
      fmt_fun = ~ list(~ \(x) round5(x, digits = 2))
    ) |>
    apply_fmt_fun()

  stats_pt_cts <- df |>
    group_by(!!rlang::sym(arm_var)) |>
    ard_dichotomous(
      variables = c(D_ANY, D_LT1, D_GT1, D_GT3, D_GT6, D_GT12),
      value = list(D_ANY = TRUE, D_LT1 = TRUE, D_GT1 = TRUE, D_GT3 = TRUE, D_GT6 = TRUE, D_GT12 = TRUE),
      statistic = everything() ~ c("n", "p"),
      denominator = denominator
    )

  ard <- bind_ard(stats_trtdur, stats_pt_cts)

  ard
}

#' Engine-Specific Functions: Table 5
#'
#' The table engine used by each engine-specific function is identified by its suffix.
#'
#' @inheritParams argument_convention
#' @param lbl_trtdur (`character`)\cr label for treatment duration variable.
#'
#' @details
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table "Patients Treated" section are the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are not removed by default (see `prune_0` argument).
#' * Records with missing treatment start and/or end datetime are excluded from all calculations.
#'
#' @return
#' * `make_table_05_gtsummary()` returns a `gtsummary` object.
#' * `make_table_05_rtables()` returns an `rtable` object.
#'
#' @seealso [make_table_05()]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#'
#' # gtsummary table --------------
#' ard <- cardinal:::ard_table_05(df = adsl)
#' tbl_gtsummary <- cardinal:::make_table_05_gtsummary(df = adsl, ard = ard)
#' tbl_gtsummary
#'
#' # rtables table ----------------
#' tbl_rtables <- cardinal:::make_table_05_rtables(df = adsl)
#' tbl_rtables
#'
#' @export
#' @name tbl_make_table_05
make_table_05_gtsummary <- function(df,
                                    ard,
                                    arm_var = "ARM",
                                    saffl_var = "SAFFL",
                                    trtsdtm_var = "TRTSDTM",
                                    trtedtm_var = "TRTEDTM",
                                    u_trtdur = "days") {
  df <- preproc_df_table_05(df, saffl_var, trtsdtm_var, trtedtm_var, u_trtdur)

  stat_fun <- function(data, ...) {
    dplyr::tibble(
      mean = mean(data$TRTDUR),
      sd = sd(data$TRTDUR),
      median = median(data$TRTDUR),
      min = min(data$TRTDUR),
      max = max(data$TRTDUR),
      q25 = quantile(data$TRTDUR, 0.25),
      q75 = quantile(data$TRTDUR, 0.75),
      tot_exp = sum(data$TRTDUR),
      tot_dur = as.numeric(lubridate::duration(sum(data$TRTDUR), u_trtdur), "years")
    )
  }

  tbl_cts <- tbl_custom_summary(
    df,
    by = all_of(arm_var),
    label = list(TRTDUR = paste("Duration of Treatment,", u_trtdur)),
    stat_fns = everything() ~ stat_fun,
    statistic = ~ c("{mean} ({sd})", "{median} ({min}, {max})", "{q25} - {q75}", "{tot_exp} ({tot_dur})"),
    digits = ~2,
    type = list(TRTDUR = "continuous2"),
    include = TRTDUR,
    missing = "no"
  )
  tbl_cts$table_body$label[4:5] <- c("Interquartile range", "Total exposure (person years)")

  tbl_cat <- tbl_ard_summary(ard, by = all_of(arm_var), include = -TRTDUR)
  tbl_cat$table_body <- dplyr::bind_rows(
    data.frame(row_type = "label", label = "Patients Treated, by duration"),
    tbl_cat$table_body
  )
  tbl_cat <- tbl_cat |>
    modify_column_indent(
      columns = dplyr::all_of("label"),
      rows = !is.na(variable),
      indent = 4L
    )
  tbl_cat$table_body$label[2:7] <- c(
    "Any duration (at least 1 dose)", "<1 month", ">=1 month", ">=3 months", ">=6 months", ">=12 months"
  )

  tbl_stack(list(tbl_cts, tbl_cat), quiet = TRUE) |>
    modify_table_styling(
      columns = dplyr::all_of("label"),
      label = "**Parameter**"
    )
}

#' @export
#' @rdname tbl_make_table_05
make_table_05_rtables <- function(df,
                                  alt_counts_df = NULL,
                                  show_colcounts = TRUE,
                                  arm_var = "ARM",
                                  id_var = "USUBJID",
                                  saffl_var = "SAFFL",
                                  trtsdtm_var = "TRTSDTM",
                                  trtedtm_var = "TRTEDTM",
                                  u_trtdur = "days",
                                  lbl_trtdur = paste("Duration of Treatment,", u_trtdur),
                                  lbl_overall = NULL,
                                  risk_diff = NULL,
                                  prune_0 = FALSE,
                                  annotations = NULL) {
  df <- preproc_df_table_05(df, saffl_var, trtsdtm_var, trtedtm_var, u_trtdur)
  if (!is.null(alt_counts_df)) {
    alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)
  }

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    analyze(
      vars = "TRTDUR",
      var_labels = lbl_trtdur,
      show_labels = "visible",
      afun = a_trtdur_stats,
      extra_args = list(u_trtdur = u_trtdur, risk_diff = risk_diff)
    ) %>%
    split_rows_by("DUR_LBL") %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("D_ANY", "D_LT1", "D_GT1", "D_GT3", "D_GT6", "D_GT12"),
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_topleft("Parameter")

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)

  if (prune_0) tbl <- prune_table(tbl)
  tbl
}

#' Analysis Function to Calculate Statistics for Treatment Duration
#'
#' @inheritParams make_table_05
#' @param x (`numeric`)\cr vector of numbers to analyze.
#' @param .spl_context (`data.frame`)\cr data frame containing information about ancestor split states
#'   that is passed by `rtables`.
#'
#' @keywords internal
a_trtdur_stats <- function(x,
                           u_trtdur,
                           .spl_context) {
  .labels <- c(
    mean_sd = "Mean (SD)", median_range = "Median (min - max)",
    iqr = "Interquartile range", tot_exp = "Total exposure (person years)"
  )

  cur_split <- tail(.spl_context$cur_col_split_val[[1]], 1)
  if (!grepl("^riskdiff", cur_split)) {
    x_stats <- list(
      mean_sd = c(mean(x), sd(x)),
      median_range = c(median(x), range(x)),
      iqr = c(quantile(x, 0.25), quantile(x, 0.75)),
      tot_exp = c(sum(x), as.numeric(lubridate::duration(sum(x), u_trtdur), "years"))
    )
    .formats <- c(
      mean_sd = "xx.xx (xx.xx)", median_range = "xx.xx (xx.xx - xx.xx)",
      iqr = "xx.xx - xx.xx", tot_exp = "xx.xx (xx.xx)"
    )
    in_rows(.list = x_stats, .formats = .formats, .labels = .labels)
  } else { # print NAs in the risk difference column
    in_rows(.list = list(mean_sd = NA, median_range = NA, iqr = NA, tot_exp = NA), .labels = .labels)
  }
}
