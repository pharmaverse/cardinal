adsl <- adsl_raw
adae <- adae_raw
adae$DCSREAS[is.na(adae$DCSREAS)] <- "ADVERSE EVENT"

test_that("Table 12 generation works with default values", {
  withr::local_options(list(width = 150))

  expect_warning(result <- make_table_12(adae, adsl))
  res <- expect_silent(result)
  expect_snapshot(res$table |> as.data.frame())
  expect_snapshot(res$ard)

  # no ARD
  expect_warning(result2 <- make_table_12(adae, adsl, return_ard = FALSE))
  res2 <- expect_silent(result2)

  # tables the same
  expect_identical(res$table, res2)
})

# gtsummary ----

test_that("Table 12 generation works with gtsummary with custom values", {
  withr::local_options(list(width = 150))

  result <- make_table_12_gtsummary(
    df = adae,
    denominator = adsl
  )

  res <- expect_silent(result)
  expect_snapshot(res |> as.data.frame())
})

# rtables ----

test_that("Table 12 generation works with default values", {
  result <- make_table_12_rtables(df = adae, alt_counts_df = adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 12 generation works with custom values", {
  adae <- var_relabel(adae, AEDECOD = "Preferred Term")
  result <- make_table_12_rtables(
    df = adae,
    alt_counts_df = adsl,
    annotations = list(
      title = paste(
        "Table 12. Patients With Adverse Events(1) Leading to Treatment Discontinuation by System Organ Class and",
        "Preferred Term,\n Safety Population, Pooled Analyses(2)\n"
      ),
      main_footer = paste(
        "Source: [include Applicant source, datasets and/or software tools used].\n",
        "(1) Treatment-emergent adverse event defined as [definition]. MedDRA version X.\n",
        "(2) Duration = [e.g., X week double-blind treatment period or median and a range indicating",
        "pooled trial durations].\n"
      ),
      prov_footer = c(
        paste(
          "Abbreviations: CI, confidence interval; MedDRA, Medical Dictionary for Regulatory Activities;",
          "N, number of patients\n"
        ),
        "in treatment arm; n, number of patients with at least one event; PT, preferred term; SOC, System Organ Class"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 12 generation works with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_12_rtables(adae, adsl, risk_diff = risk_diff)

  res <- expect_silent(result)
  expect_snapshot(res)
})
