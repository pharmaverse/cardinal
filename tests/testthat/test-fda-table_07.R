set.seed(1)

adsl <- adsl_raw
adae <- adae_raw %>%
  mutate(TRTEMFL = ifelse(
    USUBJID %in% sample(adsl[["USUBJID"]], size = as.integer(nrow(adsl) / 3)), "N", "Y"
  ))

test_that("Table 07 generation works with default values", {
  result <- make_table_07(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 07 generation works with custom values", {
  result <- make_table_07(
    adae,
    adsl,
    annotations = list(
      title = "Table 7. Deaths, Safety Population, Pooled Analyses (1)",
      main_footer = c(
        "Source: [include Applicant source, datasets and/or software tools used].",
        "(1) Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled trial",
        "durations]."
      ),
      prov_footer = c(
        "Abbreviations: AE, adverse event; MedDRA, Medical Dictionary for Regulatory Activities;",
        "N, number of patients in treatment arm; n, number of patients with adverse event"
      )
    )
  )

  fnotes_at_path(result, c("TRTEMFL", "Y")) <- "Treatment-emergent AE defined as [definition]. MedDRA version X." # nolint
  fnotes_at_path(result, c("TRTEMFL", "N")) <- paste( # nolint
    "Defined as [(e.g., deaths beyond the protocol-defined, treatment-emergent adverse event period in the",
    "same trial or deaths from other trials with drug)].",
    sep = "\n      "
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 07 generation works with NA values/pruned rows", {
  set.seed(1)
  adae$DTHCAUS[adae$DTHCAUS == "LOST TO FOLLOW UP"] <- NA

  result <- make_table_07(adae, adsl, prune_0 = FALSE)

  res <- expect_silent(result)
  expect_snapshot(res)

  result <- make_table_07(adae, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 07 generation works with risk difference column", {
  risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X")
  result <- make_table_07(adae, adsl, risk_diff = risk_diff)

  res <- expect_silent(result)
  expect_snapshot(res)
})
