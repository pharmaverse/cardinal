test_that("fda-table_07() works", {
  library(gtsummary)
  library(dplyr)

  adsl <- pharmaverseadam::adsl |>
    filter(TRT01A != "Screen Failure")

  adae <- pharmaverseadam::adae

  # Use safety population only
  adsl <- adsl |>
    filter(SAFFL == "Y")

  data <- adae |>
    filter(SAFFL == "Y")

  set.seed(1)
  # this data set doesn't have treatment action recorded. We can generate a variable for demonstration.
  aeacn_levels <- c("DRUG INTERRUPTED", "DOSE REDUCED", "DOSE RATE REDUCED", "DOSE INCREASED")
  data <- data |>
    mutate(AEACN = factor(sample(aeacn_levels, size = nrow(data), replace = TRUE),
      levels = aeacn_levels
    ))

  # --- PART 1: Overview of serious AEs
  # Assign a label to each SAE category
  sae_vars <- list(
    "SAE" = "AESER",
    "Death" = "AESDTH",
    "Life-threatening" = "AESLIFE",
    "Initial or prolonged hospitalization" = "AESHOSP",
    "Disability or permanent damage" = "AESDISAB"
  )

  # Summarize SAEs per category
  tbl_sae <-
    lapply(
      seq_along(sae_vars),
      function(i) { # apply per category
        data <- data |>
          filter(.data[[sae_vars[[i]]]] == "Y") |>
          mutate(!!sae_vars[[i]] := names(sae_vars)[i]) # convert flag to a meaningful value
        tbl_hierarchical( # calculate rates
          data = data,
          variables = all_of(sae_vars[[i]]),
          by = TRT01A,
          id = USUBJID,
          denominator = adsl,
          label = sae_vars[[i]] ~ "Event"
        )
      }
    ) |>
    tbl_stack() |>
    modify_indent("label", rows = tbl_id1 != 1, indent = 4L)

  # --- PART 2: Permanent discontinuation
  disc_ae <- adae |>
    # filtering for adverse events with a "discontinued" End of Study Status
    filter(AESER == "Y" & EOSSTT == "DISCONTINUED") |>
    mutate(
      # convert label to a more meaningful value
      AEDISC = "AE leading to permanent discontinuation of treatment"
    )

  tbl_disc_ae <- tbl_hierarchical( # calculate rates
    data = disc_ae,
    variables = AEDISC,
    by = TRT01A,
    id = USUBJID,
    denominator = adsl,
    label = AEDISC ~ "Event"
  )

  # -- PART 3: Dose modification
  dose_mod_ae <- data |>
    mutate(
      AEACN = case_when( # convert to meaningful labels
        AEACN == "DRUG INTERRUPTED" ~ "AE leading to interruption of study drug",
        AEACN == "DOSE REDUCED" ~ "AE leading to reduction of study drug",
        AEACN == "DOSE RATE REDUCED" ~ "AE leading to dose delay of study drug",
        AEACN == "DOSE INCREASED" ~ "Other",
        .default = "Other"
      )
    )

  tbl_dose_mod_ae <- tbl_hierarchical( # calculate rates
    data = dose_mod_ae,
    denominator = adsl,
    id = "USUBJID",
    by = "TRT01A",
    variables = "AEACN",
    label = list(AEACN ~ "Event", ..ard_hierarchical_overall.. = "AE leading to action taken of treatment"),
    overall_row = TRUE
  ) |>
    modify_indent(columns = label, rows = variable == "AEACN", indent = 4L)


  # -- PART 4: Any AE
  tbl_any_ae <- tbl_hierarchical(
    data = adae |> mutate(AESEV = factor(.data$AESEV, ordered = TRUE)),
    variables = AESEV,
    by = TRT01A,
    id = USUBJID,
    denominator = adsl,
    label = list(AESEV ~ "Event", ..ard_hierarchical_overall.. = "Any AE"),
    overall_row = TRUE
  ) |>
    modify_indent(columns = label, rows = variable == "AESEV", indent = 4L)

  # Put it all together
  tbl <- list(tbl_sae, tbl_disc_ae, tbl_dose_mod_ae, tbl_any_ae) |>
    tbl_stack() |>
    modify_header(label = "**Adverse Event Category**")


  ard <- gtsummary::gather_ard(tbl)

  expect_snapshot(as.data.frame(ard[[1]][[1]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[1]][[2]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[1]][[3]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[1]][[4]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[1]][[5]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[2]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[3]]$tbl_hierarchical))
  expect_snapshot(as.data.frame(ard[[4]]$tbl_hierarchical))
})
