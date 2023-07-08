# library(falcon)
# library(formatters)
# library(rtables)
# library(rlistings)
# library(remotes)
# library(tern)
# library(testthat)

adsl_raw <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")

set.seed(4)
adsl <- adsl_raw %>%
  mutate(test = rbinom(400, 1, 0.5)) %>%
  mutate(
    RANDFL = ifelse(test == 0, "N", "Y"),
    PPROTFL = ifelse(test == 0, "N", "Y"),
    DCSREAS = if_else(DCSREAS %in% c(
      "ADVERSE EVENT", "LACK OF EFFICACY", "PROTOCOL VIOLATION",
      "DEATH", "WITHDRAWAL BY PARENT/GUARDIAN"
    ), DCSREAS, "OTHER")
  ) %>%
  mutate(DCTREAS = DCSREAS)


test_that("Table 04 generation works with default values", {
  local_edition(3)
  result <- make_table_04(adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 04 generation works with custom values", {
  local_edition(3)
  result <- make_table_04(
    adsl,
    annotations = list(
      title = "Patient Disposition, Pooled Analyses (1,2)",
      main_footer = c(
        "Source: [include Applicant source, datasets and/or software tools used].",
        "(1) Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled trial",
        "durations].",
        "(2) [Include route of administration for all treatment arms if different ROA were used in the drug development].",
        "(3) Difference is shown between [treatment arms] (e.g., difference is shown between Drug Name dosage X vs. placebo)."
      ),
      prov_footer = c(
        "Abbreviations: CI, confidence interval; ITT, intention-to-treat; mITT, modified intention-to-treat; N, number of patients in treatment arm; n, number of patients in specified population or group"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})
