# fda-table_08() works

    Code
      as.data.frame(ard[[1]]$tbl_hierarchical)[1:25, ]
    Output
         group1        group1_level                     variable
      1    <NA>                NULL                       TRT01A
      2    <NA>                NULL                       TRT01A
      3    <NA>                NULL                       TRT01A
      4    <NA>                NULL                       TRT01A
      5    <NA>                NULL                       TRT01A
      6    <NA>                NULL                       TRT01A
      7    <NA>                NULL                       TRT01A
      8    <NA>                NULL                       TRT01A
      9    <NA>                NULL                       TRT01A
      10 TRT01A             Placebo ..ard_hierarchical_overall..
      11 TRT01A             Placebo ..ard_hierarchical_overall..
      12 TRT01A             Placebo ..ard_hierarchical_overall..
      13 TRT01A Xanomeline Low Dose ..ard_hierarchical_overall..
      14 TRT01A Xanomeline Low Dose ..ard_hierarchical_overall..
      15 TRT01A Xanomeline Low Dose ..ard_hierarchical_overall..
      16 TRT01A             Placebo                      DTHCAUS
      17 TRT01A             Placebo                      DTHCAUS
      18 TRT01A             Placebo                      DTHCAUS
      19 TRT01A Xanomeline Low Dose                      DTHCAUS
      20 TRT01A Xanomeline Low Dose                      DTHCAUS
      21 TRT01A Xanomeline Low Dose                      DTHCAUS
      22 TRT01A             Placebo                      DTHCAUS
      23 TRT01A             Placebo                      DTHCAUS
      24 TRT01A             Placebo                      DTHCAUS
      25 TRT01A Xanomeline Low Dose                      DTHCAUS
                variable_level      context stat_name stat_label       stat stat_fmt
      1                Placebo     tabulate         n          n         86       86
      2                Placebo     tabulate         N          N        254      254
      3                Placebo     tabulate         p          %  0.3385827     33.9
      4   Xanomeline High Dose     tabulate         n          n         72       72
      5   Xanomeline High Dose     tabulate         N          N        254      254
      6   Xanomeline High Dose     tabulate         p          %  0.2834646     28.3
      7    Xanomeline Low Dose     tabulate         n          n         96       96
      8    Xanomeline Low Dose     tabulate         N          N        254      254
      9    Xanomeline Low Dose     tabulate         p          %  0.3779528     37.8
      10                  TRUE hierarchical         n          n          2        2
      11                  TRUE hierarchical         N          N         86       86
      12                  TRUE hierarchical         p          % 0.02325581      2.3
      13                  TRUE hierarchical         n          n          1        1
      14                  TRUE hierarchical         N          N         96       96
      15                  TRUE hierarchical         p          % 0.01041667      1.0
      16     COMPLETED SUICIDE hierarchical         n          n          1        1
      17     COMPLETED SUICIDE hierarchical         N          N         86       86
      18     COMPLETED SUICIDE hierarchical         p          % 0.01162791      1.2
      19     COMPLETED SUICIDE hierarchical         n          n          0        0
      20     COMPLETED SUICIDE hierarchical         N          N         96       96
      21     COMPLETED SUICIDE hierarchical         p          %          0        0
      22 MYOCARDIAL INFARCTION hierarchical         n          n          1        1
      23 MYOCARDIAL INFARCTION hierarchical         N          N         86       86
      24 MYOCARDIAL INFARCTION hierarchical         p          % 0.01162791      1.2
      25 MYOCARDIAL INFARCTION hierarchical         n          n          0        0
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
      16    NULL  NULL     stat_1
      17    NULL  NULL     stat_1
      18    NULL  NULL     stat_1
      19    NULL  NULL     stat_2
      20    NULL  NULL     stat_2
      21    NULL  NULL     stat_2
      22    NULL  NULL     stat_1
      23    NULL  NULL     stat_1
      24    NULL  NULL     stat_1
      25    NULL  NULL     stat_2

---

    Code
      as.data.frame(ard[[2]]$tbl_hierarchical)[1:25, ]
    Output
         group1        group1_level                     variable
      1    <NA>                NULL                       TRT01A
      2    <NA>                NULL                       TRT01A
      3    <NA>                NULL                       TRT01A
      4    <NA>                NULL                       TRT01A
      5    <NA>                NULL                       TRT01A
      6    <NA>                NULL                       TRT01A
      7    <NA>                NULL                       TRT01A
      8    <NA>                NULL                       TRT01A
      9    <NA>                NULL                       TRT01A
      10 TRT01A             Placebo ..ard_hierarchical_overall..
      11 TRT01A             Placebo ..ard_hierarchical_overall..
      12 TRT01A             Placebo ..ard_hierarchical_overall..
      13 TRT01A Xanomeline Low Dose ..ard_hierarchical_overall..
      14 TRT01A Xanomeline Low Dose ..ard_hierarchical_overall..
      15 TRT01A Xanomeline Low Dose ..ard_hierarchical_overall..
      16 TRT01A             Placebo                      AEDECOD
      17 TRT01A             Placebo                      AEDECOD
      18 TRT01A             Placebo                      AEDECOD
      19 TRT01A Xanomeline Low Dose                      AEDECOD
      20 TRT01A Xanomeline Low Dose                      AEDECOD
      21 TRT01A Xanomeline Low Dose                      AEDECOD
      22 TRT01A             Placebo                      AEDECOD
      23 TRT01A             Placebo                      AEDECOD
      24 TRT01A             Placebo                      AEDECOD
      25 TRT01A Xanomeline Low Dose                      AEDECOD
                variable_level      context stat_name stat_label       stat stat_fmt
      1                Placebo     tabulate         n          n         86       86
      2                Placebo     tabulate         N          N        254      254
      3                Placebo     tabulate         p          %  0.3385827     33.9
      4   Xanomeline High Dose     tabulate         n          n         72       72
      5   Xanomeline High Dose     tabulate         N          N        254      254
      6   Xanomeline High Dose     tabulate         p          %  0.2834646     28.3
      7    Xanomeline Low Dose     tabulate         n          n         96       96
      8    Xanomeline Low Dose     tabulate         N          N        254      254
      9    Xanomeline Low Dose     tabulate         p          %  0.3779528     37.8
      10                  TRUE hierarchical         n          n          2        2
      11                  TRUE hierarchical         N          N         86       86
      12                  TRUE hierarchical         p          % 0.02325581      2.3
      13                  TRUE hierarchical         n          n          1        1
      14                  TRUE hierarchical         N          N         96       96
      15                  TRUE hierarchical         p          % 0.01041667      1.0
      16     COMPLETED SUICIDE hierarchical         n          n          1        1
      17     COMPLETED SUICIDE hierarchical         N          N         86       86
      18     COMPLETED SUICIDE hierarchical         p          % 0.01162791      1.2
      19     COMPLETED SUICIDE hierarchical         n          n          0        0
      20     COMPLETED SUICIDE hierarchical         N          N         96       96
      21     COMPLETED SUICIDE hierarchical         p          %          0        0
      22 MYOCARDIAL INFARCTION hierarchical         n          n          1        1
      23 MYOCARDIAL INFARCTION hierarchical         N          N         86       86
      24 MYOCARDIAL INFARCTION hierarchical         p          % 0.01162791      1.2
      25 MYOCARDIAL INFARCTION hierarchical         n          n          0        0
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
      16    NULL  NULL     stat_1
      17    NULL  NULL     stat_1
      18    NULL  NULL     stat_1
      19    NULL  NULL     stat_2
      20    NULL  NULL     stat_2
      21    NULL  NULL     stat_2
      22    NULL  NULL     stat_1
      23    NULL  NULL     stat_1
      24    NULL  NULL     stat_1
      25    NULL  NULL     stat_2

