test_that("fda-table_13() works", {
  library(dplyr)
  library(cards)
  library(gtsummary)

  set.seed(1)
  adsl <- pharmaverseadam::adsl
  adae <- pharmaverseadam::adae

  adae <- adae |>
    rename(OCMQ01SC = AEHLTCD) |>
    mutate(
      AESER = sample(c("Y", "N"), size = nrow(adae), replace = TRUE),
      OCMQ01NAM = sample(c("OCMQ1", "OCMQ2", "OCMQ3"), size = nrow(adae), replace = TRUE)
    )

  adae$OCMQ01SC[is.na(adae$OCMQ01SC)] <- "NARROW"

  # Pre-processing --------------------------------------------
  adsl <- adsl |>
    filter(SAFFL == "Y") # safety population

  data <- adae |>
    filter(
      # safety population
      SAFFL == "Y",
      # narrow OCMQ
      OCMQ01SC == "NARROW"
    )

  sliced_data <- data |>
    count(AEBODSYS, sort = TRUE) |>
    slice_head(n = 3) |> # keep top 3
    pull(AEBODSYS)

  data <- data |>
    filter(AEBODSYS %in% sliced_data)

  tbl <-
    tbl_hierarchical(
      data,
      variables = c(AEBODSYS, OCMQ01NAM),
      by = TRT01A,
      id = USUBJID,
      denominator = adsl,
      label = list(AEBODSYS = "Organ System", OCMQ01NAM = "OCMQ (Narrow)")
    )

  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
