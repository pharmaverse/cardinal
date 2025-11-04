######################################################################################
# FDA Table 2: Demographics and Baseline Clinical Characteristics, Safety Population #
######################################################################################

# STEP 1: Data pre-processing ------------------------------

## Dataset used: adsl
## TODO: Filter for safety population
## TODO: Filter out the "Screen Failure" treatment from variable TRT01A

# adsl <- adsl_code_here


# STEP 2: Build table --------------------------------------

## TODO: Use gtsummary::tbl_summary() to create the table
##        - Summarize variables: SEX, AGE, AGEGR1, ETHNIC, RACE
##        - Split table into columns by TRT01A
##        - Use type "continuous2" for continuous variables so that
##          statistics are displayed on multiple lines
##        - For continuous variables, display statistics: "{mean} ({sd})", "{median} ({min}, {max})"
##        - For categorical variables, display statistic: "{n} ({p}%)"
##        - Update the label for the AGEGR1 variable to "Age Group, Years"
##        - Use gtsummary::add_overall() to add an overall column

# tbl <- table_code_here


# STEP 3: Build ARD ----------------------------------------

## TODO: Use gtsummary::gather_ard() to extract the ARD from the table

# ard <- ard_code_here
