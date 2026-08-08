test_that("make_table_51() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  library(dplyr)

  adsl <- pharmaverseadam::adsl |>
    filter(SAFFL == "Y")

  data <- pharmaverseadam::adae |>
    filter(SAFFL == "Y", TRTEMFL == "Y") |>
    dplyr::slice_tail(n = 1L, by = all_of(c("USUBJID", "ARM")))

  result <- make_table_51(
    df = data,
    denominator = adsl,
    id_var = "USUBJID",
    arm_var = "ARM",
    sex_var = "SEX",
    age_var = "AGEGR1",
    race_var = "RACE",
    ethnic_var = "ETHNIC"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$tbl_ard_summary)[1:25, ])
})
