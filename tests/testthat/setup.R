library(dplyr)

adsl_raw <- random.cdisc.data::cadsl
adae_raw <- random.cdisc.data::cadae
adex_raw <- random.cdisc.data::cadex
advs_raw <- random.cdisc.data::cadvs

adsl_raw <- adsl_raw %>%
  mutate(AGEGR1 = as.factor(case_when(
    AGE >= 17 & AGE < 65 ~ ">=17 to <65",
    AGE >= 65 ~ ">=65",
    AGE >= 65 & AGE < 75 ~ ">=65 to <75",
    AGE >= 75 ~ ">=75"
  )) %>%
    formatters::with_label("Age Group"))
