# fda-table_51() works

    Code
      as.data.frame(ard$tbl_ard_summary)[1:25, ]
    Output
         group1 group1_level variable                   variable_level     context
      1    <NA>         NULL   any_ae                             NULL  attributes
      2    <NA>         NULL   any_ae                             NULL  attributes
      3     ARM      Placebo   any_ae                           Any AE categorical
      4     ARM      Placebo      SEX                                F categorical
      5     ARM      Placebo      SEX                                M categorical
      6     ARM      Placebo   AGEGR1                            18-64 categorical
      7     ARM      Placebo   AGEGR1                              >64 categorical
      8     ARM      Placebo     RACE AMERICAN INDIAN OR ALASKA NATIVE categorical
      9     ARM      Placebo     RACE        BLACK OR AFRICAN AMERICAN categorical
      10    ARM      Placebo     RACE                            WHITE categorical
      11    ARM      Placebo   ETHNIC               HISPANIC OR LATINO categorical
      12    ARM      Placebo   ETHNIC           NOT HISPANIC OR LATINO categorical
      13    ARM      Placebo   any_ae                           Any AE categorical
      14    ARM      Placebo      SEX                                F categorical
      15    ARM      Placebo      SEX                                M categorical
      16    ARM      Placebo   AGEGR1                            18-64 categorical
      17    ARM      Placebo   AGEGR1                              >64 categorical
      18    ARM      Placebo     RACE AMERICAN INDIAN OR ALASKA NATIVE categorical
      19    ARM      Placebo     RACE        BLACK OR AFRICAN AMERICAN categorical
      20    ARM      Placebo     RACE                            WHITE categorical
      21    ARM      Placebo   ETHNIC               HISPANIC OR LATINO categorical
      22    ARM      Placebo   ETHNIC           NOT HISPANIC OR LATINO categorical
      23    ARM      Placebo   any_ae                           Any AE categorical
      24    ARM      Placebo      SEX                                F categorical
      25    ARM      Placebo      SEX                                M categorical
         stat_name     stat_label      stat
      1      label Variable Label    any_ae
      2      class Variable Class   logical
      3          n              n        65
      4          n              n        40
      5          n              n        25
      6          n              n        10
      7          n              n        55
      8          n              n         0
      9          n              n         6
      10         n              n        59
      11         n              n         3
      12         n              n        62
      13       N_s            N_s        86
      14       N_s            N_s        53
      15       N_s            N_s        33
      16       N_s            N_s        14
      17       N_s            N_s        72
      18       N_s            N_s         0
      19       N_s            N_s         8
      20       N_s            N_s        78
      21       N_s            N_s         3
      22       N_s            N_s        83
      23         p              %  0.755814
      24         p              %  0.754717
      25         p              % 0.7575758
                                                                                                                                                                                                                                                                                                                           fmt_fun
      1                                                                                                                                                                                                                                                                                                 .Primitive("as.character")
      2                                                                                                                                                                                                                                                                                                                       NULL
      3                                                                                                                                                                                                                                                                                                                          0
      4                                                                                                                                                                                                                                                                                                                          0
      5                                                                                                                                                                                                                                                                                                                          0
      6                                                                                                                                                                                                                                                                                                                          0
      7                                                                                                                                                                                                                                                                                                                          0
      8                                                                                                                                                                                                                                                                                                                          0
      9                                                                                                                                                                                                                                                                                                                          0
      10                                                                                                                                                                                                                                                                                                                         0
      11                                                                                                                                                                                                                                                                                                                         0
      12                                                                                                                                                                                                                                                                                                                         0
      13                                                                                                                                                                                                                                                                                                                         0
      14                                                                                                                                                                                                                                                                                                                         0
      15                                                                                                                                                                                                                                                                                                                         0
      16                                                                                                                                                                                                                                                                                                                         0
      17                                                                                                                                                                                                                                                                                                                         0
      18                                                                                                                                                                                                                                                                                                                         0
      19                                                                                                                                                                                                                                                                                                                         0
      20                                                                                                                                                                                                                                                                                                                         0
      21                                                                                                                                                                                                                                                                                                                         0
      22                                                                                                                                                                                                                                                                                                                         0
      23 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      24 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      25 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
         warning error gts_column
      1     NULL  NULL       <NA>
      2     NULL  NULL       <NA>
      3     NULL  NULL     stat_1
      4     NULL  NULL     stat_1
      5     NULL  NULL     stat_1
      6     NULL  NULL     stat_1
      7     NULL  NULL     stat_1
      8     NULL  NULL     stat_1
      9     NULL  NULL     stat_1
      10    NULL  NULL     stat_1
      11    NULL  NULL     stat_1
      12    NULL  NULL     stat_1
      13    NULL  NULL     stat_1
      14    NULL  NULL     stat_1
      15    NULL  NULL     stat_1
      16    NULL  NULL     stat_1
      17    NULL  NULL     stat_1
      18    NULL  NULL     stat_1
      19    NULL  NULL     stat_1
      20    NULL  NULL     stat_1
      21    NULL  NULL     stat_1
      22    NULL  NULL     stat_1
      23    NULL  NULL     stat_1
      24    NULL  NULL     stat_1
      25    NULL  NULL     stat_1

