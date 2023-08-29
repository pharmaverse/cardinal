adsl <- adsl_raw
adae <- adae_raw

set.seed(1)
adae <- adae %>%
  dplyr::rename(FMQ01SC = SMQ01SC) %>%
  dplyr::mutate(
    AESER = sample(c("Y", "N"), size = nrow(adae), replace = TRUE),
    FMQ01NAM = sample(c("FMQ1", "FMQ2", "FMQ3"), size = nrow(adae), replace = TRUE)
  )
adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"

test_that("Table 34 generation works with default values", {
  result <- make_table_34(adae = adae, alt_counts_df = adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 34 generation works with custom values", {
  adae <- formatters::var_relabel(adae, AEBODSYS = "Body System or Organ Class(3)(4)")
  result <- make_table_34(
    adae = adae,
    alt_counts_df = adsl,
    fmq_scope = 'BROAD',
    annotations = list(
      title = paste(
        "Table 34. Patients With Serious Adverse Events(1) by System Organ Class, FDA Medical Query (Broad)",
        "and Preferred Term, Safety Population, Pooled Analyses or Trial X(2)"
      ),
      main_footer = paste(
        "Source: [include Applicant source, datasets and/or software tools used\n",
        "(1) Defined as any untoward medical occurrence that, at any dose that results in death, is life-threatening, requires hospitalization or",
        "prolongation of existing hospitalization, results in persistent incapacity or substantial disruption of the ability to conduct normal life",
        "functions, or is a congenital anomaly or birth defect.\n",
        "(2) Duration = [e.g., X-week double-blind treatment period or, median and a range indicating pooled trial durations].\n",
        "(3) Treatment-emergent adverse event defined as [definition].\n",
        "(4) Each FMQ is aligned to a single SOC based on clinical judgement. However, please beaware that some FMQs may contain PTs",
        "from more than one SOC."
      ),
      prov_footer = c(
        "Abbreviations: CI, confidence interval; FMQ, FDA Medical Query; N, number of patients in treatment arm; n, number of patients with",
        "at least one event; SOC, System Organ Class"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})
