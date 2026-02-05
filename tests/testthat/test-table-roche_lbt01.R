test_that("table-roche_lbt01() works", {
  library(gtsummary)
  library(dplyr)
  library(crane)

  adsl <- pharmaverseadam::adsl
  adlb <- pharmaverseadam::adlb

  # Pre-processing --------------------------------------------
  data <- adlb |>
    dplyr::filter(
      SAFFL == "Y", # safety population
      PARAMCD %in% c("ALT", "BILI", "CREAT")
      # This step can be used to filter for valid visits. Since the table creation
      # code specifies the visits, we can omit that step here.
    )

  tbl <- data |>
    filter(
      AVISIT %in% c("Baseline", "Week 4") # specify visits to display in table
    ) |>
    # apply tbl_baseline_chg function to each level of PARAM in the data
    gtsummary::tbl_strata_nested_stack(
      strata = PARAM,
      ~ .x |>
        crane::tbl_baseline_chg(
          baseline_level = "Baseline",
          by = "TRT01A",
          # this dataset has a treatment level called "Screen Failure".
          # Filtering this out as adsl is used to calculate the denominator.
          denominator = adsl |> filter(TRT01A != "Screen Failure")
        )
    ) |>
    # bold lab test labels
    gtsummary::modify_bold(columns = label, rows = tbl_indent_id1 > 0L) |>
    # update header labels
    gtsummary::modify_header(label = "**Lab  \n\U00A0\U00A0\U00A0\U00A0 Visit**") |>
    gtsummary::modify_spanning_header(gtsummary::all_stat_cols() ~ "**{level}**  \nN = {n}")


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$`PARAM="Alanine Aminotransferase (U/L)"`$tbl_baseline_chg)[1:25, ])
  expect_snapshot(as.data.frame(ard$`PARAM="Bilirubin (umol/L)"`$tbl_baseline_chg)[1:25, ])
  expect_snapshot(as.data.frame(ard$`PARAM="Creatinine (umol/L)"`$tbl_baseline_chg)[1:25, ])
})
