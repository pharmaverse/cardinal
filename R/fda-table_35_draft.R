#' #' Table 35. Patients With Adverse Events by System Organ Class,
#' #'   Safety Population, Pooled Analysis (or Trial X)
#' #'
#' #' @details
#' #' * `df` must contain the variables specified by
#' #'   `arm_var`, `id_var`, `soc_var` and `saffl_var`.
#' #' * `return_ard` set to `TRUE` or `FALSE`; whether the intermediate ARD object should be returned.
#' #'
#' #' @inheritParams argument_convention
#' #' @param soc_var (`character`)\cr Name of the variable that contains the SOC to describe.
#' #'
#' #' @return A `gtsummary` table and, if `return_ard = TRUE`, an ARD.
#' #'   If `return_ard = TRUE`, they will be returned as a list with named elements `table` and `ard`.
#' #'
#' #' @seealso [`tbl_make_table_35`]
#' #'
#' #' @examples
#' #' adsl <- random.cdisc.data::cadsl
#' #' adae <- random.cdisc.data::cadae
#' #'
#' #' tbl <- make_table_35(df = adae, denominator = adsl)
#' #' tbl
#' #'
#' #' @export
#' make_table_35 <- function(df,
#'                           denominator,
#'                           return_ard = TRUE,
#'                           id_var = "USUBJID",
#'                           arm_var = "ARM",
#'                           saffl_var = "SAFFL",
#'                           soc_var = "AESOC",
#'                           lbl_overall = NULL) {
#'
#' assert_subset(c(soc_var, arm_var, id_var, saffl_var), names(df))
#' assert_flag_variables(df, saffl_var)
#' assert_subset(c(arm_var, id_var, saffl_var), names(denominator))
#' assert_flag_variables(denominator, saffl_var)
#'
#' df <- df %>%
#'   filter(.data[[saffl_var]] == "Y") %>%
#'   arrange(soc_var) %>%
#'   df_explicit_na()
#'
#' df_denom <- denominator %>% filter(.data[[saffl_var]] == "Y")
#'
#' tbl_gts <-
#'   tbl_hierarchical(
#'     data = df,
#'     variables = soc_var,
#'     by = arm_var,
#'     denominator = df_denom,
#'     id = id_var
#'   ) %>%
#'   modify_header(label ~ paste0("**System Organ Class**")) %>%
#'   modify_header(all_stat_cols() ~ "**{level}**  \nN = {n}") %>%
#'   gtsummary::modify_column_alignment(columns = all_stat_cols(), align = "right")
#'
#'   if (!is.null(lbl_overall)) {
#'     tbl_gts_ovrl <-
#'       tbl_hierarchical(
#'         data = df,
#'         variables = soc_var,
#'         denominator = df_denom,
#'         id = id_var
#'       ) %>%
#'       modify_header(label ~ paste0("**System Organ Class**")) %>%
#'       modify_header(
#'         all_stat_cols() ~ paste0("**", lbl_overall, "**  \nN = {n}")
#'       ) %>%
#'       gtsummary::modify_column_alignment(columns = all_stat_cols(), align = "right")
#'
#'     tbl_gts_df <- as.data.frame(tbl_gts)
#'     tbl_gts_ovrl_df <- as.data.frame(tbl_gts_ovrl)
#'
#'     tbl_gts_all_df <-
#'       left_join(
#'         x = tbl_gts_df,
#'         y = tbl_gts_ovrl_df,
#'         by = "**System Organ Class**"
#'       )
#'
#'     cols_names <- colnames(tbl_gts_all_df)
#'
#'     tbl_gts <-
#'       tbl_gts_all_df %>%
#'       gt() %>%
#'       cols_label(
#'         .list = setNames(lapply(cols_names, md), cols_names)
#'       )
#'
#'     tbl <- gtsummary::with_gtsummary_theme(
#'       x = gtsummary::theme_gtsummary_compact(),
#'       expr = tbl_gts
#'     )
#'   }
#'
#'   else {
#'     tbl_gts <- tbl_gts
#'
#'     tbl <- gtsummary::with_gtsummary_theme(
#'       x = gtsummary::theme_gtsummary_compact(),
#'       expr = as_gt(tbl_gts)
#'     )
#'   }
#'
#'   if (return_ard) {
#'
#'   }
#'
#'
#'   return(tbl)
#' }
#'
#'
#'
#'
#'
#'
#'
#'
#'
#'
#'
#'
#'
#' make_table_35_rtables <- function(adae,
#'                           alt_counts_df = NULL,
#'                           show_colcounts = TRUE,
#'                           id_var = "USUBJID",
#'                           arm_var = "ARM",
#'                           saffl_var = "SAFFL",
#'                           soc_var = "AESOC",
#'                           lbl_soc_var = formatters::var_labels(adae, fill = TRUE)[soc_var],
#'                           lbl_overall = NULL,
#'                           risk_diff = NULL,
#'                           prune_0 = FALSE,
#'                           annotations = NULL) {
#'   assert_subset(c(soc_var, arm_var, id_var, saffl_var), names(adae))
#'   assert_flag_variables(adae, saffl_var)
#'
#'   adae <- adae %>%
#'     filter(.data[[saffl_var]] == "Y") %>%
#'     arrange(soc_var) %>%
#'     df_explicit_na()
#'
#'   alt_counts_df <-
#'     alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)
#'
#'   lyt <- basic_table_annot(show_colcounts, annotations) %>%
#'     split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
#'     count_occurrences(
#'       vars = soc_var,
#'       drop = FALSE,
#'       riskdiff = !is.null(risk_diff)
#'     ) %>%
#'     append_topleft(c("", lbl_soc_var))
#'
#'   tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df) %>%
#'     sort_at_path(
#'       path = c(soc_var),
#'       scorefun = score_occurrences_cols(col_names = levels(adae[[arm_var]]))
#'     )
#'   if (prune_0) tbl <- prune_table(tbl)
#'
#'   tbl
#' }
