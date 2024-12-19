#' FDA Table 2: Baseline Demographic and Clinical Characteristics, Safety Population, Pooled Analyses
#'
#' @details
#' * `df` must contain the variables specified by `vars`.
#' * `return_ard` set to `TRUE` or `FALSE`; whether the intermediate ARD object should be returned.
#'
#' @inheritParams argument_convention
#'
#' @name make_table_02
NULL

#' @describeIn make_table_02 Create FDA table 2 using an ARD.
#'
#' @return
#' * `make_table_02` returns a list containing a `gtsummary` table object.
#' The intermediary `ARD` object can also be returned with `return_ard` set to `TRUE`.
#'
#' @examples
#' library(dplyr)
#'
#' adsl <- random.cdisc.data::cadsl %>%
#'   mutate(AGEGR1 = as.factor(case_when(
#'     AGE >= 17 & AGE < 65 ~ ">=17 to <65",
#'     AGE >= 65 ~ ">=65",
#'     AGE >= 65 & AGE < 75 ~ ">=65 to <75",
#'     AGE >= 75 ~ ">=75"
#'   )))
#'
#' tbl <- make_table_02(df = adsl)
#' tbl
#'
#' @export

make_table_02 <- function(df,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          vars = c("SEX", "AGE", "RACE", "ETHNIC", "COUNTRY"),
                          lbl_vars = formatters::var_labels(df, fill = TRUE)[vars],
                          lbl_overall = "Total Population",
                          na_rm = FALSE,
                          return_ard = TRUE) {
  # check data viability
  checkmate::assert_subset(c(vars, arm_var, saffl_var), names(df))
  assert_flag_variables(df, saffl_var)

  df <- df %>%
    filter(.data[[saffl_var]] == "Y") %>%
    select(all_of(c(vars, arm_var)))

  if (!na_rm) df <- df %>% df_explicit_na()

  tbl <- df %>%
    gtsummary::tbl_summary(
      by = arm_var,
      type = all_continuous() ~ "continuous2",
      statistic = list(
        all_continuous() ~ c(
          "{mean} ({sd})",
          "{median} ({min} - {max})"
        ),
        all_categorical() ~ "{n} ({p}%)"
      ),
      digits = all_continuous() ~ 1,
      missing = ifelse(na_rm, "no", "ifany"),
      label = as.list(lbl_vars) %>% setNames(vars)
    ) %>%
    gtsummary::bold_labels() %>%
    gtsummary::modify_header(all_stat_cols() ~ "**{level}**  \nN = {n}") %>%
    gtsummary::add_overall(last = TRUE, col_label = paste0("**", lbl_overall, "**  \nN = {n}")) %>%
    gtsummary::add_stat_label(label = all_continuous2() ~ c("Mean (SD)", "Median (min - max)")) %>%
    gtsummary::modify_footnote(everything() ~ NA) %>%
    gtsummary::modify_column_alignment(columns = all_stat_cols(), align = "right")

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    res <- list(tbl = tbl, ard = ard)
  } else {
    res <- list(tbl = tbl)
  }
}

#' @rdname make_table_02
#' @export
make_table_02_rtables <- function(df,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          vars = c("SEX", "AGE", "AGEGR1", "RACE", "ETHNIC", "COUNTRY"),
                          lbl_vars = formatters::var_labels(df, fill = TRUE)[vars],
                          lbl_overall = "Total Population",
                          na_rm = FALSE,
                          prune_0 = TRUE,
                          annotations = NULL) {
  assert_subset(c(vars, arm_var, saffl_var), names(df))
  assert_flag_variables(df, saffl_var)

  df <- df %>%
    filter(.data[[saffl_var]] == "Y") %>%
    df_explicit_na()

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    analyze_vars(
      vars = vars,
      var_labels = lbl_vars,
      show_labels = "visible",
      .stats = c("mean_sd", "median_range", "count_fraction"),
      .formats = NULL,
      na.rm = na_rm
    ) %>%
    append_topleft("Characteristic")

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}

