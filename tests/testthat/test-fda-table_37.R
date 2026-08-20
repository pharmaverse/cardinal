test_that("fda-table_37() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_37")
  ard <- env$ard

  expect_snapshot(as.data.frame(ard$tbl_ard_summary)[1:25, ])
})

