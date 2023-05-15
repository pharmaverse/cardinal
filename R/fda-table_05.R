#' FDA Table 5: Duration of Treatment Exposure, Safety Population, Pooled Analyses
#'
#' @details
#' * `df` must contain `SAFFL`, `USUBJID`, and the variables specified by `arm_var`, `id_var`, `trtsdtm_var`,
#'   and `trtedtm_var`.
#' * If specified, `alt_counts_df` must contain `SAFFL`, `USUBJID`, and the variable specified by `arm_var`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table "Patients Treated" section are the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are not removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#' @param trtsdtm_var (`character`)\cr treatment start datetime variable in `df`.
#' @param trtedtm_var (`character`)\cr treatment end datetime variable in `df`.
#' @param u_trtdur (`character`)\cr unit for duration of treatment. Options are `"days"`, `"weeks"`, `"months"`,
#'   and `"years"`.
#' @param lbl_trtdur (`character`)\cr label for treatment duration variable.
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#'
#' tbl <- make_table_05(df = adsl)
#' tbl
#'
#' @export
make_table_05 <- function(df,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          id_var = "USUBJID",
                          trtsdtm_var = "TRTSDTM",
                          trtedtm_var = "TRTEDTM",
                          u_trtdur = "days",
                          lbl_trtdur = paste("Duration of Treatment,", u_trtdur),
                          lbl_overall = NULL,
                          prune_0 = FALSE,
                          annotations = NULL) {
  checkmate::assert_subset(c("SAFFL", "USUBJID", arm_var, id_var, trtsdtm_var, trtedtm_var), names(adae))
  checkmate::assert_choice(u_trtdur, c("days", "weeks", "months", "years"))

  df <- df %>%
    filter(SAFFL == "Y") %>%
    df_explicit_na() %>%
    mutate(
      TRTDUR = lubridate::interval(lubridate::ymd_hms(.data[[trtsdtm_var]]), lubridate::ymd_hms(.data[[trtedtm_var]]))
    ) %>%
    mutate(
      TRTDUR_MONTHS = TRTDUR %>% as.numeric("months"),
      TRTDUR = TRTDUR %>% as.numeric(u_trtdur)
    ) %>%
    mutate(
      D_ANY = (TRTDUR_MONTHS > 0) %>% with_label("Any duration (at least 1 dose)"),
      D_LT1 = (TRTDUR_MONTHS < 1) %>% with_label("<1 month"),
      D_GT1 = (TRTDUR_MONTHS >= 1) %>% with_label(">=1 month"),
      D_GT3 = (TRTDUR_MONTHS >= 3) %>% with_label(">=3 months"),
      D_GT6 = (TRTDUR_MONTHS >= 6) %>% with_label(">=6 months"),
      D_GT12 = (TRTDUR_MONTHS >= 12) %>% with_label(">=12 months"),
      DUR_LBL = "Patients Treated, by duration"
    )

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    analyze(
      vars = "TRTDUR",
      var_labels = lbl_trtdur,
      show_labels = "visible",
      afun = function(x) {
        in_rows(
          "Mean (SD)" = c(mean(x), stats::sd(x)),
          "Median (min - max)" = c(stats::median(x), range(x)),
          "Interquartile range" = c(stats::quantile(x, 0.25), stats::quantile(x, 0.75)),
          "Total exposure (person years)" = c(
            sum(x), as.numeric(lubridate::duration(sum(x), u_trtdur), "years")
          ),
          .formats = c("xx.xx (xx.xx)", "xx.xx (xx.xx - xx.xx)", "xx.xx - xx.xx", "xx.xx (xx.xx)")
        )
      }
    ) %>%
    split_rows_by("DUR_LBL") %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = var_labels(df[, c("D_ANY", "D_LT1", "D_GT1", "D_GT3", "D_GT6", "D_GT12")])
    ) %>%
    append_topleft(c("", "Parameter"))

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)

  if (prune_0) tbl <- prune_table(tbl)
  tbl
}
