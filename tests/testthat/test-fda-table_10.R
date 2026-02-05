test_that("fda-table_10() works", {
  library(dplyr)
  library(gtsummary)

  adsl <- pharmaverseadam::adsl
  adae <- pharmaverseadam::adae

  # Pre-processing --------------------------------------------
  adae <- adae |>
    filter(
      # safety population
      SAFFL == "Y",
      # serious adverse events
      AESER == "Y"
    )

  tbl <- adae |>
    tbl_hierarchical(
      variables = c(AESOC, AEDECOD),
      by = TRT01A,
      id = USUBJID,
      denominator = adsl,
      overall_row = TRUE,
      label = "..ard_hierarchical_overall.." ~ "Any SAE"
    )


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard)[1:25, ])
})
