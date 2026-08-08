test_that("make_table_04() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  library(dplyr)

  adsl <- pharmaverseadam::adsl |>
    filter(TRT01A != "Screen Failure") |>
    mutate(DCSREAS = NA_character_, EOTSTT = EOSSTT)

  result <- make_table_04(
    df = adsl,
    arm_var = "TRT01A",
    id_var = "USUBJID",
    saffl_var = "SAFFL"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$tbl_summary)[1:25, ])
  expect_snapshot(as.data.frame(ard$add_overall)[1:25, ])
})
