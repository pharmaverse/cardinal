test_that("fda-table_09() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")
  skip_if_not_installed("crane")

  env <- run_template("fda-table_09")

  # a listing has no ARD; snapshot the underlying data
  expect_snapshot(as.data.frame(env$data))
})

test_that("fda-table_09() de-duplicates repeated treatment keys in the listing", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")
  skip_if_not_installed("crane")

  env <- run_template("fda-table_09")

  # The listing repeats the treatment arm across subject rows. Blanking the
  # duplicated key values is a common listing step, so assert it works on this
  # data even when the key column mixes repeated and single-occurrence values.
  deduped <- crane::tbl_listing(env$data) |>
    crane::remove_duplicate_keys(keys = TRT01A)

  key_col <- deduped$table_body$TRT01A

  # first occurrence of each arm is kept; consecutive repeats are blanked
  expect_true(any(is.na(key_col) | key_col == ""))
  expect_true(any(!is.na(key_col) & key_col != ""))
})
