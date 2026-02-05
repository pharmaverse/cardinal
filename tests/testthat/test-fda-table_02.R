test_that("fda-table_02() works", {

  library(dplyr)
  library(gtsummary)

  adsl <- pharmaverseadam::adsl |>
    # removing screen failure observations
    filter(TRT01A != "Screen Failure") |>
    # Adding a numeric biomarker (weight)
    left_join(
      pharmaverseadam::advs |>
        filter(VSTESTCD == "WEIGHT", VISIT == "BASELINE") |>
        select(USUBJID, WEIGHTBL = AVAL),
      by = "USUBJID",
      relationship = "one-to-one"
    )


  # Pre-processing --------------------------------------------
  # Filter for the safety population, x
  data <- adsl |>
    filter(SAFFL == "Y")

  tbl <- data |>
    tbl_summary(
      by = "TRT01A",
      include = c("SEX", "AGE", "AGEGR1", "ETHNIC", "RACE"),
      type = all_continuous() ~ "continuous2", # arranges statistics into multiple lines
      statistic = list(
        all_continuous() ~ c(
          "{mean} ({sd})",
          "{median} ({min}, {max})"
        ),
        all_categorical() ~ "{n} ({p}%)"
      ),
      label = list(AGEGR1 = "Age Group, Years")
    ) |>
    add_overall(last = TRUE, col_label = "**Total Population**  \nN = {N}") |>
    # remove default footnote
    remove_footnote_header(columns = everything())


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_summary)[1:25, ])
  expect_snapshot(as.data.frame(ard$add_overall)[1:25, ])
})
