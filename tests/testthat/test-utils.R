# Unit tests for the internal helpers in R/utils.R

test_that("assert_flag_variables() accepts valid flag values", {
  df <- data.frame(
    SAFFL = c("Y", "N", NA),
    SERFL = c("Y", "", "N"),
    stringsAsFactors = FALSE
  )

  expect_true(assert_flag_variables(df, "SAFFL"))
  # returns invisibly
  expect_invisible(assert_flag_variables(df, "SAFFL"))
  # multiple flag variables at once
  expect_true(assert_flag_variables(df, c("SAFFL", "SERFL")))
})

test_that("assert_flag_variables() accepts a custom na_level", {
  df <- data.frame(SAFFL = c("Y", "N", "<Missing>"), stringsAsFactors = FALSE)
  expect_true(assert_flag_variables(df, "SAFFL"))

  df2 <- data.frame(SAFFL = c("Y", "N", "Unknown"), stringsAsFactors = FALSE)
  expect_true(assert_flag_variables(df2, "SAFFL", na_level = "Unknown"))
})

test_that("assert_flag_variables() errors on invalid values", {
  df <- data.frame(SAFFL = c("Y", "X", "Z"), stringsAsFactors = FALSE)
  expect_error(
    assert_flag_variables(df, "SAFFL"),
    "must be a subset of \\{Y, N, NA"
  )
  expect_error(assert_flag_variables(df, "SAFFL"), "X, Z")
})


test_that("alt_counts_df_preproc() returns NULL when input is NULL", {
  expect_null(alt_counts_df_preproc(NULL))
})

test_that("alt_counts_df_preproc() errors when required variables are missing", {
  df <- data.frame(FOO = 1:3)
  expect_error(
    alt_counts_df_preproc(df, id_var = "USUBJID", arm_var = "ARM"),
    "Variables not found in alt_counts_df: USUBJID, ARM"
  )
})

test_that("alt_counts_df_preproc() filters to the safety population", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("tern")

  df <- data.frame(
    USUBJID = c("1", "2", "3"),
    ARM = c("A", "A", "B"),
    SAFFL = c("Y", "N", "Y"),
    stringsAsFactors = FALSE
  )

  res <- alt_counts_df_preproc(df, id_var = "USUBJID", arm_var = "ARM", saffl_var = "SAFFL")
  expect_s3_class(res, "data.frame")
  expect_equal(nrow(res), 2L)
  expect_true(all(res$SAFFL == "Y"))
})

test_that("alt_counts_df_preproc() works without a safety flag", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("tern")

  df <- data.frame(
    USUBJID = c("1", "2"),
    ARM = c("A", "B"),
    stringsAsFactors = FALSE
  )
  res <- alt_counts_df_preproc(df, id_var = "USUBJID", arm_var = "ARM")
  expect_s3_class(res, "data.frame")
  expect_equal(nrow(res), 2L)
})

test_that("alt_counts_df_preproc() validates the flag variable", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("tern")

  df <- data.frame(
    USUBJID = c("1", "2"),
    ARM = c("A", "B"),
    SAFFL = c("Y", "BAD"),
    stringsAsFactors = FALSE
  )
  expect_error(
    alt_counts_df_preproc(df, id_var = "USUBJID", arm_var = "ARM", saffl_var = "SAFFL"),
    "must be a subset of"
  )
})


test_that("basic_table_annot() returns a layout with and without annotations", {
  skip_if_not_installed("rtables")

  lyt <- basic_table_annot()
  expect_s4_class(lyt, "PreDataTableLayouts")

  lyt_annot <- basic_table_annot(
    show_colcounts = TRUE,
    annotations = list(
      title = "My Title",
      subtitles = "A subtitle",
      main_footer = "Main footer",
      prov_footer = "Provenance"
    )
  )
  expect_s4_class(lyt_annot, "PreDataTableLayouts")
})


test_that("split_cols_by_arm() splits with and without an overall column", {
  skip_if_not_installed("rtables")

  lyt <- split_cols_by_arm(rtables::basic_table(), arm_var = "ARM")
  expect_s4_class(lyt, "PreDataTableLayouts")

  lyt_overall <- split_cols_by_arm(
    rtables::basic_table(),
    arm_var = "ARM",
    lbl_overall = "All Patients"
  )
  expect_s4_class(lyt_overall, "PreDataTableLayouts")
})

test_that("split_cols_by_arm() supports risk difference columns", {
  skip_if_not_installed("rtables")
  skip_if_not_installed("tern")

  lyt <- split_cols_by_arm(
    rtables::basic_table(),
    arm_var = "ARM",
    risk_diff = list(arm_x = "A: Drug X", arm_y = "B: Placebo")
  )
  expect_s4_class(lyt, "PreDataTableLayouts")

  lyt_custom <- split_cols_by_arm(
    rtables::basic_table(),
    arm_var = "ARM",
    risk_diff = list(
      arm_x = "A: Drug X",
      arm_y = "B: Placebo",
      col_label = "Risk Diff",
      pct = FALSE
    )
  )
  expect_s4_class(lyt_custom, "PreDataTableLayouts")
})
