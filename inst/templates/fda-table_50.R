# FDA TABLE 50 ---------------------------------------------------------------
# Self-contained template. Run top-to-bottom to build the objects below.
# Used by tests via run_template() and published in the catalog.

library(dplyr)
library(cards)
library(gtsummary)

adae <- pharmaverseadam::adae
adsl <- pharmaverseadam::adsl

# This specific dataset is reduced significantly after filtering.
# We'll take a few steps to ensure factor levels are present and
# match between the AE data and the denominators.

adsl <- adsl |>
  filter(SAFFL == "Y") |>
  mutate(TRT01A = as.factor(TRT01A))

adae <- adae |> mutate(
  TRT01A = as.factor(TRT01A),
  SEXGR = "Sex, n (%)",
  SEXGR1 = as.factor(SEX),
  AGEGR = "Age group, years, n(%)",
  RACEGR = "Race, n(%)",
  ETHNICGR = "Ethnicity, n(%)",
  ETHNICGR1 = as.factor(RACE)
)

data <- adae |>
  filter(
    SAFFL == "Y",
    TRTEMFL == "Y",
    AESER == "Y"
  )


data_any_sae <- adae |>
  filter(AESER == "Y") |>
  mutate(
    AESER = "Any SAE, n(%)"
  )

tbl_any_sae <- tbl_hierarchical(
  data = data_any_sae,
  denominator = adsl,
  id = "USUBJID",
  by = "TRT01A",
  variables = "AESER",
  statistic = ~"{n} ({p}%)",
  label = AESER ~ "Characteristic"
)

tbl_sex <- tbl_hierarchical(
  data = data,
  denominator = data_any_sae |> slice_head(by = c(USUBJID)),
  id = "USUBJID",
  by = "TRT01A",
  variables = c(SEXGR, SEXGR1),
  include = SEXGR1,
  statistic = ~"{n}/{N} ({p}%)"
)

tbl_agegr1 <- tbl_hierarchical(
  data = data,
  denominator = data_any_sae |> slice_head(by = c(USUBJID)),
  id = "USUBJID",
  by = "TRT01A",
  variables = c(AGEGR, AGEGR1),
  include = AGEGR1,
  statistic = ~"{n}/{N} ({p}%)"
)

tbl_race <- tbl_hierarchical(
  data = data,
  denominator = data_any_sae |> slice_head(by = c(USUBJID)),
  id = "USUBJID",
  by = "TRT01A",
  variables = c(RACEGR, RACEGR1),
  include = RACEGR1,
  statistic = ~"{n}/{N} ({p}%)"
)

tbl_ethnic <- tbl_hierarchical(
  data = data,
  denominator = data_any_sae |> slice_head(by = c(USUBJID)),
  id = "USUBJID",
  by = "TRT01A",
  variables = c(ETHNICGR, ETHNICGR1),
  include = ETHNICGR1,
  statistic = ~"{n}/{N} ({p}%)"
)

tbl <- list(tbl_any_sae, tbl_sex, tbl_agegr1, tbl_race, tbl_ethnic) |>
  tbl_stack() |>
  modify_indent(
    "label",
    rows = !(variable %in% c("..ard_hierarchical_overall..", "AESER", "SEXGR", "AGEGR", "RACEGR", "ETHNICGR"))
  ) |>
  remove_footnote_header(columns = everything()) |>
  modify_post_fmt_fun(
    fmt_fun = ~ ifelse(. == "0/0 (NA%)", "0 (0%)", .),
    columns = all_stat_cols()
  )


ard <- gtsummary::gather_ard(tbl)
