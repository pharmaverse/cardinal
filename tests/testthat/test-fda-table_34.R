test_that("fda-table_34() works", {

  library(dplyr)
  library(cards)
  library(gtsummary)

  adsl <- pharmaverseadam::adsl
  adae <- pharmaverseadam::adae

  set.seed(1)
  adae <- adae |>
    mutate(
      OCMQ01SC = as.factor(sample(c("BROAD", "NARROW"), nrow(adae), replace = TRUE)),
      OCMQ01NAM = if_else(
        SEX == "F",
        as.factor(sample(
          c("Abnormal Uterine Bleeding", "Amenorrhea", "Bacterial Vaginosis", "Decreased Menstrual Bleeding"),
          n(),
          replace = TRUE
        )),
        NA_character_
      )
    )

  # Pre-processing --------------------------------------------
  data <- adae |>
    filter(
      SAFFL == "Y",
      SEX == "F",
      OCMQ01SC == "NARROW",
      # Filtering to reduce the size of the demo table
      AEDECOD %in% c("APPLICATION SITE IRRITATION", "ERYTHEMA", "APPLICATION SITE PRURITUS", "BACK PAIN")
    ) |>
    select(OCMQ01SC, TRT01A, OCMQ01NAM, AEDECOD, USUBJID) |>
    # setting an explicit level for NA values so empty strata combinations are shown.
    mutate(across(everything(), ~ {
      if (anyNA(.)) {
        forcats::fct_na_value_to_level(as.factor(.), level = "<Missing>")
      } else {
        .
      }
    }))

  # denominator values include only Female subjects in the arm with AEs
  denom <- data |> distinct(USUBJID, TRT01A)

  tbl <- data |>
    tbl_hierarchical(
      by = TRT01A,
      variables = c(OCMQ01NAM, AEDECOD),
      id = USUBJID,
      denominator = denom,
      # variables to calculate rates for
      include = c(AEDECOD),
      label = list(
        OCMQ01NAM ~ "OCMQ (Narrow)",
        AEDECOD ~ "Preferred Term"
      )
    )


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
