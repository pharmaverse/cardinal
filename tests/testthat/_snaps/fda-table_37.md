# fda-table_37() works

    Code
      as.data.frame(ard$tbl_ard_summary)[1:25, ]
    Output
         group1         group1_level variable variable_level        context stat_name
      1  TRT01A              Placebo      L60           TRUE tabulate_value         n
      2  TRT01A              Placebo      L60           TRUE tabulate_value         p
      3  TRT01A              Placebo      G60           TRUE tabulate_value         n
      4  TRT01A              Placebo      G60           TRUE tabulate_value         p
      5  TRT01A              Placebo      G90           TRUE tabulate_value         n
      6  TRT01A              Placebo      G90           TRUE tabulate_value         p
      7  TRT01A              Placebo     G110           TRUE tabulate_value         n
      8  TRT01A              Placebo     G110           TRUE tabulate_value         p
      9  TRT01A              Placebo    GE120           TRUE tabulate_value         n
      10 TRT01A              Placebo    GE120           TRUE tabulate_value         p
      11 TRT01A Xanomeline High Dose      L60           TRUE tabulate_value         n
      12 TRT01A Xanomeline High Dose      L60           TRUE tabulate_value         p
      13 TRT01A Xanomeline High Dose      G60           TRUE tabulate_value         n
      14 TRT01A Xanomeline High Dose      G60           TRUE tabulate_value         p
      15 TRT01A Xanomeline High Dose      G90           TRUE tabulate_value         n
      16 TRT01A Xanomeline High Dose      G90           TRUE tabulate_value         p
      17 TRT01A Xanomeline High Dose     G110           TRUE tabulate_value         n
      18 TRT01A Xanomeline High Dose     G110           TRUE tabulate_value         p
      19 TRT01A Xanomeline High Dose    GE120           TRUE tabulate_value         n
      20 TRT01A Xanomeline High Dose    GE120           TRUE tabulate_value         p
      21 TRT01A  Xanomeline Low Dose      L60           TRUE tabulate_value         n
      22 TRT01A  Xanomeline Low Dose      L60           TRUE tabulate_value         p
      23 TRT01A  Xanomeline Low Dose      G60           TRUE tabulate_value         n
      24 TRT01A  Xanomeline Low Dose      G60           TRUE tabulate_value         p
      25 TRT01A  Xanomeline Low Dose      G90           TRUE tabulate_value         n
         stat_label       stat
      1           n          1
      2           % 0.01190476
      3           n        151
      4           %   1.797619
      5           n         36
      6           %  0.4285714
      7           n          1
      8           % 0.01190476
      9           n          0
      10          %          0
      11          n          0
      12          %          0
      13          n        152
      14          %   2.111111
      15          n         29
      16          %  0.4027778
      17          n          0
      18          %          0
      19          n          0
      20          %          0
      21          n          0
      22          %          0
      23          n        154
      24          %   1.638298
      25          n         29
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
      14 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      15                                                                                                                                                                                                                                                                                                                         0
      16 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      17                                                                                                                                                                                                                                                                                                                         0
      18 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      19                                                                                                                                                                                                                                                                                                                         0
      20 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      21                                                                                                                                                                                                                                                                                                                         0
      22 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      23                                                                                                                                                                                                                                                                                                                         0
      24 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      25                                                                                                                                                                                                                                                                                                                         0
         warning error gts_column
      1     NULL  NULL     stat_1
      2     NULL  NULL     stat_1
      3     NULL  NULL     stat_1
      4     NULL  NULL     stat_1
      5     NULL  NULL     stat_1
      6     NULL  NULL     stat_1
      7     NULL  NULL     stat_1
      8     NULL  NULL     stat_1
      9     NULL  NULL     stat_1
      10    NULL  NULL     stat_1
      11    NULL  NULL     stat_2
      12    NULL  NULL     stat_2
      13    NULL  NULL     stat_2
      14    NULL  NULL     stat_2
      15    NULL  NULL     stat_2
      16    NULL  NULL     stat_2
      17    NULL  NULL     stat_2
      18    NULL  NULL     stat_2
      19    NULL  NULL     stat_2
      20    NULL  NULL     stat_2
      21    NULL  NULL     stat_3
      22    NULL  NULL     stat_3
      23    NULL  NULL     stat_3
      24    NULL  NULL     stat_3
      25    NULL  NULL     stat_3

