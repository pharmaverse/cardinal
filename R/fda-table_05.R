#' FDA Table 5: Duration of Treatment Exposure, Safety Population, Pooled Analyses
#'
#' @details
#' * `df` must contain the variables specified by `arm_var`, `saffl_var`, `id_var`, `trtsdtm_var`,
#'   and `trtedtm_var`.
#' * If specified, `alt_counts_df` must contain the variables specified by `arm_var`, `id_var` and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#'
#' @inheritParams tbl_make_table_05
#' @inheritParams argument_convention
#' @param ... arguments passed to table engine-specific functions. See [tbl_make_table_05] for details.
#'
#' @return A table, the class of which is determined by `table_engine` (if `table_engine` not `NULL`) and/or an ARD
#'   (if `return_ard = TRUE`). If both are selected, they will be returned as a list with named elements `table` and
#'   `ard`.
#'
#' @seealso [tbl_make_table_05]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#'
#' tbl <- make_table_05(df = adsl)
#' tbl
#'
#' @export
make_table_05 <- function(df,
                          alt_counts_df = NULL,
                          table_engine = "rtables",
                          return_ard = TRUE,
                          arm_var = "ARM",
                          id_var = "USUBJID",
                          saffl_var = "SAFFL",
                          trtsdtm_var = "TRTSDTM",
                          trtedtm_var = "TRTEDTM",
                          u_trtdur = "days",
                          ...) {
  assert_subset(c(id_var, arm_var, saffl_var, id_var, trtsdtm_var, trtedtm_var), names(df))
  assert_choice(u_trtdur, c("days", "weeks", "months", "years"))
  assert_flag_variables(df, saffl_var)

  # warnings
  if (is.null(table_engine) && !return_ard) {
    warning(
      "No object returned. Set a value for `table_engine` to return ",
      "a table or `return_ard = TRUE` to return an ARD."
    )
    return(NULL)
  }
  if (!is.null(table_engine)) {
    if (!table_engine %in% formals()$table_engine) {
      warning("There is currently no `", table_engine, "` function available for FDA table 5.")
    } else {
      table_engine <- match.arg(table_engine)
    }
  }

  df <- preproc_df_table_05(df, saffl_var, trtsdtm_var, trtedtm_var, u_trtdur)
  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  if (return_ard) {
    ard <- ard_table_05(
      df = df,
      alt_counts_df = alt_counts_df,
      arm_var = arm_var,
      saffl_var = saffl_var,
      trtsdtm_var = trtsdtm_var,
      trtedtm_var = trtedtm_var,
      u_trtdur = u_trtdur
    )
    if (is.null(table_engine)) {
      return(ard)
    }
  }
  if (!is.null(table_engine)) {
    tbl <- switch(table_engine,
      "rtables" = make_table_05_rtables(
        df = df,
        alt_counts_df = alt_counts_df,
        arm_var = arm_var,
        saffl_var = saffl_var,
        trtsdtm_var = trtsdtm_var,
        trtedtm_var = trtedtm_var,
        u_trtdur = u_trtdur,
        ...
      ),
      NULL
    )
    if (!return_ard) {
      return(tbl)
    }
  }

  list(table = tbl, ard = ard)
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
#' df <- preproc_df_table_05(
#'   adsl,
#'   saffl_var = "SAFFL",
#'   trtsdtm_var = "TRTSDTM",
#'   trtedtm_var = "TRTEDTM",
#'   u_trtdur = "days"
#' )
#'
#' tbl <- ard_table_05(df = df)
#' tbl
#'
#' @keywords internal
#' @name ard_make_table_05
ard_table_05 <- function(df,
                         alt_counts_df = NULL,
                         arm_var = "ARM",
                         saffl_var = "SAFFL",
                         trtsdtm_var = "TRTSDTM",
                         trtedtm_var = "TRTEDTM",
                         u_trtdur = "days") {
  if (is.null(alt_counts_df)) alt_counts_df <- df

  stats_trtdur <- df |>
    group_by(!!rlang::sym(arm_var)) |>
    ard_continuous(
      variables = "TRTDUR",
      statistic = everything() ~ continuous_summary_fns(
        summaries = c("mean", "sd", "median", "min", "max", "p25", "p75"),
        other_stats = list(
          tot_exposure = \(x) sum(x),
          person_yrs = \(x) as.numeric(lubridate::duration(sum(x), u_trtdur), "years")
        )
      ),
      fmt_fn = ~ list(~ \(x) round5(x, digits = 2))
    ) |>
    apply_fmt_fn()

  stats_pt_cts <- df |>
    group_by(!!rlang::sym(arm_var)) |>
    ard_dichotomous(
      variables = c(D_ANY, D_LT1, D_GT1, D_GT3, D_GT6, D_GT12),
      value = list(D_ANY = TRUE, D_LT1 = TRUE, D_GT1 = TRUE, D_GT3 = TRUE, D_GT6 = TRUE, D_GT12 = TRUE),
      statistic = everything() ~ c("n", "p"),
      denominator = alt_counts_df
    )

  ard <- bind_ard(stats_trtdur, stats_pt_cts)

  ard
}

#' Engine-Specific Functions: Table 5
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
#' * `make_table_05_rtables()` returns an `rtable` object.
#'
#' @seealso [make_table_05()]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' df <- preproc_df_table_05(
#'   adsl,
#'   saffl_var = "SAFFL",
#'   trtsdtm_var = "TRTSDTM",
#'   trtedtm_var = "TRTEDTM",
#'   u_trtdur = "days"
#' )
#'
#' tbl <- make_table_05_rtables(df = df)
#' tbl
#'
#' @keywords internal
#' @name tbl_make_table_05
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
