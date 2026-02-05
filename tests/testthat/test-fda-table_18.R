test_that("fda-table_18() works", {

  library(dplyr)
  library(cards)
  library(cardx)
  library(gtsummary)

  adsl <- pharmaverseadam::adsl
  adae <- pharmaverseadam::adae

  set.seed(1)
  adae$AESIFL <- ifelse(adae$AESOC %in% c("VASCULAR DISORDERS"), "Y", "N")

  # Pre-processing --------------------------------------------
  adsl <- adsl |>
    # safety population
    filter(SAFFL == "Y")

  data <- adae |>
    filter(
      # safety population
      SAFFL == "Y",
      # AESI assessment
      AESIFL == "Y"
    )

  # dataset of AE flag variable counts by subject
  data_ae_fl <-
    adsl |>
    select(USUBJID, TRT01A) |>
    # create subject-level flags from adae data
    left_join(
      data |>
        select(USUBJID, AESER, AESDTH, AESLIFE, AESHOSP, AESDISAB, AESCONG, AEACN) |>
        mutate(
          # Serious AE
          ae_ser = any(AESER == "Y"),
          # Serious AE leading to death
          ae_ser_death = any(AESER == "Y" & AESDTH == "Y"),
          ae_ser_life = any(AESER == "Y" & AESLIFE == "Y"),
          ae_ser_hosp = any(AESER == "Y" & AESHOSP == "Y"),
          ae_ser_disab = any(AESER == "Y" & AESDISAB == "Y"),
          ae_ser_cong = any(AESER == "Y" & AESCONG == "Y"),
          # AE resulting in discontinuation
          ae_withdraw = any(AEACN == "DRUG WITHDRAWN"),
          .by = USUBJID
        ),
      by = "USUBJID"
    ) |>
    distinct(USUBJID, .keep_all = TRUE) |>
    # add number of AEs
    left_join(
      data |> summarise(.by = USUBJID, ae_count = n()),
      by = "USUBJID",
      relationship = "one-to-one"
    )

  ## AE grouping flags section --------
  tbl_ae_gp <- data |>
    tbl_hierarchical(
      variables = AEDECOD,
      id = USUBJID,
      denominator = adsl,
      by = TRT01A,
      overall_row = TRUE,
      label = list(
        ..ard_hierarchical_overall.. = "[Insert AE of Interest]",
        AEDECOD = "AE of Interest Assessment"
      )
    ) |>
    modify_indent(columns = label, rows = variable != "..ard_hierarchical_overall..", indent = 4L)

  ## Maximum severity section ---------
  tbl_ae_sev <- data |>
    ard_tabulate_max(variables = AESEV, id = USUBJID, by = TRT01A, denominator = adsl, quiet = TRUE) |>
    tbl_ard_summary(by = TRT01A, label = list(AESEV = "Maximum severity"))

  ## Events section -------------------
  tbl_ae_fl <- data_ae_fl |>
    tbl_summary(
      by = "TRT01A",
      include = c(ae_ser, ae_ser_death, ae_ser_life, ae_ser_hosp, ae_ser_disab, ae_ser_cong, ae_withdraw),
      missing = "no",
      percent = adsl,
      label = list(
        ae_ser = "SAE",
        ae_ser_death = "Death",
        ae_ser_life = "Life-threatening",
        ae_ser_hosp = "Initial or prolonged hospitalization",
        ae_ser_disab = "Disability or permanent damage",
        ae_ser_cong = "Congenital anomaly or birth defect",
        ae_withdraw = "Resulting in treatment discontinuation"
      )
    ) |>
    modify_indent(columns = label, rows = !variable %in% c("ae_ser", "ae_withdraw"), indent = 4L)

  ## Build table ----------------------
  tbl <- tbl_stack(list(tbl_ae_gp, tbl_ae_sev, tbl_ae_fl), quiet = TRUE)


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard[[1]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[2]]$tbl_hierarchical)[1:25, ])
  expect_snapshot(as.data.frame(ard[[3]]$tbl_hierarchical)[1:25, ])
})
