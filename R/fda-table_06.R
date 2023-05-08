#' FDA Table 6: Overview of Adverse Events, Safety Population, Pooled Analyses
#'
#' @details
#' * `df` is typically ADAE.
#' * `alt_counts_df` is typically ADSL.
#' * `df` must contain the variables `SAFFL`, `TRTEMFL`, `AESEV`, `AESER`, `AESDTH`, `AESLIFE`, `AESHOSP`, `AESDISAB`,
#'   `AESCONG`, `AESMIE`, `AESACN`, and the variable specified by `arm_var`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are not removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#'
#' tbl <- make_table_06(df = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_06 <- function(df,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          lbl_overall = NULL,
                          prune_0 = FALSE,
                          annotations = NULL) {
  df <- df %>%
    filter(SAFFL == "Y", TRTEMFL == "Y") %>%
    df_explicit_na() %>%
    mutate(
      SER = with_label(AESER == "Y", "SAE"),
      SERFATAL = with_label(AESER == "Y" & AESDTH == "Y", "SAEs with fatal outcome"),
      SERLIFE = with_label(AESER == "Y" & AESLIFE == "Y", "Life-threatening SAEs"),
      SERHOSP = with_label(AESER == "Y" & AESHOSP == "Y", "SAEs requiring hospitalization"),
      SERDISAB = with_label(
        AESER == "Y" & AESDISAB == "Y",
        "SAEs resulting in substantial disruption of normal life functions"
      ),
      SERCONG = with_label(AESER == "Y" & AESCONG == "Y", "Congenital anomaly or birth defect"),
      SERMIE = with_label(AESER == "Y" & AESMIE == "Y", "Other"),
      WD = with_label(AEACN == "DRUG WITHDRAWN", "AE leading to permanent discontinuation of study drug"),
      DSM = with_label(
        AEACN %in% c("DOSE INCREASED", "DOSE REDUCED", "DOSE RATE REDUCED", "DRUG INTERRUPTED"),
        "AE leading to dose modification of study drug"
      ),
      DSINT = with_label(AEACN == "DRUG INTERRUPTED", "AE leading to interruption of study drug"),
      DSRED = with_label(AEACN == "DOSE REDUCED", "AE leading to reduction of study drug"),
      DSD = with_label(AEACN == "DOSE RATE REDUCED", "AE leading to dose delay of study drug"),
      DSMIE = with_label(AEACN == "DOSE INCREASED", "Other")
    )

  lyt <- basic_table(
    show_colcounts = show_colcounts,
    title = if (!is.null(annotations$title)) annotations$title else "",
    subtitles = if (!is.null(annotations$subtitles)) annotations$subtitles else character(),
    main_footer = if (!is.null(annotations$main_footer)) annotations$main_footer else character(),
    prov_footer = if (!is.null(annotations$prov_footer)) annotations$prov_footer else character()
  ) %>%
    split_cols_by(arm_var)

  if (!is.null(lbl_overall)) lyt <- lyt %>% add_overall_col(lbl_overall)

  lyt <- lyt %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(df[, "SER"]),
      table_names = "ser"
    ) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(df[, c("SERFATAL", "SERLIFE", "SERHOSP", "SERDISAB", "SERCONG", "SERMIE")]),
      .indent_mods = 1L,
      table_names = "ser_fl"
    ) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(df[, c("WD", "DSM")]),
      table_names = "ae"
    ) %>%
    count_patients_with_flags(
      var = "USUBJID",
      flag_variables = var_labels(df[, c("DSINT", "DSRED", "DSD", "DSMIE")]),
      .indent_mods = 1L,
      table_names = "ds"
    ) %>%
    analyze_num_patients(
      vars = "USUBJID",
      .stats = "unique",
      .labels = c(unique = "Any AE"),
      show_labels = "hidden"
    ) %>%
    count_occurrences_by_grade(
      var = "AESEV",
      show_labels = "hidden",
      .indent_mods = 1L
    )

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
