test_that("fda-table_36() works", {

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
      # systolic blood pressure
      PARAMCD == "SYSBP",
      # post-baseline visits
      AVISITN >= 2
    ) |>
    # analyze maximum values of each subject
    slice_max(AVAL, n = 1L, by = USUBJID) |>
    # define analysis value cutoffs
    mutate(
      L90 = AVAL < 90, # SYSBP <90
      GE90 = AVAL >= 90, # SYSBP >=90
      GE120 = AVAL >= 120, # SYSBP >=120
      GE140 = AVAL >= 140, # SYSBP >=140
      GE160 = AVAL >= 160, # SYSBP >=160
      GE180 = AVAL >= 180 # SYSBP >=180
    )

  ard <- bind_ard(
    ard_tabulate_value(
      data,
      variables = c(L90, GE90, GE120, GE140, GE160, GE180),
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
      L90 = "<90",
      GE90 = ">=90",
      GE120 = ">=120",
      GE140 = ">=140",
      GE160 = ">=160",
      GE180 = ">=180"
    )
  ) |>
    modify_header(
      # Update label, add analysis value units
      label ~ paste0("**Systolic Blood Pressure (", data$VSORRESU[1], ")**"),
      # Add N values to `by` variable labels
      all_stat_cols() ~ "**{level}**  \nN = {n}"
    )


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_ard_summary)[1:25, ])
})
