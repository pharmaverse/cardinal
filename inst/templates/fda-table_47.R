# FDA TABLE 47 ---------------------------------------------------------------
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
  ) |>
  # Make the organ class a factor carrying a level with no events. When a study
  # expects a category that no subject experiences, making it an explicit factor
  # level keeps the row in the table (rendered as zero) so the shell stays stable
  # across studies rather than silently dropping the category.
  mutate(
    AEBODSYS = factor(
      AEBODSYS,
      levels = c(sort(unique(AEBODSYS)), "SOC WITH NO EVENTS")
    )
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
