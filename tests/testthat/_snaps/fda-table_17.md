# fda-table_17() works

    Code
      as.data.frame(ard$`OCMQ01SC="BROAD"`$tbl_hierarchical)[1:25, ]
    Output
         group1         group1_level   group2      group2_level  variable
      1    <NA>                 NULL     <NA>              NULL    TRT01A
      2    <NA>                 NULL     <NA>              NULL    TRT01A
      3    <NA>                 NULL     <NA>              NULL    TRT01A
      4    <NA>                 NULL     <NA>              NULL    TRT01A
      5    <NA>                 NULL     <NA>              NULL    TRT01A
      6    <NA>                 NULL     <NA>              NULL    TRT01A
      7    <NA>                 NULL     <NA>              NULL    TRT01A
      8    <NA>                 NULL     <NA>              NULL    TRT01A
      9    <NA>                 NULL     <NA>              NULL    TRT01A
      10 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      11 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      12 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      13 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      14 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      15 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      16 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      17 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      18 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      19 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      20 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      21 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      22 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      23 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      24 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      25 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
               variable_level      context stat_name stat_label       stat stat_fmt
      1               Placebo     tabulate         n          n         86       86
      2               Placebo     tabulate         N          N        254      254
      3               Placebo     tabulate         p          %  0.3385827     33.9
      4  Xanomeline High Dose     tabulate         n          n         72       72
      5  Xanomeline High Dose     tabulate         N          N        254      254
      6  Xanomeline High Dose     tabulate         p          %  0.2834646     28.3
      7   Xanomeline Low Dose     tabulate         n          n         96       96
      8   Xanomeline Low Dose     tabulate         N          N        254      254
      9   Xanomeline Low Dose     tabulate         p          %  0.3779528     37.8
      10                    3 hierarchical         n          n          0        0
      11                    3 hierarchical         N          N         86       86
      12                    3 hierarchical         p          %          0        0
      13                    3 hierarchical         n          n          7        7
      14                    3 hierarchical         N          N         72       72
      15                    3 hierarchical         p          % 0.09722222      9.7
      16                    3 hierarchical         n          n          6        6
      17                    3 hierarchical         N          N         96       96
      18                    3 hierarchical         p          %     0.0625      6.3
      19                    4 hierarchical         n          n          2        2
      20                    4 hierarchical         N          N         86       86
      21                    4 hierarchical         p          % 0.02325581      2.3
      22                    4 hierarchical         n          n          1        1
      23                    4 hierarchical         N          N         72       72
      24                    4 hierarchical         p          % 0.01388889      1.4
      25                    4 hierarchical         n          n          2        2
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

---

    Code
      as.data.frame(ard$`OCMQ01SC="NARROW"`$tbl_hierarchical)[1:25, ]
    Output
         group1         group1_level   group2      group2_level  variable
      1    <NA>                 NULL     <NA>              NULL    TRT01A
      2    <NA>                 NULL     <NA>              NULL    TRT01A
      3    <NA>                 NULL     <NA>              NULL    TRT01A
      4    <NA>                 NULL     <NA>              NULL    TRT01A
      5    <NA>                 NULL     <NA>              NULL    TRT01A
      6    <NA>                 NULL     <NA>              NULL    TRT01A
      7    <NA>                 NULL     <NA>              NULL    TRT01A
      8    <NA>                 NULL     <NA>              NULL    TRT01A
      9    <NA>                 NULL     <NA>              NULL    TRT01A
      10 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      11 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      12 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      13 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      14 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      15 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      16 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      17 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      18 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      19 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      20 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      21 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      22 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      23 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      24 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      25 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
               variable_level      context stat_name stat_label       stat stat_fmt
      1               Placebo     tabulate         n          n         86       86
      2               Placebo     tabulate         N          N        254      254
      3               Placebo     tabulate         p          %  0.3385827     33.9
      4  Xanomeline High Dose     tabulate         n          n         72       72
      5  Xanomeline High Dose     tabulate         N          N        254      254
      6  Xanomeline High Dose     tabulate         p          %  0.2834646     28.3
      7   Xanomeline Low Dose     tabulate         n          n         96       96
      8   Xanomeline Low Dose     tabulate         N          N        254      254
      9   Xanomeline Low Dose     tabulate         p          %  0.3779528     37.8
      10                    3 hierarchical         n          n          2        2
      11                    3 hierarchical         N          N         86       86
      12                    3 hierarchical         p          % 0.02325581      2.3
      13                    3 hierarchical         n          n          4        4
      14                    3 hierarchical         N          N         72       72
      15                    3 hierarchical         p          % 0.05555556      5.6
      16                    3 hierarchical         n          n          3        3
      17                    3 hierarchical         N          N         96       96
      18                    3 hierarchical         p          %    0.03125      3.1
      19                    4 hierarchical         n          n          2        2
      20                    4 hierarchical         N          N         86       86
      21                    4 hierarchical         p          % 0.02325581      2.3
      22                    4 hierarchical         n          n          3        3
      23                    4 hierarchical         N          N         72       72
      24                    4 hierarchical         p          % 0.04166667      4.2
      25                    4 hierarchical         n          n          1        1
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

