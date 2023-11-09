#' FDA Table 8: All Individual Patient Deaths, Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain `AGE`, `SEX`, `AESDTH`, `DTHADY`, and the variables specified by
#'   `dth_vars`, `arm_var`, `id_var`, and `saffl_var`.
#' * `adex` must contain `PARAMCD`, `TRTSDT`, `TRTEDT`, `AVAL`, `AVALU`, and the variables specified
#'   by `arm_var`, `id_var`, and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#'
#' @inheritParams argument_convention
#' @param dth_vars (`vector` of `character`)\cr additional death variables from `adae` to include in the table.
#' @param lbl_dth_vars (`vector` of `character`)\cr labels corresponding to variables in `dth_vars` to print
#'   in the table. Labels should be ordered according to the order of variables in `dth_vars`.
#'
#' @return A `listing_df` object.
#'
#' @examples
#' adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")
#' adex <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adex")
#'
#' tbl <- make_table_08(adae = adae, adex = adex)
#' head(tbl, 20)
#'
#' @export
make_table_08 <- function(adae,
                          adex,
                          arm_var = "ARM",
                          id_var = "USUBJID",
                          saffl_var = "SAFFL",
                          dth_vars = c("DTHCAUS", "DTHCAT"),
                          lbl_dth_vars = c("Cause of Death\nMedDRA\nPreferred Term", "Cause of Death\nVerbatim Term"),
                          na_level = "NA",
                          annotations = NULL) {
  checkmate::assert_subset(c(
    "AGE", "SEX", "AESDTH", "DTHADY", dth_vars, arm_var, id_var, saffl_var
  ), names(adae))
  checkmate::assert_subset(c(
    saffl_var, id_var, "PARAMCD", "TRTSDT", "TRTEDT", "AVAL", "AVALU"
  ), names(adex))
  assert_flag_variables(adae, saffl_var)
  assert_flag_variables(adex, saffl_var)

  # Deaths
  adae <- adae %>%
    filter(.data[[saffl_var]] == "Y" & AESDTH == "Y") %>%
    select(.data[[id_var]], all_of(arm_var), AGE, SEX, DTHADY, all_of(dth_vars)) %>%
    mutate(
      AGESEX = paste0(AGE, "/", SEX),
      DTHADY = as.character(DTHADY)
    ) %>%
    distinct(.data[[id_var]], DTHCAT, DTHCAUS, DTHADY, .keep_all = TRUE)

  # Dosing
  adex <- adex %>%
    filter(.data[[saffl_var]] == "Y", PARAMCD == "TDOSE") %>%
    select(.data[[id_var]], AVAL, AVALU, TRTSDT, TRTEDT) %>%
    mutate(
      DOSDUR = (TRTEDT - TRTSDT + 1) %>% as.character(),
      DOSAGE = paste0(AVAL, " ", AVALU)
    )

  tbl_join <- left_join(adae, adex, by = id_var) %>%
    select(all_of(c(arm_var, id_var)), AGESEX, DOSAGE, DOSDUR, DTHADY, all_of(dth_vars)) %>%
    var_relabel(
      AGESEX = "Age/\nGender",
      DOSAGE = "Dosage",
      DTHADY = "Study\nDay of\nDeath",
      DOSDUR = "Dosing\nDuration\n(Days)"
    ) %>%
    df_explicit_na(na_level = na_level) %>%
    arrange(across(all_of(c(arm_var, id_var, "AGESEX", "DOSAGE", "DOSDUR", "DTHADY"))))

  tbl_join[[arm_var]] <- with_label(tbl_join[[arm_var]], "Study Arm")
  tbl_join[[id_var]] <- with_label(tbl_join[[id_var]], "Patient ID")
  for (i in seq_len(length(dth_vars))) {
    tbl_join[[dth_vars[i]]] <- with_label(tbl_join[[dth_vars[i]]], lbl_dth_vars[i])
  }

  lsting <- as_listing(
    tbl_join,
    key_cols = c(arm_var, id_var, "AGESEX", "DOSAGE", "DOSDUR", "DTHADY"),
    main_title = if (!is.null(annotations$title)) annotations$title else "",
    subtitles = if (!is.null(annotations$subtitles)) annotations$subtitles else character(),
    main_footer = if (!is.null(annotations$main_footer)) annotations$main_footer else character(),
    prov_footer = if (!is.null(annotations$prov_footer)) annotations$prov_footer else character()
  )

  lsting
}
