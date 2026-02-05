test_that("fda-table_43() works", {

    library(dplyr)
  library(cards)
  library(gtsummary)

  adae <- pharmaverseadam::adae
  adsl <- pharmaverseadam::adsl

  set.seed(1)
  adae <- adae |>
    mutate(
      AESER = sample(c("Y", "N"), size = nrow(adae), replace = TRUE),
      OCMQ01NAM = sample(c("OCMQ1", "OCMQ2", "OCMQ3"), size = nrow(adae), replace = TRUE),
      OCMQ01SC = sample(c("BROAD", "NARROW"), size = nrow(adae), replace = TRUE)
    )

  # Pre-processing --------------------------------------------
  adsl <- adsl |>
    filter(SAFFL == "Y") # safety population

  data <- adae |>
    filter(
      # safety population
      SAFFL == "Y",
      # treatment-emergent
      TRTEMFL == "Y",
      # broad OCMQ scope
      OCMQ01SC == "BROAD",
      # filtering here to reduce the size of the table
      AESOC %in% c("EYE DISORDERS", "EAR AND LABYRINTH DISORDERS", "CONGENITAL, FAMILIAL AND GENETIC DISORDERS")
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
      include = c(OCMQ01NAM, AEDECOD),
      # Add custom variable labels
      label = list(
        AEBODSYS = "Organ System",
        OCMQ01NAM = "OCMQ (Broad)",
        AEDECOD = "Preferred Term"
      )
    )


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_ard_hierarchical)[1:25, ])
})
