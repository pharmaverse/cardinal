# fda-table_15() works

    Code
      as.data.frame(ard$tbl_hierarchical)[1:25, ]
    Output
         group1         group1_level variable       variable_level      context
      1    <NA>                 NULL   TRT01A              Placebo     tabulate
      2    <NA>                 NULL   TRT01A              Placebo     tabulate
      3    <NA>                 NULL   TRT01A              Placebo     tabulate
      4    <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      5    <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      6    <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      7    <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      8    <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      9    <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      10 TRT01A              Placebo  AEDECOD                   12 hierarchical
      11 TRT01A              Placebo  AEDECOD                   12 hierarchical
      12 TRT01A              Placebo  AEDECOD                   12 hierarchical
      13 TRT01A Xanomeline High Dose  AEDECOD                   12 hierarchical
      14 TRT01A Xanomeline High Dose  AEDECOD                   12 hierarchical
      15 TRT01A Xanomeline High Dose  AEDECOD                   12 hierarchical
      16 TRT01A  Xanomeline Low Dose  AEDECOD                   12 hierarchical
      17 TRT01A  Xanomeline Low Dose  AEDECOD                   12 hierarchical
      18 TRT01A  Xanomeline Low Dose  AEDECOD                   12 hierarchical
      19 TRT01A              Placebo  AEDECOD                   16 hierarchical
      20 TRT01A              Placebo  AEDECOD                   16 hierarchical
      21 TRT01A              Placebo  AEDECOD                   16 hierarchical
      22 TRT01A Xanomeline High Dose  AEDECOD                   16 hierarchical
      23 TRT01A Xanomeline High Dose  AEDECOD                   16 hierarchical
      24 TRT01A Xanomeline High Dose  AEDECOD                   16 hierarchical
      25 TRT01A  Xanomeline Low Dose  AEDECOD                   16 hierarchical
         stat_name stat_label       stat stat_fmt
      1          n          n         86       86
      2          N          N        254      254
      3          p          %  0.3385827     33.9
      4          n          n         72       72
      5          N          N        254      254
      6          p          %  0.2834646     28.3
      7          n          n         96       96
      8          N          N        254      254
      9          p          %  0.3779528     37.8
      10         n          n          5        5
      11         N          N         86       86
      12         p          % 0.05813953      5.8
      13         n          n          7        7
      14         N          N         72       72
      15         p          % 0.09722222      9.7
      16         n          n          9        9
      17         N          N         96       96
      18         p          %    0.09375      9.4
      19         n          n          3        3
      20         N          N         86       86
      21         p          % 0.03488372      3.5
      22         n          n         14       14
      23         N          N         72       72
      24         p          %  0.1944444       19
      25         n          n         13       13
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

