#' cardinalfda
#'
#' Implementation of FDA Safety Tables and Figures
#'
#' @keywords internal
#' @importFrom cards ard_continuous
#' @importFrom cardx ard_continuous_ci
#' @importFrom crane tbl_listing
#' @importFrom dplyr .data
#' @importFrom gtsummary tbl_summary
"_PACKAGE"

# The inst/templates scripts call these packages unqualified (e.g.
# library(gtsummary)), so they must stay in Depends. This shim references one
# symbol from each so R CMD check does not flag them as "in Depends but not
# imported".
ignore_unused_imports <- function() {
  cards::ard_continuous
  cardx::ard_continuous_ci
  crane::tbl_listing
  dplyr::.data
  gtsummary::tbl_summary
}
