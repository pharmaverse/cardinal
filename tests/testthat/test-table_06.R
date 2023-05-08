adsl <- adsl_raw
adae <- adae_raw

test_that("Table 06 generation works with default values", {
  result <- make_table_06(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 06 generation works with custom values", {
  result <- make_table_06(
    adae,
    adsl,
    annotations = list(
      title = "Table 6. Overview of Adverse Events(1), Safety Population, Pooled Analyses(2)",
      main_footer = c(
        "Source: [include Applicant source, datasets and/or software tools used].",
        "(1) Treatment-emergent AE defined as [definition]. MedDRA version X.",
        "(2) Duration = [e.g., X-week double-blind treatment period or, median and a range indicating",
        "pooled trial durations]."
      ),
      prov_footer = c(
        "Abbreviations: AE, adverse event; CI, confidence interval; MedDRA, Medical Dictionary for",
        "Regulatory Activities; N, number of patients in treatment arm;",
        "n, number of patients with at least one event; SAE, serious adverse event"
      )
    )
  )

  fnotes_at_path(
    result,
    rowpath = c("ma_ser_ser_fl_ae_ds_USUBJID_AESEV", "USUBJID", "unique"), # nolint
    colpath = NULL
  ) <- "Severity as assessed by the investigator"

  res <- expect_silent(result)
  expect_snapshot(res)
})
