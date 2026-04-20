test_that("fda-table_15() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  library(dplyr)
  library(cards)
  library(gtsummary)

  adsl <- pharmaverseadam::adsl
  adae <- pharmaverseadam::adae

  # Pre-processing --------------------------------------------
  adsl <- adsl |>
    filter(SAFFL == "Y") # safety population

  data <- adae |>
    filter(
      # safety population
      SAFFL == "Y"
    )

  tbl <-
    tbl_hierarchical(
      data,
      variables = c(AEDECOD),
      by = TRT01A,
      id = USUBJID,
      denominator = adsl,
      label = AEDECOD ~ "**Preferred Term**"
    ) |>
    # filter for >=5% frequency
    filter_hierarchical(sum(n) / sum(N) >= 0.05)


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
