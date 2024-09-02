adsl <- adsl_raw
advs <- advs_raw
advs_missing <- advs %>%
  filter(PARAMCD == "DIABP" & AVISITN >= 1)
set.seed(2)
advs_missing[sample(seq_len(nrow(advs_missing)), 100), "AVAL"] <- NA
advs_missing <- advs_missing %>%
  df_explicit_na()

test_that("Table 32 generation works with default values", {
  withr::local_options(list(width = 120))

  result <- make_table_32(advs, adsl, table_engine = "rtables")
  res <- expect_silent(result)
  expect_snapshot(res)

  # only table
  result2 <- make_table_32(
    advs, adsl, return_ard = FALSE, table_engine = "rtables"
  )
  res2 <- expect_silent(result2)
  expect_snapshot(res2)

  # only ard
  result3 <- make_table_32(
    advs, adsl, table_engine = NULL
  )
  res3 <- expect_silent(result3)
  expect_snapshot(res3)

  # both together
  expect_equal(
    result,
    list(table = res2, ard = res3)
  )
})

# rtables -----

test_that("Table 32 generation works with custom values", {
  result <- make_table_32(
    advs,
    adsl,
    table_engine = "rtables",
    lbl_overall = "Total\nPopulation",
    annotations = list(
      title = paste(
        "Table 32. Percentage of Patients With Maximum Diastolic Blood Pressure by Category\n",
        "of Blood Pressure Postbaseline, Safety Population, Pooled Analysis"
      ),
      main_footer = "Source: [include Applicant source, datasets and/or software tools used].",
      prov_footer = c(
        "Abbreviations: CI, confidence interval; n, number of patients with indicated blood pressure;",
        "N, number of patients in treatment arm with available blood pressure data"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 32 generation works with pruned rows", {
  result <- make_table_32(advs, adsl, prune_0 = TRUE, table_engine = "rtables")

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 32 generation works with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_32(
    advs, adsl, risk_diff = risk_diff, table_engine = "rtables"
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

# gtsummary -----

test_that("Table 32 generation works with default values", {
  result <-
    suppressWarnings(
      make_table_32(
        df = advs,
        table_engine = "gtsummary",
        return_ard = FALSE
      ) %>%
        gt::extract_body()
    )
  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 32 generation works with custom values", {
  result <- suppressWarnings(
    make_table_32(
      df = advs,
      table_engine = "gtsummary",
      lbl_overall = "Total Population",
      return_ard = FALSE
    ) %>%
      gt::extract_body()
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 32 generation missing values and ADSL", {
  result <- suppressWarnings(
    make_table_32(
      table_engine = "gtsummary",
      df = advs_missing,
      alt_counts_df = adsl,
      lbl_overall = "Total Population",
      return_ard = FALSE
    ) %>%
      gt::extract_body()
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})
