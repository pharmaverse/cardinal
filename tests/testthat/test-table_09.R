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
  # Use adsl for alternative column counts
  tbl_out <- make_table_09_tplyr(adae = adae, alt_counts_df = adsl, tplyr_raw = TRUE)

  # Extract column counts
  counts_row <- tbl_out[1,][2:ncol(tbl_out)]
  counts_out <- data.frame(
    arm = gsub("var1_", "", names(counts_row)),
    n_out = as.numeric(gsub("[^0-9]", "", counts_row))
  )

  # Compare expected counts to actual counts
  counts_exp <- adsl %>%
    dplyr::group_by(ARM) %>%
    dplyr::summarize(n_exp = n()) %>%
    dplyr::full_join(counts_out, by = c("ARM" = "arm")) %>%
    dplyr::mutate(equal = (n_exp == n_out))

  expect_true(all(counts_exp[["equal"]]))

  # Repeat procedure for the case that no alt_counts_df is specified
  tbl_out_n <- make_table_09_tplyr(adae = adae, tplyr_raw = TRUE)
  counts_row_n <- tbl_out_n[1,][2:ncol(tbl_out_n)]
  counts_out_n <- data.frame(
    arm = gsub("var1_", "", names(counts_row_n)),
    n_out = as.numeric(gsub("[^0-9]", "", counts_row_n))
  )

  counts_exp <- adae %>%
    dplyr::group_by(ARM) %>%
    dplyr::filter(AESER == "Y", SAFFL == "Y") %>%
    dplyr::summarize(n_exp = n()) %>%
    dplyr::full_join(counts_out_n, by = c("ARM" = "arm")) %>%
    dplyr::mutate(equal = (n_exp == n_out))

  expect_true(all(counts_exp[["equal"]]))

})

test_that("make_table_09_tplyr() assigns column headers correctly to the arm groups", {
  tbl_out <- make_table_09_tplyr(adae, tplyr_raw = TRUE)
  arm_col_names <- colnames(tbl_out)[-1] |> sub(pattern = "var1_", replacement = "")
  arm_headers <- unlist(tbl_out[1, -1])
  position_valid <- sapply(1:length(arm_col_names), function(i) grepl(arm_col_names[i], arm_headers[i]))
  expect_true(all(position_valid))

  # Alternate levels order
  adae_alt <- adae %>%
    dplyr::mutate(ARM = factor(ARM, levels = unique(adae[["ARM"]])))
  tbl_out2 <- make_table_09_tplyr(adae_alt, tplyr_raw = TRUE)
  arm_col_names <- colnames(tbl_out)[-1] |> sub(pattern = "var1_", replacement = "")
  arm_headers <- unlist(tbl_out[1, -1])
  position_valid <- sapply(1:length(arm_col_names), function(i) grepl(arm_col_names[i], arm_headers[i]))
  expect_true(all(position_valid))
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



