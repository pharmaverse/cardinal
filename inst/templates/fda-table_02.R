# FDA TABLE 02 ---------------------------------------------------------------
# Self-contained template. Run top-to-bottom to build the objects below.
# Used by tests via run_template() and published in the catalog.

library(cardinalfda)
library(dplyr)

adsl <- pharmaverseadam::adsl |>
  # removing screen failure observations
  filter(TRT01A != "Screen Failure") |>
  # Adding a numeric biomarker (weight) — include in vars to show in table
  left_join(
    pharmaverseadam::advs |>
      filter(VSTESTCD == "WEIGHT", VISIT == "BASELINE") |>
      select(USUBJID, WEIGHTBL = AVAL),
    by = "USUBJID",
    relationship = "one-to-one"
  )

result <- make_table_02(
  df = adsl,
  label = list(AGEGR1 = "Age Group, Years")
)

tbl <- result$table

ard <- result$ard
