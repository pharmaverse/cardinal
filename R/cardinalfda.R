#' cardinalfda
#'
#' Implementation of FDA Safety Tables and Figures
#'
#' @keywords internal
#' @importFrom cards ard_continuous
#' @importFrom cardx ard_continuous_ci
#' @importFrom crane tbl_demographics
#' @importFrom dplyr .data
#' @importFrom gtsummary tbl_summary
"_PACKAGE"

ignore_unused_imports <- function() {
  cards::ard_continuous
  cardx::ard_continuous_ci
  dplyr::.data
  crane::tbl_demographics
  gtsummary::tbl_summary
}
