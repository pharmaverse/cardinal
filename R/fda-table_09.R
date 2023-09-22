#' FDA Table 9: Patients With Serious Adverse Events by System Organ Class and Preferred Term,
#'   Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain `SAFFL`, `USUBJID`, `AESER`, and the variables specified
#'   by `soc_var`, `pref_var` and `arm_var`.
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



# NOTES:

# Non-optional vars: SAFFL, AESER, USUBJID -> consider this in checkmate
# arm_var col must be a factor
# if pref_var is a factor, warnings will appear. They can be ignored. Can we suppress them?
# test column headers correctly assigned (levels durcheinander oder gar kein factor)
# test return value as defined per tplyr_raw
# test pop_data_df
# test risk difference (if specified)
# test lbl_overall (if specified)
# test whether header_string is updated if necessary
# test show_colcounts if specified
# test prune_0

#' @import gt
make_table_09_tplyr <- function(adae,
                                pop_data_df = NULL,
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
  # Example
  # TODO: remove
  # adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
  # adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
  # make_table_09_tplyr(adae = adae, pop_data_df = adsl)

  # TODO: remove
  # pop_data_df <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
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

  # TODO: checkmate
  # adae and pop_data_df must be data.frames with certain columns
  # arm_var must be character and part of the column names of adae and pop_data_df
  # pref_var must be character and part of the adae column names
  # tplyr_raw must be logical/boolean
  # risk_diff_pairs must be a list of character vectors length 2 and its elements must exist in the arm_var column of adae
  # lbl_overall must be either character or NULL
  # prune_0 lgl
  # ... all arguments ...
  # annotations: only one title + can only contain title, subtitle, main_footer, prov_footer

  # Initialize column headers
  arm_names <- levels(adae[[arm_var]])

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
  structure <- Tplyr::tplyr_table(adae, treat_var = !!rlang::sym(arm_var), where = (!!rlang::sym(saffl_var) == "Y" & !!rlang::sym(ser_var) == "Y"))

  # Use alternative counts if specified
  if (!is.null(pop_data_df)) {
    structure <- structure %>%
      Tplyr::set_pop_data(pop_data_df) %>%
      Tplyr::set_pop_where(TRUE) # takes all subjects as basis, not only those where !!rlang::sym(ser_var) == "Y"!
  }

  # Add total column if specified
  if (!is.null(lbl_overall)) {
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
  if (!is.null(risk_diff_pairs)) {
    layer1 <- do.call(Tplyr::add_risk_diff, args = append(list(layer = layer1), risk_diff_pairs))
    layer2 <- do.call(Tplyr::add_risk_diff, args = append(list(layer = layer2), risk_diff_pairs))

    rd_part <- sapply(risk_diff_pairs, function(pair) paste("|RD:", paste0(pair, collapse = " - ")))
    header_string <- paste0(header_string, paste0(rd_part, collapse = ""))
  }

  # Build table
  table <- structure %>%
    Tplyr::add_layers(layer1, layer2) %>%
    Tplyr::build()

  # Revome "all zero"-rows if specified
  if (prune_0) {
    table <- table %>%
      mutate(across(starts_with("var"), ~gsub("[0()\\%\\. ]", "", .x), .names = "detect_0_{.col}")) %>%
      filter(if_any(starts_with("detect_0"), ~ .x != ""))
  }

  # Clean-up table
  table <- table %>%
    # TODO dplyr::arrange(ord_layer_index, ord_layer_1, ord_layer_2) %>% # TODO: confirm order with make_table_09() -> refer to https://atorus-research.github.io/Tplyr/articles/post_processing.html#highly-customized-sort-variables for sorting according to occurence
    dplyr::select(dplyr::starts_with(c("row_label", "var", "rdiff"))) %>%
    Tplyr::add_column_headers(s = header_string, header_n = Tplyr::header_n(structure))

  if (tplyr_raw) return(table)
  # else return gt_tbl object as follows

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
      title = if (!is.null(annotations[["title"]])) md(annotations[["title"]]) else NULL,
      subtitle = if (!is.null(annotations[["subtitles"]])) md(paste(annotations[["subtitles"]], collapse = "<br/>")) else NULL
    ) %>%
    tab_footnote(
      if (!is.null(annotations[["main_footer"]])) md(paste(annotations[["main_footer"]], collapse = "<br/>")) else NULL
    ) %>%
    tab_source_note(
      if (!is.null(annotations[["prov_footer"]])) md(paste(annotations[["prov_footer"]], collapse = "<br/>")) else NULL
    )

  # TODO: Handle missings
  # TODO: supress warnings
}


