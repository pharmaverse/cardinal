set.seed(1)
adsl <- adsl_raw
adsl$RANDDT[sample(seq_len(nrow(adsl)), 100)] <- NA
adsl <- adsl %>%
  mutate(
    ENRLDT = RANDDT,
    SCRNFL = "Y",
    SCRNFRS = factor(sample(
      c("Inclusion/exclusion criteria not met", "Patient noncompliance", "Consent withdrawn", "Other"),
      size = nrow(adsl), replace = TRUE
    ), levels = c("Inclusion/exclusion criteria not met", "Patient noncompliance", "Consent withdrawn", "Other")),
    SCRNFAILFL = ifelse(is.na(ENRLDT), "Y", "N")
  )
adsl$SCRNFRS[adsl$SCRNFL == "N" | !is.na(adsl$ENRLDT)] <- NA

test_that("Table 3 generation works with default values", {
  withr::local_options(list(width = 120))

  result <- make_table_03(adsl)
  res <- expect_silent(result)
  expect_snapshot(res$table |> as.data.frame())
  expect_snapshot(res$ard)

  # no ARD
  result2 <- make_table_03(adsl, return_ard = FALSE)
  res2 <- expect_silent(result2)

  # tables the same
  expect_identical(res$table, res2)
})

# gtsummary ----

test_that("Table 03 generation works with gtsummary with custom values", {
  result <- make_table_03_gtsummary(adsl)

  res <- expect_silent(result)
  expect_snapshot(res |> as.data.frame())
})

# rtables ----

test_that("Table 3 generation works with custom values", {
  result <- make_table_03_rtables(
    adsl,
    scrnfl_var = "SCRNFL", scrnfailfl_var = "SCRNFAILFL", scrnfail_var = "SCRNFRS",
    show_colcounts = TRUE,
    lbl_overall = "Total\nPopulation",
    annotations = list(
      title = paste(
        "Table 3. Patients Screening and Enrollment, Trials A and B"
      ),
      main_footer = c(
        "Source: [include Applicant source, datasets and/or software tools used]."
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})
