library(falcon)
library(checkmate)
library(dplyr)
library(gtsummary)
library(cards)


adsl <- random.cdisc.data::cadsl
advs <- random.cdisc.data::cadvs

ard_stack(
  data = ADSL,
  by = "ARM",
  ard_categorical(variables = "AGEGR1"),
  ard_continuous(variables = "AGE")
)

make_table_32_gtsum <- function(advs,
                                alt_counts_df = NULL,
                                id_var = "USUBJID",
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                lbl_overall = NULL) {
  assert_subset(c(
    saffl_var, "AVISITN", "PARAMCD", "AVAL", "AVALU", arm_var, id_var
  ), names(advs))
  assert_flag_variables(advs, saffl_var)

  advs <- advs %>%
    filter(
      .data[[saffl_var]] == "Y",
      AVISITN >= 1,
      PARAMCD == "DIABP"
    ) %>%
    df_explicit_na() %>%
    group_by(.data[[id_var]], PARAMCD) %>%
    mutate(MAX_DIABP = max(AVAL)) %>%
    ungroup() %>%
    distinct(.data[[id_var]], .keep_all = TRUE) %>%
    select(all_of(id_var), MAX_DIABP, AVALU, all_of(arm_var))

  if (!is.null(alt_counts_df)) {
    adsl <- alt_counts_df %>%
      filter(.data[[saffl_var]] == "Y") %>%
      select(all_of(id_var), all_of(arm_var), all_of(saffl_var))

    advs <- advs %>% select(!all_of(arm_var))
    advs <-
      adsl %>%
      left_join(advs, by = id_var)
  } else {
    advs <- advs
  }

  advs <- advs %>%
    mutate(
      L60 = case_when(MAX_DIABP < 60 ~ "true", TRUE ~ "false"),
      G60 = case_when(MAX_DIABP > 60 ~ "true", TRUE ~ "false"),
      G90 = case_when(MAX_DIABP > 90 ~ "true", TRUE ~ "false"),
      G110 = case_when(MAX_DIABP > 110 ~ "true", TRUE ~ "false"),
      GE120 = case_when(MAX_DIABP >= 120 ~ "true", TRUE ~ "false")
    ) %>%
    mutate(
      L60 = with_label(L60 == "true", "<60"),
      G60 = with_label(G60 == "true", ">60"),
      G90 = with_label(G90 == "true", ">90"),
      G110 = with_label(G110 == "true", ">110"),
      GE120 = with_label(GE120 == "true", ">=120")
    ) %>%
    select(L60, G60, G90, G110, GE120, AVALU, arm_var)

  avalu <- unique(advs$AVALU)[1]
  advs <- advs %>% select(-AVALU)

  # tbl <- advs %>%
  #   tbl_summary(
  #     by = arm_var,
  #     statistic = list(all_categorical() ~ "{n} ({p}%)"),
  #     digits = everything() ~ c(0, 1),
  #     missing = "no"
  #   ) %>%
  #   modify_header(label ~ paste0("**Diastolic Blood Pressure (", avalu, ")**")) %>%
  #   modify_header(all_stat_cols() ~ "**{level}**  \nN = {n}") %>%
  #   gtsummary::modify_column_alignment(columns = all_stat_cols(), align = "right")
  #
  # if (!is.null(lbl_overall)) {
  #   tbl <- tbl %>%
  #     add_overall(last = TRUE, col_label = paste0("**", lbl_overall, "**  \n N = {n}"))
  # }
  #
  # tbl <- tbl %>% modify_footnote(update = everything() ~ NA)
  #
  # gtsummary::with_gtsummary_theme(
  #   x = gtsummary::theme_gtsummary_compact(),
  #   expr = as_gt(tbl)
  # )
}

tbl <- make_table_32_gtsum(advs = advs)
tbl

ard_1 <-
  ard_stack(
    data = tbl,
    by = "ARM",
    ard_categorical(variables = c("L60", "G60", "G90", "G110", "GE120"))
  )
ard_1

ard_2 <- ard_1 %>% filter(variable_level == TRUE)
ard_2

ard_3 <-
  ard_2 %>%
  mutate(
    variable_level = case_when(
      variable == "L60" ~ "<60",
      variable == "G60" ~ ">60",
      variable == "G90" ~ ">90",
      variable == "G90" ~ ">90",
      variable == "G110" ~ ">110",
      variable == "GE120" ~ ">=120"
    ),
    variable = case_when(
      variable != "ARM" ~ "DBP"
    )
  )

ard_3
