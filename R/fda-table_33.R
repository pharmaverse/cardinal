# Pre-processing

library(tidyverse)
library(scda)
library(tern)

# Safety population
adsl <-
  scda::synthetic_cdisc_dataset("rcd_2022_06_27", "adsl") %>%
  dplyr::filter(SAFFL == "Y")

# Vital signs
advs <-
  scda::synthetic_cdisc_dataset("rcd_2022_06_27", "advs") %>%
  dplyr::filter(PARAMCD %in% c("DIABP", "SYSBP") & SAFFL == "Y" & AVISITN >= 1) %>% # nolint
  dplyr::group_by(USUBJID, PARAMCD) %>%
  dplyr::mutate(
    maxDIABP = if_else(PARAMCD == "DIABP", max(AVAL), NA_real_),
    maxSYSBP = if_else(PARAMCD == "SYSBP", max(AVAL), NA_real_)
  ) %>%
  dplyr::mutate(
    SBP90 = (PARAMCD == "SYSBP" & maxSYSBP < 90),
    DBP60 = (PARAMCD == "DIABP" & maxDIABP < 60),
  ) %>%
  formatters::var_relabel(
    SBP90 = "SBP <90",
    DBP60 = "DBP <60"
  )

# Build layout
lyt <-
  rtables::basic_table(show_colcounts = TRUE) %>%
  rtables::split_cols_by("ARM") %>%
  tern::count_patients_with_flags(
    var = "USUBJID",
    flag_variables = var_labels(advs[, c("SBP90", "DBP60")])
  )

# Build table
result <- build_table(lyt, df = advs, alt_counts_df = adsl)

# Add titles/footnotes

## Top left header
rtables::top_left(result) <- "Diastolic Blood Pressure\n(Pa)"

## Title
formatters::main_title(result) <-
  "Table 33. Percentage of Patients Meeting Specific Hypotension Levels Postbaseline, Safety Population, Pooled Analysis" # nolint

## Footnotes
formatters::main_footer(result) <- c(
  "Source: [include Applicant source, datasets and/or software tools used].",
  "(1) Difference is shown between [treatment arms] (e.g., difference is shown between Drug Name dosage X vs. placebo).", # nolint
  "Abbreviations: CI, confidence interval; N, number of patients in treatment arm with available blood pressure data; n, number of patients with indicated blood pressure" # nolint
)

# Print result
print(result)
