test_that("make_table_13() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  library(dplyr)

  adsl <- pharmaverseadam::adsl |>
    filter(TRT01A != "Screen Failure")
  adae <- pharmaverseadam::adae

  result <- make_table_13(
    df = adae,
    denominator = adsl,
    arm_var = "TRT01A",
    id_var = "USUBJID",
    saffl_var = "SAFFL",
    pref_var = "AEDECOD",
    min_freq = 0.05
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
