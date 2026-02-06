# fda-table_29() works

    Code
      as.data.frame(ard$tbl_ard_hierarchical)[1:25, ]
    Output
         group1        group1_level   group2       group2_level    group3
      1    <NA>                NULL     <NA>               NULL      <NA>
      2    <NA>                NULL     <NA>               NULL      <NA>
      3    <NA>                NULL     <NA>               NULL      <NA>
      4    <NA>                NULL     <NA>               NULL      <NA>
      5    <NA>                NULL     <NA>               NULL      <NA>
      6    <NA>                NULL     <NA>               NULL      <NA>
      7    <NA>                NULL     <NA>               NULL      <NA>
      8    <NA>                NULL     <NA>               NULL      <NA>
      9    <NA>                NULL     <NA>               NULL      <NA>
      10 TRT01A             Placebo AEBODSYS VASCULAR DISORDERS      <NA>
      11 TRT01A             Placebo AEBODSYS VASCULAR DISORDERS      <NA>
      12 TRT01A             Placebo AEBODSYS VASCULAR DISORDERS      <NA>
      13 TRT01A Xanomeline Low Dose AEBODSYS VASCULAR DISORDERS      <NA>
      14 TRT01A Xanomeline Low Dose AEBODSYS VASCULAR DISORDERS      <NA>
      15 TRT01A Xanomeline Low Dose AEBODSYS VASCULAR DISORDERS      <NA>
      16 TRT01A             Placebo AEBODSYS VASCULAR DISORDERS OCMQ01NAM
      17 TRT01A             Placebo AEBODSYS VASCULAR DISORDERS OCMQ01NAM
      18 TRT01A             Placebo AEBODSYS VASCULAR DISORDERS OCMQ01NAM
      19 TRT01A Xanomeline Low Dose AEBODSYS VASCULAR DISORDERS OCMQ01NAM
      20 TRT01A Xanomeline Low Dose AEBODSYS VASCULAR DISORDERS OCMQ01NAM
      21 TRT01A Xanomeline Low Dose AEBODSYS VASCULAR DISORDERS OCMQ01NAM
      22 TRT01A             Placebo AEBODSYS VASCULAR DISORDERS      <NA>
      23 TRT01A             Placebo AEBODSYS VASCULAR DISORDERS      <NA>
      24 TRT01A             Placebo AEBODSYS VASCULAR DISORDERS      <NA>
      25 TRT01A Xanomeline Low Dose AEBODSYS VASCULAR DISORDERS      <NA>
         group3_level  variable       variable_level      context stat_name
      1          NULL    TRT01A              Placebo     tabulate         n
      2          NULL    TRT01A              Placebo     tabulate         N
      3          NULL    TRT01A              Placebo     tabulate         p
      4          NULL    TRT01A Xanomeline High Dose     tabulate         n
      5          NULL    TRT01A Xanomeline High Dose     tabulate         N
      6          NULL    TRT01A Xanomeline High Dose     tabulate         p
      7          NULL    TRT01A  Xanomeline Low Dose     tabulate         n
      8          NULL    TRT01A  Xanomeline Low Dose     tabulate         N
      9          NULL    TRT01A  Xanomeline Low Dose     tabulate         p
      10         NULL OCMQ01NAM                OCMQ1 hierarchical         n
      11         NULL OCMQ01NAM                OCMQ1 hierarchical         N
      12         NULL OCMQ01NAM                OCMQ1 hierarchical         p
      13         NULL OCMQ01NAM                OCMQ1 hierarchical         n
      14         NULL OCMQ01NAM                OCMQ1 hierarchical         N
      15         NULL OCMQ01NAM                OCMQ1 hierarchical         p
      16        OCMQ1   AEDECOD          HYPOTENSION hierarchical         n
      17        OCMQ1   AEDECOD          HYPOTENSION hierarchical         N
      18        OCMQ1   AEDECOD          HYPOTENSION hierarchical         p
      19        OCMQ1   AEDECOD          HYPOTENSION hierarchical         n
      20        OCMQ1   AEDECOD          HYPOTENSION hierarchical         N
      21        OCMQ1   AEDECOD          HYPOTENSION hierarchical         p
      22         NULL OCMQ01NAM                OCMQ2 hierarchical         n
      23         NULL OCMQ01NAM                OCMQ2 hierarchical         N
      24         NULL OCMQ01NAM                OCMQ2 hierarchical         p
      25         NULL OCMQ01NAM                OCMQ2 hierarchical         n
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
      10          n          1        1
      11          N         86       86
      12          % 0.01162791      1.2
      13          n          1        1
      14          N         96       96
      15          % 0.01041667      1.0
      16          n          1        1
      17          N         86       86
      18          % 0.01162791      1.2
      19          n          1        1
      20          N         96       96
      21          % 0.01041667      1.0
      22          n          1        1
      23          N         86       86
      24          % 0.01162791      1.2
      25          n          1        1
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

