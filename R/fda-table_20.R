# Pre-processing

library(dplyr)
library(scda)
library(tern)

adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl") %>%
  df_explicit_na()

adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae") %>%
  mutate(
    aesev = factor(
      case_when(
        AESEV == "MILD" ~ "Mild",
        AESEV == "MODERATE" ~ "Moderate",
        AESEV == "SEVERE" ~ "Severe"
      ),
      levels = c("Severe", "Moderate", "Mild")
    ),
    # create adverse events of special interest flag
    AESIFL = case_when(
      AESOC == "cl A" ~ "Y",
      AESOC == "cl D" ~ "Y",
      TRUE ~ "N"
    ),
    # create flag for laboratory assessment
    AELABFL = sample(c("Y", "N"), n(), replace = TRUE)
  ) %>%
  filter(
    SAFFL == "Y",
    AESIFL == "Y"
  ) %>%
  df_explicit_na()


lyt <- basic_table(show_colcounts = TRUE) %>%
  split_cols_by(var = "ARM") %>%
  append_topleft(c("", "AESI Assessment")) %>%
  count_patients_with_event(
    "USUBJID",
    filters = c("AESIFL" = "Y"),
    .labels = "AE grouping related to AESI",
    denom = "N_col",
    table_names = "tbl_aesi"
  ) %>%
  count_occurrences(
    "AEDECOD",
    .indent_mods = 1L
  ) %>%
  count_occurrences(
    "aesev",
    var_labels = "Maximum severity",
    show_labels = "visible"
  ) %>%
  count_patients_with_event(
    "USUBJID",
    filters = c("AESER" = "Y"),
    .labels = "Serious",
    table_names = "tbl_ser"
  ) %>%
  count_patients_with_event(
    "USUBJID",
    filters = c("AESDTH" = "Y"),
    .labels = "Deaths",
    .indent_mods = 1L,
    table_names = "tbl_death"
  ) %>%
  count_patients_with_event(
    vars = "USUBJID",
    filters = c("EOSSTT" = "DISCONTINUED"),
    .labels = "Resulting in discontinuation",
    table_names = "tbl_dis"
  ) %>%
  count_patients_with_event(
    "USUBJID",
    filters = c("AEREL" = "Y"),
    .labels = "Relatedness",
    table_names = "tbl_rel"
  ) %>%
  count_patients_with_event(
    "USUBJID",
    filters = c("AELABFL" = "Y"),
    .labels = "Laboratory Assessment",
    table_names = "tbl_lab"
  )


# Build table

result <- build_table(lyt, df = adae, alt_counts_df = adsl)

# Add titles/footnotes

main_title(result) <- paste0(
  "Table 20. Adverse Events of Special Interest Assessment, Safety Population, Pooled Analysis (or Trial X) (1)"
)

main_footer(result) <- c(
  "Source: [include Applicant source, datasets and/or software tools used].",
  paste(
    "(1) Duration = [e.g., X week double-blind treatment period or median and",
    "a range indicating pooled trial durations]."
  ),
  paste(
    "(2) Difference is shown between [treatment arms]",
    "(e.g., difference is shown between Drug Name dosage X vs. placebo)."
  ),
  paste(
    "Abbreviations: AESI, adverse event of special interest; CI, confidence interval;",
    "N, number of patients in treatment arm; n, number of patients with at least one event"
  )
)


fnotes_at_path(
  result,
  rowpath = c("tbl_aesi", "count_fraction")
) <- c("Use FMQ grouping if appropriate.")
fnotes_at_path(
  result,
  rowpath = c("aesev")
) <- c("Use FMQ grouping if appropriate.")
fnotes_at_path(
  result,
  rowpath = c("tbl_ser", "count_fraction")
) <- c("Use FMQ grouping if appropriate.")
fnotes_at_path(
  result,
  rowpath = c("tbl_rel", "count_fraction")
) <- c("As determined by investigator.")
fnotes_at_path(
  result,
  rowpath = c("tbl_lab", "count_fraction")
) <- c("Include relevant laboratory results as appropriate for AESI evaluation.")

result
