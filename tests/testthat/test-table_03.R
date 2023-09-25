adsl <- adsl_raw

set.seed(3)

adsl <- adsl %>%
  dplyr::mutate(
    SCRNFL = sample(c(TRUE, NA), size = nrow(adsl), replace = TRUE),
    SCRNFLRS = sample(c(
      "Inclusion/exclusion criteria not met",
      "Patient noncompliance",
      "Consent withdrawn",
      "Other"
    ), size = nrow(adsl), replace = TRUE),
    ENRLFL = sample(c(TRUE, NA), size = nrow(adsl), replace = TRUE),
    RANDFL = sample(c(TRUE, NA), size = nrow(adsl), replace = TRUE)
  )

labels <- c(
  "SCRNFL" = "Patients screened",
  "SCRNFLRS" = "Reason for SCRNFL=N",
  "ENRLFL" = "Patients enrolled",
  "RANDFL" = "Patients randomized"
)

formatters::var_labels(adsl)[names(labels)] <- labels

test_that("Table 3 generation works with default values", {
  result <- make_table_03(adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 3 generation works with custom values", {
  result <- make_table_03(
    adsl,
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
