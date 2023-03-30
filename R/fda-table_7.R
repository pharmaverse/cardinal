library(dplyr)
library(tern)

# Load and pre-process data

adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
ntrtem <- sample(adsl[["USUBJID"]], size = as.integer(nrow(adsl)/3)) # assign subjects to nontreatment emergent AE's

adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae") %>%
  filter(SAFFL == "Y", DTHFL == "Y") %>% # not actually necessary because all observations are flagged as Y
  mutate(
    TRTEMFL_ = ifelse(USUBJID %in% ntrtem, "N", "Y"), # produce dummy data
    trtemlab = case_when( # produce label column
      TRTEMFL_ == "Y" ~ "Treatment-emergent deaths (3)",
      TRTEMFL_ == "N" ~ "Nontreatment-emergent deaths (4)",
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
    denom = "N_col",
    indent_mod = -1L,
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
    denom = "N_col", # relative to all patients
    indent_mod = -1L,
    show_labels = "hidden"
  ) %>%
  count_occurrences(
    vars = "DTHCAUS",
    .indent_mods = 1,
    denom = "n", # relative to row group, i.e. parent
    drop = FALSE
  ) %>%
  rtables::append_topleft(c("", "Deaths")) # empty string to force position right above horizontal line




result <- prune_table(tbl) # drop rows where all columns have zero counts
result

