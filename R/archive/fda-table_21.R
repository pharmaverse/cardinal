#' FDA Table 21. Overview of Serious Adverse Events by Demographic Subgroup, Safety Population,
#'   Pooled Analysis (or Trial X)
#'
#' @details
#' * `df` must contain the variables specified by `vars`, `arm_var`, and `saffl_var`.
#' * If specified, `alt_counts_df` must contain the variables specified by `arm_var`, `id_var`, and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm.
#' * Information from either ADSUB or ADVS is generally included into `df` prior to analysis.
#' * Numbers in the table for non-numeric variables represent the absolute number of patients and fraction of `n`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#' @inheritParams a_count_occurrences_ser_ae
#'
#' @return An `rtable` object.
#'
#' @examples
#' library(dplyr)
#'
#' adsl <- random.cdisc.data::cadsl %>%
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
#' adae <- random.cdisc.data::cadae
#' adae$ASER <- adae$AESER
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
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          vars = c("SEX", "AGEGR1", "RACE", "ETHNIC"),
                          denom = c("N_s", "N_col", "n"),
                          lbl_overall = NULL,
                          lbl_vars = formatters::var_labels(df, fill = TRUE)[vars],
                          prune_0 = FALSE,
                          annotations = NULL) {
  assert_subset(c(vars, id_var, arm_var, saffl_var), names(df))
  assert_flag_variables(df, c(saffl_var, "ASER"))

  df <- df %>%
    filter(.data[[saffl_var]] == "Y") %>%
    df_explicit_na()

  # For percentages calculations in case of N_s, add the overall observations
  denom <- match.arg(denom)
  if (!is.null(lbl_overall) && denom == "N_s") {
    df_ovrl <- df
    df_ovrl[[arm_var]] <- lbl_overall
    df <- rbind(df, df_ovrl)

    if (!is.null(alt_counts_df)) {
      alt_df_ovrl <- alt_counts_df
      alt_df_ovrl[[arm_var]] <- lbl_overall
      alt_counts_df <- rbind(alt_counts_df, alt_df_ovrl)
    }
  }

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations)

  lyt <- if (!is.null(lbl_overall) && denom != "N_s") {
    lyt %>% split_cols_by_arm(arm_var, lbl_overall)
  } else {
    lyt %>% split_cols_by_arm(arm_var)
  }

  lyt <- lyt %>%
    count_patients_with_event(
      id_var,
      filters = c("AESER" = "Y"),
      .labels = c(count_fraction = "Any SAE")
    ) %>%
    analyze(
      vars = vars,
      var_labels = lbl_vars,
      afun = a_count_occurrences_ser_ae,
      extra_args = list(
        denom = denom,
        arm_var = arm_var,
        df_denom = if (!is.null(alt_counts_df)) alt_counts_df else df
      ),
      show_labels = "visible"
    ) %>%
    append_topleft("Characteristic")

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}

#' Analysis Function to Calculate Count/Fraction of Serious Adverse Event Occurrences
#'
#' @inheritParams tern::s_count_occurrences
#' @inheritParams argument_convention
#' @param df_denom (`data.frame`)\cr Full data frame used to calculate denominator subgroup counts
#'   when `denom = "N_s"`.
#' @param denom (`character`)\cr Denominator to use to calculate fractions. Can be `"N_s"` (total `df_denom`
#'   subgroup/row counts), `"N_col"` (total `df` column counts), or `"n"` (total `df` overall patient count).
#'   Note that `df` is filtered to only include serious adverse events (`ASER == "Y"`).
#'
#' @keywords internal
a_count_occurrences_ser_ae <- function(df,
                                       .var,
                                       .N_col, # nolint
                                       df_denom = NULL,
                                       denom = c("N_s", "N_col", "n"),
                                       id_var = "USUBJID",
                                       arm_var = "ARM") {
  df <- df %>% filter(ASER == "Y")
  occurrences <- df[[.var]]
  ids <- factor(df[[id_var]])
  has_occurrence_per_id <- table(occurrences, ids) > 0
  n_ids_per_occurrence <- as.list(rowSums(has_occurrence_per_id))
  lvls <- names(n_ids_per_occurrence)

  denom <- match.arg(denom)
  if (denom == "N_s" && is.null(df_denom)) {
    stop("If using subgroup population counts, `df_denom` must be specified.") # nocov
  }
  dn <- switch(denom,
    N_s = lapply(
      lvls,
      function(x) {
        df_denom %>%
          filter(.data[[.var]] == x, .data[[arm_var]] == df[[arm_var]][1]) %>%
          select(all_of(id_var)) %>%
          distinct() %>%
          nrow()
      }
    ),
    n = nlevels(ids),
    N_col = .N_col
  )
  if (denom == "N_s") names(dn) <- lvls

  x_stats <- lapply(
    lvls,
    function(x) {
      i <- n_ids_per_occurrence[[x]]
      denom <- if (denom == "N_s") dn[[x]] else dn
      if (i == 0 && denom == 0) c(0, 0) else c(i, i / denom)
    }
  )
  names(x_stats) <- names(n_ids_per_occurrence)

  in_rows(
    .list = x_stats,
    .formats = tern::format_count_fraction
  )
}
