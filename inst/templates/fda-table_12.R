# FDA TABLE 12 ---------------------------------------------------------------
# Self-contained template. Run top-to-bottom to build the objects below.
# Used by tests via run_template() and published in the catalog.

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
