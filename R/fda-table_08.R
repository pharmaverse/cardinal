#' FDA Table 8: All Individual Patient Deaths, Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 8 as a patient-level listing of all individual deaths in the safety population,
#' including demographics, dosage, study day of death, and cause of death.
#'
#' @param adae (`data.frame`)\cr adverse events dataset (typically ADAE) containing death records.
#' @param adex (`data.frame`)\cr exposure dataset (typically ADEX) containing dosing information.
#' @param arm_var (`character`)\cr name of the treatment arm variable. Defaults to `"TRT01A"`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param dth_vars (`character`)\cr additional death variables from `adae` to include in the listing.
#'   Defaults to `c("DTHCAUS", "DTHCAT")`.
#' @param lbl_dth_vars (`character`)\cr labels for the variables in `dth_vars`. Defaults to cause of
#'   death labels.
#' @param na_level (`character`)\cr string used to represent missing values. Defaults to `"NA"`.
#'
#' @details
#' * `adae` must contain `AGE`, `SEX`, `AESDTH`, `DTHADY`, the variables specified by `dth_vars`,
#'   `arm_var`, `id_var`, and `saffl_var`.
#' * `adex` must contain `PARAMCD`, `TRTSDT`, `TRTEDT`, `AVAL`, `AVALU`, and the variables specified
#'   by `arm_var`, `id_var`, and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#'   Missing values in flag variables are treated as `"N"`.
#' * Returns a `listing_df` object from the `rlistings` package.
#'
#' @return A `listing_df` object.
#'
#' @examplesIf requireNamespace("random.cdisc.data", quietly = TRUE)
#' adae <- random.cdisc.data::cadae
#' adex <- random.cdisc.data::cadex
#'
#' result <- make_table_08(adae = adae, adex = adex, arm_var = "ARM")
#' head(result, 20)
#'
#' @importFrom dplyr filter select mutate distinct left_join arrange across all_of
#' @importFrom rlistings as_listing
#' @export
make_table_08 <- function(adae,
                          adex,
                          arm_var = "TRT01A",
                          id_var = "USUBJID",
                          saffl_var = "SAFFL",
                          dth_vars = c("DTHCAUS", "DTHCAT"),
                          lbl_dth_vars = c(
                            "Cause of Death\nMedDRA\nPreferred Term",
                            "Cause of Death\nVerbatim Term"
                          ),
                          na_level = "NA") {
  stopifnot(is.data.frame(adae))
  stopifnot(is.data.frame(adex))
  stopifnot(all(c("AGE", "SEX", "AESDTH", "DTHADY", dth_vars, arm_var, id_var, saffl_var) %in% names(adae)))
  stopifnot(all(c(saffl_var, id_var, "PARAMCD", "TRTSDT", "TRTEDT", "AVAL", "AVALU") %in% names(adex)))

  adae <- adae |>
    dplyr::filter(.data[[saffl_var]] == "Y", AESDTH == "Y") |>
    dplyr::select(dplyr::all_of(c(id_var, arm_var, "AGE", "SEX", "DTHADY", dth_vars))) |>
    dplyr::mutate(
      AGESEX = paste0(AGE, "/", SEX),
      DTHADY = as.character(DTHADY)
    ) |>
    dplyr::distinct(.data[[id_var]], DTHADY, .keep_all = TRUE)

  adex <- adex |>
    dplyr::filter(.data[[saffl_var]] == "Y", PARAMCD == "TDOSE") |>
    dplyr::select(dplyr::all_of(c(id_var, "AVAL", "AVALU", "TRTSDT", "TRTEDT"))) |>
    dplyr::mutate(
      DOSDUR = as.character(as.integer(TRTEDT - TRTSDT + 1)),
      DOSAGE = paste0(AVAL, " ", AVALU)
    )

  tbl_join <- dplyr::left_join(adae, adex, by = id_var) |>
    dplyr::select(dplyr::all_of(c(arm_var, id_var, "AGESEX", "DOSAGE", "DOSDUR", "DTHADY", dth_vars))) |>
    dplyr::arrange(dplyr::across(dplyr::all_of(c(arm_var, id_var))))

  tbl_join[[arm_var]] <- structure(tbl_join[[arm_var]], label = "Study Arm")
  tbl_join[[id_var]] <- structure(tbl_join[[id_var]], label = "Patient ID")
  tbl_join[["AGESEX"]] <- structure(tbl_join[["AGESEX"]], label = "Age/\nGender")
  tbl_join[["DOSAGE"]] <- structure(tbl_join[["DOSAGE"]], label = "Dosage")
  tbl_join[["DOSDUR"]] <- structure(tbl_join[["DOSDUR"]], label = "Dosing\nDuration\n(Days)")
  tbl_join[["DTHADY"]] <- structure(tbl_join[["DTHADY"]], label = "Study\nDay of\nDeath")
  for (i in seq_along(dth_vars)) {
    tbl_join[[dth_vars[i]]] <- structure(tbl_join[[dth_vars[i]]], label = lbl_dth_vars[i])
  }

  rlistings::as_listing(
    tbl_join,
    key_cols = c(arm_var, id_var, "AGESEX", "DOSAGE", "DOSDUR", "DTHADY")
  )
}
