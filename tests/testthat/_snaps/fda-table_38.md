# fda-table_38() works

    Code
      as.data.frame(ard$tbl_ard_summary)[1:25, ]
    Output
         group1         group1_level variable       variable_level        context
      1  TRT01A              Placebo    SBP90                 TRUE tabulate_value
      2  TRT01A              Placebo    SBP90                 TRUE tabulate_value
      3  TRT01A              Placebo    DBP60                 TRUE tabulate_value
      4  TRT01A              Placebo    DBP60                 TRUE tabulate_value
      5  TRT01A Xanomeline High Dose    SBP90                 TRUE tabulate_value
      6  TRT01A Xanomeline High Dose    SBP90                 TRUE tabulate_value
      7  TRT01A Xanomeline High Dose    DBP60                 TRUE tabulate_value
      8  TRT01A Xanomeline High Dose    DBP60                 TRUE tabulate_value
      9  TRT01A  Xanomeline Low Dose    SBP90                 TRUE tabulate_value
      10 TRT01A  Xanomeline Low Dose    SBP90                 TRUE tabulate_value
      11 TRT01A  Xanomeline Low Dose    DBP60                 TRUE tabulate_value
      12 TRT01A  Xanomeline Low Dose    DBP60                 TRUE tabulate_value
      13   <NA>                 NULL   TRT01A              Placebo       tabulate
      14   <NA>                 NULL   TRT01A              Placebo       tabulate
      15   <NA>                 NULL   TRT01A              Placebo       tabulate
      16   <NA>                 NULL   TRT01A Xanomeline High Dose       tabulate
      17   <NA>                 NULL   TRT01A Xanomeline High Dose       tabulate
      18   <NA>                 NULL   TRT01A Xanomeline High Dose       tabulate
      19   <NA>                 NULL   TRT01A  Xanomeline Low Dose       tabulate
      20   <NA>                 NULL   TRT01A  Xanomeline Low Dose       tabulate
      21   <NA>                 NULL   TRT01A  Xanomeline Low Dose       tabulate
      22   <NA>                 NULL    SBP90                 NULL     attributes
      23   <NA>                 NULL    SBP90                 NULL     attributes
      24   <NA>                 NULL    DBP60                 NULL     attributes
      25   <NA>                 NULL    DBP60                 NULL     attributes
         stat_name     stat_label      stat
      1          n              n         8
      2          p              % 0.0952381
      3          n              n        32
      4          p              % 0.3809524
      5          n              n         0
      6          p              %         0
      7          n              n        27
      8          p              %     0.375
      9          n              n         1
      10         p              % 0.0106383
      11         n              n        29
      12         p              % 0.3085106
      13         n              n        86
      14         N              N       254
      15         p              % 0.3385827
      16         n              n        72
      17         N              N       254
      18         p              % 0.2834646
      19         n              n        96
      20         N              N       254
      21         p              % 0.3779528
      22     label Variable Label    SBP<90
      23     class Variable Class   logical
      24     label Variable Label    DBP<60
      25     class Variable Class   logical
                                                                                                                                                                                                                                                                                                                           fmt_fun
      1                                                                                                                                                                                                                                                                                                                          0
      2  function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      3                                                                                                                                                                                                                                                                                                                          0
      4  function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      5                                                                                                                                                                                                                                                                                                                          0
      6  function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      7                                                                                                                                                                                                                                                                                                                          0
      8  function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      9                                                                                                                                                                                                                                                                                                                          0
      10 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      11                                                                                                                                                                                                                                                                                                                         0
      12 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      13                                                                                                                                                                                                                                                                                                                         0
      14                                                                                                                                                                                                                                                                                                                         0
      15 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      16                                                                                                                                                                                                                                                                                                                         0
      17                                                                                                                                                                                                                                                                                                                         0
      18 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      19                                                                                                                                                                                                                                                                                                                         0
      20                                                                                                                                                                                                                                                                                                                         0
      21 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      22                                                                                                                                                                                                                                                                                                .Primitive("as.character")
      23                                                                                                                                                                                                                                                                                                                      NULL
      24                                                                                                                                                                                                                                                                                                .Primitive("as.character")
      25                                                                                                                                                                                                                                                                                                                      NULL
         warning error gts_column
      1     NULL  NULL     stat_1
      2     NULL  NULL     stat_1
      3     NULL  NULL     stat_1
      4     NULL  NULL     stat_1
      5     NULL  NULL     stat_2
      6     NULL  NULL     stat_2
      7     NULL  NULL     stat_2
      8     NULL  NULL     stat_2
      9     NULL  NULL     stat_3
      10    NULL  NULL     stat_3
      11    NULL  NULL     stat_3
      12    NULL  NULL     stat_3
      13    NULL  NULL       <NA>
      14    NULL  NULL       <NA>
      15    NULL  NULL       <NA>
      16    NULL  NULL       <NA>
      17    NULL  NULL       <NA>
      18    NULL  NULL       <NA>
      19    NULL  NULL       <NA>
      20    NULL  NULL       <NA>
      21    NULL  NULL       <NA>
      22    NULL  NULL       <NA>
      23    NULL  NULL       <NA>
      24    NULL  NULL       <NA>
      25    NULL  NULL       <NA>

