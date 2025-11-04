################################################################################
# Roche Table LBT01: Laboratory Test Results and Change from Baseline by Visit #
################################################################################

# STEP 1: Data pre-processing ------------------------------

## Dataset used: adsl, adlb
## TODO: Filter for safety population
## TODO: Filter out invalid visits with AVISITN >= 9000
## TODO: Keep only visits "Baseline", "Week 4", and "Week 8"
## TODOL Keep only parameter "Albumin (g/L)"

# adlb <- adlb_code_here


# STEP 2: Build table --------------------------------------

## TODO: Use crane::tbl_baseline_chg() to create the table
##        - Use baseline level "Baseline"
##        - Split table into columns by TRT01A
##        - Use adsl for denominator calculations

# tbl <- table_code_here


# STEP 3: Build ARD ----------------------------------------

## TODO: Use gtsummary::gather_ard() to extract the ARD from the table

# ard <- ard_code_here
