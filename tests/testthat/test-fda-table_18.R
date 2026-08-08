test_that("make_table_18() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("random.cdisc.data")

  library(dplyr)

  set.seed(1)
  adsl <- random.cdisc.data::cadsl
  adae <- random.cdisc.data::cadae |>
    rename(FMQ01SC = SMQ01SC, FMQ01NAM = SMQ01NAM)
  levels(adae$FMQ01SC) <- c("BROAD", "NARROW")
  adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
  adae$FMQ01NAM <- factor(
    adae$FMQ01NAM,
    levels = c(
      unique(adae$FMQ01NAM),
      "Abnormal Uterine Bleeding", "Amenorrhea",
      "Bacterial Vaginosis", "Decreased Menstrual Bleeding"
    )
  )
  adae$FMQ01NAM[adae$SEX == "F"] <- as.factor(
    sample(
      c("Abnormal Uterine Bleeding", "Amenorrhea", "Bacterial Vaginosis", "Decreased Menstrual Bleeding"),
      sum(adae$SEX == "F"),
      replace = TRUE
    )
  )

  result <- make_table_18(
    df = adae,
    denominator = adsl,
    arm_var = "ARM",
    id_var = "USUBJID",
    saffl_var = "SAFFL",
    fmqsc_var = "FMQ01SC",
    fmqnam_var = "FMQ01NAM",
    pref_var = "AEDECOD",
    sex_scope = "F",
    fmq_scope = "BROAD"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
