# Pre-processing

library(dplyr)
library(scda)
library(tern)
library(lubridate)

adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl") %>%
  filter(SAFFL == "Y")

adex <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adex") %>%
  filter(SAFFL == "Y") %>%
  select("USUBJID", "ARM", "TRTSDTM", "TRTEDTM") %>%
  distinct() %>%
  mutate(TRTS_D = as.Date(ymd_hms(TRTSDTM))) %>%
  mutate(TRTE_D = as.Date(ymd_hms(TRTEDTM))) %>%
  mutate(TRTDUR = as.numeric(TRTE_D - TRTS_D + 1)) %>%
  mutate(
    any_d = (TRTDUR > 0),
    d_less_1 = (TRTDUR < 365 / 12 * 1),
    d_more_1 = (TRTDUR >= 365 / 12 * 1),
    d_more_3 = (TRTDUR >= 365 / 12 * 3),
    d_more_6 = (TRTDUR >= 365 / 12 * 6),
    d_more_12 = (TRTDUR >= 365 / 12 * 12)
  ) %>%
  formatters::var_relabel(
    any_d = "Any duration (at least 1 dose)",
    d_less_1 = "<1 month",
    d_more_1 = ">=1 month",
    d_more_3 = ">=3 months",
    d_more_6 = ">=6 months",
    d_more_12 = ">=12 months"
  )

# Build layout

lyt <- basic_table(show_colcounts = TRUE) %>%
  split_cols_by("ARM") %>%
  analyze(vars = "TRTDUR", var_labels = "Duration of treatment, days", function(x, ...) {
    if (is.numeric(x)) {
      in_rows(
        "Mean (SD)" = c(mean(x), sd(x)),
        "Median (min - max)" = c(median(x), range(x)),
        "Interquartile range" = c(quantile(x, 0.25), quantile(x, 0.75)),
        "Total exposure (person years)" = c(sum(x), sum(x) / 365),
        .formats = c("xx.xx (xx.xx)", "xx.xx (xx.xx - xx.xx)", "xx.xx - xx.xx", "xx.xx (xx.xx)")
      )
    } else {
      stop("type not supported")
    }
  }) %>%
  analyze("any_d", var_labels = "Patients treated, by duration", function(x, .N_col) { # nolint
    if (is.logical(x)) {
      in_rows("Any duration (at least 1 dose)" = rcell(sum(!is.na(x)) * c(1, 1 / .N_col), format = "xx (xx.x%)"))
    }
  }) %>%
  tern::count_patients_with_flags(
    var = "USUBJID",
    flag_variables = var_labels(adex[, c("d_less_1", "d_more_1", "d_more_3", "d_more_6", "d_more_12")]),
    .indent_mods = 1L,
    table_names = "t1"
  )
# Build table

result <- build_table(lyt, df = adex, alt_counts_df = adsl)

# Add titles/footnotes

main_title(result) <- "Table 5. Duration of Treatment Exposure, Safety Population, Pooled Analyses(1)"

main_footer(result) <- c(
  "Source: [include Applicant source, datasets and/or software tools used].",
  "(1) Duration = [e.g., X-week double-blind treatment period or median and a range indicating pooled trial durations]."
)

prov_footer(result) <- c(
  "Abbreviations: CI, confidence interval; N, number of patients in treatment arm;
  n, number of patients with given treatment duration; NA, not applicable; SD, standard deviation"
)

result
