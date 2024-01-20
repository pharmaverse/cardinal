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

# Temporary fix for disparity between package versions
adsl_raw$ETHNIC <- as.character(adsl_raw$ETHNIC)
adsl_raw$ETHNIC[adsl_raw$ETHNIC == " NOT REPORTED"] <- "NOT REPORTED"
adsl_raw$ETHNIC <- formatters::with_label(factor(adsl_raw$ETHNIC, levels = sort(unique(adsl_raw$ETHNIC))), "Ethnicity")
adae_raw$ETHNIC <- as.character(adae_raw$ETHNIC)
adae_raw$ETHNIC[adae_raw$ETHNIC == " NOT REPORTED"] <- "NOT REPORTED"
adae_raw$ETHNIC <- formatters::with_label(factor(adae_raw$ETHNIC, levels = sort(unique(adae_raw$ETHNIC))), "Ethnicity")

# expect_snapshot_ggplot - set custom plot dimensions
expect_snapshot_ggplot <- function(title, fig, width = NA, height = NA) {
  skip_if_not_installed("svglite")

  name <- paste0(title, ".svg")
  path <- tempdir()
  suppressMessages(ggplot2::ggsave(name, fig, path = path, width = width, height = height))
  path <- file.path(path, name)

  testthat::announce_snapshot_file(name = name)
  testthat::expect_snapshot_file(path, name)
}
