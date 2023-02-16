# Pre-processing

library(dplyr)
library(scda)
library(tern)

adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae") %>%
  formatters::var_relabel(
    AETERM = "Preferred Term" # Choose variable to use as Preferred Term
  )

adae <- adae %>%
  filter(
    SAFFL == "Y",
    AESER == "Y"
  )

# Build layout

lyt <- basic_table(show_colcounts = TRUE) %>%
  split_cols_by("ARM") %>%
  analyze_num_patients(
    vars = "USUBJID",
    .stats = "unique",
    .labels = c(unique = "Any SAE")
  ) %>%
  split_rows_by(
    var = "AESOC",
    split_fun = drop_split_levels,
    split_label = "System Organ Class",
    label_pos = "topleft"
  ) %>%
  summarize_num_patients(
    var = "USUBJID",
    .stats = "unique",
    .labels = c(unique = NULL)
  ) %>%
  count_occurrences(
    vars = "AETERM"
  ) %>%
  append_varlabels(
    df = adae,
    vars = "AETERM",
    indent = 1L
  )

# Build table

result <- build_table(lyt, df = adae, alt_counts_df = adsl)

# Add titles/footnotes

main_title(result) <- paste(
  "Table 9. Patients With Serious Adverse Events(1) by System Organ Class and",
  "Preferred Term, Safety Population, Pooled Analyses(2)"
)
main_footer(result) <- c(
  "Source: [include Applicant source, datasets and/or software tools used].",
  "(1) Defined as any untoward medical occurrence that, at any dose that results in death, is life-threatening,
    requires hospitalization or prolongation of existing hospitalization, results in persistent incapacity or
    substantial disruption of the ability to conduct normal life functions, or is a congenital anomaly or
    birth defect.",
  "(2) Duration = [e.g., X week double-blind treatment period or median and
    a range indicating pooled trial durations]."
)
prov_footer(result) <- c(
  "Abbreviations: AE, adverse event; CI, confidence interval; N, number of patients in treatment arm;
    n, number of patients with adverse event; PT, preferred term; SAE, serious adverse event; SOC, System Organ Class"
)

result
