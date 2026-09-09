test_that("fda-table_15() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_15")
  ard <- env$ard

  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})

test_that("fda-table_15() keeps only terms at or above the 5% threshold", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_15")

  # The template applies filter_hierarchical(sum(n) / sum(N) >= 0.05). Rebuild
  # the unfiltered table and confirm the filter actually drops the sub-threshold
  # terms and that every retained term clears the boundary.
  adsl <- pharmaverseadam::adsl |> dplyr::filter(SAFFL == "Y")
  adae <- pharmaverseadam::adae |> dplyr::filter(SAFFL == "Y")

  tbl_unfiltered <- gtsummary::tbl_hierarchical(
    adae,
    variables = c(AEDECOD),
    by = TRT01A,
    id = USUBJID,
    denominator = adsl,
    label = AEDECOD ~ "**Preferred Term**"
  )

  n_unfiltered <- sum(tbl_unfiltered$table_body$variable == "AEDECOD")
  retained <- env$tbl$table_body$label[env$tbl$table_body$variable == "AEDECOD"]

  expect_lt(length(retained), n_unfiltered)
  expect_gt(length(retained), 0)

  # Every retained preferred term must clear the 5% pooled-incidence boundary,
  # and every dropped term must fall below it. Compute the pooled rate directly.
  n_subjects <- dplyr::n_distinct(adsl$USUBJID)
  rates <- adae |>
    dplyr::group_by(AEDECOD) |>
    dplyr::summarise(n = dplyr::n_distinct(USUBJID), .groups = "drop") |>
    dplyr::mutate(rate = n / n_subjects)

  retained_rates <- rates$rate[rates$AEDECOD %in% retained]
  dropped_rates <- rates$rate[!(rates$AEDECOD %in% retained)]

  expect_true(all(retained_rates >= 0.05))
  expect_true(all(dropped_rates < 0.05))
})
