# fda-table_34() works

    Code
      as.data.frame(ard$tbl_hierarchical)[1:25, ]
    Output
         group1         group1_level    group2              group2_level variable
      1    <NA>                 NULL      <NA>                      NULL   TRT01A
      2    <NA>                 NULL      <NA>                      NULL   TRT01A
      3    <NA>                 NULL      <NA>                      NULL   TRT01A
      4    <NA>                 NULL      <NA>                      NULL   TRT01A
      5    <NA>                 NULL      <NA>                      NULL   TRT01A
      6    <NA>                 NULL      <NA>                      NULL   TRT01A
      7    <NA>                 NULL      <NA>                      NULL   TRT01A
      8    <NA>                 NULL      <NA>                      NULL   TRT01A
      9    <NA>                 NULL      <NA>                      NULL   TRT01A
      10 TRT01A              Placebo OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      11 TRT01A              Placebo OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      12 TRT01A              Placebo OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      13 TRT01A Xanomeline High Dose OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      14 TRT01A Xanomeline High Dose OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      15 TRT01A Xanomeline High Dose OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      16 TRT01A  Xanomeline Low Dose OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      17 TRT01A  Xanomeline Low Dose OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      18 TRT01A  Xanomeline Low Dose OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      19 TRT01A              Placebo OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      20 TRT01A              Placebo OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      21 TRT01A              Placebo OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      22 TRT01A Xanomeline High Dose OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      23 TRT01A Xanomeline High Dose OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      24 TRT01A Xanomeline High Dose OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
      25 TRT01A  Xanomeline Low Dose OCMQ01NAM Abnormal Uterine Bleeding  AEDECOD
                      variable_level      context stat_name stat_label       stat
      1                      Placebo     tabulate         n          n          9
      2                      Placebo     tabulate         N          N         33
      3                      Placebo     tabulate         p          %  0.2727273
      4         Xanomeline High Dose     tabulate         n          n         13
      5         Xanomeline High Dose     tabulate         N          N         33
      6         Xanomeline High Dose     tabulate         p          %  0.3939394
      7          Xanomeline Low Dose     tabulate         n          n         11
      8          Xanomeline Low Dose     tabulate         N          N         33
      9          Xanomeline Low Dose     tabulate         p          %  0.3333333
      10 APPLICATION SITE IRRITATION hierarchical         n          n          2
      11 APPLICATION SITE IRRITATION hierarchical         N          N          9
      12 APPLICATION SITE IRRITATION hierarchical         p          %  0.2222222
      13 APPLICATION SITE IRRITATION hierarchical         n          n          1
      14 APPLICATION SITE IRRITATION hierarchical         N          N         13
      15 APPLICATION SITE IRRITATION hierarchical         p          % 0.07692308
      16 APPLICATION SITE IRRITATION hierarchical         n          n          1
      17 APPLICATION SITE IRRITATION hierarchical         N          N         11
      18 APPLICATION SITE IRRITATION hierarchical         p          % 0.09090909
      19   APPLICATION SITE PRURITUS hierarchical         n          n          0
      20   APPLICATION SITE PRURITUS hierarchical         N          N          9
      21   APPLICATION SITE PRURITUS hierarchical         p          %          0
      22   APPLICATION SITE PRURITUS hierarchical         n          n          2
      23   APPLICATION SITE PRURITUS hierarchical         N          N         13
      24   APPLICATION SITE PRURITUS hierarchical         p          %  0.1538462
      25   APPLICATION SITE PRURITUS hierarchical         n          n          1
         stat_fmt
      1         9
      2        33
      3      27.3
      4        13
      5        33
      6      39.4
      7        11
      8        33
      9      33.3
      10        2
      11        9
      12       22
      13        1
      14       13
      15      7.7
      16        1
      17       11
      18      9.1
      19        0
      20        9
      21        0
      22        2
      23       13
      24       15
      25        1
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

