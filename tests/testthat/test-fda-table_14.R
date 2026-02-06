test_that("fda-table_14() works", {
  library(dplyr)
  library(cards)
  library(gtsummary)

  adsl <- pharmaverseadam::adsl
  adae <- pharmaverseadam::adae

  # Pre-processing --------------------------------------------
  adsl <- adsl |>
    filter(SAFFL == "Y") # safety population

  # for display purpose showing only bottom 5 SOCs
  sliced_data <- adae |>
    count(AESOC) |>
    slice_min(order_by = n, n = 5) |>
    pull(AESOC)

  data <- adae |>
    filter(AESOC %in% sliced_data)

  ard <- ard_stack_hierarchical(
    data,
    variables = c(AESOC, AEDECOD),
    by = TRT01A,
    id = USUBJID,
    denominator = adsl
  )

  # create table using ARD-first approach (ARD -> table)
  tbl <-
    tbl_ard_hierarchical(
      ard,
      variables = c(AESOC, AEDECOD),
      by = TRT01A,
      # add custom variable labels
      label = list(
        AESOC = "System Organ Class",
        AEDECOD = "Preferred Term"
      )
    )


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_ard_hierarchical)[1:25, ])
})
