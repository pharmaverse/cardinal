adsl <- adsl_raw %>%
  filter(SAFFL == "Y") %>%
  df_explicit_na()

test_that("Table 02 generation works with default values", {
  options(pillar.print_max = 50, width = 200)

  result <- make_table_02(adsl)
  expect_snapshot(result$tbl |> as.data.frame())
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

test_that("Table 02 generation (gtsum) works with some NA values", {
  options(pillar.print_max = 50, width = 200)

  set.seed(1)
  adsl[sample(seq_len(nrow(adsl)), 50), "SEX"] <- NA

  adsl <- adsl %>% df_explicit_na()

  result <- suppressWarnings(make_table_02(adsl, vars = "SEX"))

  res <- expect_silent(result)
  expect_snapshot(result$tbl |> as.data.frame())
})
