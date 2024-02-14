test_that("Figure 14 generation works with default values", {
  fig_14_default <- make_fig_14(advs_raw)

  expect_snapshot_ggplot("fig_14_default", fig_14_default, width = 8, height = 6)
})

test_that("Figure 14 generation works with no table", {
  fig_14_notbl <- make_fig_14(advs_raw, add_table = FALSE)

  expect_snapshot_ggplot("fig_14_notbl", fig_14_notbl, width = 8, height = 4)
})

test_that("Figure 14 generation works with custom values", {
  fig_14_custom <- make_fig_14(
    advs_raw,
    paramcd_val = "SYSBP",
    add_cond = expr("ONTRTFL == 'Y' | ABLFL == 'Y'"),
    x_lab = "Analysis Visit",
    y_lab = "Systolic (unit)",
    annotations = list(
      title = "Figure 14. Mean and 95% Confidence Interval of Systolic Blood Pressure Over Time by Treatment Arm, Safety Population, Trial X",
      subtitle = "Source: [include source]"
    ),
    yticks = c(135, 140, 145, 150, 155, 160)
  )

  expect_snapshot_ggplot("fig_14_custom", fig_14_custom, width = 10, height = 6)
})

test_that("Figure 14 generation works with ggtheme argument specified", {
  fig_14_theme <- make_fig_14(
    advs_raw,
    ggtheme = theme_dark()
  )

  expect_snapshot_ggplot("fig_14_theme", fig_14_theme, width = 10, height = 6)
})
