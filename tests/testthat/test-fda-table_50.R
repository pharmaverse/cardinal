test_that("make_table_50() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  library(dplyr)

  adsl <- pharmaverseadam::adsl |>
    filter(SAFFL == "Y") |>
    mutate(TRT01A = as.factor(TRT01A))

  adae <- pharmaverseadam::adae |>
    mutate(TRT01A = as.factor(TRT01A))

  result <- make_table_50(
    df = adae,
    denominator = adsl,
    id_var = "USUBJID",
    arm_var = "TRT01A",
    saffl_var = "SAFFL",
    trtemfl_var = "TRTEMFL",
    ser_var = "AESER",
    sex_var = "SEX",
    age_var = "AGEGR1",
    race_var = "RACE",
    ethnic_var = "ETHNIC"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard[[1]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[2]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[3]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[4]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[5]]$tbl_hierarchical)[1:25, ])
})
