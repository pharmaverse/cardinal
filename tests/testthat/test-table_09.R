adsl <- adsl_raw
adae <- adae_raw

# Test make_table_09() ----

test_that("Table 09 generation works with default values", {
  result <- make_table_09(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 09 generation works with custom values", {
  result <- make_table_09(
    adae,
    adsl,
    lbl_overall = "Total",
    annotations = list(
      title = paste(
        "Table 9. Patients With Serious Adverse Events(1) by System Organ Class and",
        "Preferred Term, Safety Population, Pooled Analyses(2)"
      ),
      main_footer = c(
        "Source: [include Applicant source, datasets and/or software tools used].",
        "(1) Defined as any untoward medical occurrence that, at any dose that results in death, is life-threatening,",
        "requires hospitalization or prolongation of existing hospitalization, results in persistent incapacity or",
        "substantial disruption of the ability to conduct normal life functions, or is a congenital anomaly or",
        "birth defect.",
        "(2) Duration = [e.g., X week double-blind treatment period or median and",
        "a range indicating pooled trial durations]."
      ),
      prov_footer = c(
        "Abbreviations: AE, adverse event; CI, confidence interval; N, number of patients in treatment arm;",
        "n, number of patients with adverse event; PT, preferred term; SAE, serious adverse event;",
        "SOC, System Organ Class"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})


# Test make_table_09_tplyr() ----

test_that("make_table_09_tplyr() returns a tibble when tplyr_raw = TRUE", {
  tbl_out <- make_table_09_tplyr(adae = adae, tplyr_raw = TRUE)
  expect_tibble(tbl_out) # verify expected type

  expect_silent(tbl_out) # expect no messages or warnings
  expect_snapshot(tbl_out) # verify that the content didn't change compared to the last run
})

test_that("make_table_09_tplyr() returns a gt object when tplyr_raw = FALSE", {
  tbl_out <- make_table_09_tplyr(adae = adae, tplyr_raw = FALSE)
  expect_class(tbl_out, "gt_tbl") # verify expected type

  expect_silent(tbl_out) # expect no messages or warnings
  expect_snapshot(tbl_out) # verify that the content didn't change compared to the last run
})

# As we have now verified visually (due to the snapshots) that tplyr table and gt table are the same content-wise,
# we can use the tplyr data.frame to verify the content. However, the cell content is not tested, since
# we trust that {tplyr} functionality works as expected
test_that("make_table_09_tplyr() provides total column counts based on the alt_count_df parameter", {
  # TRUE

  # FALSE
})

test_that("make_table_09_tplyr() assigns column headers correctly", {
  # character

  # factor - alternate levels order
})

test_that("make_table_09_tplyr() provides risk difference columns based on the risk_diff_pairs parameter", {
  # one

  # multiple

  # header_string
})

test_that("make_table_09_tplyr() provides a total column based on the lbl_overall parameter", {
  # TRUE + header_string

  # FALSE

})

test_that("make_table_09_tplyr() prunes all-zero-rows based on the prune_0 parameter", {
  # TRUE

  # FALSE
})

test_that("make_table_09_tplyr() shows column counts based on the show_colcounts parameter", {
  # TRUE

  # FALSE
})

test_that("make_table_09_tplyr() considers lbl_soc_var and lbl_pref_var parameters", {
  # tplyr

  # gt
})

test_that("make_table_09_tplyr() considers annotations if tplyr_raw = FALSE", {})



