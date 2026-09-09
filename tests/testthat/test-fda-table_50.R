test_that("fda-table_50() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_50")
  ard <- env$ard

  expect_snapshot(as.data.frame(ard[[1]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[2]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[3]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[4]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[5]]$tbl_hierarchical)[1:25, ])
})

test_that("fda-table_50() renders categories with no events as 0 (0%)", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_50")

  # This shell relies on a post-format step that recodes the empty-cell
  # placeholder "0/0 (NA%)" to "0 (0%)". A regression here would either drop
  # the empty category rows or leak the placeholder into the output, so assert
  # the recode both on the rendered table and that no placeholder survives.
  rendered <- as.data.frame(env$tbl)
  stat_cols <- grep("Placebo|Xanomeline", names(rendered), value = TRUE)
  stat_vals <- unlist(rendered[, stat_cols], use.names = FALSE)

  expect_true(any(stat_vals == "0 (0%)"))
  expect_false(any(grepl("0/0 (NA", stat_vals, fixed = TRUE)))
})
