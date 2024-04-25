set.seed(1)
adsl <- adsl_raw
adsl$EOSDY <- sample(0:400, nrow(adsl), replace = TRUE)

test_that("Figure 02 generation works with default values", {
  fig_02_default <- withr::with_options(
    opts_partial_match_old,
    make_fig_02(adsl)
  )

  expect_snapshot_ggplot("fig_02_default", fig_02_default, width = 8, height = 5)
})

test_that("Figure 02 generation works with no table", {
  fig_02_notbl <- withr::with_options(
    opts_partial_match_old,
    make_fig_02(adsl, add_table = FALSE)
  )

  expect_snapshot_ggplot("fig_02_notbl", fig_02_notbl, width = 8, height = 3)
})

test_that("Figure 02 generation works with custom values", {
  fig_02_custom <- withr::with_options(
    opts_partial_match_old,
    make_fig_02(
      adsl,
      u_trtdur = "years",
      annotations = list(
        title = "Figure 2. Time to Last Follow Up, Safety Population, Pooled Analyses"
      ),
      xticks = c(0, 0.25, 0.5, 0.75, 1, 1.1)
    )
  )

  expect_snapshot_ggplot("fig_02_custom", fig_02_custom, width = 10, height = 5)
})

test_that("Figure 02 generation works with ggtheme argument specified", {
  fig_02_theme <- withr::with_options(
    opts_partial_match_old,
    make_fig_02(
      adsl,
      ggtheme = theme_dark()
    )
  )

  expect_snapshot_ggplot("fig_02_theme", fig_02_theme, width = 10, height = 6)
})
