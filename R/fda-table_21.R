#' FDA Table 21. Overview of Serious Adverse Events by Demographic Subgroup, Safety Population, Pooled Analysis (or Trial X)
#'
#' @details
#' * `df` must contain `SAFFL` and the variables specified by `vars` and `arm_var`.
#' * If specified, `alt_counts_df` must contain `SAFFL`, `USUBJID`, and the variable specified by `arm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is included by default (see `lbl_overall` argument).
#' * Information from either ADSUB or ADVS is generally included into `df` prior to analysis.
#' * Numbers in table for non-numeric variables represent the absolute numbers of patients and fraction of `n`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @examples
#' library(dplyr)
#'
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl") %>%
#'   mutate(AGEGR1 = as.factor(case_when(
#'     AGE >= 17 & AGE < 65 ~ ">=17 to <65",
#'     AGE >= 65 ~ ">=65",
#'     AGE >= 65 & AGE < 75 ~ ">=65 to <75",
#'     AGE >= 75 ~ ">=75"
#'   )) %>% formatters::with_label("Age Group, years")) %>%
#'   formatters::var_relabel(
#'     AGE = "Age, years"
#'   )
#'
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae") %>%
#'   mutate(ASER = AESER)
#'
#' df <- left_join(adsl, adae, by = intersect(names(adsl), names(adae)))
#'
#' tbl <- make_table_21(df = df, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_21 <- function(df,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          arm_var = "ARM",
                          vars = c("SEX", "AGEGR1", "RACE", "ETHNIC"),
                          lbl_vars = formatters::var_labels(df, fill = TRUE)[vars],
                          lbl_overall = NULL,
                          prune_0 = FALSE,
                          annotations = NULL) {
  checkmate::assert_subset(c("SAFFL", vars, arm_var), names(df))
  assert_flag_variables(df, c("SAFFL", "ASER"))

  df <- df %>%
    filter(SAFFL == "Y") %>%
    df_explicit_na()
  sapply(vars, function(x) checkmate::assert_factor(df[[x]]))

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    count_patients_with_event(
      "USUBJID",
      filters = c("AESER" = "Y"),
      .labels = c(count_fraction = "Any SAE")
    ) %>%
    analyze(
      vars = vars,
      var_labels = lbl_vars,
      afun = a_count_occurrences_serae,
      extra_args = list(denom = "N_s", df_full = if (!is.null(alt_counts_df)) alt_counts_df else df),
      show_labels = "visible"
    ) %>%
    append_topleft(c("", "Characteristic"))

  tbl <- build_table(lyt, df = df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}

a_count_occurrences_serae <- function(df,
                                      .var,
                                      .N_col,
                                      .df_row,
                                      df_full = NULL,
                                      denom = c("N_s", "N_col", "n"),
                                      id = "USUBJID") {
  df <- df %>% filter(ASER == "Y")
  occurrences <- df[[.var]]
  ids <- factor(df[[id]])
  has_occurrence_per_id <- table(occurrences, ids) > 0
  n_ids_per_occurrence <- as.list(rowSums(has_occurrence_per_id))
  lvls <- names(n_ids_per_occurrence)

  if (denom == "N_s" && is.null(df_full)) {
    stop("If using subgroup population counts, `df_full` must be specified.")
  }
  denom <- match.arg(denom)
  dn <- switch(denom,
               N_s = lapply(lvls, function(x) sum(df_full[[.var]] == x)),
               n = nlevels(ids),
               N_col = .N_col)
  if (denom == "N_s") names(dn) <- lvls

  x_stats <- lapply(
    lvls,
    function(x) {
      i <- n_ids_per_occurrence[[x]]
      denom <- dn[[x]]
      if (i == 0 && denom == 0) c(0, 0) else c(i, i / denom)
    }
  )
  names(x_stats) <- names(n_ids_per_occurrence)

  in_rows(
    .list = x_stats,
    .formats = tern::format_count_fraction
  )
}
