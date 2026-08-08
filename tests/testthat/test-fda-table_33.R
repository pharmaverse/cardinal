test_that("make_table_33() works", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("cards")
  skip_if_not_installed("gtsummary")
  skip_if_not_installed("pharmaverseadam")
  skip_if_not_installed("forcats")

  library(dplyr)

  set.seed(1)
  adae <- pharmaverseadam::adae
  adae <- rename(adae, OCMQ01SC = AEHLTCD, OCMQ01NAM = AEHLT)
  levels(adae$OCMQ01SC) <- c("BROAD", "NARROW")
  adae$OCMQ01SC[is.na(adae$OCMQ01SC)] <- "NARROW"
  adae$OCMQ01NAM <- factor(adae$OCMQ01NAM, levels = c("Erectile Dysfunction", "Gynecomastia"))
  adae$OCMQ01NAM[adae$SEX == "M"] <- as.factor(
    sample(c("Erectile Dysfunction", "Gynecomastia"), sum(adae$SEX == "M"), replace = TRUE)
  )

  data <- adae |>
    filter(
      SAFFL == "Y",
      SEX == "M",
      OCMQ01SC == "NARROW",
      AEDECOD %in% c("COUGH", "COLD SWEAT", "SOMNOLENCE", "APPLICATION SITE ERYTHEMA")
    ) |>
    select(OCMQ01SC, TRT01A, OCMQ01NAM, AEDECOD, USUBJID) |>
    mutate(across(everything(), ~ {
      if (anyNA(.)) forcats::fct_na_value_to_level(as.factor(.), level = "<Missing>") else .
    }))

  denom <- data |> distinct(USUBJID, TRT01A)

  result <- make_table_33(
    df = data,
    denominator = denom,
    arm_var = "TRT01A",
    id_var = "USUBJID",
    ocmqnam_var = "OCMQ01NAM",
    pref_var = "AEDECOD",
    ocmq_scope = "NARROW"
  )

  ard <- result$ard
  expect_snapshot(as.data.frame(ard$tbl_hierarchical)[1:25, ])
})
