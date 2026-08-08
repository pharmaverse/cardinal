test_that("make_table_14() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("random.cdisc.data")

  library(dplyr)

  adae <- random.cdisc.data::cadae |>
    rename(FMQ01SC = SMQ01SC, FMQ01NAM = SMQ01NAM)
  levels(adae$FMQ01SC) <- c("BROAD", "NARROW")
  adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"

  result <- make_table_14(
    df = adae,
    arm_var = "ARM",
    id_var = "USUBJID",
    saffl_var = "SAFFL",
    fmqsc_var = "FMQ01SC",
    fmqnam_var = "FMQ01NAM"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
