test_that("make_table_11() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("random.cdisc.data")

  library(dplyr)

  set.seed(1)
  adsl <- random.cdisc.data::cadsl
  adae <- random.cdisc.data::cadae |>
    rename(FMQ01SC = SMQ01SC) |>
    mutate(
      FMQ01NAM = sample(c("FMQ1", "FMQ2", "FMQ3"), size = n(), replace = TRUE)
    )
  adae$DCSREAS[is.na(adae$DCSREAS)] <- "ADVERSE EVENT"
  adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"

  result <- make_table_11(
    df = adae,
    denominator = adsl,
    arm_var = "ARM",
    id_var = "USUBJID",
    saffl_var = "SAFFL",
    fmqsc_var = "FMQ01SC",
    fmqnam_var = "FMQ01NAM"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
