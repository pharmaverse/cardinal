#' FDA Table 51: Adverse Events by Demographic Subgroup,
#'   Safety Population, Pooled Analysis
#'
#' @description
#' Creates FDA Table 51 showing any treatment-emergent adverse event and AE counts stratified
#' by demographic subgroups (sex, age group, race, ethnicity) using a custom ARD approach.
#'
#' @param df (`data.frame`)\cr dataset (typically ADAE) required to build the table. Should be
#'   pre-filtered to one row per subject (e.g. using `dplyr::slice_tail(by=c(id_var, arm_var))`).
#' @param denominator (`data.frame`)\cr safety-filtered ADSL dataset used as the denominator.
#' @param return_ard (`flag`)\cr whether an ARD should be returned. Defaults to `TRUE`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param arm_var (`character`)\cr name of the treatment arm variable. Defaults to `"ARM"`.
#' @param sex_var (`character`)\cr name of the sex variable. Defaults to `"SEX"`.
#' @param age_var (`character`)\cr name of the age group variable. Defaults to `"AGEGR1"`.
#' @param race_var (`character`)\cr name of the race variable. Defaults to `"RACE"`.
#' @param ethnic_var (`character`)\cr name of the ethnicity variable. Defaults to `"ETHNIC"`.
#'
#' @details
#' * `df` should be pre-filtered to treatment-emergent AEs (`TRTEMFL == "Y"`) and one AE per
#'   subject (e.g. `dplyr::slice_tail(by = c(id_var, arm_var))`) before calling this function.
#'   A derived `any_ae` column is added internally.
#' * `denominator` must be pre-filtered to the safety population and contain `arm_var` and the
#'   demographic variables.
#' * Numbers in table represent the absolute numbers of patients and fraction of the safety N.
#' * When `return_ard = TRUE`, returns a named list with elements `table` and `ard`.
#'
#' @return A `gtsummary` table, or if `return_ard = TRUE`, a named list with elements `table` and `ard`.
#'
#' @examplesIf requireNamespace("random.cdisc.data", quietly = TRUE)
#' library(dplyr)
#'
#' adsl <- random.cdisc.data::cadsl |> filter(SAFFL == "Y") |> mutate(any_ae = "Any AE")
#' adae <- random.cdisc.data::cadae |>
#'   filter(SAFFL == "Y", TRTEMFL == "Y") |>
#'   slice_tail(n = 1L, by = all_of(c("USUBJID", "ARM")))
#'
#' result <- make_table_51(df = adae, denominator = adsl, arm_var = "ARM")
#' result$table
#'
#' @importFrom dplyr filter mutate select all_of rowwise
#' @importFrom cards bind_ard ard_categorical tidy_ard_row_order
#' @importFrom gtsummary tbl_ard_summary modify_table_body modify_indent modify_footnote_header
#' @importFrom gtsummary modify_header all_stat_cols gather_ard
#' @importFrom tidyr pivot_wider
#' @export
make_table_51 <- function(df,
                          denominator,
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
                          sex_var = "SEX",
                          age_var = "AGEGR1",
                          race_var = "RACE",
                          ethnic_var = "ETHNIC") {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(id_var, arm_var, sex_var, age_var, race_var, ethnic_var) %in% names(df)))
  stopifnot(is.data.frame(denominator))
  stopifnot(all(c(arm_var, sex_var, age_var, race_var, ethnic_var) %in% names(denominator)))
  stopifnot(is.logical(return_ard), length(return_ard) == 1L)

  subj_vars <- c(sex_var, age_var, race_var, ethnic_var)

  df <- df |> dplyr::mutate(any_ae = "Any AE")
  denominator <- denominator |> dplyr::mutate(any_ae = "Any AE")

  ard_vars <- c("any_ae", subj_vars)

  ard_summary <- df |>
    cards::ard_categorical(
      variables = dplyr::all_of(ard_vars),
      by = dplyr::all_of(arm_var),
      statistic = ~ "n"
    )

  ard_ns <- denominator |>
    cards::ard_categorical(
      variables = dplyr::all_of(ard_vars),
      by = dplyr::all_of(arm_var),
      statistic = ~ "n",
      stat_label = ~ list(n = "N_s")
    ) |>
    dplyr::mutate(stat_name = "N_s")

  ard_p <- cards::bind_ard(ard_summary, ard_ns) |>
    dplyr::select(-stat_label) |>
    tidyr::pivot_wider(names_from = stat_name, values_from = stat, values_fn = unlist) |>
    dplyr::rowwise() |>
    dplyr::mutate(
      stat_name = "p",
      stat_label = "%",
      stat = if (n > 0) list(n / N_s) else list(0),
      fmt_fun = list(label_round(digits = 1, scale = 100))
    ) |>
    dplyr::select(-n, -N_s)

  ard_data <- cards::bind_ard(
    ard_summary,
    ard_ns,
    ard_p,
    cards::ard_categorical(denominator, variables = dplyr::all_of(arm_var), statistic = ~ "n")
  ) |>
    cards::tidy_ard_row_order()

  label_list <- stats::setNames(
    as.list(c("Sex", "Age Group, years", "Race", "Ethnicity")),
    subj_vars
  )

  tbl <- gtsummary::tbl_ard_summary(
    ard_data,
    by = dplyr::all_of(arm_var),
    label = label_list
  ) |>
    gtsummary::modify_table_body(
      \(x) dplyr::filter(x, !label %in% "any_ae")
    ) |>
    gtsummary::modify_indent(columns = label, rows = variable == "any_ae", indent = 0L) |>
    gtsummary::modify_footnote_header(
      footnote = "n/N_s (%)",
      columns = gtsummary::all_stat_cols()
    ) |>
    gtsummary::modify_header(
      gtsummary::all_stat_cols() ~ "**{level}**  \n N = {n}"
    )

  if (return_ard) {
    ard <- gtsummary::gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  }

  tbl
}
