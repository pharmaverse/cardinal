set.seed(1)
adsl <- adsl_raw
adsl$TRTSDTM <- adsl$TRTSDTM[1]
adsl$TRTEDTM <- adsl$TRTSDTM + lubridate::days(sample(0:400, nrow(adsl), replace = TRUE))

test_that("Figure 01 generation works with default values", {
  fig_01_default <- withr::with_options(
    opts_partial_match_old,
    make_fig_01(adsl)
  )

  expect_snapshot_ggplot("fig_01_default", fig_01_default, width = 8, height = 5)
})

test_that("Figure 01 generation works with no table", {
  fig_01_notbl <- withr::with_options(
    opts_partial_match_old,
    make_fig_01(adsl, add_table = FALSE)
  )

  expect_snapshot_ggplot("fig_01_notbl", fig_01_notbl, width = 8, height = 3)
})

test_that("Figure 01 generation works with custom values", {
  fig_01_custom <- withr::with_options(
    opts_partial_match_old,
    make_fig_01(
      adsl,
      u_trtdur = "years",
      annotations = list(
        title = "Figure 1. Time to Permanent Discontinuation of Study Drug, Safety Population, Pooled Analyses"
      ),
      xticks = c(0, 0.25, 0.5, 0.75, 1, 1.1)
    )
  )

  expect_snapshot_ggplot("fig_01_custom", fig_01_custom, width = 10, height = 5)
})

test_that("Figure 01 generation works with ggtheme argument specified", {
  fig_01_theme <- withr::with_options(
    opts_partial_match_old,
    make_fig_01(
      adsl,
      ggtheme = theme_dark()
    )
  )

  expect_snapshot_ggplot("fig_01_theme", fig_01_theme, width = 10, height = 6)
})
