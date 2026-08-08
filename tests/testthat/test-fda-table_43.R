test_that("make_table_43() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  library(dplyr)

  set.seed(1)
  adsl <- pharmaverseadam::adsl |> filter(SAFFL == "Y")

  adae <- pharmaverseadam::adae |>
    mutate(
      AESER = sample(c("Y", "N"), size = n(), replace = TRUE),
      OCMQ01NAM = sample(c("OCMQ1", "OCMQ2", "OCMQ3"), size = n(), replace = TRUE),
      OCMQ01SC = sample(c("BROAD", "NARROW"), size = n(), replace = TRUE)
    ) |>
    filter(AESOC %in% c(
      "EYE DISORDERS", "EAR AND LABYRINTH DISORDERS", "CONGENITAL, FAMILIAL AND GENETIC DISORDERS"
    ))

  result <- make_table_43(
    df = adae,
    denominator = adsl,
    arm_var = "TRT01A",
    id_var = "USUBJID",
    saffl_var = "SAFFL",
    trtemfl_var = "TRTEMFL",
    soc_var = "AEBODSYS",
    ocmqsc_var = "OCMQ01SC",
    ocmqnam_var = "OCMQ01NAM",
    pref_var = "AEDECOD",
    ocmq_scope = "BROAD"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$tbl_ard_hierarchical)[1:25, ])
})
