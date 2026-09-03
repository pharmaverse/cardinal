test_that("fda-table_09() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")
  skip_if_not_installed("crane")

  env <- run_template("fda-table_09")

  # a listing has no ARD; snapshot the underlying data
  expect_snapshot(as.data.frame(env$data))
})
