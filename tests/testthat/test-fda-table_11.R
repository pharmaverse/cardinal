test_that("fda-table_11() works", {

  library(dplyr)
  library(cards)
  library(gtsummary)

  adsl <- pharmaverseadam::adsl
  adae <- pharmaverseadam::adae

  # Pre-Processing - OCMQ information
  set.seed(1)
  adae <- adae |>
    mutate(
      OCMQ01SC = sample(c("NARROW", "BROAD"), size = nrow(adae), replace = TRUE),
      OCMQ01NAM = sample(c("OCMQ1", "OCMQ2", "OCMQ3"), size = nrow(adae), replace = TRUE),
      AE_serious = sample(c("Y", "N"), size = nrow(adae), replace = TRUE)
    )
  # Use safety population, Serious Adverse Event only and Narrow OCMQ
  data <- adae |>
    filter(SAFFL == "Y", AE_serious == "Y", OCMQ01SC == "NARROW")

  sliced_data <- data |>
    count(AEBODSYS, sort = TRUE) |>
    slice_head(n = 3) %>% # keep top 3 for display purposes
    pull(AEBODSYS)

  data <- data |>
    filter(AEBODSYS %in% sliced_data)

  # Stack ARD results of two analyses
  ard <- ard_stack_hierarchical(
    data,
    variables = c(AEBODSYS, OCMQ01NAM),
    by = TRT01A,
    denominator = adsl,
    id = USUBJID
  )

  tbl <- data |>
    tbl_hierarchical(
      variables = c(AEBODSYS, OCMQ01NAM),
      by = TRT01A,
      id = USUBJID,
      include = OCMQ01NAM,
      denominator = adsl,
      overall_row = FALSE,
      label = list(
        AEBODSYS = "**Organ System**",
        OCMQ01NAM = "**OCMQ (Narrow)**"
      )
    )


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
