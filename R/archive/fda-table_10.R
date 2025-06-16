#' FDA Table 10: Patients With Serious Adverse Events by System Organ Class and
#'   FDA Medical Query (Narrow), Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain the variables `AEBODSYS`, `AESER`, and the variables specified by
#'   `arm_var`, `id_var`, `saffl_var`, `fmqsc_var`, and `fmqnam_var`.
#' * If specified, `denominator` must contain `USUBJID` and the variables specified by `arm_var` and `saffl_var`.
#' * `fmqsc_var` must contain "BROAD" or "NARROW" values, one of which will be displayed in the table. Narrow is
#'   selected by default (see `fmq_scope` argument).
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#'
#' @return A `gtsummary` table and, if `return_ard = TRUE`, an ARD.
#' If `return_ard = TRUE`, they will be returned as a list with named elements `table` and `ard`.
#'
#' @inheritParams tbl_make_table_10
#' @inheritParams argument_convention
#'
#' @seealso [`tbl_make_table_10`]
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
#' adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
#'
#' tbl <- make_table_10(df = adae, denominator = adsl)
#' tbl
#'
#' @export
make_table_10 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          saffl_var = "SAFFL",
                          fmqsc_var = "FMQ01SC",
                          fmqnam_var = "FMQ01NAM",
                          fmq_scope = "NARROW",
                          na_level = "<Missing>") {
  ard <- ard_table_10(
    df = df,
    denominator = denominator,
    id_var = id_var,
    arm_var = arm_var,
    saffl_var = saffl_var,
    fmqsc_var = fmqsc_var,
    fmqnam_var = fmqnam_var,
    fmq_scope = fmq_scope,
    na_level = na_level
  )

  tbl <- make_table_10_gtsummary(
    df = df,
    denominator = denominator,
    id_var = id_var,
    arm_var = arm_var,
    saffl_var = saffl_var,
    fmqsc_var = fmqsc_var,
    fmqnam_var = fmqnam_var,
    fmq_scope = fmq_scope,
    na_level = na_level
  )

  if (return_ard) {
    return(list(table = tbl, ard = ard))
  } else {
    return(tbl)
  }
}

#' Pre-Process Data for Table 10 Creation
#'
#' @keywords internal
preproc_df_table_10 <- function(df,
                                id_var = "USUBJID",
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                fmqsc_var = "FMQ01SC",
                                fmqnam_var = "FMQ01NAM",
                                fmq_scope = "NARROW",
                                na_level = "<Missing>") {
  assert_subset(c(
    "AEBODSYS", "AESER", arm_var, id_var, saffl_var, fmqsc_var, fmqnam_var
  ), names(df))
  assert_flag_variables(df, saffl_var, "AESER")
  assert_subset(toupper(fmq_scope), c("NARROW", "BROAD"))

  df <- df %>%
    filter(.data[[saffl_var]] == "Y", AESER == "Y", .data[[fmqsc_var]] == fmq_scope) %>%
    df_explicit_na(na_level = na_level)

  df[[fmqnam_var]] <- with_label(df[[fmqnam_var]], paste0("FMQ (", tools::toTitleCase(tolower(fmq_scope)), ")"))

  df
}

#' Make ARD: Table 10
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
#' adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
#'
#' ard <- cardinal:::ard_table_10(adae, adsl)
#' ard
#'
#' @keywords internal
#' @name ard_make_table_10
#'

ard_table_10 <- function(df,
                         denominator = NULL,
                         id_var = "USUBJID",
                         arm_var = "ARM",
                         saffl_var = "SAFFL",
                         fmqsc_var = "FMQ01SC",
                         fmqnam_var = "FMQ01NAM",
                         fmq_scope = "NARROW",
                         na_level = "<Missing>") {
  df <- preproc_df_table_10(df, id_var, arm_var, saffl_var, fmqsc_var, fmqnam_var, fmq_scope, na_level) %>%
    select(id_var, arm_var, saffl_var, "AEBODSYS", fmqsc_var, fmqnam_var) %>%
    distinct()

  if (is.null(denominator)) {
    denominator <- df
  } else {
    denominator <- alt_counts_df_preproc(denominator, id_var, arm_var, saffl_var)
  }

  ard <- cards::ard_hierarchical(
    data = df,
    variables = all_of(c("AEBODSYS", fmqnam_var)),
    by = all_of(arm_var),
    denominator = denominator,
    id = all_of(id_var)
  )

  ard
}

#' Engine-Specific Functions: Table 10
#'
#' The table engine used by each engine-specific function is identified by its suffix.
#'
#' @inheritParams argument_convention
#'
#' @details
#' * `df` must contain the variables `AEBODSYS`, `AESER`, and the variables specified by
#'   `arm_var`, `id_var`, `saffl_var`, `fmqsc_var`, and `fmqnam_var`.
#' * If specified, `denominator` (or `alt_counts_df`) must contain `USUBJID` and the variables specified by `arm_var`
#'   and `saffl_var`.
#' * `fmqsc_var` must contain "BROAD" or "NARROW" values, one of which will be displayed in the table.
#' Narrow is selected by default (see `fmq_scope` argument).
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default by `make_table_10_rtables()` (see `prune_0` argument).
#'
#' @return
#' * `make_table_10_gtsummary()` returns a `gtsummary` object.
#' * `make_table_10_rtables()` returns an `rtable` object.
#'
#' @seealso [make_table_10()]
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
#' adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
#'
#' # gtsummary table --------------
#' tbl_gtsummary <- cardinal:::make_table_10_gtsummary(df = adae, denominator = adsl)
#' tbl_gtsummary
#'
#' # rtables table ----------------
#' tbl_rtables <- cardinal:::make_table_10_rtables(df = adae, alt_counts_df = adsl)
#' tbl_rtables
#'
#' @export
#' @name tbl_make_table_10

make_table_10_gtsummary <- function(df,
                                    denominator = NULL,
                                    id_var = "USUBJID",
                                    arm_var = "ARM",
                                    saffl_var = "SAFFL",
                                    fmqsc_var = "FMQ01SC",
                                    fmqnam_var = "FMQ01NAM",
                                    fmq_scope = "NARROW",
                                    na_level = "<Missing>") {
  df <- preproc_df_table_10(df, id_var, arm_var, saffl_var, fmqsc_var, fmqnam_var, fmq_scope, na_level)

  if (is.null(denominator)) {
    denominator <- df
  } else {
    denominator <- alt_counts_df_preproc(denominator, id_var, arm_var, saffl_var)
  }

  tbl <- tbl_hierarchical(df,
    variables = all_of(c("AEBODSYS", fmqnam_var)),
    by = all_of(arm_var),
    id = all_of(id_var),
    include = fmqnam_var,
    denominator = denominator,
    overall_row = FALSE
  )

  tbl
}

#' @export
#' @rdname tbl_make_table_10
make_table_10_rtables <- function(df,
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
  df <- preproc_df_table_10(df, id_var, arm_var, saffl_var, fmqsc_var, fmqnam_var, fmq_scope, na_level)
  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    split_rows_by(
      "AEBODSYS",
      label_pos = "topleft",
      split_label = obj_label(df$AEBODSYS)
    ) %>%
    count_occurrences(
      vars = fmqnam_var,
      drop = FALSE,
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_varlabels(df, fmqnam_var, indent = 1L)

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
