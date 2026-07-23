if (requireNamespace("testthat", quietly = TRUE)) {
  library(testthat)
  options(warn = 2) # Warnings become errors
  pkg_name <- "cardinalfda"
  library(pkg_name, character.only = TRUE)
  testthat::test_check(pkg_name)
}
