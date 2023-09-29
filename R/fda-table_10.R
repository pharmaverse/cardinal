#' FDA Table 10: Patients With Serious Adverse Events by System Organ Class and
#'   FDA Medical Query (Narrow), Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain the variables `SAFFL`, `USUBJID`, `AEBODSYS`, `AESER`, and the variables specified by
#'   `arm_var`, `fmqsc_var`, and `fmqnam_var`.
#' * `fmqsc_var` must contain "BROAD" or "NARROW" values, one of which will be displayed in the table. Narrow is
#'   selected by default (see `fmq_scope` argument).
#' * If specified, `alt_counts_df` must contain variables `SAFFL` and `USUBJID`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @return An `rtable` object.
#'
#' @examples
#' library(dplyr)
#'
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#'
#' set.seed(1)
#' adae <- adae %>%
#'   rename(FMQ01SC = SMQ01SC) %>%
#'   mutate(
#'     AESER = sample(c("Y", "N"), size = nrow(adae), replace = TRUE),
#'     FMQ01NAM = sample(c("FMQ1", "FMQ2", "FMQ3"), size = nrow(adae), replace = TRUE)
#'   )
#' adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
#'
#' tbl <- make_table_10(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_10 <- function(adae,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          fmqsc_var = "FMQ01SC",
                          fmqnam_var = "FMQ01NAM",
                          fmq_scope = "NARROW",
                          lbl_overall = NULL,
                          prune_0 = TRUE,
                          na_level = "<Missing>",
                          annotations = NULL) {
  checkmate::assert_subset(c(
    "SAFFL", "USUBJID", "AEBODSYS", "AESER", arm_var, fmqsc_var, fmqnam_var
  ), names(adae))
  assert_flag_variables(adae, c("SAFFL", "AESER"))
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
      label_pos = "topleft",
      split_label = obj_label(adae$AEBODSYS)
    ) %>%
    count_occurrences(vars = fmqnam_var, drop = FALSE) %>%
    append_varlabels(adae, fmqnam_var, indent = 1L)

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
