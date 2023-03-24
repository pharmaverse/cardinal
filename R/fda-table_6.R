# Pre-processing

library(dplyr)
library(scda)
library(tern)

adsl <- synthetic_cdisc_dataset("rcd_2022_10_13", "adsl") %>% df_explicit_na()
adae <- synthetic_cdisc_dataset("rcd_2022_10_13", "adae") %>%
  df_explicit_na() %>%
  mutate(
    AESEV = factor(AESEV, labels = c("Mild", "Moderate", "Severe")),
    SER = AESER == "Y",
    SERFATAL = AESER == "Y" & AESDTH == "Y",
    SERLIFE = AESER == "Y" & AESLIFE == "Y",
    SERHOSP = AESER == "Y" & AESHOSP == "Y",
    SERDISAB = AESER == "Y" & AESDISAB == "Y",
    SERCONG = AESER == "Y" & AESCONG == "Y",
    SERMIE = AESER == "Y" & AESMIE == "Y",
    WD = AEACN == "DRUG WITHDRAWN",
    DSM = AEACN %in% c("DOSE INCREASED", "DOSE REDUCED", "DOSE RATE REDUCED", "DRUG INTERRUPTED"),
    DSINT = AEACN == "DRUG INTERRUPTED",
    DSRED = AEACN == "DOSE REDUCED",
    DSD = AEACN == "DOSE RATE REDUCED",
    DSMIE = AEACN == "DOSE INCREASED"
  ) %>%
  var_relabel(
    SER = "SAE",
    SERFATAL = "SAEs with fatal outcome",
    SERLIFE = "Life-threatening SAEs",
    SERHOSP = "SAEs requiring hospitalization",
    SERDISAB = "SAEs resulting in substantial disruption of normal life functions",
    SERCONG = "Congenital anomaly or birth defect",
    SERMIE = "Other",
    WD = "AE leading to permanent discontinuation of study drug",
    DSM = "AE leading to dose modification of study drug",
    DSINT = "AE leading to interruption of study drug",
    DSRED = "AE leading to reduction of study drug",
    DSD = "AE leading to dose delay of study drug",
    DSMIE = "Other"
  )

adae <- adae %>%
  filter(
    SAFFL == "Y",
    TRTEMFL == "Y"
  )

# Build layout

lyt <- basic_table(show_colcounts = TRUE) %>%
  split_cols_by("ARM") %>%
  count_patients_with_flags(
    var = "USUBJID",
    flag_variables = var_labels(adae[, "SER"]),
    table_names = "ser"
  ) %>%
  count_patients_with_flags(
    var = "USUBJID",
    flag_variables = var_labels(adae[, c("SERFATAL", "SERLIFE", "SERHOSP", "SERDISAB", "SERCONG", "SERMIE")]),
    .indent_mods = 1L,
    table_names = "ser_fl"
  ) %>%
  count_patients_with_flags(
    var = "USUBJID",
    flag_variables = var_labels(adae[, c("WD", "DSM")]),
    table_names = "ae"
  ) %>%
  count_patients_with_flags(
    var = "USUBJID",
    flag_variables = var_labels(adae[, c("DSINT", "DSRED", "DSD", "DSMIE")]),
    .indent_mods = 1L,
    table_names = "ds"
  ) %>%
  analyze_num_patients(
    var = "USUBJID",
    .stats = "unique",
    .labels = c(unique = "Any AE"),
    show_labels = "hidden"
  ) %>%
  count_occurrences_by_grade(
    var = "AESEV",
    show_labels = "hidden",
    .indent_mods = 1L
  )

# Build table

result <- build_table(lyt, df = adae, alt_counts_df = adsl)

# Add titles/footnotes

main_title(result) <- "Table 6. Overview of Adverse Events(1), Safety Population, Pooled Analyses(2)"

main_footer(result) <- c(
  "Source: [include Applicant source, datasets and/or software tools used].",
  "(1) Treatment-emergent AE defined as [definition]. MedDRA version X.",
  "(2) Duration = [e.g., X-week double-blind treatment period or, median and a range indicating
    pooled trial durations]."
)

fnotes_at_path(
  result,
  rowpath = c("ma_ser_ser_fl_ae_ds_USUBJID_AESEV", "USUBJID", "unique"), # nolint
  colpath = NULL
) <- "Severity as assessed by the investigator"

prov_footer(result) <- c(
  "Abbreviations: AE, adverse event; CI, confidence interval; MedDRA, Medical Dictionary for Regulatory Activities;
    N, number of patients in treatment arm; n, number of patients with at least one event; SAE, serious adverse event"
)

result
