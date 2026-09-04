# Unit tests for run_template()

test_that("run_template() errors for an unknown template", {
  expect_error(
    run_template("this-template-does-not-exist"),
    "No template found for 'this-template-does-not-exist'"
  )
})

test_that("run_template() sources a template and returns its environment", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  env <- run_template("fda-table_02")
  expect_type(env, "environment")
  # template objects are available as bindings in the returned environment
  expect_true(exists("ard", envir = env))
})

test_that("run_template() does not leak objects into the caller", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")

  run_template("fda-table_02")
  expect_false(exists("ard", envir = environment(), inherits = FALSE))
})
