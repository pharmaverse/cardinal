# fda-table_43() works

    Code
      as.data.frame(ard$tbl_ard_hierarchical)[1:25, ]
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
      10 TRT01A              Placebo AEBODSYS
      11 TRT01A              Placebo AEBODSYS
      12 TRT01A              Placebo AEBODSYS
      13 TRT01A Xanomeline High Dose AEBODSYS
      14 TRT01A Xanomeline High Dose AEBODSYS
      15 TRT01A Xanomeline High Dose AEBODSYS
      16 TRT01A  Xanomeline Low Dose AEBODSYS
      17 TRT01A  Xanomeline Low Dose AEBODSYS
      18 TRT01A  Xanomeline Low Dose AEBODSYS
      19 TRT01A              Placebo AEBODSYS
      20 TRT01A              Placebo AEBODSYS
      21 TRT01A              Placebo AEBODSYS
      22 TRT01A Xanomeline High Dose AEBODSYS
      23 TRT01A Xanomeline High Dose AEBODSYS
      24 TRT01A Xanomeline High Dose AEBODSYS
      25 TRT01A  Xanomeline Low Dose AEBODSYS
                                       group2_level    group3 group3_level  variable
      1                                        NULL      <NA>         NULL    TRT01A
      2                                        NULL      <NA>         NULL    TRT01A
      3                                        NULL      <NA>         NULL    TRT01A
      4                                        NULL      <NA>         NULL    TRT01A
      5                                        NULL      <NA>         NULL    TRT01A
      6                                        NULL      <NA>         NULL    TRT01A
      7                                        NULL      <NA>         NULL    TRT01A
      8                                        NULL      <NA>         NULL    TRT01A
      9                                        NULL      <NA>         NULL    TRT01A
      10 CONGENITAL, FAMILIAL AND GENETIC DISORDERS      <NA>         NULL OCMQ01NAM
      11 CONGENITAL, FAMILIAL AND GENETIC DISORDERS      <NA>         NULL OCMQ01NAM
      12 CONGENITAL, FAMILIAL AND GENETIC DISORDERS      <NA>         NULL OCMQ01NAM
      13 CONGENITAL, FAMILIAL AND GENETIC DISORDERS      <NA>         NULL OCMQ01NAM
      14 CONGENITAL, FAMILIAL AND GENETIC DISORDERS      <NA>         NULL OCMQ01NAM
      15 CONGENITAL, FAMILIAL AND GENETIC DISORDERS      <NA>         NULL OCMQ01NAM
      16 CONGENITAL, FAMILIAL AND GENETIC DISORDERS      <NA>         NULL OCMQ01NAM
      17 CONGENITAL, FAMILIAL AND GENETIC DISORDERS      <NA>         NULL OCMQ01NAM
      18 CONGENITAL, FAMILIAL AND GENETIC DISORDERS      <NA>         NULL OCMQ01NAM
      19 CONGENITAL, FAMILIAL AND GENETIC DISORDERS OCMQ01NAM        OCMQ3   AEDECOD
      20 CONGENITAL, FAMILIAL AND GENETIC DISORDERS OCMQ01NAM        OCMQ3   AEDECOD
      21 CONGENITAL, FAMILIAL AND GENETIC DISORDERS OCMQ01NAM        OCMQ3   AEDECOD
      22 CONGENITAL, FAMILIAL AND GENETIC DISORDERS OCMQ01NAM        OCMQ3   AEDECOD
      23 CONGENITAL, FAMILIAL AND GENETIC DISORDERS OCMQ01NAM        OCMQ3   AEDECOD
      24 CONGENITAL, FAMILIAL AND GENETIC DISORDERS OCMQ01NAM        OCMQ3   AEDECOD
      25 CONGENITAL, FAMILIAL AND GENETIC DISORDERS OCMQ01NAM        OCMQ3   AEDECOD
                    variable_level      context stat_name stat_label       stat
      1                    Placebo     tabulate         n          n         86
      2                    Placebo     tabulate         N          N        254
      3                    Placebo     tabulate         p          %  0.3385827
      4       Xanomeline High Dose     tabulate         n          n         72
      5       Xanomeline High Dose     tabulate         N          N        254
      6       Xanomeline High Dose     tabulate         p          %  0.2834646
      7        Xanomeline Low Dose     tabulate         n          n         96
      8        Xanomeline Low Dose     tabulate         N          N        254
      9        Xanomeline Low Dose     tabulate         p          %  0.3779528
      10                     OCMQ3 hierarchical         n          n          0
      11                     OCMQ3 hierarchical         N          N         86
      12                     OCMQ3 hierarchical         p          %          0
      13                     OCMQ3 hierarchical         n          n          1
      14                     OCMQ3 hierarchical         N          N         72
      15                     OCMQ3 hierarchical         p          % 0.01388889
      16                     OCMQ3 hierarchical         n          n          0
      17                     OCMQ3 hierarchical         N          N         96
      18                     OCMQ3 hierarchical         p          %          0
      19 VENTRICULAR SEPTAL DEFECT hierarchical         n          n          0
      20 VENTRICULAR SEPTAL DEFECT hierarchical         N          N         86
      21 VENTRICULAR SEPTAL DEFECT hierarchical         p          %          0
      22 VENTRICULAR SEPTAL DEFECT hierarchical         n          n          1
      23 VENTRICULAR SEPTAL DEFECT hierarchical         N          N         72
      24 VENTRICULAR SEPTAL DEFECT hierarchical         p          % 0.01388889
      25 VENTRICULAR SEPTAL DEFECT hierarchical         n          n          0
         stat_fmt
      1        86
      2       254
      3      33.9
      4        72
      5       254
      6      28.3
      7        96
      8       254
      9      37.8
      10        0
      11       86
      12      0.0
      13        1
      14       72
      15      1.4
      16        0
      17       96
      18      0.0
      19        0
      20       86
      21      0.0
      22        1
      23       72
      24      1.4
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

