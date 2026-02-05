test_that("fda-table_33() works", {

  library(dplyr)
  library(cards)
  library(gtsummary)

  adsl <- pharmaverseadam::adsl
  adae <- pharmaverseadam::adae

  set.seed(1)
  adae <- rename(adae, OCMQ01SC = AEHLTCD, OCMQ01NAM = AEHLT)
  levels(adae$OCMQ01SC) <- c("BROAD", "NARROW")
  adae$OCMQ01SC[is.na(adae$OCMQ01SC)] <- "NARROW"
  adae$OCMQ01NAM <- factor(adae$OCMQ01NAM, levels = c("Erectile Dysfunction", "Gynecomastia"))
  adae$OCMQ01NAM[adae$SEX == "M"] <- as.factor(sample(c("Erectile Dysfunction", "Gynecomastia"), sum(adae$SEX == "M"), replace = TRUE))


  # Pre-processing --------------------------------------------
  data <- adae |>
    filter(
      SAFFL == "Y",
      SEX == "M",
      OCMQ01SC == "NARROW",
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
        OCMQ01NAM ~ "OCMQ (Narrow)",
        AEDECOD ~ "Preferred Term"
      )
    )


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
