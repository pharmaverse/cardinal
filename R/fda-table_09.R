#' FDA Table 9: Patients With Serious Adverse Events by System Organ Class and Preferred Term,
#'   Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain `USUBJID`, `AESER`, `AESOC`, and the variables specified by `pref_var`, `arm_var`,
#'   and `saffl_var`.
#' * If specified, `alt_counts_df` must contain `USUBJID` and the variables specified by `arm_var` and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @return An `rtable` object.
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#'
#' tbl <- make_table_09(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_09 <- function(adae,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          pref_var = "AEDECOD",
                          lbl_pref_var = formatters::var_labels(adae, fill = TRUE)[pref_var],
                          lbl_overall = NULL,
                          risk_diff = NULL,
                          prune_0 = TRUE,
                          annotations = NULL) {
  checkmate::assert_subset(c("USUBJID", "AESER", "AESOC", arm_var, saffl_var, pref_var), names(adae))
  assert_flag_variables(adae, saffl_var)

  adae <- adae %>%
    filter(.data[[saffl_var]] == "Y", AESER == "Y") %>%
    df_explicit_na()

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    analyze_num_patients(
      vars = "USUBJID",
      .stats = "unique",
      .labels = c(unique = "Any SAE"),
      riskdiff = !is.null(risk_diff)
    ) %>%
    split_rows_by(
      var = "AESOC",
      split_fun = drop_split_levels,
      split_label = "System Organ Class",
      label_pos = "topleft"
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = "unique",
      .labels = c(unique = NULL),
      riskdiff = !is.null(risk_diff)
    ) %>%
    count_occurrences(
      vars = pref_var,
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_topleft(paste(" ", lbl_pref_var))

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}

#' Function to create FDA Table 9: Patients With Serious Adverse Events
#' by System Organ Class and Preferred Term,
#' Safety Population, Pooled Analyses with /code{gt}
#'
#' @describeIn make_table_09 Create FDA table 9 using functions from `gt`.
#' @inheritParams argument_convention
#' @param saffl_var (`character`)\cr safety population flag variable from `adae` to include in the table.
#' @param ser_var (`character`)\cr serious Event variable from `adae` to include in the table.
#' @param soc_var (`character`)\cr system organ class variable from `adae` to include in the table.
#' @param lbl_soc_var (`character`)\cr label corresponding to system organ class variable
#' `soc_var` to print in the table.
#' @param annotations (named `list` of `character`)\cr list of annotations to add to the table. Valid
#'   annotation types are `title`, `subtitles`, and a list of characters called `footnotes`.
#'   Each name-value pair should use the annotation type as name and the desired string as the value.
#' @param risk_diff (`list` of `character` vectors)\cr List of character vectors. Each vector must be
#'   of length 2 and contain the name of treatment arms to calculate risk difference and its 95% CI for. Those names
#'   must exist in the `arm_var` column of the dataset specified in `adae`.
#'
#' @return
#' * `make_table_32_gtsum` returns a `gt` object
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#'
#' tbl <- make_table_09_gtsum(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' annotations <- list(
#'   title = "Table 9. Patients With Serious Adverse Events",
#'   subtitle = "by System Organ Class and Preferred Term, Safety Population, Pooled Analyses",
#'   footnotes = list(
#'     "Duration = [e.g., X week double-blind treatment period or median and a range
#'     indicating pooled trial durations].",
#'     "Difference is shown between [treatment arms] (e.g., difference is shown
#'     between Drug Name dosage X vs. placebo)."
#'   )
#' )
#' risk_diff <- list(c("A: Drug X", "C: Combination"), c("A: Drug X", "B: Placebo"))
#' tbl <- make_table_09_gtsum(
#'   adae = adae, alt_counts_df = adsl, annotations = annotations,
#'   risk_diff = risk_diff
#' )
#' tbl
#' @export
make_table_09_gtsum <- function(adae,
                                alt_counts_df = NULL,
                                show_colcounts = TRUE,
                                saffl_var = "SAFFL",
                                ser_var = "AESER",
                                arm_var = "ARM",
                                pref_var = "AEDECOD",
                                id_var = "USUBJID",
                                soc_var = "AESOC",
                                lbl_pref_var = formatters::var_labels(adae, fill = TRUE)[pref_var],
                                lbl_soc_var = formatters::var_labels(adae, fill = TRUE)[soc_var],
                                lbl_overall = NULL,
                                annotations = NULL,
                                risk_diff = NULL) {
  checkmate::assert_data_frame(adae)
  checkmate::assert_subset(c(saffl_var, id_var, ser_var, soc_var, arm_var, pref_var), names(adae))
  assert_flag_variables(adae, saffl_var)
  checkmate::assert_factor(adae[[arm_var]])

  if (!is.null(alt_counts_df)) {
    checkmate::assert_data_frame(alt_counts_df)
    checkmate::assert_subset(c(id_var, arm_var), names(alt_counts_df))
  }

  checkmate::assert_list(risk_diff, types = "character", null.ok = TRUE)

  checkmate::assert_logical(show_colcounts)

  adae <- adae %>%
    filter(.data[[saffl_var]] == "Y", .data[[ser_var]] == "Y")

  # create data for table 09
  # lbl_overall must be NULL to get the data for all columns besides the overall column
  result_list <- create_table_09_data(adae = adae, alt_counts_df = alt_counts_df, arm_var = arm_var, id_var = id_var, soc_var = soc_var, pref_var = pref_var, lbl_overall = NULL, risk_diff = risk_diff)

  # create data for overall column
  if (!is.null(lbl_overall)) {
    overall_list <- create_table_09_data(adae = adae, alt_counts_df = alt_counts_df, arm_var = arm_var, id_var = id_var, soc_var = soc_var, pref_var = pref_var, lbl_overall = lbl_overall, risk_diff = NULL)

    result_list$data <- result_list[["data"]] %>%
      left_join(overall_list[["data"]])

    result_list$total_N <- result_list[["total_N"]] %>%
      cross_join(overall_list[["total_N"]])
  }

  result_data <- result_list[["data"]]

  rows_to_indent <- which(!is.na(result_data[[pref_var]]))

  result_data <- result_data %>%
    mutate(
      !!soc_var := if_else(is.na(.data[[soc_var]]), "Any SAE", .data[[soc_var]]),
      !!pref_var := if_else(is.na(.data[[pref_var]]), .data[[soc_var]], .data[[pref_var]])
    ) %>%
    select(-any_of(soc_var))

  gt_table <- result_data %>%
    gt(
      rowname_col = pref_var
    ) %>%
    tab_stub_indent(rows = rows_to_indent, indent = 2)


  if (show_colcounts) {
    total_N <- result_list[["total_N"]]

    set_col_labels <- function(x) {
      if (startsWith(x, "rd_")) {
        html(paste0("Risk Difference <br/>", substr(x, 4, nchar(x)), "<br/> (%) (95% CI)"))
      } else {
        html(paste0(x, "<br/>(N=", total_N[[x]], ")"))
      }
    }

    gt_table <- gt_table %>%
      cols_label_with(fn = set_col_labels)
  }


  label <- paste(lbl_soc_var, "<br/> &nbsp;&nbsp;", lbl_pref_var)

  gt_table <- gt_table %>%
    tab_stubhead(label = md(label)) %>%
    cols_align(align = "center", columns = -1) # center all columns besides the first

  if (!is.null(annotations)) {
    if (!is.null(annotations[["title"]])) {
      gt_table <- gt_table %>%
        tab_header(annotations[["title"]])
    }
    if (!is.null(annotations[["subtitle"]])) {
      gt_table <- gt_table %>%
        tab_header(annotations[["title"]], subtitle = annotations[["subtitle"]])
    }
    if (!is.null(annotations[["footnotes"]])) {
      lapply(annotations[["footnotes"]], function(x) {
        gt_table <<- gt_table %>%
          tab_footnote(x)
      })
    }
  }

  gt_table
}


#' Helper function to create the data for `make_table09_gtsum()`
#'
#' @details If `lbl_overall` is not `NULL` only the data for the overall column will be generated
#'
#' @inheritParams argument_convention
#'
#' @return list containing the counted data to be displayed for table 9 and
#' a `data.frame` containing information about the total N for each group
create_table_09_data <- function(adae, alt_counts_df, arm_var, id_var, soc_var, pref_var, lbl_overall = NULL, risk_diff = NULL) {
  basis_df <- if (!is.null(alt_counts_df)) alt_counts_df else adae
  N_data <- basis_df %>%
    {
      if (is.null(lbl_overall)) group_by(., .data[[arm_var]]) else .
    } %>%
    mutate(N = n()) %>% # count observations
    ungroup() %>%
    select(all_of(c(id_var, arm_var, "N")))

  # get total N
  total_N <- N_data %>%
    {
      if (is.null(lbl_overall)) group_by(., .data[[arm_var]]) else .
    } %>%
    distinct(N) %>%
    {
      if (is.null(lbl_overall)) {
        pivot_wider(.,
          names_from = all_of(arm_var),
          values_from = N
        )
      } else {
        rename(., !!lbl_overall := "N")
      }
    }

  adae <- adae %>%
    left_join(N_data, by = c(id_var, arm_var), relationship = "many-to-many")

  input_list <- list(NULL, soc_var, c(soc_var, pref_var))

  data_list <- lapply(input_list, function(x) {
    count_subjects(adae = adae, arm_var = arm_var, id_var = id_var, sub_level_vars = x, lbl_overall = lbl_overall, risk_diff = risk_diff)
  })

  sel_cols <- if (is.null(lbl_overall)) levels(N_data[[arm_var]]) else lbl_overall
  if (!is.null(risk_diff)) {
    risk_diff_cols <- sapply(risk_diff, function(x) {
      paste0("rd_", x[[1]], "-", x[[2]])
    })
    sel_cols <- c(sel_cols, risk_diff_cols)
  }

  result_data <- data_list %>%
    bind_rows() %>%
    select(all_of(c(soc_var, pref_var, sel_cols))) %>%
    arrange(desc(is.na(.data[[soc_var]])), .data[[soc_var]], desc(is.na(.data[[pref_var]])))

  list(data = result_data, total_N = total_N)
}

#' Helper function for `create_table_09_data()`
#' Used for counting subjects per group
#'
#' @inheritParams argument_convention
#' @param sub_level_vars (`NULL` or `character`) specifying the sub group for counted subjects
#'
#' @return A `data.frame` containing the number of subjects with `sub_level_vars` events
count_subjects <- function(adae, arm_var, id_var, sub_level_vars = NULL, lbl_overall = NULL, risk_diff = NULL) {
  grouping <- is.null(lbl_overall)
  if (grouping) {
    if (!is.null(sub_level_vars)) {
      grouping_vars <- c(arm_var, sub_level_vars)
    } else {
      grouping_vars <- arm_var
    }
  } else {
    if (!is.null(sub_level_vars)) {
      grouping_vars <- sub_level_vars
    }
  }

  count_data <- adae %>%
    {
      if (grouping || !is.null(sub_level_vars)) group_by(., across(all_of(grouping_vars))) else .
    } %>%
    summarize(
      val = n_distinct(.data[[id_var]]), # count on patient level
      N = unique(N),
      pct = format(val / mean(N) * 100, digits = 1, nsmall = 1),
      combined = paste0(val, " (", pct, "%)"),
      .groups = "drop"
    ) %>%
    {
      if (grouping) {
        pivot_wider(.,
          id_cols = all_of(sub_level_vars),
          names_from = all_of(arm_var),
          values_from = all_of(c("val", "N", "combined"))
        )
      } else {
        rename(., !!lbl_overall := "combined") %>%
          select(-c("val", "pct"))
      }
    }

  if (!is.null(risk_diff)) {
    purrr::walk(risk_diff, function(x) {
      count_data <<- count_data %>%
        mutate(!!paste0("rd_", x[[1]], "-", x[[2]]) := calculate_riskdiff(.data[[paste0("val_", x[[1]])]], .data[[paste0("val_", x[[2]])]], .data[[paste0("N_", x[[1]])]], .data[[paste0("N_", x[[2]])]]))
    })
  }
  if (grouping) {
    count_data <- count_data %>%
      rename_with(renaming_function, dplyr::starts_with("combined")) %>%
      select(-any_of(c(starts_with("val_"), starts_with("N_"))))
  }
  count_data
}


#' Helper function to rename the combined columns
#'
#' @param x character vector containing all column names which start with "combined"
#'
renaming_function <- function(x) {
  sapply(x, function(y) {
    substr(y, 10, nchar(y))
    # unlist(strsplit(y, "_"))[2]
  }, simplify = TRUE)
}


#' helper function to calculate the risk difference for table 9
#'
#' @param x character vector containing all value for the first treatment
#' @param y character vector containing all value for the second treatment
#' @param n_x character vector containing for all values of x the corresponding N
#' @param n_y character vector containing for all values of y the corresponding N
#'
#' @return vector of characters containing the value for risk difference and
#' the corresponding 95% Confidence interval in Brackets
calculate_riskdiff <- function(x, y, n_x, n_y) {
  sapply(seq_along(x), function(i) {
    pt <- prop.test(c(x[[i]], y[[i]]), c(n_x[[i]], n_y[[i]]))
    val <- format(pt$estimate[[1]] - pt$estimate[[2]], digits = 2, nsmall = 2)
    conf_int <- format(pt$conf.int, digits = 2, nsmall = 2)
    paste0(val, " (", conf_int[[1]], ", ", conf_int[[2]], ")")
  })
}
