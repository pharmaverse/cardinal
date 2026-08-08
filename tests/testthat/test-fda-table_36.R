test_that("make_table_36() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  library(dplyr)

  adsl <- pharmaverseadam::adsl |> filter(SAFFL == "Y")
  advs <- pharmaverseadam::advs

  result <- make_table_36(
    df = advs,
    denominator = adsl,
    arm_var = "TRT01A",
    id_var = "USUBJID",
    saffl_var = "SAFFL",
    paramcd = "SYSBP",
    avisitn_min = 2
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$tbl_ard_summary)[1:25, ])
})
