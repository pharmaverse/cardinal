test_that("make_table_07() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  library(dplyr)

  adsl <- pharmaverseadam::adsl |>
    filter(TRT01A != "Screen Failure")

  adae <- pharmaverseadam::adae
  # ensure some non-treatment-emergent deaths exist for the non-TREM section
  set.seed(1)
  dth_rows <- which(adae$DTHFL == "Y")
  adae$TRTEMFL[sample(dth_rows, min(3L, length(dth_rows)))] <- "N"

  result <- make_table_07(
    adae = adae,
    denominator = adsl,
    arm_var = "TRT01A",
    id_var = "USUBJID",
    saffl_var = "SAFFL"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard[[1]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[2]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[3]]$tbl_hierarchical)[1:25, ])
})
