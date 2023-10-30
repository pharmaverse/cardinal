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
  result <- make_table_04(adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 04 generation works with custom values", {
  result <- make_table_04(
    adsl,
    pop_vars = c("RANDFL", "ITTFL", "SAFFL", "PPROTFL"),
    lbl_pop_vars = c("Patients randomized", "ITT/mITT population", "Safety population", "Per-protocol population"),
    annotations = list(
      title = "Patient Disposition, Pooled Analyses (1,2)",
      main_footer = c(
        "Source: [include Applicant source, datasets and/or software tools used].",
        "(1) Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled",
        "trial durations].",
        "(2) [Include route of administration for all treatment arms if different ROA were used in the drug",
        "development].",
        "(3) Difference is shown between [treatment arms] (e.g., difference is shown between Drug Name",
        "dosage X vs. placebo)."
      ),
      prov_footer = c(
        "Abbreviations: CI, confidence interval; ITT, intention-to-treat; mITT, modified intention-to-treat;",
        "N, number of patients in treatment arm; n, number of patients in specified population or group"
      )
    ),
    prune_0 = TRUE
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})
