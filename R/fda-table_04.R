#' Wrapper to Generate Disposition Table and ARD Structure
#'
#' This function wraps `make_table_04_gtsummary()` and `create_ard_from_gtsummary()` to generate a formatted
#' disposition summary table and optionally return the corresponding Analysis Results Dataset (ARD) structure.
#'
#' @param df A data frame containing subject-level disposition data, including `EOTSTT`, `EOSSTT`, `DCSREAS`,
#' the population flags (`pop_vars`), and treatment arm (`arm_var`).
#' @param return_ard Logical flag indicating whether to return both the table and the ARD structure (`TRUE`, default),
#' or only the formatted table (`FALSE`).
#' @param id_var A string indicating the subject ID variable. Default is `"USUBJID"`.
#' @param arm_var A string indicating the treatment arm variable. Default is `"ARM"`.
#' @param reason_var A string indicating the variable for reason of discontinuation. Default is `"DCSREAS"`.
#' @param pop_vars Character vector of population flag variable names. Default is `c("SAFFL", "ITTFL")`.
#' @param lbl_pop_vars Character vector of human-readable labels corresponding to `pop_vars`.
#' Must be the same length and order. Default is `c("Safety population", "ITT/mITT population")`.
#' @param display_all_column Logical flag to indicate whether to include an overall column across all treatment groups. Default is `FALSE`.
#'
#' @return If `return_ard = TRUE`, returns a list with two elements:
#' \describe{
#'   \item{`table`}{A `gtsummary::tbl_summary` object for display}
#'   \item{`ard`}{A data frame in ARD format containing parsed statistics by treatment group}
#' }
#' If `return_ard = FALSE`, returns only the `gtsummary::tbl_summary` object.
#'
#' @seealso [make_table_04_gtsummary()], [create_ard_from_gtsummary()]
#'
#' @examples
#' \dontrun{
#' result <- make_table_04(my_disposition_data)
#' result$table # gtsummary table
#' result$ard # ARD format data
#' }
#'
#' @export
make_table_04 <- function(df,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          reason_var = "DCSREAS",
                          pop_vars = c("SAFFL", "ITTFL"),
                          lbl_pop_vars = c("Safety population", "ITT/mITT population"),
                          display_all_column = FALSE) {
  tbl <- make_table_04_gtsummary(
    df,
    id_var = "USUBJID",
    arm_var = "ARM",
    reason_var = "DCSREAS",
    pop_vars = c("SAFFL", "ITTFL"),
    lbl_pop_vars = c("Safety population", "ITT/mITT population"),
    display_all_column = FALSE
  )

  ard <- create_ard_from_gtsummary(tbl)

  if (return_ard) {
    return(list(table = tbl, ard = ard))
  } else {
    return(tbl)
  }
}

#' Generate Disposition Summary Table Using `gtsummary`
#'
#' This function creates a formatted disposition summary table (Table 04) using the `gtsummary` package.
#' It summarizes population flags and study drug/study discontinuation reasons by treatment group,
#' with labeled rows and indentation for subcategories.
#'
#' @param df A data frame containing subject-level disposition data. Must include variables such as
#' `EOTSTT`, `EOSSTT`, and `DCSREAS`, in addition to the specified `id_var`, `arm_var`, and `pop_vars`.
#' @param id_var A string indicating the subject ID variable name. Default is `"USUBJID"`.
#' @param arm_var A string indicating the treatment arm variable name. Default is `"ARM"`.
#' @param reason_var A string indicating the discontinuation reason variable. Default is `"DCSREAS"`.
#' @param pop_vars A character vector of population flag variables (e.g., `"SAFFL"`, `"ITTFL"`). Default is `c("SAFFL", "ITTFL")`.
#' @param lbl_pop_vars A character vector of labels corresponding to `pop_vars`. Default is `c("Safety population", "ITT/mITT population")`.
#' @param display_all_column Logical indicating whether to include an "All Patients" column in the summary. Default is `FALSE`.
#'
#' @return A `gtsummary::tbl_summary` object with formatted output:
#' - Summarizes population flags and discontinuation reasons,
#' - Applies human-readable labels,
#' - Indents subcategories under main categories,
#' - Optionally includes an "All" column.
#'
#' @details
#' The function:
#' - Validates the presence of required columns,
#' - Applies flag logic (e.g., `"Y"` to `TRUE`) and attaches variable labels using `with_label`,
#' - Constructs derived variables for study drug and study discontinuations based on `EOTSTT`, `EOSSTT`, and `DCSREAS`,
#' - Uses `gtsummary::tbl_summary()` to build a formatted table grouped by `arm_var`,
#' - Indents sub-reasons (e.g., "Adverse event", "Death") under their respective parent categories,
#' - Optionally adds an "All Patients" summary column.
#' @examples
#' \dontrun{
#' df <- your_disposition_data
#' make_table_04_gtsummary(df, pop_vars = c("SAFFL"), lbl_pop_vars = c("Safety population"))
#' }
#'
#' @export
make_table_04_gtsummary <- function(df,
                                    id_var = "USUBJID",
                                    arm_var = "ARM",
                                    reason_var = "DCSREAS",
                                    pop_vars = c("SAFFL", "ITTFL"),
                                    lbl_pop_vars = c("Safety population", "ITT/mITT population"),
                                    display_all_column = FALSE) {
  assert_subset(c(
    id_var, arm_var, pop_vars,
    "EOTSTT", "DCSREAS", "EOSSTT", "DCSREAS"
  ), names(df))

  assert_flag_variables(df, pop_vars)

  df <- df %>%
    df_explicit_na() %>%
    mutate(
      across(all_of(pop_vars), ~ with_label(. == "Y", lbl_pop_vars[match(cur_column(), pop_vars)])),
      DISCSD = with_label(EOTSTT == "DISCONTINUED", "Discontinued study drug"),
      DISCSD_AE = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "ADVERSE EVENT", "Adverse event"),
      DISCSD_LOE = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "LACK OF EFFICACY", "Lack of efficacy"),
      DISCSD_PD = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "PROTOCOL DEVIATION", "Protocol deviation"),
      DISCSD_DT = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "DEATH", "Death"),
      DISCSD_WBS = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "WITHDRAWAL BY SUBJECT", "Withdrawal by subject"),
      DISCSD_OTH = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "OTHER", "Other"),
      DISCS = with_label(EOSSTT == "DISCONTINUED", "Discontinued study"),
      DISCS_DT = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "DEATH", "Death"),
      DISCS_LFU = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "LOST TO FOLLOW-UP", "Lost to follow-up"),
      DISCS_WBS = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "WITHDRAWAL BY SUBJECT", "Withdrawal by subject"),
      DISCS_PHD = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "PHYSICIAN DECISION", "Physician decision"),
      DISCS_PD = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "PROTOCOL VIOLATION", "Protocol deviation"),
      DISCS_OTH = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "OTHER", "Other")
    )

  # Create summary table
  result_tbl <- df %>%
    gtsummary::tbl_summary(
      by = arm_var,
      statistic = list(all_dichotomous() ~ "{n} ({p}%)"),
      include = all_of(c(
        pop_vars,
        "DISCSD", "DISCSD_AE", "DISCSD_LOE", "DISCSD_PD", "DISCSD_DT", "DISCSD_WBS", "DISCSD_OTH",
        "DISCS", "DISCS_DT", "DISCS_LFU", "DISCS_WBS", "DISCS_PHD", "DISCS_PD", "DISCS_OTH"
      )),
      digits = list(gtsummary::all_categorical() ~ c(0, 1))
    )

  if (display_all_column) {
    result_tbl <- result_tbl %>% add_overall(last = TRUE)
  }

  result_tbl <- result_tbl %>%
    gtsummary::modify_header(label = "") %>%
    gtsummary::modify_footnote(everything() ~ NA) %>%
    # Define which variables are children of parent variables
    modify_table_styling(
      columns = "label",
      rows = variable %in% c(
        "DISCSD_AE", "DISCSD_LOE", "DISCSD_PD", "DISCSD_DT",
        "DISCSD_WBS", "DISCSD_OTH"
      ),
      text_format = "indent"
    ) %>%
    modify_table_styling(
      columns = "label",
      rows = variable %in% c(
        "DISCS_DT", "DISCS_LFU", "DISCS_WBS", "DISCS_PHD",
        "DISCS_PD", "DISCS_OTH"
      ),
      text_format = "indent"
    ) %>%
    # Make all but main categories display as levels
    modify_table_body(
      ~ .x %>%
        mutate(row_type = case_when(
          variable %in% c(pop_vars, "DISCSD", "DISCS") ~ "label",
          TRUE ~ "level"
        ))
    )

  return(result_tbl)
}

#' Convert a `gtsummary::tbl_summary` Object into an ARD (Analysis Results Display) Format
#'
#' This function extracts and reshapes the underlying data from a `gtsummary::tbl_summary` object
#' into a standardized flat ARD table format, including parsed statistics and structured columns.
#'
#' @param tbl_summary_obj A `gtsummary::tbl_summary` object containing summary statistics generated
#' from categorical or dichotomous variables.
#'
#' @return A data frame in ARD format containing the following columns:
#' - `analysis_var`: name of the analysis variable,
#' - `analysis_var_label`: label of the analysis variable,
#' - `group_level`: level or category within the variable (e.g., "Male", "Female"), or `NA` for headers,
#' - `treatment_group`: name of the treatment group,
#' - `statistic_type`: type of statistic (e.g., `"count_pct"`),
#' - `n`: extracted count (numeric),
#' - `pct`: extracted percentage (numeric),
#' - `formatted_result`: original formatted string from gtsummary (e.g., `"12 (34.3%)"`).
#'
#' @details
#' The function:
#' - Extracts relevant columns from the `table_body` component of the `tbl_summary` object,
#' - Reshapes the summary statistics to a long format,
#' - Parses and cleans treatment group names,
#' - Parses count and percentage values from formatted result strings,
#' - Adds standard ARD columns for downstream reporting.
#'
#' This is useful when integrating summary tables into a broader ARD or CSR (Clinical Study Report) workflow.
#'
#' @examples
#' # Assuming `tbl` is a gtsummary::tbl_summary object:
#' # ard_df <- create_ard_from_gtsummary(tbl)
#'
#' @export
create_ard_from_gtsummary <- function(tbl_summary_obj) {
  # Extract the underlying data from gtsummary object
  ard_data <- tbl_summary_obj$table_body %>%
    select(
      variable, var_type, var_label, label, row_type,
      starts_with("stat_")
    ) %>%
    # Reshape to long format for ARD structure
    pivot_longer(
      cols = starts_with("stat_"),
      names_to = "treatment_group",
      values_to = "formatted_result"
    ) %>%
    # Clean treatment group names
    mutate(
      treatment_group = str_remove(treatment_group, "^stat_"),
      treatment_group = str_replace_all(treatment_group, "_", " ")
    ) %>%
    # Add ARD standard columns
    mutate(
      analysis_var = variable,
      analysis_var_label = var_label,
      group_level = case_when(
        row_type == "label" ~ NA_character_,
        TRUE ~ label
      ),
      statistic_type = case_when(
        var_type == "dichotomous" ~ "count_pct",
        var_type == "categorical" ~ "count_pct",
        TRUE ~ var_type
      ),
      # Parse n and percentage from formatted result
      n = as.numeric(str_extract(formatted_result, "^\\d+")),
      pct = as.numeric(str_extract(formatted_result, "\\((\\d+\\.\\d+)%\\)", group = 1))
    ) %>%
    select(
      analysis_var, analysis_var_label, group_level, treatment_group,
      statistic_type, n, pct, formatted_result
    )

  return(ard_data)
}

#' Create an ARD Table Summarizing Disposition and Population Flags by Treatment Arm
#'
#' This function generates a flat analysis results display (ARD) table summarizing
#' discontinuation-related reasons and population flags by treatment arm. It calculates
#' counts and percentages for each category and organizes results into a structured format
#' with hierarchy levels for reporting.
#'
#' @param df A data frame containing subject-level disposition and population flag variables.
#' @param id_var Character string indicating the subject ID variable. Default is `"USUBJID"`.
#' @param arm_var Character string indicating the treatment arm variable. Default is `"ARM"`.
#' @param reason_var Character string indicating the variable containing discontinuation reasons. Default is `"DCSREAS"`.
#' @param pop_vars Character vector of population flag variables (e.g., `"SAFFL"`, `"ITTFL"`).
#' @param lbl_pop_vars Character vector of labels corresponding to `pop_vars`, used for output labeling.
#'
#' @return A data frame containing a structured summary of population flags and treatment/study
#' discontinuation reasons, including:
#' - `analysis_var`: variable name,
#' - `analysis_var_label`: descriptive label,
#' - `parent_var`: optional parent grouping variable,
#' - `variable_level`: either `"primary"` or `"secondary"` depending on hierarchy,
#' - `treatment_group`: treatment arm label,
#' - `statistic_type`: `"count_pct"` format,
#' - `n_total`, `n_event`, `pct`: statistics,
#' - `formatted_result`: formatted string (e.g., `"12 (30.0%)"`).
#'
#' @details
#' The function processes the input data to create binary indicator variables for various
#' study drug and study discontinuation reasons (e.g., adverse event, death, protocol deviation),
#' along with population flags. It then summarizes these by treatment arm, providing both counts
#' and percentages, and adds a simple hierarchical structure to facilitate grouped reporting.
#'
#' @examples
#' # Assuming appropriate structure in `adsl`:
#' # ard_table <- create_ard_table_4(adsl)
#'
#' @export
create_ard_table_4 <- function(df,
                               id_var = "USUBJID",
                               arm_var = "ARM",
                               reason_var = "DCSREAS",
                               pop_vars = c("SAFFL", "ITTFL"),
                               lbl_pop_vars = c("Safety population", "ITT/mITT population")) {
  # Prepare data similar to your original function
  df_processed <- df %>%
    df_explicit_na() %>%
    mutate(
      across(all_of(pop_vars), ~ . == "Y"),
      DISCSD = EOTSTT == "DISCONTINUED",
      DISCSD_AE = EOTSTT == "DISCONTINUED" & DCSREAS == "ADVERSE EVENT",
      DISCSD_LOE = EOTSTT == "DISCONTINUED" & DCSREAS == "LACK OF EFFICACY",
      DISCSD_PD = EOTSTT == "DISCONTINUED" & DCSREAS == "PROTOCOL DEVIATION",
      DISCSD_DT = EOTSTT == "DISCONTINUED" & DCSREAS == "DEATH",
      DISCSD_WBS = EOTSTT == "DISCONTINUED" & DCSREAS == "WITHDRAWAL BY SUBJECT",
      DISCSD_OTH = EOTSTT == "DISCONTINUED" & DCSREAS == "OTHER",
      DISCS = EOSSTT == "DISCONTINUED",
      DISCS_DT = EOSSTT == "DISCONTINUED" & DCSREAS == "DEATH",
      DISCS_LFU = EOSSTT == "DISCONTINUED" & DCSREAS == "LOST TO FOLLOW-UP",
      DISCS_WBS = EOSSTT == "DISCONTINUED" & DCSREAS == "WITHDRAWAL BY SUBJECT",
      DISCS_PHD = EOSSTT == "DISCONTINUED" & DCSREAS == "PHYSICIAN DECISION",
      DISCS_PD = EOSSTT == "DISCONTINUED" & DCSREAS == "PROTOCOL VIOLATION",
      DISCS_OTH = EOSSTT == "DISCONTINUED" & DCSREAS == "OTHER"
    )

  # Define variables and their labels
  analysis_vars <- c(
    pop_vars,
    "DISCSD", "DISCSD_AE", "DISCSD_LOE", "DISCSD_PD", "DISCSD_DT", "DISCSD_WBS", "DISCSD_OTH",
    "DISCS", "DISCS_DT", "DISCS_LFU", "DISCS_WBS", "DISCS_PHD", "DISCS_PD", "DISCS_OTH"
  )

  var_labels <- c(
    lbl_pop_vars,
    "Discontinued study drug", "Adverse event", "Lack of efficacy",
    "Protocol deviation", "Death", "Withdrawal by subject", "Other",
    "Discontinued study", "Death", "Lost to follow-up", "Withdrawal by subject",
    "Physician decision", "Protocol deviation", "Other"
  )

  # Create ARD structure
  ard_results <- map2_dfr(analysis_vars, var_labels, function(var, label) {
    df_processed %>%
      group_by(!!sym(arm_var)) %>%
      summarise(
        n_total = n(),
        n_event = sum(!!sym(var), na.rm = TRUE),
        pct = round(n_event / n_total * 100, 1),
        .groups = "drop"
      ) %>%
      mutate(
        analysis_var = var,
        analysis_var_label = label,
        statistic_type = "count_pct",
        formatted_result = paste0(n_event, " (", pct, "%)")
      ) %>%
      rename(treatment_group = !!sym(arm_var))
  })

  # Add hierarchy information
  ard_results <- ard_results %>%
    mutate(
      parent_var = case_when(
        str_starts(analysis_var, "DISCSD_") ~ "DISCSD",
        str_starts(analysis_var, "DISCS_") ~ "DISCS",
        TRUE ~ NA_character_
      ),
      variable_level = case_when(
        analysis_var %in% c(pop_vars, "DISCSD", "DISCS") ~ "primary",
        TRUE ~ "secondary"
      )
    ) %>%
    select(
      analysis_var, analysis_var_label, parent_var, variable_level,
      treatment_group, statistic_type, n_total, n_event, pct, formatted_result
    )

  return(ard_results)
}

#' Create an ARD (Analysis Results Display) using `gtsummary` with `cards` package
#'
#' This function prepares and summarizes disposition-related variables using the
#' `cards::ard_categorical()` function from the `cards` package, which integrates with `gtsummary`.
#' It processes the input data to define flags for various reasons of study or treatment discontinuation
#' and generates a formatted categorical ARD stratified by treatment arm.
#'
#' @param df A data frame containing the subject-level disposition data.
#' @param id_var Character string specifying the subject ID variable. Default is `"USUBJID"`.
#' @param arm_var Character string specifying the treatment arm variable. Default is `"ARM"`.
#' @param pop_vars Character vector of population flag variables (e.g., `"SAFFL"`, `"ITTFL"`). These should be binary flags (typically `"Y"` or `NA`).
#' @param lbl_pop_vars Character vector of labels corresponding to `pop_vars`, used for labelling in the output.
#'
#' @return A `gtsummary`-styled ARD (Analysis Results Display) object created using `cards::ard_categorical()`,
#' summarizing the specified disposition flags by treatment arm.
#'
#' @details
#' The function creates several derived binary variables indicating different reasons for study drug
#' or study discontinuation (e.g., adverse event, death, protocol deviation) and labels them for display
#' using `with_label()`. These are passed to `cards::ard_categorical()` to generate a table summarizing
#' counts and percentages by arm.
#'
#' @examples
#' # Example usage (requires appropriate structure of `df`):
#' # ard_tbl <- create_ard_with_gtsummary_cards(adsl_data)
#'
#' @export
create_ard_with_gtsummary_cards <- function(df,
                                            id_var = "USUBJID",
                                            arm_var = "ARM",
                                            pop_vars = c("SAFFL", "ITTFL"),
                                            lbl_pop_vars = c("Safety population", "ITT/mITT population")) {
  # This uses the newer gtsummary approach with cards package
  # First create the processed data
  df_processed <- df %>%
    df_explicit_na() %>%
    mutate(
      across(all_of(pop_vars), ~ with_label(. == "Y", lbl_pop_vars[match(cur_column(), pop_vars)])),
      DISCSD = with_label(EOTSTT == "DISCONTINUED", "Discontinued study drug"),
      DISCSD_AE = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "ADVERSE EVENT", "Adverse event"),
      DISCSD_LOE = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "LACK OF EFFICACY", "Lack of efficacy"),
      DISCSD_PD = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "PROTOCOL DEVIATION", "Protocol deviation"),
      DISCSD_DT = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "DEATH", "Death"),
      DISCSD_WBS = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "WITHDRAWAL BY SUBJECT", "Withdrawal by subject"),
      DISCSD_OTH = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "OTHER", "Other"),
      DISCS = with_label(EOSSTT == "DISCONTINUED", "Discontinued study"),
      DISCS_DT = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "DEATH", "Death"),
      DISCS_LFU = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "LOST TO FOLLOW-UP", "Lost to follow-up"),
      DISCS_WBS = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "WITHDRAWAL BY SUBJECT", "Withdrawal by subject"),
      DISCS_PHD = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "PHYSICIAN DECISION", "Physician decision"),
      DISCS_PD = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "PROTOCOL VIOLATION", "Protocol deviation"),
      DISCS_OTH = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "OTHER", "Other")
    )

  # Create ARD using cards package
  ard <- df_processed %>%
    cards::ard_categorical(
      by = all_of(arm_var),
      variables = all_of(c(
        pop_vars,
        "DISCSD", "DISCSD_AE", "DISCSD_LOE", "DISCSD_PD", "DISCSD_DT", "DISCSD_WBS", "DISCSD_OTH",
        "DISCS", "DISCS_DT", "DISCS_LFU", "DISCS_WBS", "DISCS_PHD", "DISCS_PD", "DISCS_OTH"
      )),
      statistic = ~ c("n", "p")
    )

  return(ard)
}

#' FDA Table 4: Patient Disposition, Pooled Analyses
#'
#' @details
#' * `df` must contain `EOTSTT`, `DCSREAS`, `EOSSTT`, `DCSREAS` and the variables specified by `arm_var`, `id_var`,
#'   and `pop_vars`.
#' * If specified, `alt_counts_df` must contain the variable specified by `arm_var`, `id_var`, and `pop_vars`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * All-zero rows are not removed by default (see `prune_0` argument).
#'
#' @param pop_vars (`vector` of `character`)\cr population variables from `df` to include in the table.
#' @param lbl_pop_vars (`vector` of `character`)\cr labels corresponding to variables in `pop_vars` to print
#'   in the table. Labels should be ordered according to the order of variables in `pop_vars`.
#' @inheritParams argument_convention
#'
#' @return An `rtable` object.
#'
#' @examples
#' library(dplyr)
#'
#' adsl <- random.cdisc.data::cadsl %>%
#'   mutate(test = rbinom(400, 1, 0.5)) %>%
#'   mutate(
#'     RANDFL = ifelse(test == 0, "N", "Y"),
#'     PPROTFL = ifelse(test == 0, "N", "Y"),
#'     DCSREAS = if_else(DCSREAS %in% c(
#'       "ADVERSE EVENT", "LACK OF EFFICACY", "PROTOCOL VIOLATION",
#'       "DEATH", "WITHDRAWAL BY PARENT/GUARDIAN"
#'     ), DCSREAS, "OTHER")
#'   )
#'
#' tbl <- make_table_04_rtables(
#'   df = adsl, pop_vars = c("RANDFL", "ITTFL", "SAFFL", "PPROTFL"),
#'   lbl_pop_vars = c(
#'     "Patients randomized", "ITT/mITT population", "Safety population", "Per-protocol population"
#'   )
#' )
#' tbl
#'
#' @export
make_table_04_rtables <- function(df,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          id_var = "USUBJID",
                          pop_vars = c("SAFFL"),
                          lbl_pop_vars = c("Safety population"),
                          lbl_overall = NULL,
                          prune_0 = FALSE,
                          risk_diff = NULL,
                          annotations = NULL) {
  assert_subset(c(
    id_var, arm_var, pop_vars,
    "EOTSTT", "DCSREAS", "EOSSTT", "DCSREAS"
  ), names(df))
  assert_flag_variables(df, pop_vars)


  df <- df %>%
    as_tibble() %>%
    df_explicit_na() %>%
    mutate(
      across(all_of(pop_vars), ~ with_label(. == "Y", lbl_pop_vars[match(cur_column(), pop_vars)])),
      DISCSD = with_label(EOTSTT == "DISCONTINUED", "Discontinued study drug"),
      DISCSD_AE = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "ADVERSE EVENT", "Adverse event"),
      DISCSD_LOE = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "LACK OF EFFICACY", "Lack of efficacy"),
      DISCSD_PD = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "PROTOCOL DEVIATION", "Protocol deviation"),
      DISCSD_DT = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "DEATH", "Death"),
      DISCSD_WBS = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "WITHDRAWAL BY SUBJECT", "Withdrawal by subject"),
      DISCSD_OTH = with_label(EOTSTT == "DISCONTINUED" & DCSREAS == "OTHER", "Other"),
      DISCS = with_label(EOSSTT == "DISCONTINUED", "Discontinued study"),
      DISCS_DT = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "DEATH", "Death"),
      DISCS_LFU = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "LOST TO FOLLOW-UP", "Lost to follow-up"),
      DISCS_WBS = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "WITHDRAWAL BY SUBJECT", "Withdrawal by subject"),
      DISCS_PHD = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "PHYSICIAN DECISION", "Physician decision"),
      DISCS_PD = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "PROTOCOL VIOLATION", "Protocol deviation"),
      DISCS_OTH = with_label(EOSSTT == "DISCONTINUED" & DCSREAS == "OTHER", "Other")
    )

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = var_labels(df[, pop_vars]),
      riskdiff = !is.null(risk_diff),
      table_names = "pop"
    ) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = "DISCSD",
      riskdiff = !is.null(risk_diff),
      table_names = "discsd"
    ) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("DISCSD_AE", "DISCSD_LOE", "DISCSD_PD", "DISCSD_DT", "DISCSD_WBS", "DISCSD_OTH"),
      riskdiff = !is.null(risk_diff),
      .indent_mods = 1L,
      table_names = "discsd_fl"
    ) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = "DISCS",
      riskdiff = !is.null(risk_diff),
      table_names = "discs"
    ) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("DISCS_DT", "DISCS_LFU", "DISCS_WBS", "DISCS_PHD", "DISCS_PD", "DISCS_OTH"),
      riskdiff = !is.null(risk_diff),
      .indent_mods = 1L,
      table_names = "discs_fl"
    )

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
