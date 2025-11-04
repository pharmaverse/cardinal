######################################################################################
# FDA Table 2: Demographics and Baseline Clinical Characteristics, Safety Population #
######################################################################################

# STEP 1: Data pre-processing ------------------------------

adsl <- adsl |>
  filter(
    SAFFL == "Y", # filter for safety population
    TRT01A != "Screen Failure" # filter out treatment
  )


# STEP 2: Build table --------------------------------------

tbl <-
  adsl |>
  tbl_summary(
    # select variables
    include = c(SEX, AGE, AGEGR1, ETHNIC, RACE),
    # stratify by treatment
    by = TRT01A,
    # use type "continuous2" for continuous variables
    type = all_continuous() ~ "continuous2",
    # specify statistics to display
    statistic = list(
      all_continuous() ~ c("{mean} ({sd})", "{median} ({min}, {max})"),
      all_categorical() ~ "{n} ({p}%)"
    ),
    # update AGEGR1 label
    label = AGEGR1 ~ "Age Group, Years"
  ) |>
  # add overall column
  add_overall(last = TRUE)

tbl


# STEP 3: Build ARD ----------------------------------------

ard <- gather_ard(tbl) # extract the ARD from the table

ard
