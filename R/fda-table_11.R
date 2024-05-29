#' FDA Table 11: Patients with FDA Medical Query (Narrow) Leading to Treatment
#'   Discontinuation, Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain the variables `AEBODSYS`, `DCSREAS`, and the variables specified by
#'   `arm_var`, `id_var`, `saffl_var`, `fmqsc_var`, and `fmqnam_var`.
#' * If specified, `alt_counts_df` must contain `USUBJID` and the variables specified by `arm_var` and `saffl_var`.
#' * A patient is defined as having at least one adverse event leading to treatment discontinuation when they have at
#'   least one record with `DCSREAS = "ADVERSE EVENT"`.
#' * `fmqsc_var` must contain "BROAD" or "NARROW" values, one of which will be displayed in the table. Narrow is
#'   selected by default (see `fmq_scope` argument).
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
#' adsl <- random.cdisc.data::cadsl
#' adae <- random.cdisc.data::cadae
#'
#' set.seed(1)
#' adae <- adae %>%
#'   rename(FMQ01SC = SMQ01SC) %>%
#'   mutate(
#'     AESER = sample(c("Y", "N"), size = nrow(adae), replace = TRUE),
#'     FMQ01NAM = sample(c("FMQ1", "FMQ2", "FMQ3"), size = nrow(adae), replace = TRUE)
#'   )
#' adae$DCSREAS[is.na(adae$DCSREAS)] <- "ADVERSE EVENT"
#' adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
#'
#' tbl <- make_table_11(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_11 <- function(adae,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          fmqsc_var = "FMQ01SC",
                          fmqnam_var = "FMQ01NAM",
                          fmq_scope = "NARROW",
                          lbl_overall = NULL,
                          risk_diff = NULL,
                          prune_0 = TRUE,
                          na_level = "<Missing>",
                          annotations = NULL) {
  assert_subset(c(
    "AEBODSYS", "DCSREAS", arm_var, id_var, saffl_var, fmqsc_var, fmqnam_var
  ), names(adae))
  assert_flag_variables(adae, saffl_var)
  assert_subset(toupper(fmq_scope), c("NARROW", "BROAD"))

  id_dcsae <- adae %>%
    filter(DCSREAS == "ADVERSE EVENT") %>%
    select(all_of(c(id_var))) %>%
    unlist()

  adae <- adae %>%
    filter(.data[[saffl_var]] == "Y", .data[[id_var]] %in% id_dcsae, .data[[fmqsc_var]] == fmq_scope) %>%
    df_explicit_na(na_level = na_level)
  adae[[fmqnam_var]] <- with_label(adae[[fmqnam_var]], paste0("FMQ (", tools::toTitleCase(tolower(fmq_scope)), ")"))

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    analyze_num_patients(
      vars = id_var,
      riskdiff = !is.null(risk_diff),
      .stats = c("unique"),
      .labels = c(unique = "Patients with at least one AE leading to discontinuation")
    ) %>%
    split_rows_by(
      "AEBODSYS",
      label_pos = "topleft",
      split_label = obj_label(adae$AEBODSYS)
    ) %>%
    summarize_num_patients(
      var = id_var,
      riskdiff = !is.null(risk_diff),
      .stats = "unique",
      .labels = c(unique = NULL)
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
