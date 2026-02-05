test_that("fda-table_06() works", {

  library(dplyr)
  library(cards)
  library(gtsummary)

  adsl <- pharmaverseadam::adsl |>
    filter(TRT01A != "Screen Failure") # Remove screening failure observations

  # Pre-processing --------------------------------------------
  data <- adsl |>
    # Filter for the safety population
    filter(SAFFL == "Y") |>
    # Calculate treatment duration values
    mutate(TRTDUR = lubridate::interval(.data[["TRTSDTM"]], .data[["TRTEDTM"]])) |>
    mutate(
      # Get treatment duration values in months (for analysis of subjects treated)
      TRTDUR_MONTHS = TRTDUR |> as.numeric("months"),
      # Specify unit to use for duration of treatment (for analysis of treatment duration)
      TRTDUR = TRTDUR |> as.numeric("days")
    ) |>
    # Add one flag variable for each treatment duration range
    mutate(
      D_ANY = TRTDUR >= 1, # duration >=1 day
      D_GT1 = TRTDUR_MONTHS >= 1, # duration >=1 month
      D_GT3 = TRTDUR_MONTHS >= 3, # duration >=3 months
      D_GT6 = TRTDUR_MONTHS >= 6, # duration >=6 months
      D_GT12 = TRTDUR_MONTHS >= 12 # duration >=12 months
    )

  # Stack ARD results of two analyses
  ard <- data |>
    ard_stack(
      .by = TRT01A,

      # Analysis of treatment duration ----------------------
      ard_summary(
        variables = TRTDUR,
        statistic = everything() ~ continuous_summary_fns(
          # Specify which default statistics to include
          summaries = c("mean", "sd", "median", "min", "max", "p25", "p75"),
          # Specify custom statistics to include
          other_stats = list(
            # Add total exposure statistic
            tot_exposure = \(x) sum(x),
            # Add total person years statistic (using same unit specified in pre-processing)
            person_yrs = \(x) as.numeric(lubridate::duration(sum(x), "days"), "years")
          )
        )
      ),

      # Analysis of subjects treated ------------------------
      ard_tabulate_value(
        variables = c(D_ANY, D_GT1, D_GT3, D_GT6, D_GT12),
        # Calculate the n and % statistics for each flag variable
        statistic = everything() ~ c("n", "p")
      )
    )

  # Use info from the ARD previously generated to create a table
  tbl <- tbl_ard_summary(
    ard,
    by = TRT01A,
    # Use type "continuous2" to display statistics on separate lines
    type = list(TRTDUR = "continuous2"),
    # Specify summary statistics to display for treatment duration variable
    statistic = all_continuous() ~ c(
      "{mean} ({sd})", "{median} ({min}, {max})",
      iqr = "{p25} - {p75}", "{tot_exposure} ({person_yrs})"
    ),
    # Add descriptive labels for each variable
    label =
      list(
        TRTDUR = "Duration of Treatment, days",
        D_ANY = ">= 1 day",
        D_GT1 = ">=1 month",
        D_GT3 = ">=3 months",
        D_GT6 = ">=6 months",
        D_GT12 = ">=12 months"
      )
  ) |>
    # Add custom statistic labels for treatment duration variable, keep other stat labels as is
    add_stat_label(
      label = list(
        TRTDUR ~ c("Mean (SD)", "Median (min, max)", "Interquartile range", "Total exposure (person-years)"),
        all_dichotomous() ~ NA_character_
      )
    ) |>
    # Add label over analysis of group of flag variables
    add_variable_group_header("Subjects Treated, by duration, n (%)", all_dichotomous()) |>
    # Update header labels
    modify_header(
      label ~ "**Parameter**",
      all_stat_cols() ~ "**{level}**  \nN = {n}"
    )


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_ard_summary)[1:25, ])
})
