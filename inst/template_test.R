test_that("<<function_name>>() works", {

  <<template_body>>

  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard)[1:25, ])
})
