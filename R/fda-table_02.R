#' FDA Table 2: Baseline Demographic and Clinical Characteristics, Safety Population, Pooled Analyses
#'
#' @details
#' * `df` must contain the variables specified by `vars`, `arm_var`, and `saffl_var`.
#' * If specified, `alt_counts_df` must contain `USUBJID` and the variables specified by `arm_var` and `saffl_var`.
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
#' @return
#' * `make_table_02` returns an `rtable` object.
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
#'   formatters::var_relabel(AGE = "Age, years")
#'
#' tbl <- make_table_02(df = adsl)
#' tbl
#'
#' @export
make_table_02 <- function(df,
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
  checkmate::assert_subset(c(vars, arm_var, saffl_var), names(df))
  assert_flag_variables(df, saffl_var)

  df <- df %>%
    filter(.data[[saffl_var]] == "Y") %>%
    df_explicit_na()

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var, saffl_var)

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
    append_topleft(c("", "Characteristic"))

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}

#' @describeIn make_table_02 Create FDA table 2 using functions from `Tplyr` and `tfrmt`.
#'
#' @param tplyr_raw (`flag`)\cr whether the raw `tibble` created using `Tplyr` functions should be returned, or the
#'   table formatted using functions from `tfrmt` should be returned (default).
#'
#' @note
#' * `make_table_02_tplyr` does not currently support footnote annotations
#' * `make_table_02_tplyr` does not currently support `alt_counts_df` when `tplyr_raw = TRUE`.
#'
#' @return
#' * `make_table_02_tplyr` returns a `gt_tbl` object when `tplyr_raw = FALSE` (default) and
#'   a `tibble` object when `tplyr_raw = TRUE`.
#'
#' @examples
#' tbl <- make_table_02_tplyr(df = adsl)
#' tbl
#'
#' @export
make_table_02_tplyr <- function(df,
                                alt_counts_df = NULL,
                                show_colcounts = TRUE,
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                vars = c("SEX", "AGE", "AGEGR1", "RACE", "ETHNIC", "COUNTRY"),
                                lbl_vars = formatters::var_labels(df, fill = TRUE)[vars],
                                lbl_overall = "Total Population",
                                na_rm = FALSE,
                                prune_0 = TRUE,
                                annotations = NULL,
                                tplyr_raw = FALSE) {
  checkmate::assert_subset(c(saffl_var, vars, arm_var), names(df))
  assert_flag_variables(df, saffl_var)

  df <- df %>% df_explicit_na()
  for (lbl in lbl_vars) {
    df[[lbl]] <- lbl
  }

  var_types <- lapply(df[vars], function(x) if (is.numeric(x)) "numeric" else "count")

  lyt <- tplyr_table(df, treat_var = !!sym(arm_var), where = !!sym(saffl_var) == "Y")

  if (!is.null(lbl_overall)) lyt <- lyt %>% add_total_group(group_name = lbl_overall)

  for (i in seq_along(vars)) {
    var <- vars[i]
    var_lbl <- lbl_vars[i]
    if (var_types[[var]] == "numeric") {
      if (tplyr_raw) {
        lyt <- lyt %>% add_layer(
          group_desc(vars(!!sym(var)), by = !!sym(var_lbl)) %>%
            set_format_strings(
              "Mean (SD)" = f_str("xx.x (xx.x)", mean, sd),
              "Median (Min - Max)" = f_str("xx.x (xx.x - xx.x)", median, min, max)
            )
        )
      } else {
        lyt <- lyt %>% add_layer(
          group_desc(vars(!!sym(var)), by = !!sym(var_lbl)) %>%
            set_format_strings(
              "Mean" = f_str("xx.xxxx", mean), "SD" = f_str("xx.xxxx", sd), "Median" = f_str("xx.xxxx", median),
              "Min" = f_str("xx.xxxx", min), "Max" = f_str("xx.xxxx", max)
            )
        )
      }
    } else {
      if (tplyr_raw) {
        lyt <- lyt %>% add_layer(
          group_count(vars(!!sym(var)), by = !!sym(var_lbl)) %>%
            set_format_strings(f_str("xx (xx.x%)", n, pct))
        )
      } else {
        lyt <- lyt %>% add_layer(
          group_count(vars(!!sym(var)), by = !!sym(var_lbl)) %>%
            set_format_strings(f_str("xx;xx.xxxx", n, pct))
        )
      }
    }
  }
  tbl <- lyt %>% build()

  if (na_rm) {
    na_ind <- tbl[, 2] != "<Missing>"
    tbl <- tbl[na_ind, ]
  }

  if (tplyr_raw) {
    tbl <- tbl %>%
      arrange(ord_layer_index, ord_layer_1, ord_layer_2) %>%
      apply_row_masks(row_breaks = TRUE) %>%
      select(starts_with("row_label"), starts_with("var1_")) %>%
      add_column_headers(
        paste0(
          "Characteristic | | ",
          paste0(
            levels(df[[arm_var]]), if (show_colcounts) paste0("\n(N=**", levels(df[[arm_var]]), "**)| ") else "| ",
            collapse = ""
          ),
          ifelse(!is.null(lbl_overall), paste0(lbl_overall, ifelse(show_colcounts, c("\n(N=**Total**)"), ""), ""))
        ),
        header_n = header_n(lyt)
      )

    if (prune_0) {
      prune_ind <- apply(tbl, MARGIN = 1, function(x) all(x == "") || !all(gsub("[0()\\% ]", "", x[-c(1:2)]) == ""))
      tbl <- tbl[prune_ind, ]
    }
  } else {
    tbl <- tbl %>%
      tidyr::pivot_longer(head(names(.)[-c(1:2)], -3), names_to = "column", values_to = "value") %>%
      mutate(
        tbl_lbl = "Characteristic",
        column = gsub("var1_", "", column),
        param = ifelse(row_label2 %in% c("Mean", "SD", "Median", "Min", "Max"), row_label2, "n;pct"),
        row_label2 = case_when(
          row_label2 %in% c("Mean", "SD") ~ "Mean (SD)",
          row_label2 %in% c("Median", "Min", "Max") ~ "Median (Min - Max)",
          .default = row_label2
        )
      ) %>%
      tidyr::separate_rows(c("param", "value"), sep = ";") %>%
      mutate(value = as.numeric(value))

    if (show_colcounts) {
      colcounts <- summary(if (!is.null(alt_counts_df)) alt_counts_df[[arm_var]] else df[[arm_var]])
      big_ns <- tibble(
        column = c(levels(df[[arm_var]]), lbl_overall),
        param = "bigN",
        value = if (!is.null(lbl_overall)) c(colcounts, sum(colcounts)) else colcounts,
      )
      tbl <- bind_rows(tbl, big_ns)
    }

    if (prune_0) {
      tbl <- tbl %>%
        group_by(ord_layer_index, ord_layer_2) %>%
        filter(sum(value) > 0) %>%
        ungroup()
    }
    big_n_tbl <- if (show_colcounts) big_n_structure(param_val = "bigN", n_frmt = frmt("\n(N=xx)")) else NULL

    tbl <- tfrmt(
      group = c(tbl_lbl, row_label1),
      label = row_label2,
      column = column,
      param = param,
      value = value,
      title = annotations[["title"]],
      subtitle = paste(annotations[["subtitles"]], collapse = ", "),
      sorting_cols = c(ord_layer_1, ord_layer_2),
      body_plan = body_plan(
        frmt_structure(
          group_val = ".default", label_val = ".default",
          frmt_combine("{n} {pct}", n = frmt("xx"), pct = frmt_when("==0" ~ "", TRUE ~ frmt("(xx.x%)")))
        ),
        frmt_structure(
          group_val = ".default", label_val = "Mean (SD)",
          frmt_combine("{Mean} ({SD})", Mean = frmt("xx.x"), SD = frmt("xx.x"))
        ),
        frmt_structure(
          group_val = ".default", label_val = "Median (Min - Max)",
          frmt_combine("{Median} ({Min} - {Max})", Median = frmt("xx.x"), Min = frmt("xx.x"), Max = frmt("xx.x"))
        )
      ),
      col_plan = col_plan(-starts_with("ord")),
      big_n = big_n_tbl
    ) %>%
      print_to_gt(tbl)
  }
  tbl
}

#' @describeIn make_table_02 Create FDA table 2 using functions from `gtsummary`.
#'
#' @return
#' * `make_table_02_gtsum` returns a `tbl_summary` object.
#'
#' @examples
#' tbl <- make_table_02_gtsum(df = adsl)
#' tbl
#'
#' @export
make_table_02_gtsum <- function(df,
                                show_colcounts = TRUE,
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                vars = c("SEX", "AGE", "AGEGR1", "RACE", "ETHNIC", "COUNTRY"),
                                lbl_vars = formatters::var_labels(df, fill = TRUE)[vars],
                                lbl_overall = "Total Population",
                                na_rm = FALSE) {
  checkmate::assert_subset(c(vars, arm_var, saffl_var), names(df))
  assert_flag_variables(df, saffl_var)

  df <- df %>%
    filter(.data[[saffl_var]] == "Y") %>%
    select(all_of(c(vars, arm_var)))

  if (!na_rm) df <- df %>% df_explicit_na()

  tbl <- df %>%
    tbl_summary(
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
      label = as.list(lbl_vars) %>% stats::setNames(vars)
    ) %>%
    gtsummary::bold_labels() %>%
    gtsummary::add_stat_label() %>%
    modify_header(all_stat_cols() ~ "**{level}**  \n (N={n})") %>%
    add_overall(last = TRUE, col_label = paste0("**", lbl_overall, "**  \n (N={n})")) %>%
    modify_footnote(update = everything() ~ NA)

  gtsummary::with_gtsummary_theme(
    x = gtsummary::theme_gtsummary_compact(),
    expr = tbl
  )
}
