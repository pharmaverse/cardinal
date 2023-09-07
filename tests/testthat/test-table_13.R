adsl <- adsl_raw
adae <- adae_raw

test_that("Table 13 generation works with default values", {
  result <- make_table_13(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 13 generation works with custom values", {
  adae <- adae %>% var_relabel(AETERM = "Preferred Term(3)")
  result <- make_table_13(
    adae,
    adsl,
    lbl_overall = "Total",
    min_freq = 0.40,
    annotations = list(
      title = paste0(
        "Table 13. Patients With Common Adverse Events(1) Occurring at >=", 0.40 * 100,
        "% Frequency, Safety Population, Pooled Analyses(2)"
      ),
      main_footer = c(
        "Source: [include Applicant source, datasets and/or software tools used].",
        "(1) Treatment-emergent adverse event defined as [definition]. MedDRA version X.",
        "(2) Duration = [e.g., X week double-blind treatment period or median and a range indicating",
        "pooled trial durations].",
        "(3) Coded as MedDRA preferred terms."
      ),
      prov_footer = c(
        "Abbreviations: CI, confidence interval; MedDRA, Medical Dictionary for Regulatory Activities;",
        "N, number of patients in treatment arm; n, number of patients with adverse event; PT, preferred term"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 13 generation works with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_13(adae, adsl, risk_diff = risk_diff)

  res <- expect_silent(result)
  expect_snapshot(res)
})
