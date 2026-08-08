#' FDA Table 50: Serious Adverse Events by Demographic Subgroup,
#'   Safety Population, Pooled Analysis
#'
#' @description
#' Creates FDA Table 50 showing any SAE and SAE counts stratified by demographic subgroups
#' (sex, age group, race, ethnicity) for the safety population.
#'
#' @param df (`data.frame`)\cr dataset (typically ADAE) required to build the table.
#' @param denominator (`data.frame`)\cr safety-filtered ADSL dataset used as the denominator.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable. Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param trtemfl_var (`character`)\cr name of the treatment-emergent flag variable.
#'   Defaults to `"TRTEMFL"`.
#' @param ser_var (`character`)\cr name of the variable indicating serious AEs. Defaults to `"AESER"`.
#' @param sex_var (`character`)\cr name of the sex variable. Defaults to `"SEX"`.
#' @param age_var (`character`)\cr name of the age group variable. Defaults to `"AGEGR1"`.
#' @param race_var (`character`)\cr name of the race variable. Defaults to `"RACE"`.
#' @param ethnic_var (`character`)\cr name of the ethnicity variable. Defaults to `"ETHNIC"`.
#'
#' @details
#' * `df` must contain `saffl_var`, `trtemfl_var`, `ser_var`, `arm_var`, `id_var`,
#'   `sex_var`, `age_var`, `race_var`, and `ethnic_var`.
#' * `denominator` must be pre-filtered to the safety population and contain `arm_var` and `id_var`.
#' * The table stacks: any SAE row + sex breakdown + age group breakdown +
#'   race breakdown + ethnicity breakdown.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE)
#' library(dplyr)
#'
#' adsl <- pharmaverseadam::adsl |>
#'   filter(SAFFL == "Y") |>
#'   mutate(TRT01A = as.factor(TRT01A))
#' adae <- pharmaverseadam::adae |>
#'   mutate(TRT01A = as.factor(TRT01A))
#'
#' result <- make_table_50(df = adae, denominator = adsl)
#' result$table
#'
#' @importFrom dplyr filter mutate distinct slice_head all_of
#' @importFrom gtsummary tbl_hierarchical tbl_stack modify_indent remove_footnote_header
#' @importFrom gtsummary modify_post_fmt_fun all_stat_cols gather_ard
#' @export
make_table_50 <- function(df,
                          denominator,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "TRT01A",
                          saffl_var = "SAFFL",
                          trtemfl_var = "TRTEMFL",
                          ser_var = "AESER",
                          sex_var = "SEX",
                          age_var = "AGEGR1",
                          race_var = "RACE",
                          ethnic_var = "ETHNIC") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(
    id_var, arm_var, saffl_var, trtemfl_var, ser_var,
    sex_var, age_var, race_var, ethnic_var
  ) %in% names(df)))
  stopifnot(is.data.frame(denominator))
  stopifnot(all(c(id_var, arm_var) %in% names(denominator)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)

  data <- df |>
    dplyr::filter(
      .data[[saffl_var]] == "Y",
      .data[[trtemfl_var]] == "Y",
      .data[[ser_var]] == "Y"
    ) |>
    dplyr::mutate(
      SEXGR = "Sex, n (%)",
      SEXGR1 = as.factor(.data[[sex_var]]),
      AGEGR = "Age group, years, n(%)",
      RACEGR = "Race, n(%)",
      ETHNICGR = "Ethnicity, n(%)",
      ETHNICGR1 = as.factor(.data[[ethnic_var]])
    )

  data_any_sae <- df |>
    dplyr::filter(.data[[ser_var]] == "Y") |>
    dplyr::mutate(!!ser_var := "Any SAE, n(%)")

  tbl_any_sae <- gtsummary::tbl_hierarchical(
    data = data_any_sae,
    denominator = denominator,
    id = id_var,
    by = dplyr::all_of(arm_var),
    variables = dplyr::all_of(ser_var),
    statistic = ~"{n} ({p}%)",
    label = stats::setNames(list("Characteristic"), ser_var)
  )

  sae_denom <- data_any_sae |> dplyr::slice_head(by = dplyr::all_of(id_var))

  tbl_sex <- gtsummary::tbl_hierarchical(
    data = data,
    denominator = sae_denom,
    id = dplyr::all_of(id_var),
    by = dplyr::all_of(arm_var),
    variables = c(SEXGR, SEXGR1),
    include = SEXGR1,
    statistic = ~"{n}/{N} ({p}%)"
  )

  tbl_age <- gtsummary::tbl_hierarchical(
    data = data,
    denominator = sae_denom,
    id = dplyr::all_of(id_var),
    by = dplyr::all_of(arm_var),
    variables = c(AGEGR, dplyr::all_of(age_var)),
    include = dplyr::all_of(age_var),
    statistic = ~"{n}/{N} ({p}%)"
  )

  tbl_race <- gtsummary::tbl_hierarchical(
    data = data,
    denominator = sae_denom,
    id = dplyr::all_of(id_var),
    by = dplyr::all_of(arm_var),
    variables = c(RACEGR, dplyr::all_of(race_var)),
    include = dplyr::all_of(race_var),
    statistic = ~"{n}/{N} ({p}%)"
  )

  tbl_ethnic <- gtsummary::tbl_hierarchical(
    data = data,
    denominator = sae_denom,
    id = dplyr::all_of(id_var),
    by = dplyr::all_of(arm_var),
    variables = c(ETHNICGR, ETHNICGR1),
    include = ETHNICGR1,
    statistic = ~"{n}/{N} ({p}%)"
  )

  grp_vars <- c("..ard_hierarchical_overall..", ser_var, "SEXGR", "AGEGR", "RACEGR", "ETHNICGR")

  tbl <- list(tbl_any_sae, tbl_sex, tbl_age, tbl_race, tbl_ethnic) |>
    gtsummary::tbl_stack() |>
    gtsummary::modify_indent(
      "label",
      rows = !(variable %in% grp_vars)
    ) |>
    gtsummary::remove_footnote_header(columns = dplyr::everything()) |>
    gtsummary::modify_post_fmt_fun(
      fmt_fun = ~ ifelse(. == "0/0 (NA%)", "0 (0%)", .),
      columns = gtsummary::all_stat_cols()
    )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
