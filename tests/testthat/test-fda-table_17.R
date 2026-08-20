test_that("fda-table_17() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("forcats")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_17")
  ard <- env$ard

  expect_snapshot(as.data.frame(ard$`OCMQ01SC="BROAD"`$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard$`OCMQ01SC="NARROW"`$tbl_hierarchical)[1:25, ])
})

