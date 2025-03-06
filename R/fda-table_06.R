#' Table engine for FDA Table 6: Overview of Adverse Events, Safety Population, Pooled Analyses
#'
#' @inheritParams make_table_06
#'
#' @return A `gtsummary` table
make_table_06_gtsummary <- function(df,
                                    denominator,
                                    id_var = "USUBJID",
                                    return_ard = TRUE,
                                    arm_var = "ARM",
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
  # Use safety population only
  s_df <- df |>
    filter(.data[[saffl_var]] == "Y")

  # -- PART 1: Create first of four table parts (Overview of serious AEs)

  # Summarize SAEs in an overall manner
  sae <- s_df |>
    filter(.data[[sae_var]] == "Y") |>
    mutate(!!sae_var := "SAE")

  tbl_any_sae <- tbl_hierarchical(
    data = sae,
    denominator = denominator,
    id = id_var,
    by = all_of(arm_var),
    variables = all_of(sae_var),
    label = sae_var ~ "Event",
  )

  # Summarize SAEs per category
  # This is necessary as adae usually has one extra column per SAE category
  tbl_sae_cat_list <- mapply(function(categ, label) {
    data <- sae |>
      filter(.data[[categ]] == "Y") |>
      mutate(
        !!categ := label
      )

    tbl_hierarchical(
      data = data,
      denominator = denominator,
      id = id_var,
      by = all_of(arm_var),
      variables = all_of(categ),
      statistic = ~ "{n} ({p}%)",
      label = categ ~ "Event"
    )
  }, categ = sae_cat_vars, label = names(sae_cat_vars), SIMPLIFY = FALSE)

  # Put first part together
  tbl_sae <- append(list(tbl_any_sae), tbl_sae_cat_list) |>
    tbl_stack() |>
    modify_column_indent("label", rows = variable %in% sae_cat_vars)


  # -- PART 2: Create second of four table parts (Permanent discontinuation)

  disc_ae <- df |>
    filter(.data[[disc_var]] == "SUBJECT DISCONTINUED FROM STUDY") |>
    mutate(
      !!disc_var := "AE leading to permanent discontinuation of study drug"
    )

  tbl_disc_ae <- tbl_hierarchical(
    data = disc_ae,
    denominator = denominator,
    id = id_var,
    by = all_of(arm_var),
    variables = all_of(disc_var),
    label = disc_var ~ "Event",
    statistic = ~ "{n} ({p}%)"
  )


  # -- PART 3: Create third of four table parts (Dose modification)
  dose_mod_ae <- df |>
    filter(.data[[dose_mod_var]] %in% c("DRUG INTERRUPTED", "DOSE REDUCED", "DOSE RATE REDUCED", "DOSE INCREASED")) |>
    mutate(
      !!dose_mod_var := case_when(
        .data[[dose_mod_var]] == "DRUG INTERRUPTED" ~ dose_mod_cat_labels[["DRUG INTERRUPTED"]],
        .data[[dose_mod_var]] == "DOSE REDUCED" ~ dose_mod_cat_labels[["DOSE REDUCED"]],
        .data[[dose_mod_var]] == "DOSE RATE REDUCED" ~ dose_mod_cat_labels[["DOSE RATE REDUCED"]],
        .default = "Other"
      )
    )

  tbl_dose_mod_ae <- tbl_hierarchical(
    data = dose_mod_ae,
    denominator = denominator,
    id = id_var,
    by = all_of(arm_var),
    variables = all_of(dose_mod_var),
    label = list(
      dose_mod_var ~ "Event",
      ..ard_hierarchical_overall.. = "AE leading to dose modification of study drug"
    ),
    statistic = ~ "{n} ({p}%)",
    overall_row = TRUE
  )

  # -- PART 4: Create fourth of four table parts (Any AE)

  tbl_any_ae <- tbl_hierarchical(
    data = df,
    denominator = denominator,
    id = id_var,
    by = all_of(arm_var),
    variables = all_of(sev_var),
    label = list(sev_var ~ "Event", ..ard_hierarchical_overall.. = "Any AE"),
    statistic = ~ "{n} ({p}%)",
    overall_row = TRUE
  )


  # Put it all together
  tbl <- list(tbl_sae, tbl_disc_ae, tbl_dose_mod_ae, tbl_any_ae) |>
    tbl_stack() |>
    modify_column_indent("label", rows = !(variable %in% c("..ard_hierarchical_overall..", sae_var, disc_var)))

  return(tbl)
}





#' FDA Table 6: Overview of Adverse Events, Safety Population, Pooled Analyses
#'
#' @inheritParams argument_convention
#'
#' @param sae_var (`character`)\cr Name of the flag variable indicating whether an adverse event is serious ("Y") or
#'  not ("N"). Defaults to AESER from an ADAE ADaM dataset.
#' @param sae_cat_vars (named `list` of `character`) \cr List of names of flag variables for categories of serious
#'  adverse events. These variables may contain "Y" or "No". Defaults to AESDTH, AESLIFE, AESHOSP, AESDISAB, AESCONG,
#'  and AESMIE from an ADAE ADaM dataset. Provide labels through names of the list elements.
#' @param disc_var (`character`) \cr Name of the variable containing information whether a subject discontinued from
#'  the study as result of an adverse event. Defaults to AEACNOTH from an ADAE ADaM dataset.
#' @param dose_mod_var (`character`) \cr Name of the variable containing information about dose modification for a
#'  subject due to an adverse event. Defaults to AEACN from an ADAE ADaM dataset.
#' @param dose_mod_cat_labels (named `list` of `character`) \cr List of labels for the dose modification categories as
#'  listed in the details section.
#' @param sev_var Name of the variable containing information about the severity of an adverse event. Defaults to AESEV
#'  from an ADAE ADaM dataset.
#'
#' @details
#' Typically, an ADAE ADaM dataset is passed to `df`. \cr
#' Typically, an ADSL ADaM dataset is passed to `denominator`. \cr
#'
#' The values passed through `id_var` and `arm_var` must be present in `names(denominator)`. \cr
#' The values passed through `saffl_var`, `arm_var`, `sae_var`, `sae_cat_vars`, `disc_var`, `dose_mod_var`, and
#'  `sev_var` must be present in `names(df)`. \cr
#'
#' Discontinuation from the study needs to be indicated by the value "SUBJECT DISCONTINUED FROM STUDY" in the `disc_var`
#'  variable. \cr
#' Dose modification may be "DRUG INTERRUPTED", "DOSE REDUCED", "DOSE RATE REDUCED", "DOSE INCREASED".
#'
#' @return A `gtsummary` table and, if `return_ard = TRUE`, an ARD.
#'   If `return_ard = TRUE`, objects will be returned as a list with named elements `table` and `ard`.
#'
#' @export
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' adae <- random.cdisc.data::cadae
#'
#' tbl <- make_table_06(df = adae, denominator = adsl)
#' tbl
make_table_06 <- function(df,
                          denominator, # cannot be missing as per tbl_hierarchical() definition
                          return_ard = TRUE,
                          id_var = "USUBJID",
                          arm_var = "ARM",
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

  assert_subset(c(id_var, arm_var), names(denominator))
  assert_subset(c(arm_var, saffl_var, sae_var, unlist(sae_cat_vars), disc_var, dose_mod_var, sev_var), names(df))
  assert_flag_variables(df, c(saffl_var, sae_var, unlist(sae_cat_vars)))

  tbl <- make_table_06_gtsummary(
    df = df,
    denominator = denominator,
    return_ard = return_ard,
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

  # Return ARD if desired
  if (return_ard) {
    ard <- gather_ard(tbl)
    return(list(table = tbl, ard = ard))
  } else {
    return(tbl)
  }
}




#' FDA Table 6: Overview of Adverse Events, Safety Population, Pooled Analyses
#'
#' @details
#' * `adae` must contain the variables `TRTEMFL`, `AESEV`, `AESER`, `AESDTH`, `AESLIFE`,
#'   `AESHOSP`, `AESDISAB`, `AESCONG`, `AESMIE`, `AEACN`, and the variables specified by `arm_var`,
#'   `id_var`, and `saffl_var`.
#' * If specified, `alt_counts_df` must contain the variables specified by `arm_var`, `id_var`, and `saffl_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Columns are split by arm. Overall population column is excluded by default (see `lbl_overall` argument).
#' * Numbers in table represent the absolute numbers of patients and fraction of `N`.
#' * All-zero rows are not removed by default (see `prune_0` argument).
#'
#' @inheritParams argument_convention
#'
#' @return An `rtable` object.
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#' adae <- random.cdisc.data::cadae
#'
#' tbl <- make_table_06_rtables(adae = adae, alt_counts_df = adsl)
#' tbl
#'
#' @export
make_table_06_rtables <- function(adae,
                                  alt_counts_df = NULL,
                                  show_colcounts = TRUE,
                                  arm_var = "ARM",
                                  id_var = "USUBJID",
                                  saffl_var = "SAFFL",
                                  lbl_overall = NULL,
                                  risk_diff = NULL,
                                  prune_0 = FALSE,
                                  annotations = NULL) {
  assert_subset(c(
    "TRTEMFL", "AESEV", "AESER", "AESDTH", "AESLIFE", "AESHOSP",
    "AESDISAB", "AESCONG", "AESMIE", "AEACN", arm_var, id_var, saffl_var
  ), names(adae))
  assert_flag_variables(adae, c(saffl_var, "TRTEMFL"))

  adae <- adae %>%
    as_tibble() %>%
    filter(.data[[saffl_var]] == "Y", TRTEMFL == "Y") %>%
    df_explicit_na() %>%
    mutate(
      SER = with_label(AESER == "Y", "SAE"),
      SERFATAL = with_label(AESER == "Y" & AESDTH == "Y", "SAEs with fatal outcome"),
      SERLIFE = with_label(AESER == "Y" & AESLIFE == "Y", "Life-threatening SAEs"),
      SERHOSP = with_label(AESER == "Y" & AESHOSP == "Y", "SAEs requiring hospitalization"),
      SERDISAB = with_label(
        AESER == "Y" & AESDISAB == "Y",
        "SAEs resulting in substantial disruption of normal life functions"
      ),
      SERCONG = with_label(AESER == "Y" & AESCONG == "Y", "Congenital anomaly or birth defect"),
      SERMIE = with_label(AESER == "Y" & AESMIE == "Y", "Other"),
      WD = with_label(AEACN == "DRUG WITHDRAWN", "AE leading to permanent discontinuation of study drug"),
      DSM = with_label(
        AEACN %in% c("DOSE INCREASED", "DOSE REDUCED", "DOSE RATE REDUCED", "DRUG INTERRUPTED"),
        "AE leading to dose modification of study drug"
      ),
      DSINT = with_label(AEACN == "DRUG INTERRUPTED", "AE leading to interruption of study drug"),
      DSRED = with_label(AEACN == "DOSE REDUCED", "AE leading to reduction of study drug"),
      DSD = with_label(AEACN == "DOSE RATE REDUCED", "AE leading to dose delay of study drug"),
      DSMIE = with_label(AEACN == "DOSE INCREASED", "Other")
    )

  alt_counts_df <- alt_counts_df_preproc(alt_counts_df, id_var, arm_var, saffl_var)

  lyt <- basic_table_annot(show_colcounts, annotations) %>%
    split_cols_by_arm(arm_var, lbl_overall, risk_diff) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = "SER",
      table_names = "ser",
      riskdiff = !is.null(risk_diff)
    ) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("SERFATAL", "SERLIFE", "SERHOSP", "SERDISAB", "SERCONG", "SERMIE"),
      .indent_mods = 1L,
      table_names = "ser_fl",
      riskdiff = !is.null(risk_diff)
    ) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("WD", "DSM"),
      table_names = "ae",
      riskdiff = !is.null(risk_diff)
    ) %>%
    count_patients_with_flags(
      var = id_var,
      flag_variables = c("DSINT", "DSRED", "DSD", "DSMIE"),
      .indent_mods = 1L,
      table_names = "ds",
      riskdiff = !is.null(risk_diff)
    ) %>%
    analyze_num_patients(
      vars = id_var,
      .stats = "unique",
      .labels = c(unique = "Any AE"),
      show_labels = "hidden",
      riskdiff = !is.null(risk_diff)
    ) %>%
    count_occurrences_by_grade(
      var = "AESEV",
      show_labels = "hidden",
      .indent_mods = 1L,
      riskdiff = !is.null(risk_diff)
    ) %>%
    append_topleft("Event")

  tbl <- build_table(lyt, df = adae, alt_counts_df = alt_counts_df)
  if (prune_0) tbl <- prune_table(tbl)

  tbl
}
