#' FDA Table 2: Baseline Demographic and Clinical Characteristics, Safety Population, Pooled Analyses
#'
#' @details
#' * `df` must contain the variables specified by `arm_var`, `saffl_var`, and variables specified by the `vars` argument.
#' * `vars` must be a character vector specifying the variables to evaluate.
#' * `return_ard` set to `TRUE` or `FALSE`; whether the intermediate ARD
#' object should be returned.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#'
#' @inheritParams tbl_make_table_02
#' @inheritParams argument_convention
#'
#' @return A `gtsummary` table and, if `return_ard = TRUE`, an ARD.
#'   If `return_ard = TRUE`, they will be returned as a list with named elements `table` and `ard`.
#'
#' @seealso [`tbl_make_table_02`]
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
                          denominator = NULL,
                          return_ard = TRUE,
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          vars = c("SEX", "AGE", "AGEGR1", "RACE", "ETHNIC", "COUNTRY")) {
  # check data viability
  assert_subset(c(arm_var, saffl_var, vars), names(df))
  assert_flag_variables(df, saffl_var)

  # Data preprocessing
  df <- df %>%
    filter(.data[[saffl_var]] == "Y") %>%
    select(all_of(c(vars, arm_var, id_var)))

  if (any(is.na(df))) {
    df <- df %>% df_explicit_na()
  }

  # create a table using gtsummary
  df %>%
    gtsummary::tbl_summary(
      by = arm_var)

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
      digits = all_continuous() ~ 2,
      missing = "no") %>%
    gtsummary::bold_labels() %>%
    gtsummary::modify_header(all_stat_cols() ~ "**{level}**  \nN = {n}") %>%
    gtsummary::add_overall(last = TRUE, col_label = paste0("**", "Total Population", "**  \nN = {n}")) %>%
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

#' Engine-Specific Functions: Table 2
#'
#' The table engine used by each engine-specific function is identified by its suffix.
#'
#' @inheritParams argument_convention
#'
#' @details
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * All-zero rows are not removed by default (see `prune_0` argument).
#'
#' @return
#' * `make_table_02_rtables()` returns an `rtable` object.
#'
#' @seealso [make_table_02()]
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#'
#'
#' # rtables table ----------------
#' adsl <- random.cdisc.data::cadsl %>%
#'   mutate(AGEGR1 = as.factor(case_when(
#'     AGE >= 17 & AGE < 65 ~ ">=17 to <65",
#'     AGE >= 65 ~ ">=65",
#'     AGE >= 65 & AGE < 75 ~ ">=65 to <75",
#'     AGE >= 75 ~ ">=75"
#'   )))
#' tbl_rtables <- cardinal:::make_table_05_rtables(df = adsl)
#' tbl_rtables
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

