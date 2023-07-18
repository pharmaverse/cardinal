#' FDA Table 10: Patients With Serious Adverse Events by System Organ Class and
#' FDA Medical Query (Narrow), Safety Population, Pooled Analyses
#' @details
#' * `adae` must contain the variables `SAFFL`, `USUBJID`, `AEBODSYS`, `AESER`
#' and the variables specified by `arm_var`, `fmqsc_var`, and `fmqnam_var`.
#' * `fmqsc_var` must contain either "BROAD" or "NARROW" values. By default, the
#' function outputs "NARROW" for the FMQ (see `FMQ` argument).
#' * If specified, `alt_counts_df` must contain variables `SAFFL` and `USUBJID`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true)
#' and `"N"` (false). Missing values in flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default
#' (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#' @param fmqsc_var (`character`)\cr FMQ scope variable to use in table.
#' @param fmqnam_var (`character`)\cr FMQ reference name variable to use in table.
#' @param FMQ (`character`)\cr FMQ scope ("Narrow" or "Broad" ) to output in table.
#' @examples
#' library(dplyr)
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#' adae <- adae %>%
#'   dplyr::rename(FMQ02SC = SMQ02SC, FMQ02NAM = CQ01NAM) %>%
#'   mutate(AESER = sample(c("Y", "N"), size = nrow(adae), replace = TRUE))
#' levels(adae$FMQ02SC) <- c("BROAD", "NARROW")
#' adae$FMQ02SC[!is.na(adae$FMQ02NAM)] <- "NARROW"
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#'
#' tbl <- make_table_10(
#'   adae = adae, alt_counts_df = adsl, fmqsc_var = "FMQ02SC",
#'   fmqnam_var = "FMQ02NAM"
#' )
#'
#' @export
make_table_10 <- function(adae,
                          alt_counts_df = adsl,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          fmqsc_var = "FMQ02SC",
                          fmqnam_var = "FMQ02NAM",
                          lbl_overall = NULL,
                          prune_0 = TRUE,
                          na_level = "<Missing>",
                          annotations = NULL,
                          FMQ = "Narrow") {
  checkmate::assert_subset(c(
    "SAFFL", "USUBJID", "AEBODSYS", "AESER", arm_var, fmqsc_var, fmqnam_var
  ), names(adae))
  assert_flag_variables(adae, c("SAFFL", "AESER"))

  adae <- adae %>%
    filter(SAFFL == "Y", AESER == "Y", (adae[[fmqsc_var]] == FMQ | adae[[fmqsc_var]] == toupper(FMQ))) %>%
    df_explicit_na(na_level = na_level)
  adae[[fmqnam_var]] <- with_label(adae[[fmqnam_var]], paste0("FMQ (", FMQ, ")"))
  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, arm_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    split_rows_by(
      "AEBODSYS",
      label_pos = "topleft",
      split_label = obj_label(adae$AEBODSYS)
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = "unique",
      .labels = c(unique = NULL)
    ) %>%
    count_occurrences(vars = fmqnam_var, drop = FALSE) %>%
    append_varlabels(adae, fmqnam_var, indent = 1L)

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
