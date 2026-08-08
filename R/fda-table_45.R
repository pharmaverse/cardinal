#' FDA Table 45: Patients With Adverse Events by System Organ Class, FDA Medical Query (Broad,
#'   Female-Specific) and Preferred Term, Safety Population, Pooled Analysis
#'
#' @description
#' Creates FDA Table 45 showing female-specific adverse events by OCMQ (Broad scope) and
#' Preferred Term for the safety population.
#'
#' @param df (`data.frame`)\cr pre-filtered ADAE dataset with OCMQ columns and sex filter applied.
#'   The caller is responsible for filtering to the relevant sex and OCMQ scope and applying
#'   `forcats::fct_na_value_to_level()` for NA handling before passing to this function.
#' @param denominator (`data.frame`)\cr denominator dataset. Typically derived as
#'   `dplyr::distinct(df, USUBJID, TRT01A)` so rates reflect only subjects with AEs.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable. Defaults to `"TRT01A"`.
#' @param ocmqnam_var (`character`)\cr name of the OCMQ name variable. Defaults to `"OCMQ01NAM"`.
#' @param pref_var (`character`)\cr name of the preferred term variable. Defaults to `"AEDECOD"`.
#' @param ocmq_scope (`character`)\cr OCMQ scope label used in the table header.
#'   Defaults to `"BROAD"`.
#'
#' @details
#' * `df` should already be filtered for safety population, sex, and OCMQ scope before being
#'   passed to this function. Apply `forcats::fct_na_value_to_level()` to ensure NA strata appear.
#' * `denominator` is typically `dplyr::distinct(df, id_var, arm_var)` so N reflects subjects
#'   with AEs in the filtered population.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE) && requireNamespace("forcats", quietly = TRUE)
#' set.seed(1)
#' library(dplyr)
#' adae <- pharmaverseadam::adae |>
#'   mutate(
#'     OCMQ01SC = as.factor(sample(c("BROAD", "NARROW"), dplyr::n(), replace = TRUE)),
#'     OCMQ01NAM = dplyr::if_else(
#'       SEX == "F",
#'       as.factor(sample(
#'         c("Abnormal Uterine Bleeding", "Amenorrhea", "Bacterial Vaginosis",
#'           "Decreased Menstrual Bleeding"),
#'         dplyr::n(), replace = TRUE
#'       )),
#'       NA_character_
#'     )
#'   )
#' data <- adae |>
#'   filter(SAFFL == "Y", SEX == "F", OCMQ01SC == "BROAD") |>
#'   select(OCMQ01SC, TRT01A, OCMQ01NAM, AEDECOD, USUBJID) |>
#'   mutate(across(everything(), ~ forcats::fct_na_value_to_level(as.factor(.), level = "<Missing>")))
#' denom <- dplyr::distinct(data, USUBJID, TRT01A)
#'
#' result <- make_table_45(df = data, denominator = denom)
#' result$table
#'
#' @importFrom dplyr all_of distinct
#' @importFrom gtsummary tbl_hierarchical gather_ard
#' @export
make_table_45 <- function(df,
                          denominator,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          ocmqnam_var = "OCMQ01NAM",
                          pref_var = "AEDECOD",
                          ocmq_scope = "BROAD") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(id_var, arm_var, ocmqnam_var, pref_var) %in% names(df)))
  stopifnot(is.data.frame(denominator))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)

  scope_label <- tools::toTitleCase(tolower(ocmq_scope))

  tbl <- df |>
    gtsummary::tbl_hierarchical(
      by = dplyr::all_of(arm_var),
      variables = dplyr::all_of(c(ocmqnam_var, pref_var)),
      id = dplyr::all_of(id_var),
      denominator = denominator,
      include = dplyr::all_of(pref_var),
      label = list(
        dplyr::all_of(ocmqnam_var) ~ paste0("OCMQ (", scope_label, ")"),
        dplyr::all_of(pref_var) ~ "Preferred Term"
      )
    )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
