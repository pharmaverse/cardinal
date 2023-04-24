# Pre-processing

library(dplyr)
library(scda)
library(tern)

adsl <- synthetic_cdisc_dataset("rcd_2022_10_13", "adsl") %>%
  filter(
    SAFFL == "Y"
  ) %>%
  mutate(
    AGEGR1 = as.factor(case_when(
      AGE >= 17 & AGE < 65 ~ ">=17 to <65",
      AGE >= 65 ~ ">=65",
      AGE >= 65 & AGE < 75 ~ ">=65 to <75",
      AGE >= 75 ~ ">=75"
    ))
  ) %>%
  df_explicit_na()

# Build layout

lyt <- basic_table(show_colcounts = TRUE) %>%
  split_cols_by(var = "ARM") %>%
  add_overall_col("All Patients") %>%
  summarize_vars(
    vars = c("SEX", "AGE", "AGEGR1", "RACE", "ETHNIC", "COUNTRY", "BMRKR2"),
    .stats = c("mean_sd", "median_range", "count_fraction"),
    var_labels = c(
      SEX = "Sex",
      AGE = "Age (years)",
      AGEGR1 = "Age groups (years)",
      RACE = "Race",
      ETHNIC = "Ethnicity",
      COUNTRY = "Country of participation",
      BMRKR2 = "Categorical Level Biomarker 2"
    ),
    na.rm = FALSE
  )

# Build table

result <- build_table(lyt, df = adsl)

# Add titles/footnotes

main_title(result) <- paste0(
  "Table 2. Baseline Demographic and Clinical Characteristics Safety Population, Pooled Analyses"
)

main_footer(result) <- c(
  "Source: [include Applicant source, datasets and/or software tools used]."
)

prov_footer(result) <- paste(
  "Abbreviations: N, number of patients in treatment arm;",
  "n, number of patients with given characteristic; SD, standard deviation"
)


result
