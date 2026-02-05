test_that("fda-table_17() works", {
  library(dplyr)
  library(cards)
  library(gtsummary)

  adae <- pharmaverseadam::adae |>
    rename(OCMQ01SC = AEHLTCD, OCMQ01NAM = AEHLT)

  adsl <- pharmaverseadam::adsl

  set.seed(23)
  adae$OCMQ01SC <- sample(c("BROAD", "NARROW"), size = nrow(adae), replace = TRUE)

  # Pre-processing --------------------------------------------
  adae <- adae |>
    # safety population
    filter(SAFFL == "Y") |>
    # filter 0CMQ to truncate table
    filter(
      OCMQ01NAM %in%
        c("HLT_0649", "HLT_0644", " HLT_0570", " HLT_0256", "HLT_0742", "HLT_0244", "HLT_0097", "HLT_0738")
    )

  adsl <- adsl |>
    # safety population
    filter(SAFFL == "Y")

  tbl <- adae |>
    select(OCMQ01SC, TRT01A, OCMQ01NAM, AEBODSYS, USUBJID) |>
    # setting an explicit level for NA values so empty strata combinations are shown.
    mutate(across(everything(), ~ {
      if (anyNA(.)) {
        forcats::fct_na_value_to_level(as.factor(.), level = "<Missing>")
      } else {
        .
      }
    })) |>
    tbl_strata(
      strata = OCMQ01SC,
      ~ tbl_hierarchical(
        .x,
        by = TRT01A,
        variables = c(AEBODSYS, OCMQ01NAM),
        id = USUBJID,
        denominator = adsl,
        # variables to calculate rates for
        include = c(OCMQ01NAM),
        label = list(OCMQ01NAM ~ "OCMQ", AEBODSYS ~ "System Organ Class")
      )
    ) |>
    modify_missing_symbol("NA", columns = everything(), rows = row_type == "level")


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard$`OCMQ01SC="BROAD"`$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard$`OCMQ01SC="NARROW"`$tbl_hierarchical)[1:25, ])
})
