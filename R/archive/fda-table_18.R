#' FDA Table 18: Patients With Adverse Events by Female-Specific FDA Medical Query (Broad) and Preferred Term,
#'   Female Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain `SEX`, and the variables specified by `arm_var`, `id_var`, `saffl_var`, `pref_var`,
#'   `fmqsc_var` and `fmqnam_var`.
#' * If specified, `alt_counts_df` must contain the variables specified by `arm_var`, `id_var`, and `saffl_var`.
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
#' adsl <- random.cdisc.data::cadsl
#' adae <- random.cdisc.data::cadae
#'
#' set.seed(1)
#' adae <- dplyr::rename(adae, FMQ01SC = SMQ01SC, FMQ01NAM = SMQ01NAM)
#' levels(adae$FMQ01SC) <- c("BROAD", "NARROW")
#' adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
#' adae$FMQ01NAM <- factor(adae$FMQ01NAM, levels = c(
#'   unique(adae$FMQ01NAM), "Abnormal Uterine Bleeding", "Amenorrhea",
#'   "Bacterial Vaginosis", "Decreased Menstrual Bleeding"
#' ))
#' adae$FMQ01NAM[adae$SEX == "F"] <- as.factor(
#'   sample(c(
#'     "Abnormal Uterine Bleeding", "Amenorrhea",
#'     "Bacterial Vaginosis", "Decreased Menstrual Bleeding"
#'   ), sum(adae$SEX == "F"), replace = TRUE)
#' )
#'
#' tbl <- make_table_18(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_18 <- function(adae,
                          alt_counts_df = NULL,
                          show_colcounts = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          pref_var = "AEDECOD",
                          sex_scope = "F",
                          fmq_scope = "BROAD",
                          fmqsc_var = "FMQ01SC",
                          fmqnam_var = "FMQ01NAM",
                          lbl_overall = NULL,
                          risk_diff = NULL,
                          prune_0 = TRUE,
                          na_level = "<Missing>",
                          annotations = NULL) {
  assert_subset(c("SEX", arm_var, id_var, fmqsc_var, fmqnam_var, saffl_var, pref_var), names(adae))
  assert_flag_variables(adae, saffl_var)
  assert_subset(toupper(fmq_scope), c("NARROW", "BROAD"))

  fmq_other_sexes <- unique(adae[adae[["SEX"]] != sex_scope, ][[fmqnam_var]])
  adae <- adae %>%
    as_tibble() %>%
    filter(
      .data[[saffl_var]] == "Y",
      .data[[fmqsc_var]] == fmq_scope,
      .data[["SEX"]] == sex_scope,
      !.data[[fmqnam_var]] %in% fmq_other_sexes
    ) %>%
    df_explicit_na(na_level = na_level)

  adae[[fmqnam_var]] <- with_label(adae[[fmqnam_var]], paste0("FMQ (", tools::toTitleCase(tolower(fmq_scope)), ")"))
  adae[[pref_var]] <- with_label(adae[[pref_var]], "Preferred Term")

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    split_rows_by(
      fmqnam_var,
      label_pos = "topleft",
      split_label = obj_label(adae[[fmqnam_var]])
    ) %>%
    count_occurrences(
      vars = pref_var,
      drop = FALSE,
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_varlabels(adae, pref_var, indent = 1L)

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
