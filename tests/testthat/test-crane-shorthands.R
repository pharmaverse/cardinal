# Coverage for the {crane} helpers the catalog templates rely on. These lock in
# the behaviour we depend on so an upstream change surfaces here rather than in a
# template snapshot.

test_that("sort_hierarchical() orders a hierarchical table", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("crane")
  skip_if_not_installed("pharmaverseadam")

  adsl <- pharmaverseadam::adsl |> dplyr::filter(SAFFL == "Y")
  adae <- pharmaverseadam::adae |> dplyr::filter(SAFFL == "Y", TRTEMFL == "Y")

  tbl <- gtsummary::tbl_hierarchical(
    adae,
    variables = c(AEDECOD),
    by = TRT01A,
    id = USUBJID,
    denominator = adsl,
    label = AEDECOD ~ "Preferred Term"
  )

  sorted <- crane::sort_hierarchical(tbl)

  # sorting must not add or drop rows, only reorder them
  expect_identical(
    nrow(sorted$table_body),
    nrow(tbl$table_body)
  )
  expect_setequal(
    sorted$table_body$label,
    tbl$table_body$label
  )
})

test_that("filter_hierarchical() keeps only terms above a threshold", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("crane")
  skip_if_not_installed("pharmaverseadam")

  adsl <- pharmaverseadam::adsl |> dplyr::filter(SAFFL == "Y")
  adae <- pharmaverseadam::adae |> dplyr::filter(SAFFL == "Y", TRTEMFL == "Y")

  tbl <- gtsummary::tbl_hierarchical(
    adae,
    variables = c(AEDECOD),
    by = TRT01A,
    id = USUBJID,
    denominator = adsl,
    label = AEDECOD ~ "Preferred Term"
  )

  filtered <- crane::filter_hierarchical(tbl, sum(n) / sum(N) >= 0.05)

  n_before <- sum(tbl$table_body$variable == "AEDECOD")
  n_after <- sum(filtered$table_body$variable == "AEDECOD")

  expect_lt(n_after, n_before)
  expect_gt(n_after, 0)
})

test_that("remove_duplicate_keys() blanks repeated key values in a listing", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("crane")

  # a listing where the key column mixes repeated and single-occurrence values
  data <- data.frame(
    ARM = c("A", "A", "B"),
    ID = c("01", "02", "03"),
    stringsAsFactors = FALSE
  )

  deduped <- crane::tbl_listing(data) |>
    crane::remove_duplicate_keys(keys = ARM)

  # first occurrence kept, consecutive repeat blanked, distinct value kept
  expect_identical(deduped$table_body$ARM, c("A", NA, "B"))
})
