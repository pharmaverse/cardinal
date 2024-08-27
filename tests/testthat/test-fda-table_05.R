set.seed(1)
adsl <- adsl_raw
adsl$TRTSDTM <- adsl$TRTSDTM[1]
adsl$TRTEDTM <- adsl$TRTSDTM + lubridate::days(sample(0:400, nrow(adsl), replace = TRUE))

test_that("Table 05 generation works with default values", {
  withr::local_options(list(width = 120))

  result <- expect_no_warning(make_table_05(adsl))
  res <- expect_silent(result)
  expect_snapshot(res)

  # only table
  result2 <- expect_no_warning(make_table_05(adsl, return_ard = FALSE))
  res2 <- expect_silent(result2)
  expect_snapshot(res2)

  # only ard
  res3 <- expect_silent(make_table_05(adsl, table_engine = NULL))
  expect_snapshot(res3[, 1:9] %>% data.frame())

  # both together
  expect_equal(
    result,
    list(table = res2, ard = res3)
  )
})

test_that("Table 05 warnings work", {
  # invalid table engine
  expect_warning(
    make_table_05(adsl, table_engine = "gtsummary")
  )

  # no output selected
  expect_warning(
    make_table_05(adsl, table_engine = NULL, return_ard = FALSE)
  )
})

# rtables ----

test_that("Table 05 generation works with rtables engine with custom values", {
  result <- make_table_05(
    adsl,
    u_trtdur = "years",
    lbl_overall = "Total\nPopulation",
    prune_0 = TRUE,
    annotations = list(
      title = "Table 5. Duration of Treatment Exposure, Safety Population, Pooled Analyses*",
      main_footer = paste0(
        "Source: [include Applicant source, datasets and/or software tools used].\n",
        "* Duration = [e.g., X-week double-blind treatment period or median and a ",
        "range indicating pooled trial durations]."
      ),
      prov_footer = paste0(
        "Abbreviations: CI, confidence interval; N, number of patients in treatment arm;\n  ",
        "n, number of patients with given treatment duration; NA, not applicable; SD, standard deviation"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 05 generation works with rtables engine with NA values/pruned rows", {
  set.seed(1)
  adsl[lubridate::seconds(adsl$TRTEDTM - adsl$TRTSDTM) %>% as.numeric("days") > 180, c("TRTSDTM", "TRTEDTM")] <- NA

  result <- make_table_05(adsl)

  res <- expect_silent(result)
  expect_snapshot(res)

  result <- make_table_05(adsl, prune_0 = TRUE)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 05 generation works with rtables engine with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_05(adsl, risk_diff = risk_diff)

  res <- expect_silent(result)
  expect_snapshot(res)
})
