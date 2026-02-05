test_that("fda-table_09() works", {

  library(dplyr)
  library(cards)
  library(gtsummary)

  adae <- pharmaverseadam::adae
  adex <- pharmaverseadam::adex

  # Pre-processing --------------------------------------------
  # deaths
  adae <- adae |>
    filter(
      # safety population
      SAFFL == "Y",
      # deaths
      DTHFL == "Y"
    ) |>
    # select variables from `adae` to include in final result
    select(USUBJID, TRT01A, AGE, SEX, DTHADY, DTHCAUS) |>
    # keep one row per unique ID
    distinct(USUBJID, DTHCAUS, DTHADY, .keep_all = TRUE)

  # dosing
  adex <- adex |>
    filter(
      # safety population
      SAFFL == "Y",
      # total dosages
      PARAMCD == "TDOSE"
    ) |>
    # select variables from `adex` to include in final result
    select(USUBJID, AVAL, TRTSDT, TRTEDT) |>
    mutate(
      # derive dosage duration
      DOSDUR = (TRTEDT - TRTSDT + 1) |> as.character()
    )

  # combine all data
  data <- left_join(adae, adex, by = "USUBJID") |>
    select(TRT01A, USUBJID, AGE, SEX, DOSDUR, DTHADY, DTHCAUS) |>
    arrange()

  tbl <- as_gtsummary(data) |>
    # set table header labels
    modify_header(
      TRT01A = "**Treatment Arm**",
      USUBJID = "**Unique  \n Subject ID**",
      AGE = "**Age**",
      SEX = "**Sex**",
      DOSDUR = "**Dosing**  \n **Duration**  \n **(Days)**",
      DTHADY = "**Study**  \n **Day of**  \n **Death**",
      DTHCAUS = "**Cause of Death**"
    ) |>
    # align all columns left
    modify_column_alignment(everything(), align = "left")

  # as_gtsummary doesn't create ard
  expect_snapshot(as.data.frame(data))
})
