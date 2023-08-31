adsl <- adsl_raw %>%
  mutate(AGEGR1 = as.factor(case_when(
    AGE >= 17 & AGE < 65 ~ ">=17 to <65",
    AGE >= 65 ~ ">=65",
    AGE >= 65 & AGE < 75 ~ ">=65 to <75",
    AGE >= 75 ~ ">=75"
  )) %>%
    formatters::with_label("Age Group, years"))

adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
adae$ASER <- adae$AESER

df <- left_join(adsl, adae, by = intersect(names(adsl), names(adae)))

test_that("Table 21 generation works with default values", {
  result <- make_table_21(df, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 21 generation works with custom values", {
  result <- make_table_21(
    df,
    adsl,
    annotations = list(
      title = paste(
        "Table 21. Overview of Serious Adverse Events(1) by Demographic Subgroup, Safety Population,",
        "Pooled Analysis (or Trial X)"
      ),
      main_footer = c(
        "Source: [include Applicant source, datasets and/or software tools used].",
        "(1) Defined as any untoward medical occurrence that, at any dose that results in death, is life-threatening,",
        "requires hospitalization or prolongation of existing hospitalization, results in persistent incapacity or",
        "substantial disruption of the ability to conduct normal life functions, or is a congenital anomaly or",
        "birth defect. "
      ),
      prov_footer = c(
        "Abbreviations: N, number of patients in treatment arm; n, number of patients with adverse event;",
        "Ns, total number of patients for each specific subgroup; SAE, serious adverse event"
      )
    ),
    prune_0 = TRUE
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})
