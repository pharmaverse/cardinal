test_that("make_table_12() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("random.cdisc.data")

  library(dplyr)

  adsl <- random.cdisc.data::cadsl
  adae <- random.cdisc.data::cadae
  adae$DCSREAS[is.na(adae$DCSREAS)] <- "ADVERSE EVENT"

  result <- make_table_12(
    df = adae,
    denominator = adsl,
    arm_var = "ARM",
    id_var = "USUBJID",
    saffl_var = "SAFFL",
    pref_var = "AEDECOD"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
