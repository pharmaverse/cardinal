# Pre-processing
library(dplyr)
library(scda)
library(tern)
library(rlistings)

# Deaths
adae <-
  synthetic_cdisc_dataset("rcd_2022_06_27", "adae") %>%
  filter(SAFFL == "Y" & AESDTH == "Y") %>%
  select(
    STUDYID, USUBJID, ACTARM, ACTARMCD, AGE, SEX, DTHCAT, DTHCAUS, ASTDY, AESDTH, AEOUT, DTHADY
  ) %>%
  mutate(
    AGESEX = paste0(AGE, "/", SEX),
    DTHADY = as.character(DTHADY)
  ) %>%
  distinct(USUBJID, DTHCAT, DTHCAUS, DTHADY, .keep_all = TRUE)

# Dosing
adex <-
  synthetic_cdisc_dataset("rcd_2022_06_27", "adex") %>%
  filter(PARAMCD == "TDOSE") %>%
  select(USUBJID, PARAMCD, PARAM, AVAL, AVALU, TRTSDT, TRTEDT) %>%
  mutate(
    DOSDUR = (TRTEDT - TRTSDT + 1) %>% as.character(),
    DOSAGE = paste0(AVAL, " ", AVALU)
  )

# Join
tbl_join <-
  adae %>%
  left_join(adex, by = "USUBJID") %>%
  select(ACTARM, USUBJID, AGESEX, DOSAGE, DOSDUR, DTHADY, DTHCAUS, DTHCAT) %>%
  var_relabel(
    ACTARM = "Study Arm",
    USUBJID = "Patient ID",
    AGESEX = "Age/\nGender",
    DOSAGE = "Dosage",
    DTHADY = "Study\nDay of\nDeath",
    DOSDUR = "Dosing\nDuration\n(Days)",
    DTHCAUS = "Cause of Death\nMedDRA\nPreferred Term",
    DTHCAT = "Cause of Death\nPreferred Term"
  ) %>%
  df_explicit_na(na_level = "") %>%
  arrange(ACTARM, USUBJID, AGESEX, DOSAGE, DOSDUR, DTHADY)

# Listing
final_list <-
  as_listing(
    tbl_join,
    key_cols = c("ACTARM", "USUBJID", "AGESEX", "DOSAGE", "DOSDUR", "DTHADY"),
    main_title = "Table 8. All Individual Patient Deaths, Safety Population, Pooled Analyses (1)",
    main_footer =
      "Source: [include Applicant source, datasets and/or software tools used].
(1) Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled trial durations].
Abbreviations: MedDRA, Medical Dictionary for Regulatory Activities; PT, preferred term"
  )

head(final_list)
