adsl <- adsl_raw %>%
  filter(SAFFL == "Y") %>%
    mutate(AGEGR1 = as.factor(case_when(
    AGE >= 17 & AGE < 65 ~ ">=17 to <65",
    AGE >= 65 ~ ">=65",
    AGE >= 65 & AGE < 75 ~ ">=65 to <75",
    AGE >= 75 ~ ">=75"
    ))) %>%
  df_explicit_na()

test_that("Table 02 generation works with default values", {
  options(pillar.print_max = 50, width = 200)

  result <- make_table_02(adsl)
  res <- expect_silent(result)
  expect_snapshot(res$tbl |> as.data.frame())
  expect_snapshot(res$ard)

  # no ARD
  result2 <- make_table_05(adsl, return_ard = FALSE)
  res2 <- expect_silent(result2)

  # tables the same
  expect_identical(res$tbl, res2)
})

test_that("Table 02 generation works with custom values", {
  options(pillar.print_max = 50, width = 200)

  advs <- advs_raw %>%
    dplyr::filter(AVISIT == "BASELINE", VSTESTCD == "TEMP") %>%
    dplyr::select(all_of(c("USUBJID", "AVAL")))

  anl <- dplyr::left_join(adsl, advs, by = "USUBJID") %>% df_explicit_na()

  result <- make_table_02(
    anl,
    vars = c("SEX", "AGE", "RACE", "ETHNIC", "COUNTRY", "AVAL")
  )

  res <- expect_silent(result)
  expect_snapshot(result$tbl |> as.data.frame())
})

test_that("Table 02 generation works with some NA values", {
  options(pillar.print_max = 50, width = 200)

  set.seed(1)
  adsl[sample(seq_len(nrow(adsl)), 50), "SEX"] <- NA

  adsl <- adsl %>% df_explicit_na()

  result <- suppressWarnings(make_table_02(adsl, vars = "SEX"))

  res <- expect_silent(result)
  expect_snapshot(result$tbl |> as.data.frame())
})

test_that("Table 02 generation (rtables) works with default values", {
  result <- make_table_02_rtables(adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 02 generation (rtables) works with custom values", {
  advs <- advs_raw %>%
    dplyr::filter(AVISIT == "BASELINE", VSTESTCD == "TEMP") %>%
    dplyr::select("USUBJID", "AVAL")

  anl <- dplyr::left_join(adsl, advs, by = "USUBJID") %>% df_explicit_na()

  result <- make_table_02_rtables(
    anl,
    vars = c("SEX", "AGE", "AGEGR1", "RACE", "ETHNIC", "COUNTRY", "AVAL"),
    lbl_vars = c(
      "Sex", "Age, years", "Age Group, years", "Race", "Ethnicity",
      "Country of Participation", "Baseline Temperature (C)"
    ),
    na_rm = TRUE,
    annotations = list(
      title = "Table 2. Baseline Demographic and Clinical Characteristics Safety Population, Pooled Analyses",
      main_footer = "Source: [include Applicant source, datasets and/or software tools used].",
      prov_footer = paste(
        "Abbreviations: N, number of patients in treatment arm;",
        "n, number of patients with given characteristic; SD, standard deviation"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 02 generation (rtables) works with some NA values", {
  set.seed(1)
  adsl[sample(seq_len(nrow(adsl)), 50), "SEX"] <- NA

  adsl <- adsl %>% df_explicit_na()

  result <- make_table_02_rtables(adsl, vars = "SEX", lbl_vars = "Sex")

  res <- expect_silent(result)
  expect_snapshot(res)
})
