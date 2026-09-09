# fda-table_46() works

    Code
      as.data.frame(ard$tbl_hierarchical_rate_and_count$tbl_hierarchical)[1:25, ]
    Output
         group1         group1_level group2 group2_level                     variable
      1    <NA>                 NULL   <NA>         NULL                       TRT01A
      2    <NA>                 NULL   <NA>         NULL                       TRT01A
      3    <NA>                 NULL   <NA>         NULL                       TRT01A
      4    <NA>                 NULL   <NA>         NULL                       TRT01A
      5    <NA>                 NULL   <NA>         NULL                       TRT01A
      6    <NA>                 NULL   <NA>         NULL                       TRT01A
      7    <NA>                 NULL   <NA>         NULL                       TRT01A
      8    <NA>                 NULL   <NA>         NULL                       TRT01A
      9    <NA>                 NULL   <NA>         NULL                       TRT01A
      10 TRT01A              Placebo   <NA>         NULL ..ard_hierarchical_overall..
      11 TRT01A              Placebo   <NA>         NULL ..ard_hierarchical_overall..
      12 TRT01A              Placebo   <NA>         NULL ..ard_hierarchical_overall..
      13 TRT01A Xanomeline High Dose   <NA>         NULL ..ard_hierarchical_overall..
      14 TRT01A Xanomeline High Dose   <NA>         NULL ..ard_hierarchical_overall..
      15 TRT01A Xanomeline High Dose   <NA>         NULL ..ard_hierarchical_overall..
      16 TRT01A  Xanomeline Low Dose   <NA>         NULL ..ard_hierarchical_overall..
      17 TRT01A  Xanomeline Low Dose   <NA>         NULL ..ard_hierarchical_overall..
      18 TRT01A  Xanomeline Low Dose   <NA>         NULL ..ard_hierarchical_overall..
      19 TRT01A              Placebo   <NA>         NULL                     AEBODSYS
      20 TRT01A              Placebo   <NA>         NULL                     AEBODSYS
      21 TRT01A              Placebo   <NA>         NULL                     AEBODSYS
      22 TRT01A Xanomeline High Dose   <NA>         NULL                     AEBODSYS
      23 TRT01A Xanomeline High Dose   <NA>         NULL                     AEBODSYS
      24 TRT01A Xanomeline High Dose   <NA>         NULL                     AEBODSYS
      25 TRT01A  Xanomeline Low Dose   <NA>         NULL                     AEBODSYS
               variable_level      context stat_name stat_label      stat stat_fmt
      1               Placebo     tabulate         n          n        86       86
      2               Placebo     tabulate         N          N       254      254
      3               Placebo     tabulate         p          % 0.3385827     33.9
      4  Xanomeline High Dose     tabulate         n          n        72       72
      5  Xanomeline High Dose     tabulate         N          N       254      254
      6  Xanomeline High Dose     tabulate         p          % 0.2834646     28.3
      7   Xanomeline Low Dose     tabulate         n          n        96       96
      8   Xanomeline Low Dose     tabulate         N          N       254      254
      9   Xanomeline Low Dose     tabulate         p          % 0.3779528     37.8
      10                 TRUE hierarchical         n          n        65       65
      11                 TRUE hierarchical         N          N        86       86
      12                 TRUE hierarchical         p          %  0.755814       76
      13                 TRUE hierarchical         n          n        68       68
      14                 TRUE hierarchical         N          N        72       72
      15                 TRUE hierarchical         p          % 0.9444444       94
      16                 TRUE hierarchical         n          n        84       84
      17                 TRUE hierarchical         N          N        96       96
      18                 TRUE hierarchical         p          %     0.875       88
      19    CARDIAC DISORDERS hierarchical         n          n        12       12
      20    CARDIAC DISORDERS hierarchical         N          N        86       86
      21    CARDIAC DISORDERS hierarchical         p          % 0.1395349       14
      22    CARDIAC DISORDERS hierarchical         n          n        14       14
      23    CARDIAC DISORDERS hierarchical         N          N        72       72
      24    CARDIAC DISORDERS hierarchical         p          % 0.1944444       19
      25    CARDIAC DISORDERS hierarchical         n          n        14       14
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
      as.data.frame(ard$tbl_hierarchical_rate_and_count$tbl_hierarchical_count)[1:25, ]
    Output
         group1         group1_level   group2      group2_level
      1  TRT01A              Placebo     <NA>              NULL
      2  TRT01A Xanomeline High Dose     <NA>              NULL
      3  TRT01A  Xanomeline Low Dose     <NA>              NULL
      4  TRT01A              Placebo     <NA>              NULL
      5  TRT01A Xanomeline High Dose     <NA>              NULL
      6  TRT01A  Xanomeline Low Dose     <NA>              NULL
      7  TRT01A              Placebo AEBODSYS CARDIAC DISORDERS
      8  TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS
      9  TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS
      10 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS
      11 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS
      12 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS
      13 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS
      14 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS
      15 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS
      16 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS
      17 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS
      18 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS
      19 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS
      20 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS
      21 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS
      22 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS
      23 TRT01A Xanomeline High Dose AEBODSYS CARDIAC DISORDERS
      24 TRT01A  Xanomeline Low Dose AEBODSYS CARDIAC DISORDERS
      25 TRT01A              Placebo AEBODSYS CARDIAC DISORDERS
                             variable                       variable_level
      1  ..ard_hierarchical_overall..                                 TRUE
      2  ..ard_hierarchical_overall..                                 TRUE
      3  ..ard_hierarchical_overall..                                 TRUE
      4                      AEBODSYS                    CARDIAC DISORDERS
      5                      AEBODSYS                    CARDIAC DISORDERS
      6                      AEBODSYS                    CARDIAC DISORDERS
      7                       AEDECOD                  ATRIAL FIBRILLATION
      8                       AEDECOD                  ATRIAL FIBRILLATION
      9                       AEDECOD                  ATRIAL FIBRILLATION
      10                      AEDECOD                       ATRIAL FLUTTER
      11                      AEDECOD                       ATRIAL FLUTTER
      12                      AEDECOD                       ATRIAL FLUTTER
      13                      AEDECOD                   ATRIAL HYPERTROPHY
      14                      AEDECOD                   ATRIAL HYPERTROPHY
      15                      AEDECOD                   ATRIAL HYPERTROPHY
      16                      AEDECOD  ATRIOVENTRICULAR BLOCK FIRST DEGREE
      17                      AEDECOD  ATRIOVENTRICULAR BLOCK FIRST DEGREE
      18                      AEDECOD  ATRIOVENTRICULAR BLOCK FIRST DEGREE
      19                      AEDECOD ATRIOVENTRICULAR BLOCK SECOND DEGREE
      20                      AEDECOD ATRIOVENTRICULAR BLOCK SECOND DEGREE
      21                      AEDECOD ATRIOVENTRICULAR BLOCK SECOND DEGREE
      22                      AEDECOD                          BRADYCARDIA
      23                      AEDECOD                          BRADYCARDIA
      24                      AEDECOD                          BRADYCARDIA
      25                      AEDECOD             BUNDLE BRANCH BLOCK LEFT
                    context stat_name stat_label stat stat_fmt
      1  hierarchical_count         n          n  281      281
      2  hierarchical_count         n          n  414      414
      3  hierarchical_count         n          n  427      427
      4  hierarchical_count         n          n   26       26
      5  hierarchical_count         n          n   28       28
      6  hierarchical_count         n          n   32       32
      7  hierarchical_count         n          n    1        1
      8  hierarchical_count         n          n    3        3
      9  hierarchical_count         n          n    3        3
      10 hierarchical_count         n          n    0        0
      11 hierarchical_count         n          n    2        2
      12 hierarchical_count         n          n    1        1
      13 hierarchical_count         n          n    2        2
      14 hierarchical_count         n          n    0        0
      15 hierarchical_count         n          n    0        0
      16 hierarchical_count         n          n    1        1
      17 hierarchical_count         n          n    0        0
      18 hierarchical_count         n          n    1        1
      19 hierarchical_count         n          n    1        1
      20 hierarchical_count         n          n    0        0
      21 hierarchical_count         n          n    0        0
      22 hierarchical_count         n          n    4        4
      23 hierarchical_count         n          n    0        0
      24 hierarchical_count         n          n    0        0
      25 hierarchical_count         n          n    1        1
                                                                                                                                                                              fmt_fun
      1  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      2  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      3  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      4  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      5  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      6  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      7  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      8  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      9  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      10 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      11 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      12 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      13 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      14 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      15 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      16 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      17 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      18 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      19 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      20 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      21 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      22 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      23 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      24 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      25 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
         warning error gts_column
      1     NULL  NULL     stat_1
      2     NULL  NULL     stat_2
      3     NULL  NULL     stat_3
      4     NULL  NULL     stat_1
      5     NULL  NULL     stat_2
      6     NULL  NULL     stat_3
      7     NULL  NULL     stat_1
      8     NULL  NULL     stat_2
      9     NULL  NULL     stat_3
      10    NULL  NULL     stat_1
      11    NULL  NULL     stat_2
      12    NULL  NULL     stat_3
      13    NULL  NULL     stat_1
      14    NULL  NULL     stat_2
      15    NULL  NULL     stat_3
      16    NULL  NULL     stat_1
      17    NULL  NULL     stat_2
      18    NULL  NULL     stat_3
      19    NULL  NULL     stat_1
      20    NULL  NULL     stat_2
      21    NULL  NULL     stat_3
      22    NULL  NULL     stat_1
      23    NULL  NULL     stat_2
      24    NULL  NULL     stat_3
      25    NULL  NULL     stat_1

