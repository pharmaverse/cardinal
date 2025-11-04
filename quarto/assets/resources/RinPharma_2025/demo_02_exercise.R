##########################################################################################################
# FDA Table 14: Subjects With Adverse Events by System Organ Class and Preferred Term, Safety Population #
##########################################################################################################

# STEP 1: Data pre-processing ------------------------------

## Dataset used: adsl, adae
## TODO: Filter for safety population

# adsl <- adsl_code_here

# adae <- adae_code_here


# STEP 2: Build table --------------------------------------

## TODO: Use gtsummary::tbl_hierarchical() to create the table
##        - Use 2 hierarchy variables: AEBODSYS and AEDECOD
##        - Split table into columns by TRT01A
##        - Use USUBJID as the ID column
##        - Use adsl for denominator calculations
## TODO: Extra processing:
##        - Use sort_hierarchical() to sort SOCs and AEs in table
##          by descending frequency
##        - Use filter_hierarchical() to only include AEs with frequency > 5

# tbl <- table_code_here


# STEP 3: Build ARD ----------------------------------------

## TODO: Use gtsummary::gather_ard() to extract the ARD from the table

# ard <- ard_code_here

