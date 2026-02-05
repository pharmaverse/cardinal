test_that("fda-table_12() works", {

  library(dplyr)
  library(cards)
  library(gtsummary)

  adsl <- random.cdisc.data::cadsl
  adae <- random.cdisc.data::cadae
  adae$DCSREAS[is.na(adae$DCSREAS)] <- "ADVERSE EVENT"

  # Pre-processing --------------------------------------------
  adsl <- adsl |>
    filter(SAFFL == "Y") # safety population

  data <- adae |>
    filter(
      # safety population
      SAFFL == "Y",
      # discontinuation due to AE
      DCSREAS == "ADVERSE EVENT"
    )

  ard <- ard_stack_hierarchical(
    data,
    variables = c(AEBODSYS, AEDECOD),
    by = TRT01A,
    denominator = adsl,
    id = USUBJID
  )

  tbl <- tbl_hierarchical(
    data,
    variables = c(AEBODSYS, AEDECOD),
    by = TRT01A,
    id = USUBJID,
    denominator = adsl,
    overall_row = TRUE,
    label = list(..ard_hierarchical_overall.. = "Subjects with at least one AE leading to treatment discontinuation")
  )

  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
