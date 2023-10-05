#' Standard Arguments
#'
#' This documentation lists all the arguments in `falcon` that are used repeatedly by functions to output tables.
#'
#' @param adae (`data.frame`)\cr dataset (typically ADAE) required to build table.
#' @param adex (`data.frame`)\cr dataset (typically ADEX) required to build table.
#' @param advs (`data.frame`)\cr dataset (typically ADVS) required to build table.
#' @param alt_counts_df (`character`)\cr alternative dataset (typically ADSL) used only to calculate column counts.
#' @param annotations (named `list` of `character`)\cr list of annotations to add to the table. Valid
#'   annotation types are `title`, `subtitles`, `main_footer`, and `prov_footer`. Each name-value pair should
#'   use the annotation type as name and the desired string as value.
#' @param arm_var (`character`)\cr arm variable used to split table into columns.
#' @param df (`data.frame`)\cr dataset required to build table.
#' @param fmqsc_var (`character`)\cr FMQ scope variable to use in table.
#' @param fmqnam_var (`character`)\cr FMQ reference name variable to use in table.
#' @param fmq_scope (`character`)\cr FMQ scope ("NARROW" or "BROAD") to output in table.
#' @param id_var (`character`)\cr variable used as unique subject identifier.
#' @param lbl_overall (`character`)\cr if specified, an overall column will be added to the table with
#'   the given value as the column label.
#' @param lbl_pref_var (`character`)\cr label corresponding to preferred term variable `pref_var` to print in the table.
#' @param lbl_vars (`vector` of `character`)\cr labels corresponding to variables in `vars` to print
#'   in the table. Labels should be ordered according to the order of variables in `vars`.
#' @param na_level (`character`)\cr string to represent missing values.
#' @param na_rm (`flag`)\cr whether `NA` levels should be removed from the table.
#' @param pref_var (`character`)\cr preferred term variable from `adae` to include in the table.
#' @param prune_0 (`flag`)\cr whether all-zero rows should be removed from the table.
#' @param risk_diff (named `list`)\cr list of settings to apply to add a risk difference column to the table.
#'   Defaults to `NULL` (no risk difference column added). See [tern::add_riskdiff()] for more details. List should
#'   contain the following elements:
#'    * `arm_x`: (required) the name of reference arm.
#'    * `arm_y`: (required) the name of the arm to compare to the reference arm.
#'    * `col_label`: (optional) label to use for the risk difference column. Defaults to
#'      `"Risk Difference (%) (95% CI)"`.
#'    * `pct`: (optional) whether the output should be returned as percentages. Defaults to `TRUE`.
#' @param saffl_var (`character`)\cr flag variable used to indicate inclusion in safety population.
#' @param show_colcounts (`flag`)\cr whether column counts should be printed.
#' @param vars (`vector` of `character`)\cr variables from `df` to include in the table.
#'
#' @name argument_convention
#' @keywords internal
NULL
