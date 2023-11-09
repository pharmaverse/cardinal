#' falcon Package
#'
#' Implementation of FDA Safety Tables and Figures
#'
#' @keywords internal
"_PACKAGE"

#' @import dplyr gtsummary rtables tern tfrmt Tplyr
#' @importFrom rlang .data
#' @importFrom magrittr %>%
#' @importFrom stats median sd quantile
#' @importFrom tidyr pivot_longer separate_rows
#' @importFrom formatters with_label var_labels var_relabel
#' @importFrom rlistings as_listing
NULL

# Fix R CMD check warning for missing global definitions
utils::globalVariables(c(
  ".", "AEACN", "AESCONG", "AESDISAB", "AESDTH", "AESER", "AESHOSP", "AESIFL", "AESLIFE", "AESMIE", "AGE",
  "AGESEX", "AVAL", "AVALU", "AVISITN", "DOSAGE", "DOSDUR", "DTHADY", "DTHCAT", "DTHCAUS", "DTHFL", "DCSREAS",
  "MAX_DIABP", "MAX_SYSBP", "PARAMCD", "SEX", "TRTDUR", "TRTDUR_MONTHS", "TRTEDT", "ASER", "DCTREAS",
  "EOSSTT", "EOTSTT", "ITTFL", "PPROTFL", "RANDFL", "TRTEMFL", "TRTSDT", "USUBJID", "column", "median", "ord_layer_1",
  "ord_layer_2", "ord_layer_index", "param", "pct", "row_label1", "row_label2", "sd", "tbl_lbl", "value",
  "ENRLDT", "RANDDT", "G110", "G60", "G90", "GE120", "L60", "id_var"
))
