test_that("make_table_03() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  library(dplyr)

  set.seed(1)
  scrnfail_reas_lvls <- c(
    "Inclusion/exclusion criteria not met", "Subject noncompliance", "Consent withdrawn", "Other"
  )
  adsl <- pharmaverseadam::adsl |>
    mutate(
      ENRLDT = RANDDT,
      SCRNFL = "Y",
      SCRNFRS = NA_character_,
      SCRNFAILFL = ifelse(is.na(ENRLDT), "Y", "N")
    ) |>
    mutate(
      SCRNFRS = factor(
        replace(
          SCRNFRS,
          TRT01A == "Screen Failure",
          sample(scrnfail_reas_lvls, size = sum(TRT01A == "Screen Failure"), replace = TRUE)
        ),
        levels = scrnfail_reas_lvls
      )
    )

  result <- make_table_03(
    df = adsl,
    arm_var = "TRT01A",
    id_var = "USUBJID",
    scrnfl_var = "SCRNFL",
    scrnfailfl_var = "SCRNFAILFL",
    scrnfail_var = "SCRNFRS"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$tbl_summary)[1:25, ])
})
