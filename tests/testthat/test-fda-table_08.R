test_that("make_table_08() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("random.cdisc.data")

  library(dplyr)

  adae <- random.cdisc.data::cadae
  adex <- random.cdisc.data::cadex

  result <- make_table_08(
    adae = adae,
    adex = adex,
    arm_var = "ARM",
    id_var = "USUBJID",
    saffl_var = "SAFFL",
    dth_vars = c("DTHCAUS")
  )

  expect_snapshot(as.data.frame(result)[1:20, ])
})
