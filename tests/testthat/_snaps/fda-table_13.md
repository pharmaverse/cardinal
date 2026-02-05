# fda-table_13() works

    Code
      as.data.frame(ard$tbl_hierarchical)[1:25, ]
    Output
         group1         group1_level   group2
      1    <NA>                 NULL     <NA>
      2    <NA>                 NULL     <NA>
      3    <NA>                 NULL     <NA>
      4    <NA>                 NULL     <NA>
      5    <NA>                 NULL     <NA>
      6    <NA>                 NULL     <NA>
      7    <NA>                 NULL     <NA>
      8    <NA>                 NULL     <NA>
      9    <NA>                 NULL     <NA>
      10 TRT01A              Placebo     <NA>
      11 TRT01A              Placebo     <NA>
      12 TRT01A              Placebo     <NA>
      13 TRT01A Xanomeline High Dose     <NA>
      14 TRT01A Xanomeline High Dose     <NA>
      15 TRT01A Xanomeline High Dose     <NA>
      16 TRT01A  Xanomeline Low Dose     <NA>
      17 TRT01A  Xanomeline Low Dose     <NA>
      18 TRT01A  Xanomeline Low Dose     <NA>
      19 TRT01A              Placebo AEBODSYS
      20 TRT01A              Placebo AEBODSYS
      21 TRT01A              Placebo AEBODSYS
      22 TRT01A Xanomeline High Dose AEBODSYS
      23 TRT01A Xanomeline High Dose AEBODSYS
      24 TRT01A Xanomeline High Dose AEBODSYS
      25 TRT01A  Xanomeline Low Dose AEBODSYS
                                                 group2_level  variable
      1                                                  NULL    TRT01A
      2                                                  NULL    TRT01A
      3                                                  NULL    TRT01A
      4                                                  NULL    TRT01A
      5                                                  NULL    TRT01A
      6                                                  NULL    TRT01A
      7                                                  NULL    TRT01A
      8                                                  NULL    TRT01A
      9                                                  NULL    TRT01A
      10                                                 NULL  AEBODSYS
      11                                                 NULL  AEBODSYS
      12                                                 NULL  AEBODSYS
      13                                                 NULL  AEBODSYS
      14                                                 NULL  AEBODSYS
      15                                                 NULL  AEBODSYS
      16                                                 NULL  AEBODSYS
      17                                                 NULL  AEBODSYS
      18                                                 NULL  AEBODSYS
      19 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS OCMQ01NAM
      20 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS OCMQ01NAM
      21 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS OCMQ01NAM
      22 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS OCMQ01NAM
      23 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS OCMQ01NAM
      24 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS OCMQ01NAM
      25 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS OCMQ01NAM
                                               variable_level      context stat_name
      1                                               Placebo     tabulate         n
      2                                               Placebo     tabulate         N
      3                                               Placebo     tabulate         p
      4                                  Xanomeline High Dose     tabulate         n
      5                                  Xanomeline High Dose     tabulate         N
      6                                  Xanomeline High Dose     tabulate         p
      7                                   Xanomeline Low Dose     tabulate         n
      8                                   Xanomeline Low Dose     tabulate         N
      9                                   Xanomeline Low Dose     tabulate         p
      10 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS hierarchical         n
      11 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS hierarchical         N
      12 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS hierarchical         p
      13 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS hierarchical         n
      14 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS hierarchical         N
      15 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS hierarchical         p
      16 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS hierarchical         n
      17 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS hierarchical         N
      18 GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS hierarchical         p
      19                                                    1 hierarchical         n
      20                                                    1 hierarchical         N
      21                                                    1 hierarchical         p
      22                                                    1 hierarchical         n
      23                                                    1 hierarchical         N
      24                                                    1 hierarchical         p
      25                                                    1 hierarchical         n
         stat_label       stat stat_fmt
      1           n         86       86
      2           N        254      254
      3           %  0.3385827     33.9
      4           n         72       72
      5           N        254      254
      6           %  0.2834646     28.3
      7           n         96       96
      8           N        254      254
      9           %  0.3779528     37.8
      10          n         21       21
      11          N         86       86
      12          %   0.244186       24
      13          n         36       36
      14          N         72       72
      15          %        0.5       50
      16          n         51       51
      17          N         96       96
      18          %    0.53125       53
      19          n          8        8
      20          N         86       86
      21          % 0.09302326      9.3
      22          n         23       23
      23          N         72       72
      24          %  0.3194444       32
      25          n         25       25
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

