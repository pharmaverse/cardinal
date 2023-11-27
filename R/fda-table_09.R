#' FDA Table 9: Patients With Serious Adverse Events by System Organ Class and Preferred Term,
#'   Safety Population, Pooled Analyses
#'
#' @inheritParams argument_convention
#'
#' @name make_table_09
NULL


#' @describeIn make_table_09 Create FDA table 9 using functions from `rtables` and `tern`.
#'
#' @details
#' For `make_table_09()`
#' * `adae` must contain `SAFFL`, `USUBJID`, `AESER`, and the variables specified
#'   by `soc_var`, `pref_var` and `arm_var`.
#' * If specified, `alt_counts_df` must contain `SAFFL`, `USUBJID`, and the variable specified by `arm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @return
#' * `make_table_09` returns an `rtables` table object.
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



#' @describeIn make_table_09 Create FDA table 9 using functions from `Tplyr`.
#'
#' @param risk_diff_pairs (`list` of `character` vectors)\cr Optional. List of character vectors. Each vector must be
#'   of length 2 and contain the name of treatment arms to calculate risk difference and its 95% CI for. Those names
#'   must exist in the `arm_var` column of the dataset specified in `adae`.
#' @param tplyr_raw (`flag`)\cr Boolean. Indicates whether the raw `tibble` created using `Tplyr` functions should be
#' returned or a presentation ready `gt_table` (default).
#'
#' @details
#' For `make_table_09_tplyr()`
#' * `adae` must contain the variables specified by `id_var`, `arm_var`, `saffl_var`, `ser_var`, `soc_var`, and
#'   `pref_var`.
#' * If specified, `alt_counts_df` must contain the variables specified by `id_var`, `saffl_var`, and `arm_var`.
#' * Flag variables are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'     flag variables are treated as `"N"`.
#' * Columns are split by the variable specified in `arm_var`. Overall population column is excluded by default
#'   (see `lbl_overall` argument).
#' * Numbers in the table represent the absolute numbers of patients and fraction of `N` (total number of patient in
#'   the safety population.
#' * All-zero rows are removed by default (see `prune_0` argument).
#' * Risk difference is calculated by using the default functionality of `Tplyr::add_risk_diff()`
#'
#'
#' @note
#' * `make_table_09_tplyr()` does not support annotations in case `tplyr_raw = TRUE`.
#' * `make_table_09_tplyr()` raises a warning in case `pref_var` or `soc_var` is a factor. Those can safely be ignored.
#' * `make_table_09_tplyr()` does not explicitly handle missings.
#'
#' @return
#' * `make_table_09_tplyr()` returns a `gt_tbl` object when `tplyr_raw = FALSE` (default) and
#'   a `tibble` object when `tplyr_raw = TRUE`.
#'
#' @examples
#'  adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#'  adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#'
#'  # Basic table
#'  make_table_09_tplyr(adae = adae, alt_counts_df = adsl)
#'
#'  # Activate risk difference column
#'  rd_pairs <- list(c("A: Drug X", "B: Placebo"), c("A: Drug X", "C: Combination"))
#'  make_table_09_tplyr(adae = adae, alt_counts_df = adsl, risk_diff_pairs = rd_pairs)
#'
#'  # Add overall column
#'  make_table_09_tplyr(adae = adae, alt_counts_df = adsl, lbl_overall = "Total patients")
#'
#'  # Add titles and footnotes
#'    annot <- list(
#'      title = "Table 9. Patients with Serious Adverse Events by SOC and PT, Safety Population, Pooled Analyses",
#'      subtitles = c("Only one title, but", "multiple subtitles possible"),
#'      main_footer = c("Main footer 1", "Main footer 2"),
#'      prov_footer = c("Some more information", "E.g. a source note")
#'    )
#'    make_table_09_tplyr(adae = adae, alt_counts_df = adsl, annotations = annot)
#'
#' @import gt
#' @import checkmate
#' @export
make_table_09_tplyr <- function(adae,
                                alt_counts_df = NULL,
                                id_var = "USUBJID",
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                ser_var = "AESER",
                                soc_var = "AESOC",
                                pref_var = "AEDECOD",
                                lbl_soc_var = "System Organ Class",
                                lbl_pref_var = "Reported Term for Adverse Event",
                                risk_diff_pairs = NULL,
                                show_colcounts = TRUE,
                                lbl_overall = NULL,
                                prune_0 = TRUE,
                                tplyr_raw = FALSE,
                                annotations = NULL
                                ) {
  # TODO: include function into the homepage!

  # TODO
  # test column headers correctly assigned (levels durcheinander oder gar kein factor)
  # test return value as defined per tplyr_raw
  # test alt_counts_df
  # test risk difference (if specified)
  # test lbl_overall (if specified)
  # test whether header_string is updated if necessary
  # test show_colcounts if specified
  # test prune_0


  # TODO: remove after it has been used in the tests
  # ----
  # alt_counts_df <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
  # adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
  # arm_var <- "ARM"
  # pref_var <- "AEDECOD"
  # soc_var <- "AESOC"
  # risk_diff_pairs <- list(c("A: Drug X", "B: Placebo"), c("A: Drug X", "C: Combination"))
  # lbl_overall <- "Total subjects"
  # show_colcounts <- TRUE
  # prune_0 <- TRUE
  # id_var <- "USUBJID"
  # saffl_var <- "SAFFL"
  # ser_var <- "AESER"
  # lbl_soc_var <- "System Organ Class"
  # lbl_pref_var <- "Reported Term for Adverse Event"
  # tplyr_raw <- FALSE
  # annotations <- list(
  #   title = "Table 9. Patients with Serious Adverse Events by System Organ Class and Preferred Term, Safety Population, Pooled Analyses",
  #   subtitles = c("I am proud to be a subtitle", "Me too!"),
  #   main_footer = c("Main footer 1", "Main footer 2"),
  #   prov_footer = c("abc", "def")
  # )
  # ----

  # Set instructions to activate/deactivate table components
  add_alt_counts <- ifelse(!is.null(alt_counts_df), TRUE, FALSE)
  add_overall_col <- ifelse(!is.null(lbl_overall), TRUE, FALSE)
  add_rd_col <- ifelse(!is.null(risk_diff_pairs), TRUE, FALSE)
  add_title <- ifelse(!is.null(annotations[["title"]]), TRUE, FALSE)
  add_subtitles <- ifelse(!is.null(annotations[["subtitles"]]), TRUE, FALSE)
  add_footnotes <- ifelse(!is.null(annotations[["main_footer"]]), TRUE, FALSE)
  add_source_notes <- ifelse(!is.null(annotations[["prov_footer"]]), TRUE, FALSE)

  # Check validity of input parameters
  assert_data_frame(adae)
  assert_string(id_var)
  assert_string(arm_var)
  assert_string(saffl_var)
  assert_string(ser_var)
  assert_string(soc_var)
  assert_string(pref_var)
  assert_subset(c(id_var, arm_var, saffl_var, ser_var, soc_var, pref_var), names(adae))
  assert_data_frame(alt_counts_df, null.ok = TRUE)
  if (add_alt_counts) assert_subset(c(id_var, arm_var), names(alt_counts_df))
  assert_string(lbl_overall, null.ok = TRUE)
  assert_string(lbl_pref_var, null.ok = TRUE)
  assert_string(lbl_soc_var, null.ok = TRUE)
  assert_list(risk_diff_pairs, types = "character", null.ok = TRUE)
  if (add_rd_col) {
    lapply(risk_diff_pairs, assert_vector, len = 2, any.missing = FALSE)
    lapply(risk_diff_pairs, function(vec) assert_true(all(vec %in% adae[[arm_var]])))
  }
  assert_logical(show_colcounts, len = 1)
  assert_logical(prune_0, len = 1)
  assert_logical(tplyr_raw, len = 1)
  assert_list(annotations, types = "character", null.ok = TRUE)
  if (!is.null(annotations)) {
    assert_names(names(annotations), subset.of = c("title", "subtitles", "main_footer", "prov_footer"))
  }

  # Artificially convert factor for nested variables to character to suppress tplyr warning
  if (is.factor(adae[[pref_var]])) {
    adae[[pref_var]] <- as.character(adae[[pref_var]])
  }

  if (is.factor(adae[[soc_var]])) {
    adae[[soc_var]] <- as.character(adae[[soc_var]])
  }

  # Initialize column headers
  # Allow for both, character and factor. The advantage of the latter is that users have control about the order
  arm_names <- if (is.factor(adae[[arm_var]])) levels(adae[[arm_var]]) else unique(as.character(adae[[arm_var]]))

  header_string <- paste0(
    paste0(lbl_soc_var, " \n ", lbl_pref_var,  "|"), # \\line
    paste0(
      if (show_colcounts) # paste total counts to arm names
        paste(arm_names, "\n(N=**", arm_names, "**)", sep = "")
      else # use only arm names
        arm_names,
      collapse = "|") #\\line
  )

  # Initiate table structure
  structure <- Tplyr::tplyr_table(
    adae,
    treat_var = !!rlang::sym(arm_var),
    where = (!!rlang::sym(saffl_var) == "Y" & !!rlang::sym(ser_var) == "Y")
  )

  # Use alternative counts if specified
  if (add_alt_counts) {
    structure <- structure %>%
      Tplyr::set_pop_data(alt_counts_df) %>%
      Tplyr::set_pop_where(TRUE) # takes all subjects as basis, not only those where !!rlang::sym(ser_var) == "Y"!
  }

  # Add total column if specified
  if (add_overall_col) {
    structure <- structure %>%
      Tplyr::add_total_group(group_name = lbl_overall)

    header_string <- paste0(
      header_string, "|", lbl_overall,
      if (show_colcounts) paste0("\n(N=**", lbl_overall, "**)")
    )
  }

  # Create table layers
  layer1 <- structure %>%
    Tplyr::group_count("Any SAE") %>%
    Tplyr::set_distinct_by(!!rlang::sym(id_var))

  layer2 <- structure %>%
    Tplyr::group_count(vars(!!sym(soc_var), !!sym(pref_var))) %>%
    Tplyr::set_distinct_by(!!rlang::sym(id_var)) %>%
    Tplyr::set_nest_count(TRUE)

  # Add risk difference column(s) if specified
  if (add_rd_col) {
    layer1 <- do.call(Tplyr::add_risk_diff, args = append(list(layer = layer1), risk_diff_pairs))
    layer2 <- do.call(Tplyr::add_risk_diff, args = append(list(layer = layer2), risk_diff_pairs))

    rd_part <- sapply(risk_diff_pairs, function(pair) paste("|RD:", paste0(pair, collapse = " - ")))
    header_string <- paste0(header_string, paste0(rd_part, collapse = ""))
  }

  # Build table
  table <- structure %>%
    Tplyr::add_layers(layer1, layer2) %>%
    Tplyr::build()

  # Remove "all zero"-rows if specified
  if (prune_0) {
    table <- table %>%
      mutate(across(starts_with("var"), ~gsub("[0()\\%\\. ]", "", .x), .names = "detect_0_{.col}")) %>%
      filter(if_any(starts_with("detect_0"), ~ .x != ""))
  }

  # Clean-up table
  table <- table %>%
    arrange(ord_layer_index, ord_layer_1, ord_layer_2) %>% # refer to
    # https://atorus-research.github.io/Tplyr/articles/post_processing.html#highly-customized-sort-variables
    # for sorting according to occurrence in case this is required later
    select(starts_with(c("row_label", "var", "rdiff"))) %>%
    Tplyr::add_column_headers(s = header_string, header_n = Tplyr::header_n(structure))

  if (tplyr_raw) return(table)
  # else generate and return gt_tbl object as follows

  # Prepare for header row
  lbl_stubhead <- paste(lbl_soc_var, "<br/> &nbsp;&nbsp;", lbl_pref_var)
  lbl_cols <- gsub("\n", "<br/>", as.character(table[1, -1]))
  names(lbl_cols) <- colnames(table)[-1]

  # Trim prepending blank spaces from preferred term variable values
  pref_var_lvls <- unique(adae[[pref_var]])
  ind_prep_blank <- which(substr(pref_var_lvls, 1, 1) == " ")
  trmd_pref_var_lvls <- pref_var_lvls
  trmd_pref_var_lvls[ind_prep_blank] <- sub(" +", "", trmd_pref_var_lvls[ind_prep_blank])

  gt_tbl <- table[-1,] %>% # drop header row
    mutate(
      # remove prepending blank spaces since they are ignored by gt
      row_label1 = if_else(substr(row_label1, 1, 1) == " ", sub(" +", "", row_label1), row_label1),
      # remove blank space between opening bracket and percentage number
      across(!row_label1, ~ sub("\\( +", "(", .x))
    ) %>%
    gt(rowname_col = "row_label1") %>%
    tab_stub_indent(any_of(trmd_pref_var_lvls), indent = 2) %>%
    tab_stubhead(md(lbl_stubhead)) %>%
    cols_label(.list = as.list(lbl_cols), .fn = md) %>%
    tab_header(
      title = if (add_title) md(annotations[["title"]]) else NULL,
      subtitle = if (add_subtitles) md(paste(annotations[["subtitles"]], collapse = "<br/>")) else NULL
    ) %>%
    tab_footnote(
      if (add_footnotes) md(paste(annotations[["main_footer"]], collapse = "<br/>")) else NULL
    ) %>%
    tab_source_note(
      if (add_source_notes) md(paste(annotations[["prov_footer"]], collapse = "<br/>")) else NULL
    )

  gt_tbl
}


