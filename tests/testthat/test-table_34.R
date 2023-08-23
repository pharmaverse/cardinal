adsl_raw <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
adae_raw <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")

adsl <- adsl_raw
adae <- adae_raw

adae <- dplyr::rename(adae, FMQ01SC = SMQ01SC, FMQ01NAM = SMQ01NAM)
levels(adae$FMQ01SC) <- c("BROAD", "NARROW")
adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"

test_that("Table 34 generation works with default values", {
  result <- make_table_34(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 34 generation works with custom values", {
  adae <- formatters::var_relabel(adae, AEBODSYS = "Body System or Organ Class(3)(4)")
  result <- make_table_34(
    adae,
    adsl,
    annotations = list(
      title = paste(
        "Table 34. Patients With Serious Adverse Events(1) by System Organ Class, FDA Medical Query (Narrow)",
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
