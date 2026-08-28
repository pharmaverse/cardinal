test_that("fda-table_50() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_50")
  ard <- env$ard

  expect_snapshot(as.data.frame(ard[[1]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[2]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[3]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[4]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[5]]$tbl_hierarchical)[1:25, ])
})
