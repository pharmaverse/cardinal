make_table_32 <- function(data,
                          ...,
                          tbl_engine = "gtsummary",
                          return_ard = TRUE) {

  # check data viability
  # assert_subset(categorical_vars, names(data))

  if (tbl_engine == "gtsummary") {
    # tbl <- make_table_32_gtsum(ard, ...)
    tbl <- make_table_32_gtsum(...)
    ard <- make_ard_32(...)
  }
  if (tbl_engine == "rtables") {
    ard <- "ARD not available for {rtables}"
    tbl <- make_table_32_rtables(df = data)
  }
  if (tbl_engine == "tplyr") {
    tbl <- make_table_32_tplyr(ard, ...)
  }

  if (return_ard) {
    res <- list(tbl, ard)
  } else {
    res <- tbl
  }

  return(res)
}

make_table_32_gtsum <- function(df,
                                alt_counts_df = NULL,
                                id_var = "USUBJID",
                                arm_var = "ARM",
                                saffl_var = "SAFFL",
                                lbl_overall = NULL) {
  assert_subset(c(
    saffl_var, "AVISITN", "PARAMCD", "AVAL", "AVALU", arm_var, id_var
  ), names(df))
  assert_flag_variables(df, saffl_var)

  advs <- df %>%
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

  tbl <- advs %>%
    tbl_summary(
      by = arm_var,
      statistic = list(all_categorical() ~ "{n} ({p}%)"),
      digits = everything() ~ c(0, 1),
      missing = "no"
    ) %>%
    modify_header(label ~ paste0("**Diastolic Blood Pressure (", avalu, ")**")) %>%
    modify_header(all_stat_cols() ~ "**{level}**  \nN = {n}") %>%
    gtsummary::modify_column_alignment(columns = all_stat_cols(), align = "right")

  if (!is.null(lbl_overall)) {
    tbl <- tbl %>%
      add_overall(last = TRUE, col_label = paste0("**", lbl_overall, "**  \n N = {n}"))
  }

  tbl <- tbl %>% modify_footnote(update = everything() ~ NA)

  gtsummary::with_gtsummary_theme(
    x = gtsummary::theme_gtsummary_compact(),
    expr = as_gt(tbl)
  )
}


make_ard_32 <- function(df,
                        alt_counts_df = NULL,
                        id_var = "USUBJID",
                        arm_var = "ARM",
                        saffl_var = "SAFFL",
                        lbl_overall = NULL) {

  assert_subset(c(
    saffl_var, "AVISITN", "PARAMCD", "AVAL", "AVALU", arm_var, id_var
  ), names(df))
  assert_flag_variables(df, saffl_var)


  df <- df %>%
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

    df <- df %>% select(!all_of(arm_var))
    df <-
      adsl %>%
      left_join(df, by = id_var)
  } else {
    df <- df
  }

  df <- df %>%
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
    mutate(
      ARM = as.character(ARM)
    ) %>%
    select(L60, G60, G90, G110, GE120, AVALU, arm_var)

  avalu <- unique(df$AVALU)[1]
  df <- df %>% select(-AVALU)

  ard <-
    ard_stack(
      data = df,
      .by = ARM,
      ard_categorical(variables = c("L60", "G60", "G90", "G110", "GE120")),
      .attributes = TRUE
    )
    # filter(variable_level == TRUE) %>%
    # mutate(
    #   variable_level = case_when(
    #     variable == "L60" ~ "<60",
    #     variable == "G60" ~ ">60",
    #     variable == "G90" ~ ">90",
    #     variable == "G90" ~ ">90",
    #     variable == "G110" ~ ">110",
    #     variable == "GE120" ~ ">=120"
    #   ),
    #   # variable = case_when(
    #   #   variable != "ARM" ~ "DBP"
    #   # )
    # )

  return(ard)
}






library(cards)
library(dplyr)
library(random.cdisc.data)
library(gtsummary)
library(checkmate)
library(tern)
source("R/utils.R")
adsl <- random.cdisc.data::cadsl
advs <- random.cdisc.data::cadvs

tbl_1 <-
  make_table_32(
    df         = advs,
    tbl_engine = "gtsummary",
    return_ard = FALSE,
    saffl_var  = "ITTFL"
  )
tbl_1

# ard_1 <- make_ard_32(df = advs)
# ard_1

tbl <- make_table_32(data = advs, return_ard = FALSE)
tbl
z1 <- tbl[[1]]
z2 <- tbl[[2]]
z2


tbl_2 <-
  make_table_32(
    df         = advs,
    tbl_engine = "gtsummary",
    return_ard = FALSE,
    saffl_var  = "ITTFL"
  )
tbl_2

ard_2 <-
  make_table_32(
    df         = advs,
    tbl_engine = "gtsummary",
    return_ard = TRUE,
    saffl_var  = "ITTFL"
  )
ard_2

z1 <- ard_2[[1]]
z1
z2 <- ard_2[[2]]
z2

# z3 <- tbl_ard_summary(z2, by = ARM)
