test_that("fda-table_37() works", {
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
      # diastolic blood pressure
      PARAMCD == "DIABP",
      # post-baseline visits
      AVISITN >= 2
    ) |>
    # analyze maximum values of each subject
    slice_max(AVAL, n = 1L, by = USUBJID) |>
    # define analysis value cutoffs
    mutate(
      L60 = AVAL < 60,
      G60 = AVAL > 60,
      G90 = AVAL > 90,
      G110 = AVAL > 110,
      GE120 = AVAL >= 120
    )

  ard <- bind_ard(
    ard_tabulate_value(
      data,
      variables = c(L60, G60, G90, G110, GE120),
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
      L60 = "<60",
      G60 = ">60",
      G90 = ">90",
      G110 = ">110",
      GE120 = ">=120"
    )
  ) |>
    modify_header(
      # Update label, add analysis value units
      label ~ paste0("**Diastolic Blood Pressure (", data$VSORRESU[1], ")**"),
      # Add N values to `by` variable labels
      all_stat_cols() ~ "**{level}**  \nN = {n}"
    )


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_ard_summary)[1:25, ])
})
