test_that("custom table works", {

  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")
  skip_if_not_installed("forcats")
  skip_if_not_installed("crane")

  library("dplyr")
  library("gtsummary")
  library("forcats")
  library("crane")

  adam_db <- list(
    adsl = pharmaverseadam::adsl,
    adae = pharmaverseadam::adae
  )
  # data pre-processing ----------------------------------------------------------
  df_aet02 <-
    adam_db$adae |>
    mutate(
      # convert hierarchy variables to factor and set an explicit NA level
      across(
        c(AEBODSYS, AEDECOD),
        ~ .x |> fct_na_value_to_level(level = "No Coding Available")
      )
    )

  # build AET02 ------------------------------------------------------------------
  expect_no_warning(
    df_aet02 |>
      tbl_hierarchical_rate_and_count(
        by = "TRT01A",
        variables = c(AEBODSYS, AEDECOD),
        denominator = adam_db$adsl,
        label = list(
          AEBODSYS ~ "MedDRA System Organ Class",
          AEDECOD ~ "MedDRA Preferred Term"
        ),
        # sort by descending rate at the SOC and AE levels
        sort = "descending"
      )
  )
})
