#' Initialize Table Layout with Annotations
#'
#' Initializes a table layout via [`rtables::basic_table()`] and applies `show_colcounts`
#' argument. Adds any annotations supplied via the `annotations` argument.
#'
#' @inheritParams argument_convention
#'
#' @examples
#' lyt <- basic_table_annot(annotations = list(title = "Title", main_footer = "Main Footer"))
#' build_table(lyt, df = data.frame())
#'
#' @export
basic_table_annot <- function(show_colcounts = TRUE, annotations = NULL) {
  basic_table(
    show_colcounts = show_colcounts,
    title = if (!is.null(annotations$title)) annotations$title else "",
    subtitles = if (!is.null(annotations$subtitles)) annotations$subtitles else character(),
    main_footer = if (!is.null(annotations$main_footer)) annotations$main_footer else character(),
    prov_footer = if (!is.null(annotations$prov_footer)) annotations$prov_footer else character()
  )
}

#' Split Columns by Arm Variable
#'
#' Splits `rtables` layout into columns by arm variable. Appends an "overall" column as the
#' rightmost column if `lbl_overall` is supplied.
#'
#' @inheritParams argument_convention
#' @param lyt (`rtables` layout object)\cr Layout object pre-data used for tabulation.
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#'
#' lyt <- rtables::basic_table() %>% split_cols_by_arm(lbl_overall = "All Arms")
#' build_table(lyt, df = adsl)
#'
#' @export
split_cols_by_arm <- function(lyt, arm_var = "ARM", lbl_overall = NULL) {
  lyt <- lyt %>% split_cols_by(arm_var)
  if (!is.null(lbl_overall)) lyt %>% add_overall_col(lbl_overall) else lyt
}

#' Pre-Process `alt_counts_df` for Safety Population
#'
#' If `alt_counts_df` is not `NULL`, will check for required variables and filter
#' to include only safety population, then apply [`tern::df_explicit_na()`].
#'
#' @inheritParams argument_convention
#'
#' @examples
#' adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
#' alt_counts_df_preproc(adsl)
#'
#' @export
alt_counts_df_preproc <- function(alt_counts_df) {
  if (!is.null(alt_counts_df)) {
    checkmate::assert_subset(c("SAFFL", "USUBJID"), names(alt_counts_df))
    alt_counts_df %>%
      filter(SAFFL == "Y") %>%
      df_explicit_na()
  }
}
