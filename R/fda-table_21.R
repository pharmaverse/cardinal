#' FDA Table 21. Overview of Serious Adverse Events1 by Demographic Subgroup, Safety Population, Pooled Analysis (or Trial X)
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
#'     select(STUDYID, USUBJID, SEX, AGE, RACE, ETHNIC, SAFFL, ARM, ACTARM) %>%
#'     filter(SAFFL == "Y") %>%
#'     mutate(AGEGR1 = as.factor(case_when(
#'         AGE >= 17 & AGE < 65 ~ ">=17 to <65",
#'         AGE >= 65 ~ ">=65",
#'         AGE >= 65 & AGE < 75 ~ ">=65 to <75",
#'         AGE >= 75 ~ ">=75"
#'     )) %>% formatters::with_label("Age Group, years")) %>%
#'     formatters::var_relabel(
#'     AGE = "Age, years"
#'     )
#' 
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae") %>%
#'     filter(SAFFL == "Y" & AESER == "Y") %>%
#'     group_by(STUDYID, USUBJID, AESER) %>%
#'     distinct(USUBJID) %>%
#'     ungroup() %>%
#'     select(STUDYID, USUBJID, AESER)
#' 
#' tbl_join <- left_join(adsl, adae, by = "USUBJID")
#' tbl_join2 <- tbl_join %>%
#'     mutate(
#'         ASER = as.character(AESER),
#'         ASER = ifelse(is.na(ASER), "N", ASER)
#'     )
#'
#' tbl <- make_table_21(df = tbl_join2)
#' tbl
#'
#' @export
make_table_21 <- function(
  df,
  show_colcounts = TRUE,
  arm_var = "ARM",
  vars = c("SEX", "AGEGR1", "RACE", "ETHNIC"),
  lbl_vars = formatters::var_labels(df, fill = TRUE)[vars],
  lbl_overall = "Total Population",
  prune_0 = FALSE,
  annotations = NULL
) {

  checkmate::assert_subset(c("SAFFL", vars, arm_var), names(df))
  assert_flag_variables(df, "SAFFL")

  df <- df %>%
    filter(SAFFL == "Y")

  for (var in vars) {
    new_var <- paste0(var, "AE")
    df <- df %>%
      mutate(
        !!new_var := case_when(
          !is.na(!!rlang::sym(var)) & ASER == "Y" ~ !!rlang::sym(var),
          !is.na(!!rlang::sym(var)) & ASER == "N" ~ "NOAE",
          .default = NA_character_
        )
      )
  }

  varsae <- paste0(vars, "AE")

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    count_occurrences(
      vars = varsae,
      var_labels = lbl_vars,
      .stats = c("fraction"),
      denom = "n",
      show_labels = "visible"
    ) %>%
    append_topleft(c("", "Characteristic"))

  tbl <- build_table(lyt, df = df)
  if (prune_0) tbl <- prune_table(tbl)

  for (var in varsae) {
    temp_path <- c(var, "NOAE")
    tt_at_path(tbl, path = temp_path) <- NULL
  }

  tbl
}