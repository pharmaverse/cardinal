adsl <- adsl_raw
adae <- adae_raw

test_that("Table 36 generation works with default values", {
  result <- make_table_36(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 36 generation works with custom values", {
  annotations <- list(
    title = "Table 36. Patients With Adverse Events by System Organ Class and Preferred Term, Safety
    Population, Pooled Analysis (or Trial X)",
    main_footer = c(
      "Source: [include Applicant source, datasets and/or software tools used].",
      "1 Duration = [e.g., X week double-blind treatment period or median and a range
      indicating pooled trial durations].",
      "2 Treatment-emergent adverse event defined as [definition]. MedDRA version X.",
      "3 Difference is shown between [treatment arms] (e.g., difference is shown
      between Drug Name dosage X vs. placebo).",
      "4 Table display is ordered by the risk difference."
    ),
    prov_footer = c(
      "Abbreviations: CI, confidence interval; MedDRA, Medical Dictionary for Regulatory Activities;",
      "N, number of patients in treatment arm; n, number of patients with at least one event;",
      "PT, preferred term; SOC, System Organ Class "
    )
  )

  result <- make_table_36(
    adae,
    adsl,
    lbl_overall = "Total",
    annotations = annotations
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 36 generation works with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_36(adae, adsl, risk_diff = risk_diff)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 36 generation works with some NA values", {
  set.seed(5)
  adae[sample(seq_len(nrow(adae)), 10), "AEBODSYS"] <- NA

  result <- make_table_36(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 36 generation works with custom values (SOC variable and label)", {
  result <- make_table_36(
    adae,
    adsl,
    lbl_overall = "Total",
    soc_var = "AEBODSYS",
    lbl_soc_var = "Label for AEBODSYS"
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})
