# fda-table_33() works

    Code
      as.data.frame(ard$tbl_hierarchical)[1:25, ]
    Output
         group1         group1_level    group2 group2_level variable
      1    <NA>                 NULL      <NA>         NULL   TRT01A
      2    <NA>                 NULL      <NA>         NULL   TRT01A
      3    <NA>                 NULL      <NA>         NULL   TRT01A
      4    <NA>                 NULL      <NA>         NULL   TRT01A
      5    <NA>                 NULL      <NA>         NULL   TRT01A
      6    <NA>                 NULL      <NA>         NULL   TRT01A
      7    <NA>                 NULL      <NA>         NULL   TRT01A
      8    <NA>                 NULL      <NA>         NULL   TRT01A
      9    <NA>                 NULL      <NA>         NULL   TRT01A
      10 TRT01A              Placebo OCMQ01NAM            1  AEDECOD
      11 TRT01A              Placebo OCMQ01NAM            1  AEDECOD
      12 TRT01A              Placebo OCMQ01NAM            1  AEDECOD
      13 TRT01A Xanomeline High Dose OCMQ01NAM            1  AEDECOD
      14 TRT01A Xanomeline High Dose OCMQ01NAM            1  AEDECOD
      15 TRT01A Xanomeline High Dose OCMQ01NAM            1  AEDECOD
      16 TRT01A  Xanomeline Low Dose OCMQ01NAM            1  AEDECOD
      17 TRT01A  Xanomeline Low Dose OCMQ01NAM            1  AEDECOD
      18 TRT01A  Xanomeline Low Dose OCMQ01NAM            1  AEDECOD
      19 TRT01A              Placebo OCMQ01NAM            1  AEDECOD
      20 TRT01A              Placebo OCMQ01NAM            1  AEDECOD
      21 TRT01A              Placebo OCMQ01NAM            1  AEDECOD
      22 TRT01A Xanomeline High Dose OCMQ01NAM            1  AEDECOD
      23 TRT01A Xanomeline High Dose OCMQ01NAM            1  AEDECOD
      24 TRT01A Xanomeline High Dose OCMQ01NAM            1  AEDECOD
      25 TRT01A  Xanomeline Low Dose OCMQ01NAM            1  AEDECOD
               variable_level      context stat_name stat_label      stat stat_fmt
      1               Placebo     tabulate         n          n         6        6
      2               Placebo     tabulate         N          N        29       29
      3               Placebo     tabulate         p          % 0.2068966     20.7
      4  Xanomeline High Dose     tabulate         n          n        12       12
      5  Xanomeline High Dose     tabulate         N          N        29       29
      6  Xanomeline High Dose     tabulate         p          % 0.4137931     41.4
      7   Xanomeline Low Dose     tabulate         n          n        11       11
      8   Xanomeline Low Dose     tabulate         N          N        29       29
      9   Xanomeline Low Dose     tabulate         p          % 0.3793103     37.9
      10                    1 hierarchical         n          n         0        0
      11                    1 hierarchical         N          N         6        6
      12                    1 hierarchical         p          %         0        0
      13                    1 hierarchical         n          n         6        6
      14                    1 hierarchical         N          N        12       12
      15                    1 hierarchical         p          %       0.5       50
      16                    1 hierarchical         n          n         8        8
      17                    1 hierarchical         N          N        11       11
      18                    1 hierarchical         p          % 0.7272727       73
      19                    2 hierarchical         n          n         1        1
      20                    2 hierarchical         N          N         6        6
      21                    2 hierarchical         p          % 0.1666667       17
      22                    2 hierarchical         n          n         0        0
      23                    2 hierarchical         N          N        12       12
      24                    2 hierarchical         p          %         0        0
      25                    2 hierarchical         n          n         0        0
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

