adsl <- adsl_raw
advs <- advs_raw

test_that("Table 32 generation works with default values", {
  result <- make_table_32(advs, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 32 generation works with custom values", {
  result <- make_table_32(
    advs,
    adsl,
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
  result <- make_table_32(advs, adsl, prune_0 = TRUE)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 32 generation works with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_32(advs, adsl, risk_diff = risk_diff)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 32 (gtsum) generation works with default values", {
  result <- suppressWarnings(make_table_32_gtsum(advs = advs, adsl = adsl))

  res <- expect_silent(result[["_data"]])
  expect_snapshot(res)
})

test_that("Table 32 (gtsum) generation works with custom values", {
  result <- suppressWarnings(make_table_32_gtsum(advs = advs, adsl = adsl, lbl_overall = "Total Population"))
  res <- expect_silent(as.data.frame(result))
  expect_snapshot(res)
})

test_that("Table 32 (gtsum) generation works with default values", {
  result <- suppressWarnings(make_table_32_gtsum(advs = advs, adsl = adsl) %>% as_gt())
  res <- expect_silent(as.data.frame(result))
  expect_snapshot(res)
})

test_that("Table 32 (gtsum) generation works with custom values", {
  result <- suppressWarnings(
    make_table_32_gtsum(advs = advs, adsl = adsl, lbl_overall = "Total Population") %>%
      as_gt()
  )

  res <- expect_silent(as.data.frame(result))
  expect_snapshot(res)
})
