# fda-table_11() works

    Code
      as.data.frame(ard$tbl_hierarchical)[1:25, ]
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
      10   <NA>                 NULL     <NA>              NULL    TRT01A
      11   <NA>                 NULL     <NA>              NULL    TRT01A
      12   <NA>                 NULL     <NA>              NULL    TRT01A
      13 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      14 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      15 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      16 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      17 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      18 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      19 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      20 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      21 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      22 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      23 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      24 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS OCMQ01NAM
      25 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS OCMQ01NAM
               variable_level      context stat_name stat_label       stat stat_fmt
      1               Placebo     tabulate         n          n         86       86
      2               Placebo     tabulate         N          N        306      306
      3               Placebo     tabulate         p          %  0.2810458     28.1
      4        Screen Failure     tabulate         n          n         52       52
      5        Screen Failure     tabulate         N          N        306      306
      6        Screen Failure     tabulate         p          %  0.1699346     17.0
      7  Xanomeline High Dose     tabulate         n          n         72       72
      8  Xanomeline High Dose     tabulate         N          N        306      306
      9  Xanomeline High Dose     tabulate         p          %  0.2352941     23.5
      10  Xanomeline Low Dose     tabulate         n          n         96       96
      11  Xanomeline Low Dose     tabulate         N          N        306      306
      12  Xanomeline Low Dose     tabulate         p          %  0.3137255     31.4
      13                    1 hierarchical         n          n          2        2
      14                    1 hierarchical         N          N         86       86
      15                    1 hierarchical         p          % 0.02325581      2.3
      16                    1 hierarchical         n          n          1        1
      17                    1 hierarchical         N          N         72       72
      18                    1 hierarchical         p          % 0.01388889      1.4
      19                    1 hierarchical         n          n          5        5
      20                    1 hierarchical         N          N         96       96
      21                    1 hierarchical         p          % 0.05208333      5.2
      22                    2 hierarchical         n          n          4        4
      23                    2 hierarchical         N          N         86       86
      24                    2 hierarchical         p          % 0.04651163      4.7
      25                    2 hierarchical         n          n          2        2
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
      10                                                                                                                                                                                                                                                                                                                         0
      11                                                                                                                                                                                                                                                                                                                         0
      12 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
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
      10    NULL  NULL     stat_4
      11    NULL  NULL     stat_4
      12    NULL  NULL     stat_4
      13    NULL  NULL     stat_1
      14    NULL  NULL     stat_1
      15    NULL  NULL     stat_1
      16    NULL  NULL     stat_2
      17    NULL  NULL     stat_2
      18    NULL  NULL     stat_2
      19    NULL  NULL     stat_3
      20    NULL  NULL     stat_3
      21    NULL  NULL     stat_3
      22    NULL  NULL     stat_1
      23    NULL  NULL     stat_1
      24    NULL  NULL     stat_1
      25    NULL  NULL     stat_2

