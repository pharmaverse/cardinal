test_that("fda-table_10() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_10")
  ard <- env$ard

  expect_snapshot(as.data.frame(ard)[1:25, ])
})
