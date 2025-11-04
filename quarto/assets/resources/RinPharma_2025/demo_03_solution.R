################################################################################
# Roche Table LBT01: Laboratory Test Results and Change from Baseline by Visit #
################################################################################

# STEP 1: Data pre-processing ------------------------------

adlb <- adlb |>
  filter(
    SAFFL == "Y", # filter for safety population
    AVISITN < 9000, # filter out invalid visits
    AVISIT %in% c("Baseline", "Week 4", "Week 8"), # keep only visits "Baseline" and "Week 4",
    PARAM %in% c("Albumin (g/L)") # select parameter
  )


# STEP 2: Build table --------------------------------------

tbl <-
  adlb |>
  crane::tbl_baseline_chg(
    baseline_level = "Baseline",
    by = "TRT01A",
    denominator = adsl
  )

tbl


# STEP 3: Build ARD ----------------------------------------

ard <- gather_ard(tbl) # extract the ARD from the table

ard

