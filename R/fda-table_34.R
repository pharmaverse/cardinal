#' FDA Table 34: Patients With Serious Adverse Events1 by System Organ Class, FDA Medical Query (Narrow) and Preferred Term,
#' Safety Population, Pooled Analysis (or Trial X)
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
#' @examples
#' library(dplyr)
#'
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#'
#' set.seed(1)
#' adae <- adae %>%
#'   dplyr::rename(FMQ01SC = SMQ01SC) %>%
#'   dplyr::mutate(
#'     AESER = sample(c("Y", "N"), size = nrow(adae), replace = TRUE),
#'     FMQ01NAM = sample(c("FMQ1", "FMQ2", "FMQ3"), size = nrow(adae), replace = TRUE)
#'   )
#' adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
#'
#' tbl <- make_table_34(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_34 <- function(adae,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          fmqsc_var = "FMQ01SC",
                          fmqnam_var = "FMQ01NAM",
                          fmq_scope = "NARROW",
                          pref_var = "AETERM",
                          lbl_pref_var = formatters::var_labels(adae, fill = TRUE)[pref_var],
                          lbl_overall = NULL,
                          prune_0 = TRUE,
                          na_level = "<Missing>",
                          annotations = NULL) {
  checkmate::assert_subset(c("SAFFL", "USUBJID", "AEBODSYS", arm_var, fmqsc_var, fmqnam_var, pref_var), names(adae))
  #assert_flag_variables(adae, "SAFFL")
  checkmate::assert_subset(toupper(fmq_scope), c("NARROW", "BROAD"))

  adae <- adae %>%
    filter(SAFFL == "Y", AESER == "Y", adae[[fmqsc_var]] == fmq_scope) %>%
    df_explicit_na(na_level = na_level)
  adae[[fmqnam_var]] <- with_label(adae[[fmqnam_var]], paste0("FMQ (", tools::toTitleCase(tolower(fmq_scope)), ")"))

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      label_pos = "topleft",
      split_label = obj_label(adae$AEBODSYS)
    ) %>%
    split_rows_by(
      fmqnam_var,
      child_labels = "visible",
      label_pos = "topleft",
      split_label = obj_label(adae[[fmqnam_var]])
    ) %>%
    count_occurrences(vars = pref_var, drop = FALSE)

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
