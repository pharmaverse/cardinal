# source("R/utils.R")
# source("R/fda-table_35.R")
#
# adsl <- random.cdisc.data::cadsl
# adae <- random.cdisc.data::cadae
#
# tbl <- make_table_35(df = adae, denominator = adsl, lbl_overall = "def")
# tbl
#
# ard <-
#   cards::ard_stack_hierarchical(
#     data = adae %>% filter(SAFFL == "Y"),
#     variables = c(AESOC),
#     by = TRT01A,
#     denominator = adsl %>% filter(SAFFL == "Y"),
#     id = USUBJID,
#     overall = TRUE
#   )
#
# ard <-
#   cards::ard_stack_hierarchical(
#     data = adae %>% filter(SAFFL == "Y"),
#     variables = c(AESOC),
#     by = TRT01A,
#     denominator = adsl %>% filter(SAFFL == "Y"),
#     id = USUBJID,
#     overall = TRUE
#   )
#
#
#
#
# AESOC
#
#
#
#
#
#
# ADAE_subset <- cards::ADAE |>
#   dplyr::filter(
#     AESOC %in% unique(cards::ADAE$AESOC)[1:5],
#     AETERM %in% unique(cards::ADAE$AETERM)[1:5]
#   )
#
# # Example 1: Event Rates  --------------------
# # First, build the ARD
# ard <-
#   cards::ard_stack_hierarchical(
#     data = ADAE_subset,
#     variables = c(AESOC, AETERM),
#     by = TRTA,
#     denominator = cards::ADSL |> mutate(TRTA = ARM),
#     id = USUBJID,
#     overall = TRUE
#   )
#
# # Second, build table from the ARD
# tbl_ard_hierarchical(
#   cards = ard,
#   variables = c(AESOC, AETERM),
#   by = TRTA
# )
