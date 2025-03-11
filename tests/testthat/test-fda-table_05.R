set.seed(1)
adsl <- adsl_raw
adsl$TRTSDTM <- adsl$TRTSDTM[1]
adsl$TRTEDTM <- adsl$TRTSDTM + lubridate::days(sample(0:400, nrow(adsl), replace = TRUE))

test_that("Table 05 generation works with default values", {
  withr::local_options(list(width = 120))

  result <- make_table_05(adsl)
  res <- expect_silent(result)
  expect_snapshot(res$table |> as.data.frame())
  expect_snapshot(res$ard)

  # no ARD
  result2 <- make_table_05(adsl, return_ard = FALSE)
  res2 <- expect_silent(result2)

  # tables the same
  expect_identical(res$table, res2)
})

# gtsummary ----

test_that("Table 05 generation works with gtsummary with custom values", {
  ard <- cardinal:::ard_table_05(df = adsl)
  result <- make_table_05_gtsummary(
    adsl,
    ard = ard,
    u_trtdur = "years"
  )

  res <- expect_silent(result)
  expect_snapshot(res |> as.data.frame())
})

# rtables ----

test_that("Table 05 generation works with rtables with custom values", {
  result <- make_table_05_rtables(
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

test_that("Table 05 generation works with rtables with NA values/pruned rows", {
  set.seed(1)
  adsl[lubridate::seconds(adsl$TRTEDTM - adsl$TRTSDTM) %>% as.numeric("days") > 180, c("TRTSDTM", "TRTEDTM")] <- NA

  result <- make_table_05_rtables(adsl)

  res <- expect_silent(result)
  expect_snapshot(res)

  result <- make_table_05_rtables(adsl, prune_0 = TRUE)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 05 generation works with rtables with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_05_rtables(adsl, risk_diff = risk_diff)

  res <- expect_silent(result)
  expect_snapshot(res)
})
