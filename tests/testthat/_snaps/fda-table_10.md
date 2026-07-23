# fda-table_10() works

    Code
      as.data.frame(ard)[1:25, ]
    Output
         tbl_hierarchical.group1 tbl_hierarchical.group1_level
      1                     <NA>                          NULL
      2                     <NA>                          NULL
      3                     <NA>                          NULL
      4                     <NA>                          NULL
      5                     <NA>                          NULL
      6                     <NA>                          NULL
      7                     <NA>                          NULL
      8                     <NA>                          NULL
      9                     <NA>                          NULL
      10                    <NA>                          NULL
      11                    <NA>                          NULL
      12                    <NA>                          NULL
      13                  TRT01A          Xanomeline High Dose
      14                  TRT01A          Xanomeline High Dose
      15                  TRT01A          Xanomeline High Dose
      16                  TRT01A           Xanomeline Low Dose
      17                  TRT01A           Xanomeline Low Dose
      18                  TRT01A           Xanomeline Low Dose
      19                  TRT01A          Xanomeline High Dose
      20                  TRT01A          Xanomeline High Dose
      21                  TRT01A          Xanomeline High Dose
      22                  TRT01A           Xanomeline Low Dose
      23                  TRT01A           Xanomeline Low Dose
      24                  TRT01A           Xanomeline Low Dose
      25                  TRT01A          Xanomeline High Dose
         tbl_hierarchical.group2 tbl_hierarchical.group2_level
      1                     <NA>                          NULL
      2                     <NA>                          NULL
      3                     <NA>                          NULL
      4                     <NA>                          NULL
      5                     <NA>                          NULL
      6                     <NA>                          NULL
      7                     <NA>                          NULL
      8                     <NA>                          NULL
      9                     <NA>                          NULL
      10                    <NA>                          NULL
      11                    <NA>                          NULL
      12                    <NA>                          NULL
      13                    <NA>                          NULL
      14                    <NA>                          NULL
      15                    <NA>                          NULL
      16                    <NA>                          NULL
      17                    <NA>                          NULL
      18                    <NA>                          NULL
      19                    <NA>                          NULL
      20                    <NA>                          NULL
      21                    <NA>                          NULL
      22                    <NA>                          NULL
      23                    <NA>                          NULL
      24                    <NA>                          NULL
      25                   AESOC      NERVOUS SYSTEM DISORDERS
            tbl_hierarchical.variable tbl_hierarchical.variable_level
      1                        TRT01A                         Placebo
      2                        TRT01A                         Placebo
      3                        TRT01A                         Placebo
      4                        TRT01A                  Screen Failure
      5                        TRT01A                  Screen Failure
      6                        TRT01A                  Screen Failure
      7                        TRT01A            Xanomeline High Dose
      8                        TRT01A            Xanomeline High Dose
      9                        TRT01A            Xanomeline High Dose
      10                       TRT01A             Xanomeline Low Dose
      11                       TRT01A             Xanomeline Low Dose
      12                       TRT01A             Xanomeline Low Dose
      13 ..ard_hierarchical_overall..                            TRUE
      14 ..ard_hierarchical_overall..                            TRUE
      15 ..ard_hierarchical_overall..                            TRUE
      16 ..ard_hierarchical_overall..                            TRUE
      17 ..ard_hierarchical_overall..                            TRUE
      18 ..ard_hierarchical_overall..                            TRUE
      19                        AESOC        NERVOUS SYSTEM DISORDERS
      20                        AESOC        NERVOUS SYSTEM DISORDERS
      21                        AESOC        NERVOUS SYSTEM DISORDERS
      22                        AESOC        NERVOUS SYSTEM DISORDERS
      23                        AESOC        NERVOUS SYSTEM DISORDERS
      24                        AESOC        NERVOUS SYSTEM DISORDERS
      25                      AEDECOD                               1
         tbl_hierarchical.context tbl_hierarchical.stat_name
      1                  tabulate                          n
      2                  tabulate                          N
      3                  tabulate                          p
      4                  tabulate                          n
      5                  tabulate                          N
      6                  tabulate                          p
      7                  tabulate                          n
      8                  tabulate                          N
      9                  tabulate                          p
      10                 tabulate                          n
      11                 tabulate                          N
      12                 tabulate                          p
      13             hierarchical                          n
      14             hierarchical                          N
      15             hierarchical                          p
      16             hierarchical                          n
      17             hierarchical                          N
      18             hierarchical                          p
      19             hierarchical                          n
      20             hierarchical                          N
      21             hierarchical                          p
      22             hierarchical                          n
      23             hierarchical                          N
      24             hierarchical                          p
      25             hierarchical                          n
         tbl_hierarchical.stat_label tbl_hierarchical.stat tbl_hierarchical.stat_fmt
      1                            n                    86                        86
      2                            N                   306                       306
      3                            %             0.2810458                      28.1
      4                            n                    52                        52
      5                            N                   306                       306
      6                            %             0.1699346                      17.0
      7                            n                    72                        72
      8                            N                   306                       306
      9                            %             0.2352941                      23.5
      10                           n                    96                        96
      11                           N                   306                       306
      12                           %             0.3137255                      31.4
      13                           n                     1                         1
      14                           N                    72                        72
      15                           %            0.01388889                       1.4
      16                           n                     2                         2
      17                           N                    96                        96
      18                           %            0.02083333                       2.1
      19                           n                     1                         1
      20                           N                    72                        72
      21                           %            0.01388889                       1.4
      22                           n                     2                         2
      23                           N                    96                        96
      24                           %            0.02083333                       2.1
      25                           n                     1                         1
                                                                                                                                                                                                                                                                                                          tbl_hierarchical.fmt_fun
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
         tbl_hierarchical.warning tbl_hierarchical.error tbl_hierarchical.gts_column
      1                      NULL                   NULL                      stat_1
      2                      NULL                   NULL                      stat_1
      3                      NULL                   NULL                      stat_1
      4                      NULL                   NULL                      stat_2
      5                      NULL                   NULL                      stat_2
      6                      NULL                   NULL                      stat_2
      7                      NULL                   NULL                      stat_3
      8                      NULL                   NULL                      stat_3
      9                      NULL                   NULL                      stat_3
      10                     NULL                   NULL                      stat_4
      11                     NULL                   NULL                      stat_4
      12                     NULL                   NULL                      stat_4
      13                     NULL                   NULL                      stat_1
      14                     NULL                   NULL                      stat_1
      15                     NULL                   NULL                      stat_1
      16                     NULL                   NULL                      stat_2
      17                     NULL                   NULL                      stat_2
      18                     NULL                   NULL                      stat_2
      19                     NULL                   NULL                      stat_1
      20                     NULL                   NULL                      stat_1
      21                     NULL                   NULL                      stat_1
      22                     NULL                   NULL                      stat_2
      23                     NULL                   NULL                      stat_2
      24                     NULL                   NULL                      stat_2
      25                     NULL                   NULL                      stat_1

