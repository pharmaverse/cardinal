#' FDA Table 33: Patients With Adverse Events by OCMQ (Narrow Scope) and Preferred Term,
#'   Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 33 showing patients with adverse events by oncology condition medical query
#' (OCMQ, narrow scope) and preferred term.
#'
#' @param df (`data.frame`)\cr pre-processed dataset required to build the table. The caller is
#'   responsible for pre-filtering (e.g. safety population, sex, OCMQ scope), selecting the
#'   relevant columns, and handling missing levels before passing to this function.
#' @param denominator (`data.frame`)\cr dataset used as the denominator. Typically derived from
#'   `df` via `dplyr::distinct(id_var, arm_var)`.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param ocmqnam_var (`character`)\cr name of the OCMQ name variable. Defaults to `"OCMQ01NAM"`.
#' @param pref_var (`character`)\cr name of the preferred term variable. Defaults to `"AEDECOD"`.
#' @param ocmq_scope (`character`)\cr OCMQ scope label used in the row group header. Defaults to
#'   `"NARROW"`, which produces the label `"OCMQ (Narrow)"`.
#' @param na_level (`character`)\cr string label used for missing value levels. Defaults to
#'   `"<Missing>"`. Expected to have been applied to `df` by the caller before passing to this
#'   function (e.g. via `forcats::fct_na_value_to_level()`).
#'
#' @details
#' * Pre-processing (filtering to safety population, sex, and OCMQ scope; selecting columns;
#'   converting `NA` values to an explicit level via `forcats::fct_na_value_to_level()`) is the
#'   caller's responsibility and must be done before calling this function.
#' * `df` must contain the variables specified by `id_var`, `arm_var`, `ocmqnam_var`, and `pref_var`.
#' * `denominator` must contain the variables specified by `id_var` and `arm_var`.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE) && requireNamespace("forcats", quietly = TRUE)
#' library(dplyr)
#' library(forcats)
#'
#' set.seed(1)
#' adae <- pharmaverseadam::adae
#' adae <- rename(adae, OCMQ01SC = AEHLTCD, OCMQ01NAM = AEHLT)
#' levels(adae$OCMQ01SC) <- c("BROAD", "NARROW")
#' adae$OCMQ01SC[is.na(adae$OCMQ01SC)] <- "NARROW"
#' adae$OCMQ01NAM <- factor(adae$OCMQ01NAM, levels = c("Erectile Dysfunction", "Gynecomastia"))
#' adae$OCMQ01NAM[adae$SEX == "M"] <- as.factor(
#'   sample(c("Erectile Dysfunction", "Gynecomastia"), sum(adae$SEX == "M"), replace = TRUE)
#' )
#'
#' data <- adae |>
#'   filter(
#'     SAFFL == "Y", SEX == "M", OCMQ01SC == "NARROW",
#'     AEDECOD %in% c("COUGH", "COLD SWEAT", "SOMNOLENCE", "APPLICATION SITE ERYTHEMA")
#'   ) |>
#'   select(OCMQ01SC, TRT01A, OCMQ01NAM, AEDECOD, USUBJID) |>
#'   mutate(across(everything(), ~ fct_na_value_to_level(as.factor(.), level = "<Missing>")))
#'
#' denom <- data |> distinct(USUBJID, TRT01A)
#'
#' result <- make_table_33(df = data, denominator = denom)
#' result$table
#'
#' @importFrom dplyr all_of
#' @importFrom gtsummary tbl_hierarchical gather_ard
#' @export
make_table_33 <- function(df,
                          denominator,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          ocmqnam_var = "OCMQ01NAM",
                          pref_var = "AEDECOD",
                          ocmq_scope = "NARROW",
                          na_level = "<Missing>") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(id_var, arm_var, ocmqnam_var, pref_var) %in% names(df)))
  stopifnot(is.data.frame(denominator))
  stopifnot(all(c(id_var, arm_var) %in% names(denominator)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)

  ocmq_label <- paste0("OCMQ (", tools::toTitleCase(tolower(ocmq_scope)), ")")
  label_list <- stats::setNames(list(ocmq_label, "Preferred Term"), c(ocmqnam_var, pref_var))

  tbl <- df |>
    gtsummary::tbl_hierarchical(
      by = dplyr::all_of(arm_var),
      variables = dplyr::all_of(c(ocmqnam_var, pref_var)),
      id = dplyr::all_of(id_var),
      denominator = denominator,
      include = dplyr::all_of(pref_var),
      label = label_list
    )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
