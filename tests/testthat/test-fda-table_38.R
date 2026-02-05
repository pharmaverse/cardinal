test_that("fda-table_38() works", {

  library(dplyr)
  library(cards)
  library(gtsummary)

  adsl <- pharmaverseadam::adsl
  advs <- pharmaverseadam::advs

  # Pre-processing --------------------------------------------
  adsl <- adsl |>
    filter(SAFFL == "Y") # safety population

  data <- advs |>
    filter(
      # safety population
      SAFFL == "Y",
      # diastolic & systolic blood pressure
      PARAMCD %in% c("DIABP", "SYSBP"),
      # post-baseline visits
      AVISITN >= 2
    ) |>
    # analyze minimum values per parameter of each subject
    slice_min(AVAL, n = 1L, by = c(USUBJID, PARAMCD)) |>
    # define analysis value cutoffs per parameter
    mutate(
      SBP90 = PARAMCD == "SYSBP" & AVAL < 90, # SYSBP <90
      DBP60 = PARAMCD == "DIABP" & AVAL < 60 # DIABP <60
    )

  ard <- bind_ard(
    ard_tabulate_value(
      data,
      variables = c(SBP90, DBP60),
      by = TRT01A,
      statistic = ~ c("n", "p"),
      # denominator values are number of subjects in arm with BP data
      denominator = data |> distinct(USUBJID, TRT01A)
    ),
    # ARD for header N values
    ard_tabulate(adsl, variables = TRT01A)
  )

  tbl <- tbl_ard_summary(
    ard,
    by = TRT01A,
    # Add labels for each range
    label = list(
      SBP90 = "SBP<90",
      DBP60 = "DBP<60"
    )
  ) |>
    modify_header(
      # Update label, add analysis value units
      label ~ paste0("**Blood Pressure (", data$VSORRESU[1], ")**"),
      # Add N values to `by` variable labels
      all_stat_cols() ~ "**{level}**  \nN = {n}"
    )


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_ard_summary)[1:25, ])
})
