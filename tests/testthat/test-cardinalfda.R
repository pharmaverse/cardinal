test_that("ignore_unused_imports() references the Depends packages", {
  # This helper only exists so R CMD check does not flag the packages that the
  # inst/templates scripts attach with library(). Calling it keeps that
  # contract covered and confirms the referenced symbols still resolve.
  skip_if_not_installed("cards")
  skip_if_not_installed("cardx")
  skip_if_not_installed("crane")
  skip_if_not_installed("dplyr")
  skip_if_not_installed("gtsummary")

  expect_no_error(ignore_unused_imports())
})
