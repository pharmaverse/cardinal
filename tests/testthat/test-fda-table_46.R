test_that("fda-table_46() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("crane")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_46")
  ard <- env$ard

  expect_snapshot(
    as.data.frame(ard$tbl_hierarchical_rate_and_count$tbl_hierarchical)[1:25, ]
  )
  expect_snapshot(
    as.data.frame(ard$tbl_hierarchical_rate_and_count$tbl_hierarchical_count)[1:25, ]
  )
})

test_that("fda-table_46() leads each section with rate then count rows", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("crane")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_46")

  # the table opens with the overall rate and count rows
  expect_identical(
    env$tbl$table_body$label[1:2],
    c(
      "Total number of participants with at least one adverse event",
      "Overall total number of events"
    )
  )
})
