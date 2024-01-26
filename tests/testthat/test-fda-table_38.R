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


test_that("Table 38 generation works with default values", {
  result <- make_table_38(adae = adae, alt_counts_df = adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 38 generation works with custom values", {
  adae <- formatters::var_relabel(adae, AEBODSYS = "Body System or Organ Class(3)")
  result <- make_table_38(
    adae = adae,
    alt_counts_df = adsl,
    fmq_scope = "NARROW",
    annotations = list(
      title = paste(
        "Table 38. Patients With Adverse Events by System Organ Class, FDA Medical Query (Narrow)(1)\n",
        "and Preferred Term, Safety Population, Pooled Analysis (or Trial X)(2)"
      ),
      main_footer = paste(
        "Source: [include Applicant source, datasets and/or software tools used]\n",
        "(1) Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled trial durations].\n",
        "(2) Treatment-emergent adverse event defined as [definition]. MedDRA version X.\n",
        "(3) Each FMQ is aligned to a single SOC based on clinical judgment. However,\n",
        "please be aware that some FMQs may contain PTs from more than one SOC."
      ),
      prov_footer = c(
        "Abbreviations: CI, confidence interval; FMQ, FDA Medical Query; N, number of patients in treatment arm;",
        "n, number of patients with at least one event; SOC, System Organ Class"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 38 generation works with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_38(adae, adsl, risk_diff = risk_diff)

  res <- expect_silent(result)
  expect_snapshot(res)
})
