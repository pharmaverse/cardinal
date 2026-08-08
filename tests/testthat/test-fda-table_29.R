test_that("make_table_29() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  library(dplyr)

  set.seed(1)
  adsl <- pharmaverseadam::adsl |>
    filter(SAFFL == "Y")

  adae <- pharmaverseadam::adae |>
    rename(OCMQ01SC = AEHLTCD) |>
    mutate(
      AESER = sample(c("Y", "N"), size = n(), replace = TRUE),
      OCMQ01NAM = sample(c("OCMQ1", "OCMQ2", "OCMQ3"), size = n(), replace = TRUE)
    ) |>
    filter(AESOC == "VASCULAR DISORDERS")
  adae$OCMQ01SC[is.na(adae$OCMQ01SC)] <- "NARROW"

  result <- make_table_29(
    df = adae,
    denominator = adsl,
    arm_var = "TRT01A",
    id_var = "USUBJID",
    saffl_var = "SAFFL",
    ser_var = "AESER",
    trtemfl_var = "TRTEMFL",
    soc_var = "AEBODSYS",
    ocmqsc_var = "OCMQ01SC",
    ocmqnam_var = "OCMQ01NAM",
    pref_var = "AEDECOD",
    ocmq_scope = "NARROW"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$tbl_ard_hierarchical)[1:25, ])
})
