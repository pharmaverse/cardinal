adsl <- adsl_raw
adae <- adae_raw
adae <- dplyr::rename(adae, FMQ01SC = SMQ01SC, FMQ01NAM = SMQ01NAM)
levels(adae$FMQ01SC) <- c("BROAD", "NARROW")
adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
adsl <- adsl %>%
  dplyr::left_join(
    adae,
    by = c("USUBJID", "SAFFL", "ARM")
  )

test_that("Table 14 generation works with default values", {
  result <- make_table_14(adae)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 14 generation works with custom values", {
  adae <- formatters::var_relabel(adae, AEBODSYS = "Body System or Organ Class(3)")
  result <- make_table_14(
    adae,
    adsl,
    annotations = list(
      title = paste(
        "Table 14. Patients With Adverse Events(1) by System Organ Class and FDA Medical Query,",
        "Safety Population, Pooled Analyses(2)"
      ),
      main_footer = paste(
        "Source: [include Applicant source, datasets and/or software tools used\n",
        "(1) Treatment-emergent AE defined as [definition]. MedDRA version X.\n",
        "(2) Duration = [e.g., X-week double-blind treatment period or, median and a range indicating pooled trial",
        "durations].\n",
        "(3) Each FMQ is aligned to a single SOC based on clinical judgement. Howevere, please beaware that some FMQs",
        "may contain PTs from more than one SOC."
      ),
      prov_footer = c(
        "Abbreviations: CI, confidence interval; FMQ, FDA Medical Query;",
        "MedDRA, Medical Dictionary for Regulatory Activities; N, number of patients in treatment arm;",
        "n, number of patients with at least one event; SOC, System Organ Class"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 14 generation works with NA values/pruned rows", {
  result <- make_table_14(adae, prune_0 = TRUE)

  res <- expect_silent(result)
  expect_snapshot(res)
})
