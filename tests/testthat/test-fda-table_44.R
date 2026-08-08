test_that("make_table_44() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")
  skip_if_not_installed("forcats")

  library(dplyr)

  set.seed(1)
  adae <- pharmaverseadam::adae |>
    mutate(
      OCMQ01SC = as.factor(sample(c("BROAD", "NARROW"), n(), replace = TRUE)),
      OCMQ01NAM = if_else(
        SEX == "M",
        as.factor(sample(c("Erectile Dysfunction", "Gynecomastia"), n(), replace = TRUE)),
        NA_character_
      )
    )

  data <- adae |>
    filter(
      SAFFL == "Y",
      SEX == "M",
      OCMQ01SC == "BROAD",
      AEDECOD %in% c("COUGH", "COLD SWEAT", "SOMNOLENCE", "APPLICATION SITE ERYTHEMA")
    ) |>
    select(OCMQ01SC, TRT01A, OCMQ01NAM, AEDECOD, USUBJID) |>
    mutate(across(everything(), ~ {
      if (anyNA(.)) forcats::fct_na_value_to_level(as.factor(.), level = "<Missing>") else .
    }))

  denom <- data |> distinct(USUBJID, TRT01A)

  result <- make_table_44(
    df = data,
    denominator = denom,
    arm_var = "TRT01A",
    id_var = "USUBJID",
    ocmqnam_var = "OCMQ01NAM",
    pref_var = "AEDECOD",
    ocmq_scope = "BROAD"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
