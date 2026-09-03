# FDA TABLE 02 ---------------------------------------------------------------
# Self-contained template. Run top-to-bottom to build the objects below.
# Used by tests via run_template() and published in the catalog.

library(cardinalfda)
library(dplyr)

adsl <- pharmaverseadam::adsl |>
  # removing screen failure observations
  filter(TRT01A != "Screen Failure")

tbl <- adsl |>
  dplyr::filter(SAFFL == "Y") |>
  gtsummary::tbl_summary(
    by = dplyr::all_of("TRT01A"),
    include = dplyr::all_of(c("SEX", "AGE", "AGEGR1", "ETHNIC", "RACE")),
    type = gtsummary::all_continuous() ~ "continuous2",
    statistic = list(
      gtsummary::all_continuous() ~ c(
        "{mean} ({sd})",
        "{median} ({min}, {max})"
      ),
      gtsummary::all_categorical() ~ "{n} ({p}%)"
    ),
    label = list(AGEGR1 = "Age Group, Years")
  ) |>
  gtsummary::add_overall(last = TRUE, col_label = "**Total Population**  \nN = {N}") |>
  gtsummary::remove_footnote_header(columns = dplyr::everything())

ard <- gtsummary::gather_ard(tbl)
