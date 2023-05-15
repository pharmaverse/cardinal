library(dplyr)
library(scda)

adsl_raw <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
adae_raw <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
adex_raw <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adex")
advs_raw <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "advs")
