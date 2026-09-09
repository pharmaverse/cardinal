# FDA TABLE 46 ---------------------------------------------------------------
# Self-contained template. Run top-to-bottom to build the objects below.
# Used by tests via run_template() and published in the catalog.

library(dplyr)
library(cards)
library(gtsummary)
library(crane)

adsl <- pharmaverseadam::adsl
adae <- pharmaverseadam::adae

# Pre-processing --------------------------------------------
adsl <- adsl |>
  filter(SAFFL == "Y") # safety population

data <- adae |>
  filter(
    SAFFL == "Y", # safety population
    TRTEMFL == "Y" # treatment-emergent
  )

# build the AE rate-and-count table by system organ class and preferred term
tbl <- data |>
  tbl_hierarchical_rate_and_count(
    denominator = adsl,
    by = TRT01A,
    variables = c(AEBODSYS, AEDECOD),
    label = AEDECOD ~ "MedDRA Preferred Term"
  ) |>
  add_overall(last = TRUE)


ard <- gtsummary::gather_ard(tbl)
