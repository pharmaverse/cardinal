# # Load -----
# source("R/utils.R")
# source("R/fda-table_35.R")
#
# # No lbl_overall -----
# adsl <- random.cdisc.data::cadsl
# adae <- random.cdisc.data::cadae
#
# tbl <- make_table_35(df = adae, denominator = adsl)
#
# tbl_ovrl <-
#   tbl_hierarchical(
#     data = adae,
#     variables = "AESOC",
#     # by = arm_var,
#     denominator = adsl,
#     id = "USUBJID"
#   ) %>%
#   modify_header(label ~ paste0("**System Organ Class**")) %>%
#   modify_header(all_stat_cols() ~ "**Overall**  \nN = {n}") %>%
#   gtsummary::modify_column_alignment(columns = all_stat_cols(), align = "right")
#
#
# tbl <- as.data.frame(tbl)
# tbl_ovrl <- as.data.frame(tbl_ovrl)
#
# tbl_all <- left_join(x = tbl, y = tbl_ovrl, by = "**System Organ Class**")
#
# cols_names <- colnames(tbl_all)
# cols_names
# tbl_all_gt2_md <-
#   tbl_all %>%
#   gt() %>%
#   cols_label(
#     .list = setNames(lapply(cols_names, md), cols_names)
#   )
#
# tbl_all_gt2_md
#
# # lbl_overall -----
#
# adsl <- random.cdisc.data::cadsl
# adae <- random.cdisc.data::cadae
#
# tbl <-
#   make_table_35(
#     df = adae,
#     denominator = adsl,
#     lbl_overall = "def"
#   )
# tbl
