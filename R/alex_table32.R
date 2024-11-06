# Load libraries -----
library(dplyr)
library(rlang)
library(cardinal)
library(gtsummary)
library(checkmate)
library(random.cdisc.data)
library(cards)

# Load prerequisites -----
source("R/fda-table_32.R")
source("R/utils.R")

# Load data -----
adsl <- random.cdisc.data::cadsl
advs <- random.cdisc.data::cadvs

# Make both table and ARD -----
result_01 <- make_table_32(
  df = advs,
  return_ard = TRUE,
  lbl_overall = "abc"
)

# All results -----
result_01

# Table -----
tbl <- result_01$table
tbl

# ARD -----
ard <- result_01$ard

## By groups -----
ard_tbl_summary <- ard$tbl_summary
## Overall -----
ard_overall <- ard$add_overall

## Combine the ARDs
ard_combined <-
  bind_ard(
    ard_tbl_summary,
    ard_overall,
    .update = FALSE,
    .distinct = TRUE
  )
