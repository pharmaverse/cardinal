#' FDA Table 3: Patient Screening and Enrollment, Trials A and B
#'
#' @details
#' * `df` must contain `ENRLDT`, `RANDDT`, and the variables specified by `id_var`, `arm_var`, `scrnfl_var`,
#'   `scrnfailfl_var`, and `scrnfail_var`.
#' * If specified, `denominator` must contain the variables specified by `id_var` and `arm_var`.
#' * Patients are considered enrolled in they have an enrollment date (`ENRLDT` is not missing), and are considered
#'   randomized if they have a randomization date (`RANDDT` is not missing).
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#'
#' @inheritParams tbl_make_table_03
#' @inheritParams argument_convention
#'
#' @return A `gtsummary` table and, if `return_ard = TRUE`, an ARD. If `return_ard = TRUE`, they will be returned as a
#'   list with named elements `table` and `ard`.
#'
#' @seealso [`tbl_make_table_03`]
#'
#' @examples
#' library(dplyr)
#'
#' adsl <- random.cdisc.data::cadsl
#'
#' set.seed(1)
#' adsl$RANDDT[sample(seq_len(nrow(adsl)), 100)] <- NA
#' scrnfail_reas_lvls <- c(
#'   "Inclusion/exclusion criteria not met", "Patient noncompliance", "Consent withdrawn", "Other"
#' )
#' adsl <- adsl %>%
#'   mutate(
#'     ENRLDT = RANDDT,
#'     SCRNFL = "Y",
#'     SCRNFRS = factor(sample(scrnfail_reas_lvls, size = nrow(adsl), replace = TRUE),
#'       levels = scrnfail_reas_lvls
#'     ),
#'     SCRNFAILFL = ifelse(is.na(ENRLDT), "Y", "N")
#'   )
#' adsl$SCRNFRS[adsl$SCRNFL == "N" | !is.na(adsl$ENRLDT)] <- NA
#'
#' tbl <- make_table_03(df = adsl, denominator = adsl)
#' tbl
#'
#' @export
make_table_03 <- function(df,
                          denominator = NULL,
                          return_ard = TRUE,
                          arm_var = "ARM",
                          id_var = "USUBJID",
                          scrnfl_var = "SCRNFL",
                          scrnfailfl_var = "SCRNFAILFL",
                          scrnfail_var = "SCRNFRS") {
  ard <- ard_table_03(
    df = df,
    denominator = denominator,
    arm_var = arm_var,
    id_var = id_var,
    scrnfl_var = scrnfl_var,
    scrnfailfl_var = scrnfailfl_var,
    scrnfail_var = scrnfail_var
  )

  tbl <- make_table_03_gtsummary(
    df = df,
    denominator = denominator,
    arm_var = arm_var,
    id_var = id_var,
    scrnfl_var = scrnfl_var,
    scrnfailfl_var = scrnfailfl_var,
    scrnfail_var = scrnfail_var
  )

  if (return_ard) {
    return(list(table = tbl, ard = ard))
  } else {
    return(tbl)
  }
}

#' Pre-Process Data for Table 3 Creation
#'
#' @keywords internal
preproc_df_table_03 <- function(df,
                                arm_var = "ARM",
                                id_var = "USUBJID",
                                scrnfl_var = "SCRNFL",
                                scrnfailfl_var = "SCRNFAILFL",
                                scrnfail_var = "SCRNFRS") {
  assert_subset(c(arm_var, id_var, scrnfl_var, scrnfailfl_var, scrnfail_var, "ENRLDT", "RANDDT"), names(df))
  assert_flag_variables(df, c(scrnfl_var, scrnfailfl_var))

  df %>%
    df_explicit_na() %>%
    mutate(
      SCRNFL = with_label(.data[[scrnfl_var]] == "Y", "Patients screened"),
      SCRNFL = with_label(!is.na(scrnfail_var), "Screnning failures"),
      ENRLFL = with_label(!is.na(ENRLDT), "Patients enrolled"),
      RANDFL = with_label(!is.na(RANDDT), "Patients randomized")
    )
}

#' Make ARD: Table 3
#'
#' @examples
#' library(dplyr)
#'
#' adsl <- random.cdisc.data::cadsl
#'
#' set.seed(1)
#' adsl$RANDDT[sample(seq_len(nrow(adsl)), 100)] <- NA
#' scrnfail_reas_lvls <- c(
#'   "Inclusion/exclusion criteria not met", "Patient noncompliance", "Consent withdrawn", "Other"
#' )
#' adsl <- adsl %>%
#'   mutate(
#'     ENRLDT = RANDDT,
#'     SCRNFL = "Y",
#'     SCRNFRS = factor(sample(scrnfail_reas_lvls, size = nrow(adsl), replace = TRUE),
#'       levels = scrnfail_reas_lvls
#'     ),
#'     SCRNFAILFL = ifelse(is.na(ENRLDT), "Y", "N")
#'   )
#' adsl$SCRNFRS[adsl$SCRNFL == "N" | !is.na(adsl$ENRLDT)] <- NA
#'
#' ard <- cardinal:::ard_table_03(df = df)
#' ard
#'
#' @keywords internal
#' @name ard_make_table_03
ard_table_03 <- function(df,
                         denominator = NULL,
                         arm_var = "ARM",
                         id_var = "USUBJID",
                         scrnfl_var = "SCRNFL",
                         scrnfailfl_var = "SCRNFAILFL",
                         scrnfail_var = "SCRNFRS") {
  df <- preproc_df_table_03(df, arm_var, id_var, scrnfl_var, scrnfailfl_var, scrnfail_var)

  if (is.null(denominator)) {
    denominator <- df
  } else {
    denominator <- alt_counts_df_preproc(denominator, id_var, arm_var)
  }

  scrn_ard <- df |>
    group_by(!!rlang::sym(arm_var)) |>
    ard_dichotomous(
      variables = SCRNFL,
      value = list(SCRNFL = TRUE),
      statistic = everything() ~ c("n"),
      denominator = denominator
    )

  scrnfail_ard <- df |>
    group_by(!!rlang::sym(arm_var)) |>
    ard_categorical(
      variables = SCRNFRS,
      statistic = everything() ~ c("n", "p")
    )

  enrl_rand_ard <- df |>
    group_by(!!rlang::sym(arm_var)) |>
    ard_dichotomous(
      variables = c(ENRLFL, RANDFL),
      value = list(ENRLFL = TRUE, RANDFL = TRUE),
      statistic = everything() ~ c("n", "p"),
      denominator = denominator
    )

  ard <- bind_ard(scrn_ard, scrnfail_ard, enrl_rand_ard)

  ard
}

#' Engine-Specific Functions: Table 3
#'
#' The table engine used by each engine-specific function is identified by its suffix.
#'
#' @inheritParams argument_convention
#'
#' @details
#' * `df` must contain `ENRLDT`, `RANDDT`, and the variables specified by `id_var`, `arm_var`, `scrnfl_var`,
#'   `scrnfailfl_var`, and `scrnfail_var`.
#' * If specified, `alt_counts_df` must contain the variables specified by `id_var` and `arm_var`.
#' * Patients are considered enrolled in they have an enrollment date (`ENRLDT` is not missing), and are considered
#'   randomized if they have a randomization date (`RANDDT` is not missing).
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are removed by default (see `prune_0` argument).
#'
#' @return
#' * `make_table_03_gtsummary()` returns a `gtsummary` object.
#' * `make_table_03_rtables()` returns an `rtable` object.
#'
#' @seealso [make_table_03()]
#'
#' @inheritParams make_table_03
#'
#' @examples
#' library(dplyr)
#'
#' adsl <- random.cdisc.data::cadsl
#'
#' set.seed(1)
#' adsl$RANDDT[sample(seq_len(nrow(adsl)), 100)] <- NA
#' scrnfail_reas_lvls <- c(
#'   "Inclusion/exclusion criteria not met", "Patient noncompliance", "Consent withdrawn", "Other"
#' )
#' adsl <- adsl %>%
#'   mutate(
#'     ENRLDT = RANDDT,
#'     SCRNFL = "Y",
#'     SCRNFRS = factor(sample(scrnfail_reas_lvls, size = nrow(adsl), replace = TRUE),
#'       levels = scrnfail_reas_lvls
#'     ),
#'     SCRNFAILFL = ifelse(is.na(ENRLDT), "Y", "N")
#'   )
#' adsl$SCRNFRS[adsl$SCRNFL == "N" | !is.na(adsl$ENRLDT)] <- NA
#'
#' # gtsummary table --------------
#' tbl_gtsummary <- cardinal:::make_table_03_gtsummary(
#'   df = adsl, scrnfl_var = "SCRNFL", scrnfailfl_var = "SCRNFAILFL",
#'   scrnfail_var = "SCRNFRS"
#' )
#' tbl_gtsummary
#'
#' # rtables table ----------------
#' tbl_rtables <- cardinal:::make_table_03_rtables(
#'   df = adsl, scrnfl_var = "SCRNFL", scrnfailfl_var = "SCRNFAILFL",
#'   scrnfail_var = "SCRNFRS"
#' )
#' tbl_rtables
#'
#' @export
#' @name tbl_make_table_03
make_table_03_gtsummary <- function(df,
                                    denominator = NULL,
                                    arm_var = "ARM",
                                    id_var = "USUBJID",
                                    scrnfl_var = "SCRNFL",
                                    scrnfailfl_var = "SCRNFAILFL",
                                    scrnfail_var = "SCRNFRS") {
  df <- preproc_df_table_03(df, arm_var, id_var, scrnfl_var, scrnfailfl_var, scrnfail_var)

  if (is.null(denominator)) {
    denominator <- df
  } else {
    denominator <- alt_counts_df_preproc(denominator, id_var, arm_var)
  }

  tbl <- df %>%
    select("ARM", scrnfl_var, scrnfail_var, "ENRLFL", "RANDFL") %>%
    tbl_summary(
      by = arm_var,
      label = list(
        scrnfl_var ~ "Patients screened",
        scrnfail_var ~ "Screening failures"
      ),
      missing = "no"
    ) %>%
    modify_header(label ~ "**Disposition**")

  tbl
}

#' @export
#' @rdname tbl_make_table_03
make_table_03_rtables <- function(df,
                                  alt_counts_df = NULL,
                                  show_colcounts = FALSE,
                                  arm_var = "ARM",
                                  id_var = "USUBJID",
                                  scrnfl_var,
                                  scrnfailfl_var,
                                  scrnfail_var,
                                  lbl_overall = NULL,
                                  prune_0 = TRUE,
                                  annotations = NULL) {
  assert_subset(
    c(id_var, scrnfl_var, scrnfailfl_var, scrnfail_var, "ENRLDT", "RANDDT", arm_var), names(df)
  )
  assert_flag_variables(df, c(scrnfl_var, scrnfailfl_var))

  df <- df %>%
    mutate(
      SCRNFL = with_label(.data[[scrnfl_var]] == "Y", "Patients screened"),
      ENRLFL = with_label(!is.na(ENRLDT), "Patients enrolled"),
      RANDFL = with_label(!is.na(RANDDT), "Patients randomized")
    ) %>%
    df_explicit_na()
  if (!is.null(alt_counts_df)) {
    alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var)
  }

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = "SCRNFL",
      .stats = "count"
    ) %>%
    split_rows_by(scrnfailfl_var, split_fun = keep_split_levels("Y")) %>%
    summarize_num_patients(
      var = id_var,
      .stats = "unique",
      .labels = c(unique = "Screening failures")
    ) %>%
    count_occurrences(vars = scrnfail_var) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("ENRLFL", "RANDFL"),
      nested = FALSE
    ) %>%
    append_topleft("Disposition")

  tbl <- build_table(lyt, df = df, alt_counts_df = alt_counts_df)

  if (prune_0) tbl <- prune_table(tbl)
  tbl
}
