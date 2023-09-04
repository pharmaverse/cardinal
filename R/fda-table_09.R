#' FDA Table 9: Patients With Serious Adverse Events by System Organ Class and Preferred Term,
#'   Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain `SAFFL`, `USUBJID`, `AESER`, `AESOC`, and the variables specified
#'   by `pref_var` and `arm_var`.
#' * If specified, `alt_counts_df` must contain `SAFFL`, `USUBJID`, and the variable specified by `arm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
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
                          pref_var = "AETERM",
                          lbl_pref_var = formatters::var_labels(adae, fill = TRUE)[pref_var],
                          lbl_overall = NULL,
                          prune_0 = TRUE,
                          annotations = NULL) {
  checkmate::assert_subset(c("SAFFL", "USUBJID", "AESER", "AESOC", arm_var, pref_var), names(adae))
  assert_flag_variables(adae, "SAFFL")

  adae <- adae %>%
    filter(SAFFL == "Y", AESER == "Y") %>%
    df_explicit_na()

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    analyze_num_patients(
      vars = "USUBJID",
      .stats = "unique",
      .labels = c(unique = "Any SAE")
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
      .labels = c(unique = NULL)
    ) %>%
    count_occurrences(vars = pref_var) %>%
    append_topleft(paste(" ", lbl_pref_var))

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}

#' Function to create FDA Table 9: Patients With Serious Adverse Events
#' by System Organ Class and Preferred Term,
#' Safety Population, Pooled Analyses with /code{gt}
#'
#'
#' @inheritParams argument_convention
#' @param saffl_var (`character`)\cr safety population flag variable from `adae` to include in the table.
#' @param ser_var (`character`)\cr serious Event variable from `adae` to include in the table.
#' @param soc_var (`character`)\cr system organ class variable from `adae` to include in the table.
#' @param lbl_soc_var (`character`)\cr label corresponding to system organ class variable `soc_var` to print in the table.
#' @param annotations (named `list` of `character`)\cr list of annotations to add to the table. Valid
#'   annotation types are `title`, `subtitles`, and a list of characters called `footnotes`. Each name-value pair should
#'   use the annotation type as name and the desired string as value.
#'
#' @return A gt table object
#' @export
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#'
#' tbl <- make_table_09(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#'
#' annotations <- list(
#'   title = "Table 9. Patients With Serious Adverse Events",
#'   subtitle = "by System Organ Class and Preferred Term, Safety Population, Pooled Analyses",
#'   footnotes = list(
#'     "Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled trial durations].",
#'     "Difference is shown between [treatment arms] (e.g., difference is shown between Drug Name dosage X vs. placebo)."
#'   )
#' )
#'
#' tbl <- make_table_09(adae = adae, alt_counts_df = adsl, annotations = annotations)
#' tbl
make_table_09_gt <- function(adae,
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
                             annotations = NULL) {

  checkmate::assert_data_frame(adae)
  checkmate::assert_subset(c(saffl_var, id_var, ser_var, soc_var, arm_var, pref_var), names(adae))
  assert_flag_variables(adae, saffl_var)

  if (!is.null(alt_counts_df)) {
    checkmate::assert_data_frame(alt_counts_df)
    checkmate::assert_subset(c(id_var,arm_var), names(alt_counts_df))
  }

  checkmate::assert_logical(show_colcounts)

  adae <- adae %>%
    dplyr::filter(.data[[saffl_var]] == "Y", .data[[ser_var]] == "Y")

  # count observations per group
  basis_df <- if (!is.null(alt_counts_df)) alt_counts_df else adae
  N_data <- basis_df %>%
    dplyr::group_by(.data[[arm_var]]) %>%
    dplyr::mutate(N = dplyr::n()) %>%
    dplyr::ungroup() %>%
    dplyr::select(dplyr::all_of(c(id_var, arm_var, "N")))


  adae <- adae %>%
    dplyr::left_join(N_data, by = c(id_var, arm_var))

  count_per_subject <- function(arm_var, sub_level_vars = NULL) {

    if (!is.null(sub_level_vars)) {
      grouping_vars <- c(arm_var, sub_level_vars)
    } else {
      grouping_vars <- arm_var
    }

    adae %>%
      dplyr::group_by(dplyr::across(dplyr::all_of(grouping_vars))) %>%
      dplyr::summarize(
        val = dplyr::n_distinct(.data[[id_var]]), #count on patient level
        pct = format(val/mean(N)*100, digits = 1, nsmall = 1),
        combined = paste0(val, " (", pct, "%)"),
        .groups = "drop"
      ) %>%
      tidyr::pivot_wider(
        id_cols = dplyr::all_of(sub_level_vars), names_from = dplyr::all_of(arm_var),
        values_from = combined
      )
  }

  input_list <- list(NULL, soc_var, c(soc_var, pref_var))
  data_list <- purrr::map(input_list, ~count_per_subject(arm_var = arm_var, sub_level_vars = .x))

  arm_levels <- levels(N_data[[arm_var]])

  result_data <- dplyr::bind_rows(data_list) %>%
    dplyr::select(dplyr::all_of(c(soc_var, pref_var, arm_levels))) %>%
    dplyr::arrange(dplyr::desc(is.na(.data[[soc_var]])), .data[[soc_var]], dplyr::desc(is.na(.data[[pref_var]])))

  rows_to_indent <- which(!is.na(result_data[[pref_var]]))

  result_data <- result_data %>%
    dplyr::mutate(
      !!soc_var := dplyr::if_else(is.na(.data[[soc_var]]), "Any SAE", .data[[soc_var]]),
      !!pref_var := dplyr::if_else(is.na(.data[[pref_var]]), .data[[soc_var]], .data[[pref_var]])
    ) %>%
    dplyr::select(-dplyr::any_of(soc_var))

  gt_table <- result_data %>%
    gt::gt(
      rowname_col = pref_var
    ) %>%
    gt::tab_stub_indent(rows = rows_to_indent, indent = 2)


  if (show_colcounts) {

    total_N <- N_data %>%
      dplyr::group_by(.data[[arm_var]]) %>%
      dplyr::distinct(N) %>%
      tidyr::pivot_wider(
        names_from = dplyr::all_of(arm_var),
        values_from = N
      )

    set_col_labels <- function(x) {
     gt::html(paste0(x, "<br/>(N=", total_N[[x]], ")"))
    }

    gt_table <- gt_table %>%
      gt::cols_label_with(fn = set_col_labels)
  }


  label <- paste(lbl_soc_var, "<br/> &nbsp;&nbsp;", lbl_pref_var)

  gt_table <- gt_table %>%
    gt::tab_stubhead(label = gt::md(label)) %>%
    gt::cols_align(align = "center", columns = -1) # center all columns besides the first

  if (!is.null(annotations)) {
    if (!is.null(annotations[["title"]])) {
      gt_table <- gt_table %>%
        gt::tab_header(annotations[["title"]])
    }
    if (!is.null(annotations[["subtitle"]])) {
      gt_table <- gt_table %>%
        gt::tab_header(annotations[["title"]], subtitle = annotations[["subtitle"]])
    }
    if (!is.null(annotations[["footnotes"]])) {
      lapply(annotations[["footnotes"]], function(x) {
        gt_table <<- gt_table %>%
          gt::tab_footnote(x)
      })
    }
  }

  gt_table
}
