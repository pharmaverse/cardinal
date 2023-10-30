adsl <- adsl_raw
adae <- adae_raw

set.seed(1)
adae <- dplyr::rename(adae, FMQ01SC = SMQ01SC, FMQ01NAM = SMQ01NAM)
levels(adae$FMQ01SC) <- c("BROAD", "NARROW")
adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
adae$FMQ01NAM <- factor(adae$FMQ01NAM, levels = c(unique(adae$FMQ01NAM), "Erectile Dysfunction", "Gynecomastia"))
adae$FMQ01NAM[adae$SEX == "M"] <- as.factor(
  sample(c("Erectile Dysfunction", "Gynecomastia"), sum(adae$SEX == "M"), replace = TRUE)
)

risk_diff <- list(arm_x = "A: Drug X", arm_y = "C: Combination")

test_that("Table 15 generation works with default values", {
  result <- make_table_15(adae)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 15 generation works with custom values", {
  result <- make_table_15(
    adae,
    adsl,
    annotations = list(
      title = paste(
        "Table 15: Patients With Adverse Events by Male-Specific FDA Medical Query (Narrow) and Preferred Term,",
        "Male Safety Population, Pooled Analyses"
      ),
      main_footer = paste(
        "Source: [include Applicant source, datasets and/or software tools used].\n",
        "(1) Treatment-emergent adverse event defined as [definition]. MedDRA version X.\n",
        "(2) Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled",
        "trial durations].\n",
        "(3) Difference is shown between [treatment arms] (e.g., difference is shown between Drug Name dosage",
        "X vs. placebo).\n"
      ),
      prov_footer = c(
        "Abbreviations: CI, confidence interval;",
        "FMQ, FDA Medical Query;",
        "MedDRA, Medical Dictionary for Regulatory Activities;",
        "N, number of patients in treatment arm;",
        "n, number of patients with at least one event;",
        "PT, preferred term"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 15 generation works with NA values/pruned rows", {
  result <- make_table_15(adae, prune_0 = TRUE)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 15 generation works with risk difference column", {
  risk_diff <- list(arm_x = "A: Drug X", arm_y = "C: Combination")
  result <- make_table_15(adae, risk_diff = risk_diff)

  res <- expect_silent(result)
  expect_snapshot(res)
})
