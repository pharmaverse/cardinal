#' falcon Package
#'
#' Implementation of FDA Safety Tables and Figures
#'
#' @keywords internal
"_PACKAGE"

#' @import dplyr rtables tern Tplyr
#' @importFrom rlang .data
#' @importFrom magrittr %>%
#' @importFrom formatters with_label var_labels var_relabel
#' @importFrom rlistings as_listing
#' @importFrom tfrmt tfrmt body_plan frmt frmt_structure frmt_combine frmt_when col_plan print_to_gt
NULL

# Fix R CMD check warning for missing global definitions
utils::globalVariables(c(
  "AEACN", "AESCONG", "AESDISAB", "AESDTH", "AESER", "AESHOSP", "AESIFL", "AESLIFE", "AESMIE", "AGE",
  "AGESEX", "AVAL", "AVALU", "AVISITN", "DOSAGE", "DOSDUR", "DTHADY", "DTHCAT", "DTHCAUS", "DTHFL",
  "MAX_DIABP", "MAX_SYSBP", "PARAMCD", "SAFFL", "SEX", "TRTDUR", "TRTDUR_MONTHS", "TRTEDT",
  "TRTEMFL", "TRTSDT", "USUBJID"
))
