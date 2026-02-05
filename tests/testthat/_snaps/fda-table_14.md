# fda-table_14() works

    Code
      as.data.frame(ard$tbl_ard_hierarchical)[1:25, ]
    Output
         group1         group1_level group2
      1    <NA>                 NULL   <NA>
      2    <NA>                 NULL   <NA>
      3    <NA>                 NULL   <NA>
      4    <NA>                 NULL   <NA>
      5    <NA>                 NULL   <NA>
      6    <NA>                 NULL   <NA>
      7    <NA>                 NULL   <NA>
      8    <NA>                 NULL   <NA>
      9    <NA>                 NULL   <NA>
      10 TRT01A              Placebo   <NA>
      11 TRT01A              Placebo   <NA>
      12 TRT01A              Placebo   <NA>
      13 TRT01A Xanomeline High Dose   <NA>
      14 TRT01A Xanomeline High Dose   <NA>
      15 TRT01A Xanomeline High Dose   <NA>
      16 TRT01A  Xanomeline Low Dose   <NA>
      17 TRT01A  Xanomeline Low Dose   <NA>
      18 TRT01A  Xanomeline Low Dose   <NA>
      19 TRT01A              Placebo  AESOC
      20 TRT01A              Placebo  AESOC
      21 TRT01A              Placebo  AESOC
      22 TRT01A Xanomeline High Dose  AESOC
      23 TRT01A Xanomeline High Dose  AESOC
      24 TRT01A Xanomeline High Dose  AESOC
      25 TRT01A  Xanomeline Low Dose  AESOC
                                       group2_level variable
      1                                        NULL   TRT01A
      2                                        NULL   TRT01A
      3                                        NULL   TRT01A
      4                                        NULL   TRT01A
      5                                        NULL   TRT01A
      6                                        NULL   TRT01A
      7                                        NULL   TRT01A
      8                                        NULL   TRT01A
      9                                        NULL   TRT01A
      10                                       NULL    AESOC
      11                                       NULL    AESOC
      12                                       NULL    AESOC
      13                                       NULL    AESOC
      14                                       NULL    AESOC
      15                                       NULL    AESOC
      16                                       NULL    AESOC
      17                                       NULL    AESOC
      18                                       NULL    AESOC
      19 CONGENITAL, FAMILIAL AND GENETIC DISORDERS  AEDECOD
      20 CONGENITAL, FAMILIAL AND GENETIC DISORDERS  AEDECOD
      21 CONGENITAL, FAMILIAL AND GENETIC DISORDERS  AEDECOD
      22 CONGENITAL, FAMILIAL AND GENETIC DISORDERS  AEDECOD
      23 CONGENITAL, FAMILIAL AND GENETIC DISORDERS  AEDECOD
      24 CONGENITAL, FAMILIAL AND GENETIC DISORDERS  AEDECOD
      25 CONGENITAL, FAMILIAL AND GENETIC DISORDERS  AEDECOD
                                     variable_level      context stat_name stat_label
      1                                     Placebo     tabulate         n          n
      2                                     Placebo     tabulate         N          N
      3                                     Placebo     tabulate         p          %
      4                        Xanomeline High Dose     tabulate         n          n
      5                        Xanomeline High Dose     tabulate         N          N
      6                        Xanomeline High Dose     tabulate         p          %
      7                         Xanomeline Low Dose     tabulate         n          n
      8                         Xanomeline Low Dose     tabulate         N          N
      9                         Xanomeline Low Dose     tabulate         p          %
      10 CONGENITAL, FAMILIAL AND GENETIC DISORDERS hierarchical         n          n
      11 CONGENITAL, FAMILIAL AND GENETIC DISORDERS hierarchical         N          N
      12 CONGENITAL, FAMILIAL AND GENETIC DISORDERS hierarchical         p          %
      13 CONGENITAL, FAMILIAL AND GENETIC DISORDERS hierarchical         n          n
      14 CONGENITAL, FAMILIAL AND GENETIC DISORDERS hierarchical         N          N
      15 CONGENITAL, FAMILIAL AND GENETIC DISORDERS hierarchical         p          %
      16 CONGENITAL, FAMILIAL AND GENETIC DISORDERS hierarchical         n          n
      17 CONGENITAL, FAMILIAL AND GENETIC DISORDERS hierarchical         N          N
      18 CONGENITAL, FAMILIAL AND GENETIC DISORDERS hierarchical         p          %
      19                  VENTRICULAR SEPTAL DEFECT hierarchical         n          n
      20                  VENTRICULAR SEPTAL DEFECT hierarchical         N          N
      21                  VENTRICULAR SEPTAL DEFECT hierarchical         p          %
      22                  VENTRICULAR SEPTAL DEFECT hierarchical         n          n
      23                  VENTRICULAR SEPTAL DEFECT hierarchical         N          N
      24                  VENTRICULAR SEPTAL DEFECT hierarchical         p          %
      25                  VENTRICULAR SEPTAL DEFECT hierarchical         n          n
               stat stat_fmt
      1          86       86
      2         254      254
      3   0.3385827     33.9
      4          72       72
      5         254      254
      6   0.2834646     28.3
      7          96       96
      8         254      254
      9   0.3779528     37.8
      10          0        0
      11         86       86
      12          0      0.0
      13          2        2
      14         72       72
      15 0.02777778      2.8
      16          1        1
      17         96       96
      18 0.01041667      1.0
      19          0        0
      20         86       86
      21          0      0.0
      22          2        2
      23         72       72
      24 0.02777778      2.8
      25          1        1
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
      13                                                                                                                                                                                                                                                                                                                         0
      14                                                                                                                                                                                                                                                                                                                         0
      15 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      16                                                                                                                                                                                                                                                                                                                         0
      17                                                                                                                                                                                                                                                                                                                         0
      18 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      19                                                                                                                                                                                                                                                                                                                         0
      20                                                                                                                                                                                                                                                                                                                         0
      21 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      22                                                                                                                                                                                                                                                                                                                         0
      23                                                                                                                                                                                                                                                                                                                         0
      24 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      25                                                                                                                                                                                                                                                                                                                         0
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

