# Pre-processing

library(dplyr)
library(scda)
library(tern)

# Safety population
adsl <-
  scda::synthetic_cdisc_dataset("rcd_2022_06_27", "adsl") %>%
  tern::df_explicit_na() %>%
  dplyr::filter(SAFFL == "Y")

# Vital signs - DIABP
advs <-
  scda::synthetic_cdisc_dataset("rcd_2022_06_27", "advs") %>%
  tern::df_explicit_na() %>%
  dplyr::filter(PARAMCD == "DIABP" & SAFFL == "Y" & AVISITN >= 1) %>%
  dplyr::select(STUDYID, USUBJID, ARM, ACTARM, PARAMCD, PARAM, AVAL, AVALU, AVISITN, AVISIT) %>%
  dplyr::group_by(USUBJID, PARAMCD) %>%
  dplyr::mutate(maxDIABP = max(AVAL)) %>%
  ungroup() %>%
  dplyr::mutate(
    L60 = (maxDIABP < 60),
    U60 = (maxDIABP > 60),
    U90 = (maxDIABP > 90),
    U110 = (maxDIABP > 110),
    UE120 = (maxDIABP >= 120)
  ) %>%
  formatters::var_relabel(
    L60 = "<60",
    U60 = ">60",
    U90 = ">90",
    U110 = ">110",
    UE120 = ">=120"
  )

# Build layout
lyt <-
  rtables::basic_table(show_colcounts = TRUE) %>%
  rtables::split_cols_by("ARM") %>%
  tern::count_patients_with_flags(
    var = "USUBJID",
    flag_variables = var_labels(advs[, c("L60", "U60", "U90", "U110", "UE120")]),
    table_names = "diabp"
  )


# Build table
result <- build_table(lyt, df = advs, alt_counts_df = adsl)

# Add titles/footnotes

## Top left header
rtables::top_left(result) <- "Diastolic Blood Pressure\n(Pa)"

## Title
formatters::main_title(result) <-
  "Table 32. Percentage of Patients With Maximum Diastolic Blood Pressure by Category of Blood Pressure Postbaseline, Safety Population, Pooled Analysis"

## Footnotes
formatters::main_footer(result) <- c(
  "Source: [include Applicant source, datasets and/or software tools used].",
  "(1) Difference is shown between [treatment arms] (e.g., difference is shown between Drug Name dosage X vs. placebo).",
  "Abbreviations: CI, confidence interval; n, number of patients with indicated blood pressure; N, number of patients in treatment arm with available blood pressure data"
)

# Print result
result
