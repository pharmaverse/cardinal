# Pre-processing

library(dplyr)
library(scda)
library(tern)

adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae") %>%
  formatters::var_relabel(
    AETERM = "Preferred Term(3)" # Choose variable to use as Preferred Term
  )

adae <- adae %>%
  filter(
    SAFFL == "Y"
  )

# Build layout

lyt <- basic_table(show_colcounts = TRUE) %>%
  split_cols_by("ARM") %>%
  count_occurrences(
    vars = "AETERM"
  ) %>%
  append_varlabels(
    df = adae,
    vars = "AETERM"
  )

# Build table

result <- build_table(lyt, df = adae, alt_counts_df = adsl)

# Prune table

x <- 0.05 # Minimum cut-off percentage

row_condition <- has_fraction_in_any_col(
  atleast = x,
  col_names = names(table(adsl$ARM))
)
result <- prune_table(result, keep_rows(row_condition))

# Add titles/footnotes

main_title(result) <- paste0(
  "Table 13. Patients With Common Adverse Events(1) Occurring at ≥", x * 100,
  "% Frequency, Safety Population, Pooled Analyses(2)"
)

main_footer(result) <- c(
  "Source: [include Applicant source, datasets and/or software tools used].",
  "(1) Treatment-emergent adverse event defined as [definition]. MedDRA version X.",
  "(2) Duration = [e.g., X week double-blind treatment period or median and a range indicating
    pooled trial durations].",
  "(3) Coded as MedDRA preferred terms."
)

prov_footer(result) <- c(
  "Abbreviations: CI, confidence interval; MedDRA, Medical Dictionary for Regulatory Activities;
    N, number of patients in treatment arm; n, number of patients with adverse event; PT, preferred term"
)

result
