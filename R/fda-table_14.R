# Pre-processing

library(dplyr)
library(scda)
library(tern)

adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae") %>%
  df_explicit_na()

adae <- adae %>%
  filter(
    SAFFL == "Y"
    )


# Build layout

lyt <- basic_table(show_colcounts = TRUE) %>%
  split_cols_by("SMQ01SC")%>%
  split_cols_by("ARM") %>%
  split_rows_by(
    "AEBODSYS",
    child_labels = "visible",
    nested = TRUE,
    label_pos = "topleft",
    split_label = obj_label(adae$AEBODSYS)
  ) %>%
  count_occurrences(vars = "SMQ01NAM", drop = FALSE)

# Build table

result <- build_table(lyt, df = adae)

# Add titles/footnotes

main_title(result) <- "Table 14. Patients With Adverse Events(1) by System Organ Class and FDA Medical Query, Safety Population, Pooled Analyses(2)"

main_footer(result) <- c(
  "Source: [include Applicant source, datasets and/or software tools used",
  "(1) Treatment-emergent AE defined as [definition]. MedDRA version X.",
  "(2) Duration = [e.g., X-week double-blind treatment period or, median and a range indicating
    pooled trial durations].",
  "(3) Difference is shown between [treatment arms] (e.g., difference is shown between Drug Name dosage X vs. placebo)",
  "(4) Each FMQ is aligned to a single SOC based on clinical judgement. Howevere, please beaware that some FMQs may contain PTs from more than one SOC."
)

prov_footer(result) <- c(
  "Abbreviations: CI, confidence interval; FMQ, FDA Medical Query; MedDRA, Medical Dictionary for Regulatory Activities;
    N, number of patients in treatment arm; n, number of patients with at least one event; SOC, System Organ Class"
)

result
