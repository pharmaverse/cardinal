library(cards)
library(dplyr)
library(random.cdisc.data)
library(gtsummary)
library(checkmate)
library(tern)
source("R/utils.R")
adsl <- random.cdisc.data::cadsl
advs <- random.cdisc.data::cadvs

df            <- advs
saffl_var     <- "SAFFL"
id_var        <- "USUBJID"
arm_var       <- "ARM"
alt_counts_df <- adsl

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

adsl <- alt_counts_df %>%
  filter(.data[[saffl_var]] == "Y") %>%
  select(all_of(id_var), all_of(arm_var), all_of(saffl_var))

df <- df %>% select(!all_of(arm_var))
df <-
  adsl %>%
  left_join(df, by = id_var)

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
  select(L60, G60, G90, G110, GE120, AVALU, arm_var)


avalu <- unique(df$AVALU)[1]
df <- df %>% select(-AVALU)


# Try with a factor column -----
ard_0 <-
  ard_stack(
    data = df,
    .by = ARM,
    ard_categorical(variables = c("L60", "G60", "G90", "G110", "GE120")),
    .attributes = TRUE,
    .missing = TRUE
  )

tbl_0 <- tbl_ard_summary(ard_0, by = ARM)
tbl_0


# Dataframe for ard -----

df4ard <-
  df %>%
  mutate(ARM = as.character(ARM))

# Try 1 - success (?) -----
ard <-
  ard_stack(
    data = df4ard,
    .by = ARM,
    ard_categorical(variables = c("L60", "G60", "G90", "G110", "GE120")),
    .attributes = TRUE,
    .missing = TRUE
  )

tbl <- tbl_ard_summary(ard, by = ARM)
tbl

# Try 2 - not a success -----
ard2 <-
  ard %>%
  filter(variable == "ARM" | variable_level == "TRUE")

tbl2 <- tbl_ard_summary(ard2, by = ARM)
tbl2

# Try 3 -----
ard3 <-
  ard %>%
  # filter(variable == "ARM" | variable_level == "TRUE") %>%
  mutate(
    variable = case_when(
      variable != "ARM" ~ "DBP"
    )
  )

tbl3 <- tbl_ard_summary(ard3, by = ARM)
tbl3
