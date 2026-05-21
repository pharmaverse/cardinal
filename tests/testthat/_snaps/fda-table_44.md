# fda-table_44() works

    Code
      as.data.frame(ard$tbl_hierarchical)[1:25, ]
    Output
         group1         group1_level    group2         group2_level variable
      1    <NA>                 NULL      <NA>                 NULL   TRT01A
      2    <NA>                 NULL      <NA>                 NULL   TRT01A
      3    <NA>                 NULL      <NA>                 NULL   TRT01A
      4    <NA>                 NULL      <NA>                 NULL   TRT01A
      5    <NA>                 NULL      <NA>                 NULL   TRT01A
      6    <NA>                 NULL      <NA>                 NULL   TRT01A
      7    <NA>                 NULL      <NA>                 NULL   TRT01A
      8    <NA>                 NULL      <NA>                 NULL   TRT01A
      9    <NA>                 NULL      <NA>                 NULL   TRT01A
      10 TRT01A              Placebo OCMQ01NAM Erectile Dysfunction  AEDECOD
      11 TRT01A              Placebo OCMQ01NAM Erectile Dysfunction  AEDECOD
      12 TRT01A              Placebo OCMQ01NAM Erectile Dysfunction  AEDECOD
      13 TRT01A Xanomeline High Dose OCMQ01NAM Erectile Dysfunction  AEDECOD
      14 TRT01A Xanomeline High Dose OCMQ01NAM Erectile Dysfunction  AEDECOD
      15 TRT01A Xanomeline High Dose OCMQ01NAM Erectile Dysfunction  AEDECOD
      16 TRT01A  Xanomeline Low Dose OCMQ01NAM Erectile Dysfunction  AEDECOD
      17 TRT01A  Xanomeline Low Dose OCMQ01NAM Erectile Dysfunction  AEDECOD
      18 TRT01A  Xanomeline Low Dose OCMQ01NAM Erectile Dysfunction  AEDECOD
      19 TRT01A              Placebo OCMQ01NAM Erectile Dysfunction  AEDECOD
      20 TRT01A              Placebo OCMQ01NAM Erectile Dysfunction  AEDECOD
      21 TRT01A              Placebo OCMQ01NAM Erectile Dysfunction  AEDECOD
      22 TRT01A Xanomeline High Dose OCMQ01NAM Erectile Dysfunction  AEDECOD
      23 TRT01A Xanomeline High Dose OCMQ01NAM Erectile Dysfunction  AEDECOD
      24 TRT01A Xanomeline High Dose OCMQ01NAM Erectile Dysfunction  AEDECOD
      25 TRT01A  Xanomeline Low Dose OCMQ01NAM Erectile Dysfunction  AEDECOD
                    variable_level      context stat_name stat_label      stat
      1                    Placebo     tabulate         n          n         3
      2                    Placebo     tabulate         N          N        18
      3                    Placebo     tabulate         p          % 0.1666667
      4       Xanomeline High Dose     tabulate         n          n         8
      5       Xanomeline High Dose     tabulate         N          N        18
      6       Xanomeline High Dose     tabulate         p          % 0.4444444
      7        Xanomeline Low Dose     tabulate         n          n         7
      8        Xanomeline Low Dose     tabulate         N          N        18
      9        Xanomeline Low Dose     tabulate         p          % 0.3888889
      10 APPLICATION SITE ERYTHEMA hierarchical         n          n         0
      11 APPLICATION SITE ERYTHEMA hierarchical         N          N         3
      12 APPLICATION SITE ERYTHEMA hierarchical         p          %         0
      13 APPLICATION SITE ERYTHEMA hierarchical         n          n         3
      14 APPLICATION SITE ERYTHEMA hierarchical         N          N         8
      15 APPLICATION SITE ERYTHEMA hierarchical         p          %     0.375
      16 APPLICATION SITE ERYTHEMA hierarchical         n          n         3
      17 APPLICATION SITE ERYTHEMA hierarchical         N          N         7
      18 APPLICATION SITE ERYTHEMA hierarchical         p          % 0.4285714
      19                     COUGH hierarchical         n          n         1
      20                     COUGH hierarchical         N          N         3
      21                     COUGH hierarchical         p          % 0.3333333
      22                     COUGH hierarchical         n          n         3
      23                     COUGH hierarchical         N          N         8
      24                     COUGH hierarchical         p          %     0.375
      25                     COUGH hierarchical         n          n         0
         stat_fmt
      1         3
      2        18
      3      16.7
      4         8
      5        18
      6      44.4
      7         7
      8        18
      9      38.9
      10        0
      11        3
      12        0
      13        3
      14        8
      15       38
      16        3
      17        7
      18       43
      19        1
      20        3
      21       33
      22        3
      23        8
      24       38
      25        0
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

