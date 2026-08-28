# FDA TABLE 15 ---------------------------------------------------------------
# Self-contained template. Run top-to-bottom to build the objects below.
# Used by tests via run_template() and published in the catalog.

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
