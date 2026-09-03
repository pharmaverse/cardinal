test_that("fda-table_02() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_02")
  ard <- env$ard

  expect_snapshot(as.data.frame(ard$tbl_summary)[1:25, ])
  expect_snapshot(as.data.frame(ard$add_overall)[1:25, ])
})
