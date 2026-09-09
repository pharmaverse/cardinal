test_that("fda-table_47() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("crane")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_47")
  ard <- env$ard

  expect_snapshot(
    as.data.frame(ard$tbl_hierarchical_rate_and_count$tbl_hierarchical)[1:25, ]
  )
  expect_snapshot(
    as.data.frame(ard$tbl_hierarchical_rate_and_count$tbl_hierarchical_count)[1:25, ]
  )
})

test_that("fda-table_47() keeps a category with no events as a zero-row", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("crane")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_47")

  # The organ class is a factor carrying "SOC WITH NO EVENTS", a level no subject
  # experiences. It must survive as a zero-row (header + rate "0" + count "0")
  # rather than being dropped, so the shell is stable when a study expects a
  # category that happens to have no events.
  unobserved <- env$tbl$table_body |>
    dplyr::filter(.data$group1_level == "SOC WITH NO EVENTS")

  expect_identical(nrow(unobserved), 3L)
  expect_identical(unobserved$label[1], "SOC WITH NO EVENTS")
  expect_true(is.na(unobserved$stat_1[1]))
  expect_identical(unobserved$stat_1[2], "0")
  expect_identical(unobserved$stat_1[3], "0")

  # add_overall fills the overall column with "0" for the zero-row
  expect_identical(unobserved$stat_0[2], "0")
})
