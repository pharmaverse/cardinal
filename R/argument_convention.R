#' Standard Arguments
#'
#' This documentation lists all the arguments in `falcon` that are used repeatedly by functions to output tables.
#'
#' @param adae (`data.frame`)\cr data (typically ADAE) required to build table.
#' @param adex (`data.frame`)\cr data (typically ADEX) required to build table.
#' @param advs (`data.frame`)\cr data (typically ADVS) required to build table.
#' @param df (`data.frame`)\cr data required to build table.
#' @param alt_counts_df (`character`) alternative (full) dataset (typically ADSL) used only to calculate column counts.
#' @param show_colcounts (`flag`)\cr whether column counts should be printed.
#' @param arm_var (`character`)\cr arm variable used to split table into columns.
#' @param id_var (`character`)\cr variable used as unique subject identifier.
#' @param lbl_overall (`character`)\cr if specified, an overall column will be added to the table with
#'   the given value as the column label.
#' @param vars (`vector` of `character`)\cr variables from `df` to include in the table.
#' @param lbl_vars (`vector` of `character`)\cr labels corresponding to variables in `vars` to print
#'   in the table. Labels should be ordered according to the order of variables in `vars`.
#' @param pref_var (`character`)\cr preferred term variable from `adae` to include in the table.
#' @param lbl_pref_var (`character`)\cr label corresponding to preferred term variable `pref_var` to print in the table.
#' @param .stats (`character`)\cr statistics to include in the table. Includes statistics for all variable
#'   types (only the statistics that are valid for a given variable's type will be printed).
#'   See [`tern::summarize_vars()`] for options.
#' @param .formats (named `list` of `character`)\cr list of formats corresponding to each value in `.stats`.
#'   Each name is a value in `.stats` and the corresponding value is the format that should be applied to
#'   that statistic. See [`formatters::list_valid_format_labels()`] for a list of valid formats.
#' @param na_rm (`flag`)\cr whether `NA` levels should be removed from the table.
#' @param prune_0 (`flag`)\cr whether all-zero rows should be removed from the table.
#' @param annotations (named `list` of `character`)\cr list of annotations to add to the table. Valid
#'   annotations types are `title`, `subtitles`, `main_footer`, and `prov_footer`. Each name-value pair should
#'   use the annotation type as name and the desired string as value.
#' @param na_level (`character`)\cr string to represent missing values.
#'
#' @name argument_convention
#' @keywords internal
NULL
