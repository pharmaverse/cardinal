#' FDA Table 16: Patients With Adverse Events by Male-Specific FDA Medical Query (Broad)
#'   and Preferred Term, Male Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 16 showing patients with adverse events by male-specific FDA Medical Query
#' (Broad) and preferred term, restricted to the male safety population.
#'
#' @param df (`data.frame`)\cr dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame` or `NULL`)\cr dataset used as the denominator (typically ADSL).
#'   If `NULL`, `df` is used.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split table into columns.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param pref_var (`character`)\cr name of the preferred term variable. Defaults to `"AEDECOD"`.
#' @param sex_scope (`character`)\cr sex group to include. Defaults to `"M"` (male).
#' @param fmq_scope (`character`)\cr FMQ scope: `"NARROW"` or `"BROAD"`. Defaults to `"BROAD"`.
#' @param fmqsc_var (`character`)\cr name of the FMQ scope variable. Defaults to `"FMQ01SC"`.
#' @param fmqnam_var (`character`)\cr name of the FMQ name variable. Defaults to `"FMQ01NAM"`.
#' @param na_level (`character`)\cr string used to label missing values. Defaults to `"<Missing>"`.
#'
#' @details
#' * `df` must contain `SEX`, and the variables specified by `arm_var`, `id_var`, `saffl_var`,
#'   `pref_var`, `fmqsc_var`, and `fmqnam_var`.
#' * FMQ names that appear in the non-male population are excluded from the male analysis.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#'   Missing values in flag variables are treated as `"N"`.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("random.cdisc.data", quietly = TRUE) && requireNamespace("dplyr", quietly = TRUE)
#' library(dplyr)
#'
#' adsl <- random.cdisc.data::cadsl
#' adae <- random.cdisc.data::cadae
#'
#' set.seed(1)
#' adae <- dplyr::rename(adae, FMQ01SC = SMQ01SC, FMQ01NAM = SMQ01NAM)
#' levels(adae$FMQ01SC) <- c("BROAD", "NARROW")
#' adae$FMQ01SC[is.na(adae$FMQ01SC)] <- "NARROW"
#' adae$FMQ01NAM <- factor(
#'   adae$FMQ01NAM,
#'   levels = c(unique(adae$FMQ01NAM), "Erectile Dysfunction", "Gynecomastia")
#' )
#' adae$FMQ01NAM[adae$SEX == "M"] <- as.factor(
#'   sample(c("Erectile Dysfunction", "Gynecomastia"), sum(adae$SEX == "M"), replace = TRUE)
#' )
#'
#' result <- make_table_16(df = adae, denominator = adsl, arm_var = "ARM")
#' result$table
#'
#' @importFrom dplyr filter all_of
#' @importFrom gtsummary tbl_hierarchical gather_ard
#' @export
make_table_16 <- function(df,
                           denominator = NULL,
                           return_ard = TRUE,
                           id_var = "USUBJID",
                           arm_var = "TRT01A",
                           saffl_var = "SAFFL",
                           pref_var = "AEDECOD",
                           sex_scope = "M",
                           fmq_scope = "BROAD",
                           fmqsc_var = "FMQ01SC",
                           fmqnam_var = "FMQ01NAM",
                           na_level = "<Missing>") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c("SEX", arm_var, id_var, fmqsc_var, fmqnam_var, saffl_var, pref_var) %in% names(df)))
  stopifnot(toupper(fmq_scope) %in% c("NARROW", "BROAD"))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)
  if (!is.null(denominator)) {
    stopifnot(is.data.frame(denominator))
    stopifnot(all(c(arm_var, id_var) %in% names(denominator)))
  }

  fmq_other_sexes <- unique(df[df[["SEX"]] != sex_scope, ][[fmqnam_var]])

  df <- df |>
    dplyr::filter(
      .data[[saffl_var]] == "Y",
      .data[[fmqsc_var]] == toupper(fmq_scope),
      .data[["SEX"]] == sex_scope,
      !.data[[fmqnam_var]] %in% fmq_other_sexes
    )

  if (is.null(denominator)) {
    denominator <- df
  } else {
    denominator <- denominator |>
      dplyr::filter(.data[[saffl_var]] == "Y", .data[["SEX"]] == sex_scope)
  }

  tbl <- gtsummary::tbl_hierarchical(
    data = df,
    variables = dplyr::all_of(c(fmqnam_var, pref_var)),
    by = dplyr::all_of(arm_var),
    id = dplyr::all_of(id_var),
    denominator = denominator,
    overall_row = TRUE,
    label = list("..ard_hierarchical_overall.." ~ paste0("Any AE (FMQ ", tools::toTitleCase(tolower(fmq_scope)), ")"))
  )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
