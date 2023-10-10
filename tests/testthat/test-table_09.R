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
    lbl_overall = "Total",
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

test_that("Table 09 (gt) generation works with default values", {
  result <- make_table_09_gt(adae)

  res <- list(
    "data" = result[["_data"]],
    "column_label" = result[["_boxhead"]][["column_label"]],
    "header" = result[["_heading"]],
    "footnotes" = result[["_footnotes"]][["footnotes"]]
  )
  expect_snapshot(res)
})

test_that("Table 09 (gt) generation works with costum values", {
  annotations <- list(
    title = "Table 9. Patients With Serious Adverse Events",
    subtitle = "by System Organ Class and Preferred Term, Safety Population, Pooled Analyses",
    footnotes = list(
      "Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled trial durations].",
      "Difference is shown between [treatment arms] (e.g., difference is shown between Drug Name dosage X vs. placebo)."
    )
  )
  risk_diff <- list(c("A: Drug X", "C: Combination"), c("A: Drug X", "B: Placebo"))

  result <- make_table_09_gt(adae,
                             alt_counts_df = adsl,
                             lbl_overall = "Total",
                             annotations = annotations,
                             risk_diff = risk_diff)

  res <- list(
    "data" = result[["_data"]],
    "column_label" = result[["_boxhead"]][["column_label"]],
    "header" = result[["_heading"]],
    "footnotes" = result[["_footnotes"]][["footnotes"]]
  )
  expect_snapshot(res)
})
