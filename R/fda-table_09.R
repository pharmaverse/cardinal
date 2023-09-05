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



# NOTES:

# Non-optional vars: SAFFL, AESER, USUBJID, AESOC -> consider this in checkmate
# arm_var col must be a factor
# if pref_var is a factor, warnings will appear. They can be ignored. Can we suppress them?
# test column headers correctly assigned (levels durcheinander oder gar kein factor)
# test return value as defined per tplyr_raw
# test pop_data_df
# test risk difference (if specified + compare content to manual prop.test)

make_table_09_tplyr <- function(adae,
                                pop_data_df = NULL,
                                arm_var = "ARM",
                                pref_var = "AEDECOD",
                                # TODO: add soc_var as parameter
                                risk_diff_pairs = NULL,
                                tplyr_raw = FALSE
                                ) {
  # Example
  # TODO: remove
  # adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
  # adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
  # make_table_09_tplyr(adae = adae, pop_data_df = adsl)

  # fnc <- function(x, bool) { if (bool) x %>% add_layer(group_count("Something")) }
  # or rather: https://stackoverflow.com/questions/30604107/r-conditional-evaluation-when-using-the-pipe-operator

  # TODO: remove
  # pop_data_df <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
  # adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
  # arm_var <- "ARM"
  # pref_var <- "AEDECOD"
  # risk_diff_pairs <- list(c("A: Drug X", "B: Placebo"))

  # TODO: checkmate
  # adae and pop_data_df must be data.frames with certain columns
  # arm_var must be character and part of the column names of adae and pop_data_df
  # pref_var must be character and part of the adae column names
  # tplyr_raw must be logical/boolean
  # risk_diff_pairs must be a list of character vectors length 2 and its elements must exist in the arm_var column of adae

  # Initiate table structure
  structure <- Tplyr::tplyr_table(adae, treat_var = !!rlang::sym(arm_var), where = (SAFFL == "Y" & AESER == "Y"))

  # Use alternative counts if specified
  if (!is.null(pop_data_df)) {
    structure <- structure %>%
      Tplyr::set_pop_data(pop_data_df) %>%
      Tplyr::set_pop_where(TRUE) # takes all subjects as basis, not only those where AESER == "Y"!
  }

  layer1 <- structure %>%
    Tplyr::group_count("Any SAE") %>%
    Tplyr::set_distinct_by(USUBJID)

  layer2 <- structure %>%
    Tplyr::group_count(vars(AESOC, !!sym(pref_var))) %>%
    Tplyr::set_distinct_by(USUBJID) %>%
    Tplyr::set_nest_count(TRUE)

  arm_names <- levels(adae[[arm_var]])
  header_string <- paste0(
    "System Organ Class\n  Reported Term for Adverse Event|", # \\line
    paste0(paste(arm_names, "\n(N=**", arm_names, "**)", sep = ""), collapse = "|") #\\line
  )

  # Add risk difference column(s) if specified
  if (!is.null(risk_diff_pairs)) {
    layer1 <- do.call(Tplyr::add_risk_diff, args = append(list(layer = layer1), risk_diff_pairs))
    layer2 <- do.call(Tplyr::add_risk_diff, args = append(list(layer = layer2), risk_diff_pairs))

    rd_part <- sapply(risk_diff_pairs, function(pair) paste("|RD:", paste0(pair, collapse = " - ")))
    header_string <- paste0(header_string, paste0(rd_part, collapse = ""))
  }



  # TODO: read f_str help to remove blank spaces within the percentage paranthesis

  table <- structure %>%
    Tplyr::add_layers(layer1, layer2) %>%
    Tplyr::build() %>%
    dplyr::arrange(ord_layer_index, ord_layer_1, ord_layer_2) %>% # TODO: confirm order with make_table_09() -> refer to https://atorus-research.github.io/Tplyr/articles/post_processing.html#highly-customized-sort-variables for sorting according to occurence
    dplyr::select(dplyr::starts_with(c("row_label", "var", "rdiff"))) %>%
    Tplyr::add_column_headers(s = header_string, header_n = header_n(structure)) #%>%
    # dplyr::mutate(row_label1 = Tplyr::str_indent_wrap(row_label1, width = 10))

  table

  # Add Risk Difference columns -> Continue with l. 143

  # Add Total column (lbl_overall): add_total_group()

  # Handle missings


  # if (!tplyr_raw) return a table formatted with tfrmt

  # footnotes can only be added for tplyr_raw = FALSE



}


