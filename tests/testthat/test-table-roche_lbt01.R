test_that("make_table_roche_lbt01() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")
  skip_if_not_installed("crane")

  library(dplyr)

  adsl <- pharmaverseadam::adsl |>
    filter(TRT01A != "Screen Failure")

  adlb <- pharmaverseadam::adlb

  result <- make_table_roche_lbt01(
    df = adlb,
    denominator = adsl,
    arm_var = "TRT01A",
    saffl_var = "SAFFL",
    paramcd_filter = c("ALT", "BILI", "CREAT"),
    visits = c("Baseline", "Week 4"),
    baseline_level = "Baseline"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$`PARAM="Alanine Aminotransferase (U/L)"`$tbl_baseline_chg)[1:25, ])
  expect_snapshot(as.data.frame(ard$`PARAM="Bilirubin (umol/L)"`$tbl_baseline_chg)[1:25, ])
  expect_snapshot(as.data.frame(ard$`PARAM="Creatinine (umol/L)"`$tbl_baseline_chg)[1:25, ])
})
