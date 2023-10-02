#' FDA Table 14: Patients With Adverse Events by System Organ Class and FDA Medical Query, Safety Population,
#'   Pooled Analyses
#'
#' @details
#' * `adae` must contain the variables `SAFFL`, `USUBJID`, `AEBODSYS`, and the variables specified by `arm_var`,
#'   `fmqsc_var`, and `fmqnam_var`.
#' * If specified, `alt_counts_df` must contain variables `SAFFL` and `USUBJID`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are not removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @return An `rtable` object.
#'
#' @examples
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#' adae <- dplyr::rename(adae, FMQ01SC = SMQ01SC, FMQ01NAM = SMQ01NAM)
#' levels(adae$FMQ01SC) <- c("BROAD", "NARROW")
#' adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
#'
#' tbl <- make_table_14(adae = adae)
#' tbl
#'
#' @export
make_table_14 <- function(adae,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          fmqsc_var = "FMQ01SC",
                          fmqnam_var = "FMQ01NAM",
                          lbl_overall = NULL,
                          risk_diff = NULL,
                          prune_0 = FALSE,
                          na_level = "<Missing>",
                          annotations = NULL) {
  checkmate::assert_subset(c(
    "SAFFL", "USUBJID", "AEBODSYS", arm_var, fmqsc_var, fmqnam_var
  ), names(adae))
  assert_flag_variables(adae, "SAFFL")

  adae <- adae %>%
    filter(SAFFL == "Y") %>%
    df_explicit_na(na_level = na_level)
  adae[[fmqnam_var]] <- with_label(adae[[fmqnam_var]], "FMQ")

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by(fmqsc_var) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      label_pos = "topleft",
      split_label = obj_label(adae$AEBODSYS)
    ) %>%
    count_occurrences(
      vars = fmqnam_var,
      drop = FALSE,
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_varlabels(adae, fmqnam_var, indent = 1L)

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
