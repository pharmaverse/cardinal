# fda-table_06() works

    Code
      as.data.frame(ard$tbl_ard_summary)[1:25, ]
    Output
         group1         group1_level variable variable_level        context
      1  TRT01A              Placebo   TRTDUR           NULL        summary
      2  TRT01A              Placebo   TRTDUR           NULL        summary
      3  TRT01A              Placebo   TRTDUR           NULL        summary
      4  TRT01A              Placebo   TRTDUR           NULL        summary
      5  TRT01A              Placebo   TRTDUR           NULL        summary
      6  TRT01A              Placebo   TRTDUR           NULL        summary
      7  TRT01A              Placebo   TRTDUR           NULL        summary
      8  TRT01A              Placebo   TRTDUR           NULL        summary
      9  TRT01A              Placebo   TRTDUR           NULL        summary
      10 TRT01A              Placebo    D_ANY           TRUE tabulate_value
      11 TRT01A              Placebo    D_ANY           TRUE tabulate_value
      12 TRT01A              Placebo    D_GT1           TRUE tabulate_value
      13 TRT01A              Placebo    D_GT1           TRUE tabulate_value
      14 TRT01A              Placebo    D_GT3           TRUE tabulate_value
      15 TRT01A              Placebo    D_GT3           TRUE tabulate_value
      16 TRT01A              Placebo    D_GT6           TRUE tabulate_value
      17 TRT01A              Placebo    D_GT6           TRUE tabulate_value
      18 TRT01A              Placebo   D_GT12           TRUE tabulate_value
      19 TRT01A              Placebo   D_GT12           TRUE tabulate_value
      20 TRT01A Xanomeline High Dose   TRTDUR           NULL        summary
      21 TRT01A Xanomeline High Dose   TRTDUR           NULL        summary
      22 TRT01A Xanomeline High Dose   TRTDUR           NULL        summary
      23 TRT01A Xanomeline High Dose   TRTDUR           NULL        summary
      24 TRT01A Xanomeline High Dose   TRTDUR           NULL        summary
      25 TRT01A Xanomeline High Dose   TRTDUR           NULL        summary
            stat_name   stat_label      stat
      1          mean         Mean  149.5412
      2            sd           SD  60.35442
      3        median       Median       182
      4           min          Min  6.999988
      5           max          Max       210
      6           p25           Q1       134
      7           p75           Q3       183
      8  tot_exposure tot_exposure     12711
      9    person_yrs   person_yrs  34.80082
      10            n            n        85
      11            p            %         1
      12            n            n        77
      13            p            % 0.9058824
      14            n            n        67
      15            p            % 0.7882353
      16            n            n        40
      17            p            % 0.4705882
      18            n            n         0
      19            p            %         0
      20         mean         Mean  112.2222
      21           sd           SD  65.52329
      22       median       Median  96.49999
      23          min          Min  14.99999
      24          max          Max       200
      25          p25           Q1  53.49999
                                                                                                                                                                                                                                                                                                                           fmt_fun
      1                                                                                                                                                                                                                                                                                                                          1
      2                                                                                                                                                                                                                                                                                                                          1
      3                                                                                                                                                                                                                                                                                                                          1
      4                                                                                                                                                                                                                                                                                                                          1
      5                                                                                                                                                                                                                                                                                                                          1
      6                                                                                                                                                                                                                                                                                                                          1
      7                                                                                                                                                                                                                                                                                                                          1
      8                                                                                                                                                                                                                                                                                                                          1
      9                                                                                                                                                                                                                                                                                                                          1
      10                                                                                                                                                                                                                                                                                                                         0
      11 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      12                                                                                                                                                                                                                                                                                                                         0
      13 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      14                                                                                                                                                                                                                                                                                                                         0
      15 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      16                                                                                                                                                                                                                                                                                                                         0
      17 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      18                                                                                                                                                                                                                                                                                                                         0
      19 function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      20                                                                                                                                                                                                                                                                                                                         1
      21                                                                                                                                                                                                                                                                                                                         1
      22                                                                                                                                                                                                                                                                                                                         1
      23                                                                                                                                                                                                                                                                                                                         1
      24                                                                                                                                                                                                                                                                                                                         1
      25                                                                                                                                                                                                                                                                                                                         1
         warning error gts_column
      1     NULL  NULL     stat_1
      2     NULL  NULL     stat_1
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
      20    NULL  NULL     stat_2
      21    NULL  NULL     stat_2
      22    NULL  NULL     stat_2
      23    NULL  NULL     stat_2
      24    NULL  NULL     stat_2
      25    NULL  NULL     stat_2

