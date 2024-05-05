#' FDA Table 34: Patients With Serious Adverse Events by System Organ Class, FDA Medical Query (Narrow) and
#'   Preferred Term, Safety Population, Pooled Analysis (or Trial X)
#'
#' @details
#' * `adae` must contain the variables `AEBODSYS`, `AESER`, and the variables specified by
#'   `arm_var`, `id_var`, `saffl_var`, `trtemfl_var`, `fmqsc_var`, `fmqnam_var`, and `pref_var`.
#' * If specified, `alt_counts_df` must contain the variables specified by `arm_var`, `id_var`, and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @examples
#' library(dplyr)
#'
#' adae <- random.cdisc.data::cadae
#' adsl <- random.cdisc.data::cadsl
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
#' tbl <- make_table_34(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_34 <- function(adae,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          trtemfl_var = "TRTEMFL",
                          fmqsc_var = "FMQ01SC",
                          fmqnam_var = "FMQ01NAM",
                          fmq_scope = "NARROW",
                          pref_var = "AEDECOD",
                          lbl_pref_var = formatters::var_labels(adae, fill = TRUE)[pref_var],
                          lbl_overall = NULL,
                          risk_diff = NULL,
                          prune_0 = TRUE,
                          na_level = "<Missing>",
                          annotations = NULL) {

  checkmate::assert_subset(c("AEBODSYS", arm_var, id_var, saffl_var, trtemfl_var, fmqsc_var, fmqnam_var, pref_var), names(adae))
  assert_flag_variables(adae, saffl_var, trtemfl_var)
  checkmate::assert_subset(toupper(fmq_scope), c("NARROW", "BROAD"))

  adae <- adae %>%
    filter(.data[[saffl_var]] == "Y", AESER == "Y", .data[[trtemfl_var]] == "Y", .data[[fmqsc_var]] == fmq_scope) %>%
    df_explicit_na(na_level = na_level)
  adae[[fmqnam_var]] <- with_label(adae[[fmqnam_var]], paste0("FMQ (", tools::toTitleCase(tolower(fmq_scope)), ")"))

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = obj_label(adae$AEBODSYS)
    ) %>%
    split_rows_by(
      fmqnam_var,
      child_labels = "hidden",
      label_pos = "topleft",
      split_label = obj_label(adae[[fmqnam_var]])
    ) %>%
    summarize_num_patients(
      var = id_var,
      .stats = "unique",
      .labels = c(unique = NULL),
      riskdiff = !is.null(risk_diff)
    ) %>%
    count_occurrences(
      vars = pref_var,
      drop = FALSE,
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_topleft(paste("   ", lbl_pref_var))

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
