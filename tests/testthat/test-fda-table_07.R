test_that("fda-table_07() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_07")
  ard <- env$ard

  expect_snapshot(as.data.frame(ard[[1]][[1]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[1]][[2]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[1]][[3]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[1]][[4]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[1]][[5]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[2]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[3]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[4]]$tbl_hierarchical))
})

