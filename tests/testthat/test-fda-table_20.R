set.seed(1)

adsl <- adsl_raw
adae <- adae_raw %>%
  mutate(
    AESIFL = case_when(
      AESOC %in% c("cl A", "cl D") ~ "Y",
      TRUE ~ "N"
    ),
    AELABFL = sample(c("Y", "N"), n(), replace = TRUE)
  )

test_that("Table 20 generation works with default values", {
  result <- make_table_20(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 20 generation works with custom values", {
  result <- make_table_20(
    adae,
    adsl,
    annotations = list(
      title = paste(
        "Table 20. Adverse Events of Special Interest Assessment, Safety Population,",
        "Pooled Analysis (or Trial X) (1)"
      ),
      main_footer = c(
        "Source: [include Applicant source, datasets and/or software tools used].",
        "(1) Duration = [e.g., X week double-blind treatment period or median and",
        "a range indicating pooled trial durations].",
        "(2) Difference is shown between [treatment arms]",
        "(e.g., difference is shown between Drug Name dosage X vs. placebo)."
      ),
      prov_footer = c(
        "Abbreviations: AESI, adverse event of special interest; CI, confidence interval;",
        "N, number of patients in treatment arm; n, number of patients with at least one event"
      )
    )
  )

  fnotes_at_path(
    result,
    rowpath = c("ma_tbl_aesi_AEDECOD_AESEV_tbl_ser_tbl_death_tbl_dis_tbl_rel_tbl_lab", "tbl_aesi", "count_fraction.AESIFL") # nolint
  ) <- c("Use FMQ grouping if appropriate.")
  fnotes_at_path(
    result,
    rowpath = c("ma_tbl_aesi_AEDECOD_AESEV_tbl_ser_tbl_death_tbl_dis_tbl_rel_tbl_lab", "AESEV") # nolint
  ) <- c("Use FMQ grouping if appropriate.")
  fnotes_at_path(
    result,
    rowpath = c("ma_tbl_aesi_AEDECOD_AESEV_tbl_ser_tbl_death_tbl_dis_tbl_rel_tbl_lab", "tbl_ser", "count_fraction") # nolint
  ) <- c("Use FMQ grouping if appropriate.")
  fnotes_at_path(
    result,
    rowpath = c("ma_tbl_aesi_AEDECOD_AESEV_tbl_ser_tbl_death_tbl_dis_tbl_rel_tbl_lab", "tbl_rel", "count_fraction") # nolint
  ) <- c("As determined by investigator.")
  fnotes_at_path(
    result,
    rowpath = c("ma_tbl_aesi_AEDECOD_AESEV_tbl_ser_tbl_death_tbl_dis_tbl_rel_tbl_lab", "tbl_lab", "count_fraction.AELABFL") # nolint
  ) <- c("Include relevant laboratory results as appropriate for AESI evaluation.")

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 20 generation works with missing values/pruned rows", {
  adae$AESEV[adae$AESEV == "MILD"] <- "MODERATE"

  result <- make_table_20(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 20 generation works with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_20(adae, adsl, risk_diff = risk_diff)

  res <- expect_silent(result)
  expect_snapshot(res)
})
