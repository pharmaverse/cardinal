# FDA TABLE 03 ---------------------------------------------------------------
# Self-contained template. Run top-to-bottom to build the objects below.
# Used by tests via run_template() and published in the catalog.

library(dplyr)
library(cards)
library(gtsummary)

adsl <- pharmaverseadam::adsl

set.seed(1)
scrnfail_reas_lvls <- c(
  "Inclusion/exclusion criteria not met", "Subject noncompliance", "Consent withdrawn", "Other"
)
data <- adsl |>
  mutate(
    ENRLDT = RANDDT,
    ENRLFL = !is.na(ENRLDT),
    RANDFL = !is.na(RANDDT),
    SCRNFL = TRUE,
    SCRNFRS = NA_character_
  ) |>
  mutate( # set screen failure reasons for relevant observations.
    SCRNFRS = factor(
      replace(
        SCRNFRS,
        TRT01A == "Screen Failure",
        sample(scrnfail_reas_lvls, size = sum(TRT01A == "Screen Failure"), replace = TRUE)
      ),
      levels = scrnfail_reas_lvls
    )
  )

tbl_scrn <- tbl_summary(
  data = data,
  include = "SCRNFL",
  missing = "no",
  label = ~"Subjects screened"
)

tbl_scrnfrs <- tbl_hierarchical(
  data = data,
  denominator = adsl,
  id = USUBJID,
  variables = "SCRNFRS",
  label = list(..ard_hierarchical_overall.. = "Screening failures"),
  overall_row = TRUE
) |>
  modify_indent(columns = label, rows = row_type == "level", indent = 4L) |>
  modify_indent(columns = label, rows = variable == "SCRNFRS", indent = 8L)

tbl_enrl_rand <- tbl_summary(
  data = data,
  include = c("ENRLFL", "RANDFL"),
  missing = "no",
  label = list(ENRLFL = "Subjects enrolled", RANDFL = "Subjects randomized")
)

tbl <- list(tbl_scrn, tbl_scrnfrs, tbl_enrl_rand) |>
  tbl_stack() |>
  modify_header(label = "**Disposition**")


ard <- gtsummary::gather_ard(tbl)
