#' Table 35. Patients With Adverse Events1 by System Organ Class,
#'   Safety Population, Pooled Analysis (or Trial X)
#'
#' @details
#' * `adae` must contain the variables `AEBODSYS`, and the variables specified by
#'   `arm_var`, `id_var`, and `saffl_var`.
#' * If specified, `alt_counts_df` must contain the variables specified by `arm_var`, `id_var`, and `saffl_var`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @examples
#' library(dplyr)
#'
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' tbl <- make_table_35(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_35 <- function(adae,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          soc_var = "AESOC",
                          lbl_overall = NULL,
                          risk_diff = NULL,
                          prune_0 = FALSE,
                          annotations = NULL) {
  checkmate::assert_subset(c("AEBODSYS", arm_var, id_var, saffl_var), names(adae))
  assert_flag_variables(adae, saffl_var)

  adae <- adae %>%
    filter(.data[[saffl_var]] == "Y") %>%
    arrange(AEBODSYS) %>%
    df_explicit_na()

  # List of unique SOCs in the database
  lst_soc <- unique(adae$AEBODSYS)

  # Mutate a flag variable with label for each SOC
  for (i in lst_soc) {
    adae <- adae %>% mutate(!!paste0("fl_", i) := with_label(AEBODSYS == i, i))
  }

  alt_counts_df <-
    alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  # List of all 'fl_' SOC variables
  adae_lst_df <- adae %>% select(starts_with("fl_"))
  adae_lst <- colnames(adae_lst_df)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    count_occurrences(
      vars = soc_var,
      drop = FALSE,
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_topleft(c("", "System Organ Class"))

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df) %>%
    sort_at_path(
      path = c("AEBODSYS"),
      scorefun = score_occurrences_cols(col_names = levels(adae[[arm_var]]))
    )
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
