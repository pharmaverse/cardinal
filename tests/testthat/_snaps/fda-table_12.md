# fda-table_12() works

    Code
      as.data.frame(ard$tbl_hierarchical)[1:25, ]
    Output
         group1 group1_level group2 group2_level                     variable
      1    <NA>         NULL   <NA>         NULL                       TRT01A
      2    <NA>         NULL   <NA>         NULL                       TRT01A
      3    <NA>         NULL   <NA>         NULL                       TRT01A
      4    <NA>         NULL   <NA>         NULL                       TRT01A
      5    <NA>         NULL   <NA>         NULL                       TRT01A
      6    <NA>         NULL   <NA>         NULL                       TRT01A
      7    <NA>         NULL   <NA>         NULL                       TRT01A
      8    <NA>         NULL   <NA>         NULL                       TRT01A
      9    <NA>         NULL   <NA>         NULL                       TRT01A
      10 TRT01A            1   <NA>         NULL ..ard_hierarchical_overall..
      11 TRT01A            1   <NA>         NULL ..ard_hierarchical_overall..
      12 TRT01A            1   <NA>         NULL ..ard_hierarchical_overall..
      13 TRT01A            2   <NA>         NULL ..ard_hierarchical_overall..
      14 TRT01A            2   <NA>         NULL ..ard_hierarchical_overall..
      15 TRT01A            2   <NA>         NULL ..ard_hierarchical_overall..
      16 TRT01A            3   <NA>         NULL ..ard_hierarchical_overall..
      17 TRT01A            3   <NA>         NULL ..ard_hierarchical_overall..
      18 TRT01A            3   <NA>         NULL ..ard_hierarchical_overall..
      19 TRT01A            1   <NA>         NULL                     AEBODSYS
      20 TRT01A            1   <NA>         NULL                     AEBODSYS
      21 TRT01A            1   <NA>         NULL                     AEBODSYS
      22 TRT01A            2   <NA>         NULL                     AEBODSYS
      23 TRT01A            2   <NA>         NULL                     AEBODSYS
      24 TRT01A            2   <NA>         NULL                     AEBODSYS
      25 TRT01A            3   <NA>         NULL                     AEBODSYS
         variable_level      context stat_name stat_label      stat stat_fmt
      1               1     tabulate         n          n       134      134
      2               1     tabulate         N          N       400      400
      3               1     tabulate         p          %     0.335     33.5
      4               2     tabulate         n          n       134      134
      5               2     tabulate         N          N       400      400
      6               2     tabulate         p          %     0.335     33.5
      7               3     tabulate         n          n       132      132
      8               3     tabulate         N          N       400      400
      9               3     tabulate         p          %      0.33     33.0
      10           TRUE hierarchical         n          n        86       86
      11           TRUE hierarchical         N          N       134      134
      12           TRUE hierarchical         p          %  0.641791       64
      13           TRUE hierarchical         n          n        93       93
      14           TRUE hierarchical         N          N       134      134
      15           TRUE hierarchical         p          % 0.6940299       69
      16           TRUE hierarchical         n          n        90       90
      17           TRUE hierarchical         N          N       132      132
      18           TRUE hierarchical         p          % 0.6818182       68
      19              1 hierarchical         n          n        53       53
      20              1 hierarchical         N          N       134      134
      21              1 hierarchical         p          % 0.3955224       40
      22              1 hierarchical         n          n        55       55
      23              1 hierarchical         N          N       134      134
      24              1 hierarchical         p          % 0.4104478       41
      25              1 hierarchical         n          n        69       69
                                                                                                                                                                                                                                                                                                                           fmt_fun
      1                                                                                                                                                                                                                                                                                                                          0
      2                                                                                                                                                                                                                                                                                                                          0
      3  function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      4                                                                                                                                                                                                                                                                                                                          0
      5                                                                                                                                                                                                                                                                                                                          0
      6  function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      7                                                                                                                                                                                                                                                                                                                          0
      8                                                                                                                                                                                                                                                                                                                          0
      9  function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      10                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      11                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      12                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      13                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      14                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      15                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      16                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      17                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      18                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      19                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      20                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      21                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      22                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      23                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      24                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      25                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
         warning error gts_column
      1     NULL  NULL     stat_1
      2     NULL  NULL     stat_1
      3     NULL  NULL     stat_1
      4     NULL  NULL     stat_2
      5     NULL  NULL     stat_2
      6     NULL  NULL     stat_2
      7     NULL  NULL     stat_3
      8     NULL  NULL     stat_3
      9     NULL  NULL     stat_3
      10    NULL  NULL     stat_1
      11    NULL  NULL     stat_1
      12    NULL  NULL     stat_1
      13    NULL  NULL     stat_2
      14    NULL  NULL     stat_2
      15    NULL  NULL     stat_2
      16    NULL  NULL     stat_3
      17    NULL  NULL     stat_3
      18    NULL  NULL     stat_3
      19    NULL  NULL     stat_1
      20    NULL  NULL     stat_1
      21    NULL  NULL     stat_1
      22    NULL  NULL     stat_2
      23    NULL  NULL     stat_2
      24    NULL  NULL     stat_2
      25    NULL  NULL     stat_3

