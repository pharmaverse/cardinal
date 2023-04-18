library(dplyr)
library(tern)

# Load and pre-process data

adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
ntrtem <- sample(adsl[["USUBJID"]], size = as.integer(nrow(adsl) / 3)) # assign subjects to nontreatment emergent AE's

adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae") %>%
  filter(SAFFL == "Y", DTHFL == "Y") %>% # not actually necessary because all observations are flagged as Y
  mutate(
    TRTEMFL_ = ifelse(USUBJID %in% ntrtem, "N", "Y"), # produce dummy data
    trtemlab = case_when( # produce label column
      TRTEMFL_ == "Y" ~ "Treatment-emergent deaths",
      TRTEMFL_ == "N" ~ "Nontreatment-emergent deaths",
      .default = "Other"
    )
  )


# Set layout
# Note: Does not count re-animated patients who "died twice"

lyt <- basic_table(show_colcounts = TRUE) %>%
  split_cols_by("ARM") %>%
  analyze_num_patients(
    var = "USUBJID",
    .stats = "unique",
    .labels = c(unique = "Total deaths"),
    show_labels = "hidden"
  ) %>%
  count_occurrences(
    vars = "DTHCAUS",
    .indent_mods = 1,
    denom = "n" # relative to all deaths rather than to all patients
  ) %>%
  split_rows_by("TRTEMFL_", labels_var = "trtemlab") %>%
  analyze_num_patients(
    var = "USUBJID",
    .stats = "unique",
    .labels = c(unique = "Total"),
    show_labels = "hidden"
  ) %>%
  count_occurrences(
    vars = "DTHCAUS",
    denom = "n", # relative to row group, i.e. parent
    drop = FALSE
  ) %>%
  rtables::append_topleft(c("", "Deaths")) # empty string to force position right above horizontal line


# Build table

tbl <- build_table(lyt, df = adae, alt_counts_df = adsl)

# Add titles/footnotes

main_title(tbl) <- paste(
  "Table 7. Deaths, Safety Population, Pooled Analyses (1)"
)

main_footer(tbl) <- c(
  "Source: [include Applicant source, datasets and/or software tools used].",
  "(1) Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled trial
    durations]."
)

fnotes_at_path(tbl, c("TRTEMFL_", "Y")) <- "Treatment-emergent AE defined as [definition]. MedDRA version X." # nolint
fnotes_at_path(tbl, c("TRTEMFL_", "N")) <- paste( # nolint
  "Defined as [(e.g., deaths beyond the protocol-defined, treatment-emergent adverse event period in the",
  "same trial or deaths from other trials with drug)].",
  sep = "\n      "
)

prov_footer(tbl) <- c(
  "Abbreviations: AE, adverse event; MedDRA, Medical Dictionary for Regulatory Activities; N, number of patients
    in treatment arm; n, number of patients with adverse event"
)

result <- prune_table(tbl) # drop rows where all columns have zero counts
result
