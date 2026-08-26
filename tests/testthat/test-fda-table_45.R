test_that("fda-table_45() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")
  skip_if_not_installed("forcats")

  env <- run_template("fda-table_45")
  ard <- env$ard

  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
