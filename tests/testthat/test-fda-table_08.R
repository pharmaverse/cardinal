test_that("fda-table_08() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_08")
  ard <- env$ard

  expect_snapshot(as.data.frame(ard[[1]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[2]]$tbl_hierarchical)[1:25, ])
})

test_that("fda-table_08() orders terms after hierarchical sorting", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_08")

  # sort_hierarchical() drives the term ordering within each section. Assert the
  # observed order so a change in the sort behaviour is caught rather than
  # silently reshuffling the shell.
  body <- env$tbl$table_body

  dthcaus <- body$label[body$variable == "DTHCAUS"]
  aedecod <- body$label[body$variable == "AEDECOD"]

  expect_identical(
    dthcaus,
    c("COMPLETED SUICIDE", "MYOCARDIAL INFARCTION", "SUDDEN DEATH")
  )
  expect_identical(
    aedecod,
    c("COMPLETED SUICIDE", "MYOCARDIAL INFARCTION", "SUDDEN DEATH")
  )
})
