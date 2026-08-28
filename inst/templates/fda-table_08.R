# FDA TABLE 08 ---------------------------------------------------------------
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
    SAFFL == "Y",
    # deaths
    DTHFL == "Y"
  )

tbl_dthcaus <- data |>
  tbl_hierarchical(
    variables = DTHCAUS,
    id = USUBJID,
    by = TRT01A,
    denominator = adsl,
    overall_row = TRUE,
    label = list("..ard_hierarchical_overall.." = "Death details", DTHCAUS = "**Deaths**")
  ) |>
  sort_hierarchical() |>
  modify_indent(columns = label, rows = variable == "DTHCAUS", indent = 4L)

tbl_aesdth <- data |>
  filter(AESDTH == "Y") |>
  tbl_hierarchical(
    variables = AEDECOD,
    id = USUBJID,
    by = TRT01A,
    denominator = adsl,
    overall_row = TRUE,
    label = list("..ard_hierarchical_overall.." = "Adverse events with an outcome of death", AEDECOD = "**Deaths**")
  ) |>
  sort_hierarchical() |>
  modify_indent(columns = label, rows = variable == "AEDECOD", indent = 4L)

tbl <- tbl_stack(list(tbl_dthcaus, tbl_aesdth))


ard <- gtsummary::gather_ard(tbl)
