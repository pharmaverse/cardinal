#' Initialize Table Layout with Annotations
#'
#' Initializes a table layout via [`rtables::basic_table()`] and applies `show_colcounts`
#' argument. Adds any annotations supplied via the `annotations` argument.
#'
#' @inheritParams argument_convention
#'
#' @return An `rtables` `PreDataTableLayouts` object suitable for passing to further layout functions, and
#'   to `build_table`.
#'
#' @keywords internal
basic_table_annot <- function(show_colcounts = TRUE, annotations = NULL) {
  rlang::check_installed("rtables")
  rtables::basic_table(
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
#' @return An `rtables` `PreDataTableLayouts` object suitable for passing to further layout functions, and
#'   to `build_table`.
#'
#' @keywords internal
split_cols_by_arm <- function(lyt, arm_var = "ARM", lbl_overall = NULL, risk_diff = NULL) {
  rlang::check_installed("rtables")
  if (is.null(risk_diff)) {
    spl_fun <- NULL
  } else {
    arm_x <- risk_diff$arm_x
    arm_y <- risk_diff$arm_y
    col_label <- if ("col_label" %in% names(risk_diff)) {
      risk_diff$col_label
    } else {
      eval(formals(tern::add_riskdiff)$col_label)
    }
    pct <- if ("pct" %in% names(risk_diff)) risk_diff$pct else TRUE
    spl_fun <- tern::add_riskdiff(arm_x = arm_x, arm_y = arm_y, col_label = col_label, pct = pct)
  }

  lyt <- lyt |> rtables::split_cols_by(arm_var, split_fun = spl_fun)
  if (!is.null(lbl_overall)) lyt |> rtables::add_overall_col(lbl_overall) else lyt
}

#' Pre-Process `alt_counts_df` for Safety Population
#'
#' If `alt_counts_df` is not `NULL`, will check for required variables (`arm_var`) and filter
#' to include only safety population (`saffl_var`, if specified), then apply [`tern::df_explicit_na()`].
#'
#' @inheritParams argument_convention
#'
#' @return A `data.frame` (modified `alt_counts_df`) or `NULL`.
#'
#' @keywords internal
alt_counts_df_preproc <- function(alt_counts_df, id_var = "USUBJID", arm_var = "ARM", saffl_var = NULL) {
  if (!is.null(alt_counts_df)) {
    missing_vars <- setdiff(c(id_var, arm_var, saffl_var), names(alt_counts_df))
    if (length(missing_vars) > 0) {
      stop("Variables not found in alt_counts_df: ", paste(missing_vars, collapse = ", "))
    }
    if (!is.null(saffl_var)) {
      assert_flag_variables(alt_counts_df, saffl_var)
      alt_counts_df <- alt_counts_df |> dplyr::filter(.data[[saffl_var]] == "Y")
    }
    rlang::check_installed("tern")
    tern::df_explicit_na(alt_counts_df)
  }
}

#' Check Values of Flag Variables
#'
#' Flag variables are expected to take one of two values: `"Y"` (yes/true) or
#' `"N"` (no/false). Missing values are also accepted and treated as `"N"`.
#'
#' @inheritParams argument_convention
#' @param flag_vars (`vector` of `character`)\cr names of flag variables within `df` to check.
#'
#' @return Invisibly returns `TRUE` if all flag variables are valid; otherwise stops with an error.
#'
#' @keywords internal
assert_flag_variables <- function(df, flag_vars, na_level = "<Missing>") {
  allowed <- c("Y", "N", "", NA, na_level)
  for (x in flag_vars) {
    invalid <- setdiff(as.character(unique(df[[x]])), as.character(allowed))
    if (length(invalid) > 0) {
      stop(sprintf(
        "unique(df$%s) must be a subset of {Y, N, NA, %s}, but has extra values: %s",
        x, na_level, paste(invalid, collapse = ", ")
      ))
    }
  }
  invisible(TRUE)
}
