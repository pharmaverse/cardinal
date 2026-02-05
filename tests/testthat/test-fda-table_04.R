test_that("fda-table_04() works", {
  library(dplyr)
  library(gtsummary)

  adsl <- pharmaverseadam::adsl |>
    filter(TRT01A != "Screen Failure") # Remove screen failure observations

  # Pre-processing --------------------------------------------
  pop_vars <- c("rand_fl", "ITTFL", "SAFFL", "prot_fl")
  lbl_pop_vars <- c("Subjects randomized", "ITT population", "Safety population", "Per-protocol population")

  data <- adsl |>
    mutate(
      across(all_of("SAFFL"), ~ . == "Y"),
      ITTFL = !is.na(RANDDT),
      rand_fl = !is.na(RANDDT),
      prot_fl = EOSSTT == "COMPLETED"
    )

  tbl <- data |>
    tbl_summary(
      by = "TRT01A",
      statistic = list(all_dichotomous() ~ "{n} ({p}%)"),
      include = all_of(pop_vars),
      digits = list(all_categorical() ~ c(0, 1)),
      label = as.list(lbl_pop_vars) |> setNames(pop_vars)
    ) |>
    # Define which variables are children of parent variables
    modify_indent(
      columns = "label",
      rows = variable != "rand_fl",
      indent = 4L
    ) |>
    modify_header(label = "**Population**")


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_summary)[1:25, ])
})
