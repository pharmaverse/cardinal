##########################################################################################################
# FDA Table 14: Subjects With Adverse Events by System Organ Class and Preferred Term, Safety Population #
##########################################################################################################

# STEP 1: Data pre-processing ------------------------------

adae <- adae |>
  filter(SAFFL == "Y") # filter for safety population


# STEP 2: Build table --------------------------------------

tbl <-
  adae |>
  tbl_hierarchical(
    # select hierarchy variables
    variables = c(AEBODSYS, AEDECOD),
    # stratify by treatment
    by = TRT01A,
    # set ID column
    id = USUBJID,
    # select dataset for denominator counts
    denominator = adsl
  ) |>
  # sort by descending frequency
  sort_hierarchical() |>
  # filter out rows with less than 5 AEs
  filter_hierarchical(n_overall > 5)

tbl


# STEP 3: Build ARD ----------------------------------------

ard <- gather_ard(tbl) # extract the ARD from the table

ard
