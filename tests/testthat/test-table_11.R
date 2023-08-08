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
  result <- make_table_11(adae = adae, alt_counts_df = adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 11 generation works with custom values", {
  adae <- formatters::var_relabel(adae, AEBODSYS = "Body System or Organ Class(2)")
  result <- make_table_11(
    adae = adae,
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
