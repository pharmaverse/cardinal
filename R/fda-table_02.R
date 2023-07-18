#' FDA Table 2: Baseline Demographic and Clinical Characteristics Safety Population, Pooled Analyses
#'
#' @details
#' * `df` must contain `SAFFL` and the variables specified by `vars` and `arm_var`.
#' * If specified, `alt_counts_df` must contain `SAFFL`, `USUBJID`, and the variable specified by `arm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is included by default (see `lbl_overall` argument).
#' * Information from either ADSUB or ADVS is generally included into `df` prior to analysis.
#' * Numbers in table for non-numeric variables represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @name make_table_02
NULL

#' @describeIn make_table_02 Create FDA table 2 using functions from `rtables` and `tern`.
#'
#' @examples
#' library(dplyr)
#'
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl") %>%
#'   mutate(AGEGR1 = as.factor(case_when(
#'     AGE >= 17 & AGE < 65 ~ ">=17 to <65",
#'     AGE >= 65 ~ ">=65",
#'     AGE >= 65 & AGE < 75 ~ ">=65 to <75",
#'     AGE >= 75 ~ ">=75"
#'   )) %>% formatters::with_label("Age Group, years")) %>%
#'   formatters::var_relabel(
#'     AGE = "Age, years"
#'   )
#'
#' tbl <- make_table_02(df = adsl)
#' tbl
#'
#' @export
make_table_02 <- function(df,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          vars = c("SEX", "AGE", "AGEGR1", "RACE", "ETHNIC", "COUNTRY"),
                          lbl_vars = formatters::var_labels(df, fill = TRUE)[vars],
                          lbl_overall = "Total Population",
                          .stats = c("mean_sd", "median_range", "count_fraction"),
                          .formats = NULL,
                          na_rm = FALSE,
                          prune_0 = TRUE,
                          annotations = NULL) {
  checkmate::assert_subset(c("SAFFL", vars, arm_var), names(df))
  assert_flag_variables(df, "SAFFL")

  df <- df %>%
    filter(SAFFL == "Y") %>%
    df_explicit_na()

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    summarize_vars(
      vars = vars,
      var_labels = lbl_vars,
      show_labels = "visible",
      .stats = .stats,
      .formats = .formats,
      na.rm = na_rm
    ) %>%
    append_topleft(c("", "Characteristic"))

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}

#' @describeIn make_table_02 Create FDA table 2 using functions from `Tplyr`.
#'
#' @examples
#' library(dplyr)
#' library(huxtable)
#'
#' tbl <- make_table_02_tplyr(df = adsl)
#'
#' tbl <- huxtable::as_hux(tbl, add_colnames = FALSE) %>%
#'   huxtable::set_bold(1, 1:ncol(tbl), FALSE) %>%
#'   huxtable::set_align(1, 1:ncol(tbl), "center") %>%
#'   huxtable::set_align(2:nrow(tbl), 3:ncol(tbl), "center") %>%
#'   huxtable::set_valign(1, 1:ncol(tbl), "bottom") %>%
#'   huxtable::set_bottom_border(1, 1:ncol(tbl), 1) %>%
#'   huxtable::set_width(2) %>%
#'   huxtable::set_col_width(c(.2, .3, .125, .125, .125, .125))
#'
#' huxtable::position(tbl) <- "left"
#'
#' tbl
#'
#' @export
make_table_02_tplyr <- function(df,
                                alt_counts_df = NULL,
                                show_colcounts = TRUE,
                                arm_var = "ARM",
                                vars = c("SEX", "AGE", "AGEGR1", "RACE", "ETHNIC", "COUNTRY"),
                                lbl_vars = formatters::var_labels(df, fill = TRUE)[vars],
                                lbl_overall = "Total Population",
                                .stats = c("mean_sd", "median_range", "count_fraction"),
                                .formats = NULL,
                                na_rm = FALSE,
                                prune_0 = TRUE,
                                annotations = NULL) {
  checkmate::assert_subset(c("SAFFL", vars, arm_var), names(df))
  assert_flag_variables(df, "SAFFL")

  df <- df %>% df_explicit_na()
  for (lbl in lbl_vars) {
    df[[lbl]] <- lbl
  }

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  var_types <- lapply(df[vars], function(x) if (is.numeric(x)) "numeric" else "count")

  lyt <- tplyr_table(df, treat_var = !!sym(arm_var), where = SAFFL == "Y")

  if (!is.null(lbl_overall)) lyt <- lyt %>% add_total_group()

  for (var in vars) {
    var_lbl <- lbl_vars[[var]]
    if (var_types[[var]] == "numeric") {
      lyt <- lyt %>%
        add_layer(
          group_desc(vars(!!sym(var)), by = !!sym(var_lbl)) %>%
            set_format_strings(
              "Mean (SD)" = f_str("xx.x (xx.x)", mean, sd),
              "Median (Min - Max)" = f_str("xx.x (xx.x - xx.x)", median, min, max)
            )
        )
    } else {
      lyt <- lyt %>%
        add_layer(
          group_count(vars(!!sym(var)), by = !!sym(var_lbl)) %>%
            set_format_strings(f_str("xx (xx%)", n, pct))
        )
    }
  }

  tbl <- lyt %>% build()

  tbl <- tbl %>%
    arrange(ord_layer_index, ord_layer_1, ord_layer_2) %>%
    apply_row_masks(row_breaks = TRUE) %>%
    select(starts_with("row_label"), starts_with("var1_")) %>%
    add_column_headers(
      paste0(
        "Characteristic | | ",
        paste0(levels(df[[arm_var]]), "\n(N=**", levels(df[[arm_var]]), "**)| ", collapse = ""),
        ifelse(!is.null(lbl_overall), paste0(lbl_overall, "\n(N=**Total**)"), "")
      ),
      header_n = header_n(lyt)
    )

  tbl
}
