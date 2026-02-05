test_that("fda-table_29() works", {

  library(dplyr)
  library(cards)
  library(gtsummary)

  adae <- pharmaverseadam::adae
  adsl <- pharmaverseadam::adsl

  set.seed(1)
  adae <- adae |>
    rename(OCMQ01SC = AEHLTCD) |>
    mutate(
      AESER = sample(c("Y", "N"), size = nrow(adae), replace = TRUE),
      OCMQ01NAM = sample(c("OCMQ1", "OCMQ2", "OCMQ3"), size = nrow(adae), replace = TRUE)
    ) |>
    # truncating table for demonstration
    filter(AESOC == "VASCULAR DISORDERS")
  adae$OCMQ01SC[is.na(adae$OCMQ01SC)] <- "NARROW"

  # Pre-processing --------------------------------------------
  adsl <- adsl |>
    # safety population
    filter(
      SAFFL == "Y"
    )

  data <- adae |>
    filter(
      # safety population
      SAFFL == "Y",
      # serious AEs
      AESER == "Y",
      # treatment-emergent
      TRTEMFL == "Y",
      # narrow OCMQ scope
      OCMQ01SC == "NARROW"
    )

  ard <- ard_stack_hierarchical(
    data,
    variables = c(AEBODSYS, OCMQ01NAM, AEDECOD),
    by = TRT01A,
    id = USUBJID,
    denominator = adsl,
    # variables to include AE rates for
    include = c(OCMQ01NAM, AEDECOD)
  )

  # create table using ARD-first approach (ARD -> table)
  tbl <-
    tbl_ard_hierarchical(
      ard,
      variables = c(AEBODSYS, OCMQ01NAM, AEDECOD),
      by = TRT01A,
      # variables to display AE rates for
      include = c(OCMQ01NAM, AEDECOD)
    ) |>
    # add custom variable label
    modify_header(label = "**Organ System**")


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_ard_hierarchical)[1:25, ])
})
