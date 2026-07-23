test_that("make_table_02() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  library(dplyr)

  adsl <- pharmaverseadam::adsl |>
    filter(TRT01A != "Screen Failure")

  result <- make_table_02(df = adsl)

  ard <- result$ard

  expect_snapshot(as.data.frame(ard$tbl_summary)[1:25, ])
  expect_snapshot(as.data.frame(ard$add_overall)[1:25, ])
})
