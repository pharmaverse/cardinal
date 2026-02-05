test_that("fda-table_44() works", {
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
        SEX == "M",
        as.factor(sample(
          c("Erectile Dysfunction", "Gynecomastia"),
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
      SEX == "M",
      OCMQ01SC == "BROAD",
      # filtering here to reduce the size of the table
      AEDECOD %in% c("COUGH", "COLD SWEAT", "SOMNOLENCE", "APPLICATION SITE ERYTHEMA")
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

  # denominator values include only Male subjects in the arm with AEs
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
        OCMQ01NAM ~ "OCMQ (Broad)",
        AEDECOD ~ "Preferred Term"
      )
    )


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
