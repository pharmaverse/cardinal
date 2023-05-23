set.seed(1)

adae <- adae_raw
adex <- adex_raw

test_that("Table 08 generation works with default values", {
  result <- make_table_08(adae, adex)
  rand_rows <- sort(sample(seq_len(nrow(result)), as.integer(nrow(result) / 5)))
  res <- expect_silent(result[rand_rows, ])
  expect_snapshot(res)
})

test_that("Table 08 generation works with custom values", {
  result <- make_table_08(
    adae,
    adex,
    na_level = "-",
    annotations = list(
      title = "Table 8. All Individual Patient Deaths, Safety Population, Pooled Analyses (1)",
      main_footer = c(
        "Source: [include Applicant source, datasets and/or software tools used].",
        "(1) Duration = [e.g., X week double-blind treatment period or median and a range indicating",
        "pooled trial durations].",
        "Abbreviations: MedDRA, Medical Dictionary for Regulatory Activities; PT, preferred term"
      )
    )
  )

  rand_rows <- sort(sample(seq_len(nrow(result)), as.integer(nrow(result) / 5)))
  res <- expect_silent(result[rand_rows, ])
  expect_snapshot(res)
})
