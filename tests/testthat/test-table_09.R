adsl <- adsl_raw
adae <- adae_raw

test_that("Table 09 generation works with default values", {
  result <- make_table_09(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 09 generation works with custom values", {
  result <- make_table_09(
    adae,
    adsl,
    annotations = list(
      title = paste(
        "Table 9. Patients With Serious Adverse Events(1) by System Organ Class and",
        "Preferred Term, Safety Population, Pooled Analyses(2)"
      ),
      main_footer = c(
        "Source: [include Applicant source, datasets and/or software tools used].",
        "(1) Defined as any untoward medical occurrence that, at any dose that results in death, is life-threatening,",
        "requires hospitalization or prolongation of existing hospitalization, results in persistent incapacity or",
        "substantial disruption of the ability to conduct normal life functions, or is a congenital anomaly or",
        "birth defect.",
        "(2) Duration = [e.g., X week double-blind treatment period or median and",
        "a range indicating pooled trial durations]."
      ),
      prov_footer = c(
        "Abbreviations: AE, adverse event; CI, confidence interval; N, number of patients in treatment arm;",
        "n, number of patients with adverse event; PT, preferred term; SAE, serious adverse event;",
        "SOC, System Organ Class"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})
