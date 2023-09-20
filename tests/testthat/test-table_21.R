adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl") %>%
  mutate(AGEGR1 = as.factor(case_when(
    AGE >= 17 & AGE < 65 ~ ">=17 to <65",
    AGE >= 65 ~ ">=65",
    AGE >= 65 & AGE < 75 ~ ">=65 to <75",
    AGE >= 75 ~ ">=75"
  )) %>% formatters::with_label("Age Group, years")) %>%
  formatters::var_relabel(
    AGE = "Age, years"
  )

adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
adae$ASER <- adae$AESER

df <- left_join(adsl, adae, by = intersect(names(adsl), names(adae)))

test_that("Table 21 generation works with default values", {
  result <- make_table_21(df = df)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 21 generation works with custom values: N_s denominator and overall column", {
  result <- make_table_21(
    df = df,
    alt_counts_df = adsl,
    denom = "N_s",
    lbl_overall = "Total population",
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 21 generation works with custom values: N_col denominator and no overall column", {
  result <- make_table_21(
    df = df,
    alt_counts_df = adsl,
    denom = "N_col",
    lbl_overall = NULL,
    annotations = list(
      title = "Table 21. Overview of Serious Adverse Events1 by Demographic Subgroup, Safety Population,
Pooled Analysis (or Trial X)",
      main_footer = "Source: [include Applicant source, datasets and/or software tools used].",
      prov_footer = paste(
        "Defined as any untoward medical occurrence that, at any dose that results in death, is life-threatening, requires hospitalization or",
        "prolongation of existing hospitalization, results in persistent incapacity or substantial disruption of the ability to conduct normal life",
        "functions, or is a congenital anomaly or birth defect.",
        "Abbreviations: N, number of patients in treatment arm; n, number of patients with adverse event; Ns, total number of patients for",
        "each specific subgroup; SAE, serious adverse event"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 21 generation works with some NA values", {
  set.seed(5)
  df[sample(seq_len(nrow(df)), 50), "SEX"] <- NA
  df[sample(seq_len(nrow(df)), 30), "AGEGR1"] <- NA

  df <- df %>% df_explicit_na()

  result <- make_table_21(
    df = df,
    alt_counts_df = adsl,
    denom = "n",
    lbl_overall = "Total population",
    vars = c("AGEGR1", "SEX"),
    lbl_vars = c("Age (group)", "Sex")
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})
