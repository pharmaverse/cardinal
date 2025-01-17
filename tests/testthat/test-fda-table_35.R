adsl <- adsl_raw
adae <- adae_raw

test_that("Table 35 generation works with default values", {
  withr::local_options(list(width = 150))

  result <- make_table_35(adae)
  res <- expect_silent(result)
  expect_snapshot(res$table |> as.data.frame())
  expect_snapshot(res$ard)

  # no ARD
  result2 <- make_table_35(adae, adsl, return_ard = FALSE)
  res2 <- expect_silent(result2)

  # tables the same
  expect_error(expect_identical(res$table, res2))
})

# gtsummary ----

test_that("Table 35 generation works with gtsummary with custom values", {
  withr::local_options(list(width = 150))

  result <- make_table_35_gtsummary(df = adae, denominator = adsl)

  res <- expect_silent(result)
  expect_snapshot(res |> as.data.frame())
})

test_that("Table 35 generation works with gtsummary missing values", {
  withr::local_options(list(width = 150))

  set.seed(5)
  adae[sample(seq_len(nrow(adae)), 10), "AEBODSYS"] <- NA

  result <- make_table_35_gtsummary(df = adae, denominator = adsl)
  res <- expect_silent(result)
  expect_snapshot(res |> as.data.frame())
})

# rtables -----

test_that("Table 35 generation works with custom values", {
  result <- make_table_35_rtables(
    adae,
    adsl,
    lbl_overall = "Total\nPopulation",
    annotations = list(
      title = paste(
        "Table 35. Patients With Adverse Events1 by System Organ Class,\n",
        "Safety Population, Pooled Analysis"
      ),
      main_footer = c(
        "Source: [include Applicant source, datasets and/or software tools used].",
        "(1) Treatment-emergent adverse event defined as [definition].",
        "(2) Duration = [e.g., X week double-blind treatment period or median",
        "and a range indicating pooled trial durations].",
        "(3) Difference is shown between [treatment arms] (e.g., difference",
        "is shown between Drug Name dosage X vs. placebo).",
        "(4) Table display is ordered by the risk difference."
      ),
      prov_footer = c(
        "Abbreviations: CI, confidence interval;",
        "N, number of patients in treatment arm;",
        "n, number of patients with at least one event"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 35 generation works with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_35_rtables(adae, adsl, risk_diff = risk_diff)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 35 generation works with some NA values", {
  set.seed(5)
  adae[sample(seq_len(nrow(adae)), 10), "AEBODSYS"] <- NA

  adae <- adae %>% df_explicit_na()
  result <- make_table_35_rtables(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 35 generation works with custom values (SOC variable and label)", {
  result <- make_table_35_rtables(
    adae,
    adsl,
    lbl_overall = "Total\nPopulation",
    soc_var = "AEBODSYS",
    lbl_soc_var = "AEBODSYS var used"
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 35 generation works with pruning", {
  adae$AESOC[adae$AESOC == "cl C"] <- "cl A"
  result <- make_table_35_rtables(adae, adsl, prune_0 = TRUE)

  res <- expect_silent(result)
  expect_snapshot(res)
})
