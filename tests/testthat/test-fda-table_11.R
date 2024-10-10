adsl <- adsl_raw
adae <- adae_raw

set.seed(1)
adae <- adae %>%
  dplyr::rename(FMQ01SC = SMQ01SC) %>%
  dplyr::mutate(
    AESER = sample(c("Y", "N"), size = nrow(adae), replace = TRUE),
    FMQ01NAM = sample(c("FMQ1", "FMQ2", "FMQ3"), size = nrow(adae), replace = TRUE)
  )
adae$DCSREAS[is.na(adae$DCSREAS)] <- "ADVERSE EVENT"
adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"

test_that("Table 11 generation works with default values", {
  withr::local_options(list(width = 120))

  expect_warning(result <- make_table_11(adae, adsl))
  res <- expect_silent(result)
  expect_snapshot(res$table |> as.data.frame())
  expect_snapshot(res$ard)

  # no ARD
  expect_warning(result2 <- make_table_11(adae, adsl, return_ard = FALSE))
  res2 <- expect_silent(result2)

  # tables the same
  expect_identical(res$table, res2)
})

# gtsummary ----

test_that("Table 11 generation works with gtsummary with custom values", {
  result <- make_table_11_gtsummary(
    df = adae,
    denominator = adsl
  )

  res <- expect_silent(result)
  expect_snapshot(res |> as.data.frame())
})

# rtables ----

test_that("Table 11 generation works with rtables with custom values", {
  adae <- formatters::var_relabel(adae, AEBODSYS = "Body System or Organ Class(2)")
  result <- make_table_11_rtables(
    df = adae,
    alt_counts_df = adsl,
    fmq_scope = "BROAD",
    annotations = list(
      title = paste(
        "Table 11. Patients with FDA Medical Query (Broad) Leading to Treatment Discontinuation, Safety Population,\n",
        "Pooled Analyses(1)\n"
      ),
      main_footer = paste(
        "Source: [include Applicant source, datasets and/or software tools used].\n",
        "(1) Duration = [e.g., X-week double-blind treatment period or median and a range indicating pooled trial\n",
        "durations].\n",
        "(2) Each FMQ is aligned to a single SOC based on clinical judgement.",
        "However, please be aware that some FMQs\n may contain PTs from more than one SOC."
      ),
      prov_footer = c(
        "Abbreviations: CI, confidence interval; FMQ, FDA Medical Query;",
        "MedDRA, Medical Dictionary for Regulatory Activities; N, number of patients in treatment arm;",
        "n, number of patients with adverse event; SOC, System Organ Class"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 11 generation works with rtables with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_11_rtables(adae, adsl, risk_diff = risk_diff)

  res <- expect_silent(result)
  expect_snapshot(res)
})
