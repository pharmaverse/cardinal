# source("R/utils.R")
# source("R/fda-table_35.R")
#
# # adsl <- random.cdisc.data::cadsl
# # adae <- random.cdisc.data::cadae
# #
# # tblo <- make_table_35(df = adae, denominator = adsl, lbl_overall = "abc")
# # tblo
#
#
# adsl <- random.cdisc.data::cadsl
# adae <- random.cdisc.data::cadae
#
# tbl <- make_table_35(df = adae, denominator = adsl)
# tbl
#
# tbl_overall <-
#   tbl_hierarchical(
#     data = adae,
#     variables = "AESOC",
#     # by = arm_var,
#     denominator = adsl,
#     id = "USUBJID"
#   ) %>%
#   modify_header(all_stat_cols() ~ "**Overall**  \nN = {n}")
#
# tbl_overall
#
# tbl_df <- as.data.frame(tbl)
# tbl_overall_df <- as.data.frame(tbl_overall)
#
# tbl_all <-
#   left_join(
#     x = tbl_df,
#     y = tbl_overall_df,
#     by = "**Primary System Organ Class**"
#   )
#
# tbl_all_gt <- gt(tbl_all)
# tbl_all_gt
#
# tbl_all_gt2 <- gtsummary::with_gtsummary_theme(
#   x = gtsummary::theme_gtsummary_compact(),
#   expr = tbl_all_gt
# )
#
# tbl_all_gt2
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
# tbl_final <- gtsummary::with_gtsummary_theme(
#   x = gtsummary::theme_gtsummary_compact(),
#   expr = tbl_all_gt2_md
# )
#
# tbl_final
