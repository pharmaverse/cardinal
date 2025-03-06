adsl <- adsl_raw
adae <- adae_raw

# Test common function ----
test_that("Table 06 generation works with default values", {
  result <- make_table_06(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 06 returns ARD if specified", {
  result <- make_table_06(adae, adsl, return_ard = TRUE)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 06 generation works with custom labels", {
  result <- make_table_06(
    adae,
    adsl,
    sae_cat_vars = list(
      `My test label 1` = "AESDTH",
      `Life-threatening SAEs` =
                          "AESLIFE",
      `My test label 2` = "AESHOSP",
      `SAEs resulting in substantial disruption of normal life functions` = "AESDISAB",
      `Congenital anomaly or birth defect` = "AESCONG", Other = "AESMIE"
    ),
    dose_mod_cat_labels = list(
      `DRUG INTERRUPTED` = "My test label 3",
      `DOSE REDUCED` = "AE leading to reduction of study drug",
      `DOSE RATE REDUCED` = "AE leading to dose delay of study drug",
      `DOSE INCREASED` = "Some other label"
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})



# Test rtables function ----

test_that("Table 06 rtables generation works with default values", {
  result <- make_table_06_rtables(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 06 rtables generation works with custom values", {
  result <- make_table_06_rtables(
    adae,
    adsl,
    lbl_overall = "Total",
    prune_0 = TRUE,
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

test_that("Table 06 rtables generation works with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_06_rtables(adae, adsl, risk_diff = risk_diff)

  res <- expect_silent(result)
  expect_snapshot(res)
})
