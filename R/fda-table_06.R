#' FDA Table 6: Overview of Adverse Events, Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 6 showing an overview of adverse events including serious AEs,
#' discontinuations, dose modifications, and overall AE counts.
#'
#' @param df (`data.frame`)\cr dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame`)\cr dataset used as the denominator for proportion calculations.
#'   Typically ADSL. Cannot be missing.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param sae_var (`character`)\cr name of the flag variable indicating serious AEs. Defaults to `"AESER"`.
#' @param sae_cat_vars (named `list` of `character`)\cr list of flag variable names for categories of
#'   serious AEs. Defaults to `AESDTH`, `AESLIFE`, `AESHOSP`, `AESDISAB`, `AESCONG`, `AESMIE`.
#' @param disc_var (`character`)\cr name of the variable for study discontinuation due to AE.
#'   Defaults to `"AEACNOTH"`.
#' @param dose_mod_var (`character`)\cr name of the variable for dose modification due to AE.
#'   Defaults to `"AEACN"`.
#' @param dose_mod_cat_labels (named `list` of `character`)\cr list of labels for dose modification
#'   categories.
#' @param sev_var (`character`)\cr name of the AE severity variable. Defaults to `"AESEV"`.
#'
#' @details
#' Typically, an ADAE ADaM dataset is passed to `df` and an ADSL dataset to `denominator`. \cr
#' The values passed through `id_var` and `arm_var` must be present in `names(denominator)`. \cr
#' The values passed through `saffl_var`, `arm_var`, `sae_var`, `sae_cat_vars`, `disc_var`,
#' `dose_mod_var`, and `sev_var` must be present in `names(df)`. \cr
#' Discontinuation is indicated by `"SUBJECT DISCONTINUED FROM STUDY"` in `disc_var`. \cr
#' Dose modification may be `"DRUG INTERRUPTED"`, `"DOSE REDUCED"`, `"DOSE RATE REDUCED"`,
#' `"DOSE INCREASED"`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE) && requireNamespace("dplyr", quietly = TRUE)
#' library(dplyr)
#'
#' adsl <- pharmaverseadam::adsl |>
#'   filter(TRT01A != "Screen Failure")
#'
#' adae <- pharmaverseadam::adae
#'
#' result <- make_table_06(df = adae, denominator = adsl)
#' result$table
#'
#' @importFrom dplyr filter mutate case_when all_of
#' @importFrom gtsummary tbl_hierarchical tbl_stack tbl_merge modify_column_indent gather_ard
#' @export
make_table_06 <- function(df,
                          denominator,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          sae_var = "AESER",
                          sae_cat_vars = list(
                            "SAEs with fatal outcome" = "AESDTH",
                            "Life-threatening SAEs" = "AESLIFE",
                            "SAEs requiring hospitalization" = "AESHOSP",
                            "SAEs resulting in substantial disruption of normal life functions" = "AESDISAB",
                            "Congenital anomaly or birth defect" = "AESCONG",
                            "Other" = "AESMIE"
                          ),
                          disc_var = "AEACNOTH",
                          dose_mod_var = "AEACN",
                          dose_mod_cat_labels = list(
                            "DRUG INTERRUPTED" = "AE leading to interruption of study drug",
                            "DOSE REDUCED" = "AE leading to reduction of study drug",
                            "DOSE RATE REDUCED" = "AE leading to dose delay of study drug",
                            "DOSE INCREASED" = "Other"
                          ),
                          sev_var = "AESEV") {
  stopifnot(is.data.frame(df))
  stopifnot(is.data.frame(denominator))
  stopifnot(all(c(id_var, arm_var) %in% names(denominator)))
  stopifnot(all(c(
    arm_var, saffl_var, sae_var, unlist(sae_cat_vars), disc_var, dose_mod_var, sev_var
  ) %in% names(df)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)

  tbl <- .make_table_06_gtsummary(
    df = df,
    denominator = denominator,
    id_var = id_var,
    arm_var = arm_var,
    saffl_var = saffl_var,
    sae_var = sae_var,
    sae_cat_vars = sae_cat_vars,
    disc_var = disc_var,
    dose_mod_var = dose_mod_var,
    dose_mod_cat_labels = dose_mod_cat_labels,
    sev_var = sev_var
  )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}

#' @keywords internal
.make_table_06_gtsummary <- function(df,
                                     denominator,
                                     id_var = "USUBJID",
                                     arm_var = "TRT01A",
                                     saffl_var = "SAFFL",
                                     sae_var = "AESER",
                                     sae_cat_vars = list(
                                       "SAEs with fatal outcome" = "AESDTH",
                                       "Life-threatening SAEs" = "AESLIFE",
                                       "SAEs requiring hospitalization" = "AESHOSP",
                                       "SAEs resulting in substantial disruption of normal life functions" = "AESDISAB",
                                       "Congenital anomaly or birth defect" = "AESCONG",
                                       "Other" = "AESMIE"
                                     ),
                                     disc_var = "AEACNOTH",
                                     dose_mod_var = "AEACN",
                                     dose_mod_cat_labels = list(
                                       "DRUG INTERRUPTED" = "AE leading to interruption of study drug",
                                       "DOSE REDUCED" = "AE leading to reduction of study drug",
                                       "DOSE RATE REDUCED" = "AE leading to dose delay of study drug",
                                       "DOSE INCREASED" = "Other"
                                     ),
                                     sev_var = "AESEV") {
  s_df <- df |>
    dplyr::filter(.data[[saffl_var]] == "Y")

  sae <- s_df |>
    dplyr::filter(.data[[sae_var]] == "Y") |>
    dplyr::mutate(!!sae_var := "SAE")

  tbl_any_sae <- gtsummary::tbl_hierarchical(
    data = sae,
    denominator = denominator,
    id = id_var,
    by = dplyr::all_of(arm_var),
    variables = dplyr::all_of(sae_var),
    label = sae_var ~ "Event"
  )

  tbl_sae_cat_list <- mapply(function(categ, label) {
    data <- sae |>
      dplyr::filter(.data[[categ]] == "Y") |>
      dplyr::mutate(!!categ := label)

    gtsummary::tbl_hierarchical(
      data = data,
      denominator = denominator,
      id = id_var,
      by = dplyr::all_of(arm_var),
      variables = dplyr::all_of(categ),
      statistic = ~"{n} ({p}%)",
      label = categ ~ "Event"
    )
  }, categ = sae_cat_vars, label = names(sae_cat_vars), SIMPLIFY = FALSE)

  tbl_sae <- append(list(tbl_any_sae), tbl_sae_cat_list) |>
    gtsummary::tbl_stack() |>
    gtsummary::modify_column_indent("label", rows = variable %in% sae_cat_vars)

  disc_ae <- df |>
    dplyr::filter(.data[[disc_var]] == "SUBJECT DISCONTINUED FROM STUDY") |>
    dplyr::mutate(!!disc_var := "AE leading to permanent discontinuation of study drug")

  tbl_disc_ae <- gtsummary::tbl_hierarchical(
    data = disc_ae,
    denominator = denominator,
    id = id_var,
    by = dplyr::all_of(arm_var),
    variables = dplyr::all_of(disc_var),
    label = disc_var ~ "Event",
    statistic = ~"{n} ({p}%)"
  )

  dose_mod_ae <- df |>
    dplyr::filter(.data[[dose_mod_var]] %in% c("DRUG INTERRUPTED", "DOSE REDUCED", "DOSE RATE REDUCED", "DOSE INCREASED")) |>
    dplyr::mutate(!!dose_mod_var := dplyr::case_when(
      .data[[dose_mod_var]] == "DRUG INTERRUPTED" ~ dose_mod_cat_labels[["DRUG INTERRUPTED"]],
      .data[[dose_mod_var]] == "DOSE REDUCED" ~ dose_mod_cat_labels[["DOSE REDUCED"]],
      .data[[dose_mod_var]] == "DOSE RATE REDUCED" ~ dose_mod_cat_labels[["DOSE RATE REDUCED"]],
      .default = "Other"
    ))

  tbl_dose_mod_ae <- gtsummary::tbl_hierarchical(
    data = dose_mod_ae,
    denominator = denominator,
    id = id_var,
    by = dplyr::all_of(arm_var),
    variables = dplyr::all_of(dose_mod_var),
    label = list(
      dose_mod_var ~ "Event",
      ..ard_hierarchical_overall.. = "AE leading to dose modification of study drug"
    ),
    statistic = ~"{n} ({p}%)",
    overall_row = TRUE
  )

  tbl_any_ae <- gtsummary::tbl_hierarchical(
    data = df,
    denominator = denominator,
    id = id_var,
    by = dplyr::all_of(arm_var),
    variables = dplyr::all_of(sev_var),
    label = list(sev_var ~ "Event", ..ard_hierarchical_overall.. = "Any AE"),
    statistic = ~"{n} ({p}%)",
    overall_row = TRUE
  )

  tbl <- list(tbl_sae, tbl_disc_ae, tbl_dose_mod_ae, tbl_any_ae) |>
    gtsummary::tbl_stack() |>
    gtsummary::modify_column_indent("label",
      rows = !(variable %in% c("..ard_hierarchical_overall..", sae_var, disc_var))
    )

  tbl
}
