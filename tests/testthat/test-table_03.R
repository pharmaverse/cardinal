adsl <- adsl_raw

set.seed(1)
adsl$RANDDT[sample(1:nrow(adsl), 100)] <- NA
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
  result <- make_table_03(adsl, scrnfl_var = "SCRNFL", scrnfailfl_var = "SCRNFAILFL", scrnfail_var = "SCRNFRS")

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 3 generation works with custom values", {
  result <- make_table_03(
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
