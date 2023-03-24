# Pre-processing

library(dplyr)
library(scda)
library(tern)

adsl <- synthetic_cdisc_dataset("rcd_2022_10_13", "adsl") %>% df_explicit_na()
adae <- synthetic_cdisc_dataset("rcd_2022_10_13", "adae") %>%
  filter(
    SAFFL == "Y"
  ) %>%
  mutate(
    sex = as.factor(case_when(
      SEX == "M" ~ "Male",
      SEX == "F" ~ "Female"
    )),
    age_grp = as.factor(case_when(
      AGE >= 17 & AGE < 65 ~ ">=17 to <65",
      AGE >= 65 ~ ">=65",
      AGE >= 65 & AGE < 75 ~ ">=65 to <75",
      AGE >= 75 ~ ">=75"
    )),
    race = as.factor(case_when(
      RACE == "ASIAN" ~ "Asian",
      RACE == "AMERICAN INDIAN OR ALASKA NATIVE" ~ "American Indian or Alaska Native",
      RACE == "BLACK OR AFRICAN AMERICAN" ~ "Black or African American",
      RACE == "WHITE" ~ "White",
      RACE == "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" ~ "Native Hawaiian or Other Pacific Islander",
      RACE == "MULTIPLE" ~ "Multiple"
    )),
    ethnic = as.factor(case_when(
      ETHNIC == "NOT REPORTED" ~ "Not Reported",
      ETHNIC == "HISPANIC OR LATINO" ~ "Hispanic or Latino",
      ETHNIC == "NOT HISPANIC OR LATINO" ~ "Not Hispanic or Latino",
      ETHNIC == "UNKNOWN" ~ "Unknown"
    )),
    country = as.factor(case_when(
      COUNTRY == "CHN" ~ "China",
      COUNTRY == "RUS" ~ "Russia",
      COUNTRY == "USA" ~ "United States",
      COUNTRY == "NGA" ~ "China",
      COUNTRY == "PAK" ~ "Pakistan",
      COUNTRY == "BRA" ~ "Brazil",
      COUNTRY == "CAN" ~ "Canada",
      COUNTRY == "GBR" ~ "Great Britain",
      COUNTRY == "JPN" ~ "Japan"
    )),
    bio = as.factor(case_when(
      BMRKR2 == "LOW" ~ "Low",
      BMRKR2 == "MEDIUM" ~ "Medium",
      BMRKR2 == "HIGH" ~ "High"
    ))
  ) %>%
  df_explicit_na()

# Build layout

lyt <- basic_table(show_colcounts = TRUE) %>%
  split_cols_by(var = "ARM") %>%
  add_overall_col("All Patients") %>%
  summarize_vars("sex", .stats = c("count_fraction"), var_labels = "Sex", na.rm = FALSE) %>%
  analyze(vars = "AGE", var_labels = "Age (years)", afun = function(x) {
    in_rows(
      "Mean (SD)" = rcell(c(mean(x), sd(x)), format = "xx.xx (xx.xx)"),
      "Median (min - max)" = rcell(c(median(x), range(x)), format = "xx.xx (xx.xx - xx.xx)")
    )
  }) %>%
  summarize_vars(
    vars = c("age_grp", "race", "ethnic", "country", "bio"),
    .stats = c("count_fraction"),
    var_labels = c(
      age_grp = "Age groups (years)",
      race = "Race",
      ethnic = "Ethnicity",
      country = "Country of participation",
      bio = "Categorical Level Biomarker 2"
    ),
    na.rm = FALSE
  )

# Build table

result <- build_table(lyt, df = adae, alt_counts_df = adsl)

# Add titles/footnotes

main_title(result) <- paste0(
  "Table 2. Baseline Demographic and Clinical Characteristics Safety Population, Pooled Analyses"
)

main_footer(result) <- c(
  "Source: [include Applicant source, datasets and/or software tools used].",
)

prov_footer(result) <- c("Abbreviations: N, number of patients in treatment arm; n, number of patients with given characteristic; SD, standard deviation")


result
