adsl <- adsl_raw
advs <- advs_raw
advs_missing <- advs |>
  filter(PARAMCD == "DIABP" & AVISITN >= 1)
set.seed(2)
advs_missing[sample(seq_len(nrow(advs_missing)), 100), "AVAL"] <- NA
advs_missing <- advs_missing |>
  df_explicit_na()

test_that("Table 32 generation works with default values", {
  withr::local_options(list(width = 120))

  result <- make_table_32(
    advs,
    adsl,
    subset = (PARAMCD == "DIABP" & AVISITN >= 1)
  )
  res <- expect_silent(result)
  expect_snapshot(res$table |> as.data.frame())
  expect_snapshot(res$ard)

  # no ARD
  result2 <- make_table_32(
    advs,
    adsl,
    return_ard = FALSE,
    subset = (PARAMCD == "DIABP" & AVISITN >= 1)
  )
  res2 <- expect_silent(result2)

  expect_identical(res$table, res2)
})

# gtsummary -----
test_that("Table 32 generation works with default values", {
  ard <-
    cardinal:::ard_table_32(
      df = advs,
      subset = (PARAMCD == "DIABP" & AVISITN >= 1)
    )

  result <-
    make_table_32(
      df = advs,
      subset = (PARAMCD == "DIABP" & AVISITN >= 1),
      return_ard = FALSE
    )
  res <- expect_silent(result)
  expect_snapshot(res |> as.data.frame())
})

test_that("Table 32 generation works with custom values", {
  result <-
    make_table_32(
      df = advs,
      lbl_overall = "Total Population",
      return_ard = FALSE,
      subset = (PARAMCD == "DIABP" & AVISITN >= 1)
    )

  res <- expect_silent(result)
  expect_snapshot(res |> as.data.frame())
})

test_that("Table 32 generation missing values and ADSL", {
  ard <-
    cardinal:::ard_table_32(
      df = advs_missing,
      alt_counts_df = adsl,
      subset = (PARAMCD == "DIABP" & AVISITN >= 1)
    )

  result <-
    make_table_32(
      df = advs_missing,
      alt_counts_df = adsl,
      lbl_overall = "Total Population",
      return_ard = FALSE,
      subset = (PARAMCD == "DIABP" & AVISITN >= 1)
    )

  res <- expect_silent(result)
  expect_snapshot(res |> as.data.frame())
})

# rtables -----

test_that("Table 32 generation works with custom values", {
  result <- make_table_32_rtables(
    advs,
    adsl,
    subset = (PARAMCD == "DIABP" & AVISITN >= 1),
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
  result <- make_table_32_rtables(
    advs,
    adsl,
    prune_0 = TRUE,
    subset = (PARAMCD == "DIABP" & AVISITN >= 1)
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 32 generation works with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_32_rtables(
    advs,
    adsl,
    risk_diff = risk_diff,
    subset = (PARAMCD == "DIABP" & AVISITN >= 1)
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

