# fda-table_07() works

    Code
      as.data.frame(ard[[1]][[1]]$tbl_hierarchical)
    Output
         group1         group1_level variable       variable_level      context
      1    <NA>                 NULL   TRT01A              Placebo     tabulate
      2    <NA>                 NULL   TRT01A              Placebo     tabulate
      3    <NA>                 NULL   TRT01A              Placebo     tabulate
      4    <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      5    <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      6    <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      7    <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      8    <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      9    <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      10 TRT01A Xanomeline High Dose    AESER                    1 hierarchical
      11 TRT01A Xanomeline High Dose    AESER                    1 hierarchical
      12 TRT01A Xanomeline High Dose    AESER                    1 hierarchical
      13 TRT01A  Xanomeline Low Dose    AESER                    1 hierarchical
      14 TRT01A  Xanomeline Low Dose    AESER                    1 hierarchical
      15 TRT01A  Xanomeline Low Dose    AESER                    1 hierarchical
         stat_name stat_label       stat stat_fmt
      1          n          n         86       86
      2          N          N        254      254
      3          p          %  0.3385827     33.9
      4          n          n         72       72
      5          N          N        254      254
      6          p          %  0.2834646     28.3
      7          n          n         96       96
      8          N          N        254      254
      9          p          %  0.3779528     37.8
      10         n          n          1        1
      11         N          N         72       72
      12         p          % 0.01388889      1.4
      13         n          n          2        2
      14         N          N         96       96
      15         p          % 0.02083333      2.1
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

---

    Code
      as.data.frame(ard[[1]][[2]]$tbl_hierarchical)
    Output
         group1        group1_level variable       variable_level      context
      1    <NA>                NULL   TRT01A              Placebo     tabulate
      2    <NA>                NULL   TRT01A              Placebo     tabulate
      3    <NA>                NULL   TRT01A              Placebo     tabulate
      4    <NA>                NULL   TRT01A Xanomeline High Dose     tabulate
      5    <NA>                NULL   TRT01A Xanomeline High Dose     tabulate
      6    <NA>                NULL   TRT01A Xanomeline High Dose     tabulate
      7    <NA>                NULL   TRT01A  Xanomeline Low Dose     tabulate
      8    <NA>                NULL   TRT01A  Xanomeline Low Dose     tabulate
      9    <NA>                NULL   TRT01A  Xanomeline Low Dose     tabulate
      10 TRT01A             Placebo   AESDTH                    1 hierarchical
      11 TRT01A             Placebo   AESDTH                    1 hierarchical
      12 TRT01A             Placebo   AESDTH                    1 hierarchical
      13 TRT01A Xanomeline Low Dose   AESDTH                    1 hierarchical
      14 TRT01A Xanomeline Low Dose   AESDTH                    1 hierarchical
      15 TRT01A Xanomeline Low Dose   AESDTH                    1 hierarchical
         stat_name stat_label       stat stat_fmt
      1          n          n         86       86
      2          N          N        254      254
      3          p          %  0.3385827     33.9
      4          n          n         72       72
      5          N          N        254      254
      6          p          %  0.2834646     28.3
      7          n          n         96       96
      8          N          N        254      254
      9          p          %  0.3779528     37.8
      10         n          n          2        2
      11         N          N         86       86
      12         p          % 0.02325581      2.3
      13         n          n          1        1
      14         N          N         96       96
      15         p          % 0.01041667      1.0
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

---

    Code
      as.data.frame(ard[[1]][[3]]$tbl_hierarchical)
    Output
         group1        group1_level variable       variable_level      context
      1    <NA>                NULL   TRT01A              Placebo     tabulate
      2    <NA>                NULL   TRT01A              Placebo     tabulate
      3    <NA>                NULL   TRT01A              Placebo     tabulate
      4    <NA>                NULL   TRT01A Xanomeline High Dose     tabulate
      5    <NA>                NULL   TRT01A Xanomeline High Dose     tabulate
      6    <NA>                NULL   TRT01A Xanomeline High Dose     tabulate
      7    <NA>                NULL   TRT01A  Xanomeline Low Dose     tabulate
      8    <NA>                NULL   TRT01A  Xanomeline Low Dose     tabulate
      9    <NA>                NULL   TRT01A  Xanomeline Low Dose     tabulate
      10 TRT01A             Placebo  AESLIFE                    1 hierarchical
      11 TRT01A             Placebo  AESLIFE                    1 hierarchical
      12 TRT01A             Placebo  AESLIFE                    1 hierarchical
      13 TRT01A Xanomeline Low Dose  AESLIFE                    1 hierarchical
      14 TRT01A Xanomeline Low Dose  AESLIFE                    1 hierarchical
      15 TRT01A Xanomeline Low Dose  AESLIFE                    1 hierarchical
         stat_name stat_label       stat stat_fmt
      1          n          n         86       86
      2          N          N        254      254
      3          p          %  0.3385827     33.9
      4          n          n         72       72
      5          N          N        254      254
      6          p          %  0.2834646     28.3
      7          n          n         96       96
      8          N          N        254      254
      9          p          %  0.3779528     37.8
      10         n          n          2        2
      11         N          N         86       86
      12         p          % 0.02325581      2.3
      13         n          n          2        2
      14         N          N         96       96
      15         p          % 0.02083333      2.1
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

---

    Code
      as.data.frame(ard[[1]][[4]]$tbl_hierarchical)
    Output
         group1         group1_level variable       variable_level      context
      1    <NA>                 NULL   TRT01A              Placebo     tabulate
      2    <NA>                 NULL   TRT01A              Placebo     tabulate
      3    <NA>                 NULL   TRT01A              Placebo     tabulate
      4    <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      5    <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      6    <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      7    <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      8    <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      9    <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      10 TRT01A              Placebo  AESHOSP                    1 hierarchical
      11 TRT01A              Placebo  AESHOSP                    1 hierarchical
      12 TRT01A              Placebo  AESHOSP                    1 hierarchical
      13 TRT01A Xanomeline High Dose  AESHOSP                    1 hierarchical
      14 TRT01A Xanomeline High Dose  AESHOSP                    1 hierarchical
      15 TRT01A Xanomeline High Dose  AESHOSP                    1 hierarchical
      16 TRT01A  Xanomeline Low Dose  AESHOSP                    1 hierarchical
      17 TRT01A  Xanomeline Low Dose  AESHOSP                    1 hierarchical
      18 TRT01A  Xanomeline Low Dose  AESHOSP                    1 hierarchical
         stat_name stat_label       stat stat_fmt
      1          n          n         86       86
      2          N          N        254      254
      3          p          %  0.3385827     33.9
      4          n          n         72       72
      5          N          N        254      254
      6          p          %  0.2834646     28.3
      7          n          n         96       96
      8          N          N        254      254
      9          p          %  0.3779528     37.8
      10         n          n          5        5
      11         N          N         86       86
      12         p          % 0.05813953      5.8
      13         n          n          7        7
      14         N          N         72       72
      15         p          % 0.09722222      9.7
      16         n          n          7        7
      17         N          N         96       96
      18         p          % 0.07291667      7.3
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

---

    Code
      as.data.frame(ard[[1]][[5]]$tbl_hierarchical)
    Output
         group1        group1_level variable       variable_level      context
      1    <NA>                NULL   TRT01A              Placebo     tabulate
      2    <NA>                NULL   TRT01A              Placebo     tabulate
      3    <NA>                NULL   TRT01A              Placebo     tabulate
      4    <NA>                NULL   TRT01A Xanomeline High Dose     tabulate
      5    <NA>                NULL   TRT01A Xanomeline High Dose     tabulate
      6    <NA>                NULL   TRT01A Xanomeline High Dose     tabulate
      7    <NA>                NULL   TRT01A  Xanomeline Low Dose     tabulate
      8    <NA>                NULL   TRT01A  Xanomeline Low Dose     tabulate
      9    <NA>                NULL   TRT01A  Xanomeline Low Dose     tabulate
      10 TRT01A Xanomeline Low Dose AESDISAB                    1 hierarchical
      11 TRT01A Xanomeline Low Dose AESDISAB                    1 hierarchical
      12 TRT01A Xanomeline Low Dose AESDISAB                    1 hierarchical
         stat_name stat_label       stat stat_fmt
      1          n          n         86       86
      2          N          N        254      254
      3          p          %  0.3385827     33.9
      4          n          n         72       72
      5          N          N        254      254
      6          p          %  0.2834646     28.3
      7          n          n         96       96
      8          N          N        254      254
      9          p          %  0.3779528     37.8
      10         n          n          1        1
      11         N          N         96       96
      12         p          % 0.01041667      1.0
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

---

    Code
      as.data.frame(ard[[2]]$tbl_hierarchical)
    Output
         group1         group1_level variable       variable_level      context
      1    <NA>                 NULL   TRT01A              Placebo     tabulate
      2    <NA>                 NULL   TRT01A              Placebo     tabulate
      3    <NA>                 NULL   TRT01A              Placebo     tabulate
      4    <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      5    <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      6    <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      7    <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      8    <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      9    <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      10 TRT01A Xanomeline High Dose   AEDISC                    1 hierarchical
      11 TRT01A Xanomeline High Dose   AEDISC                    1 hierarchical
      12 TRT01A Xanomeline High Dose   AEDISC                    1 hierarchical
      13 TRT01A  Xanomeline Low Dose   AEDISC                    1 hierarchical
      14 TRT01A  Xanomeline Low Dose   AEDISC                    1 hierarchical
      15 TRT01A  Xanomeline Low Dose   AEDISC                    1 hierarchical
         stat_name stat_label       stat stat_fmt
      1          n          n         86       86
      2          N          N        254      254
      3          p          %  0.3385827     33.9
      4          n          n         72       72
      5          N          N        254      254
      6          p          %  0.2834646     28.3
      7          n          n         96       96
      8          N          N        254      254
      9          p          %  0.3779528     37.8
      10         n          n          1        1
      11         N          N         72       72
      12         p          % 0.01388889      1.4
      13         n          n          2        2
      14         N          N         96       96
      15         p          % 0.02083333      2.1
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

---

    Code
      as.data.frame(ard[[3]]$tbl_hierarchical)
    Output
         group1         group1_level                     variable
      1    <NA>                 NULL                       TRT01A
      2    <NA>                 NULL                       TRT01A
      3    <NA>                 NULL                       TRT01A
      4    <NA>                 NULL                       TRT01A
      5    <NA>                 NULL                       TRT01A
      6    <NA>                 NULL                       TRT01A
      7    <NA>                 NULL                       TRT01A
      8    <NA>                 NULL                       TRT01A
      9    <NA>                 NULL                       TRT01A
      10 TRT01A              Placebo ..ard_hierarchical_overall..
      11 TRT01A              Placebo ..ard_hierarchical_overall..
      12 TRT01A              Placebo ..ard_hierarchical_overall..
      13 TRT01A Xanomeline High Dose ..ard_hierarchical_overall..
      14 TRT01A Xanomeline High Dose ..ard_hierarchical_overall..
      15 TRT01A Xanomeline High Dose ..ard_hierarchical_overall..
      16 TRT01A  Xanomeline Low Dose ..ard_hierarchical_overall..
      17 TRT01A  Xanomeline Low Dose ..ard_hierarchical_overall..
      18 TRT01A  Xanomeline Low Dose ..ard_hierarchical_overall..
      19 TRT01A              Placebo                        AEACN
      20 TRT01A              Placebo                        AEACN
      21 TRT01A              Placebo                        AEACN
      22 TRT01A Xanomeline High Dose                        AEACN
      23 TRT01A Xanomeline High Dose                        AEACN
      24 TRT01A Xanomeline High Dose                        AEACN
      25 TRT01A  Xanomeline Low Dose                        AEACN
      26 TRT01A  Xanomeline Low Dose                        AEACN
      27 TRT01A  Xanomeline Low Dose                        AEACN
      28 TRT01A              Placebo                        AEACN
      29 TRT01A              Placebo                        AEACN
      30 TRT01A              Placebo                        AEACN
      31 TRT01A Xanomeline High Dose                        AEACN
      32 TRT01A Xanomeline High Dose                        AEACN
      33 TRT01A Xanomeline High Dose                        AEACN
      34 TRT01A  Xanomeline Low Dose                        AEACN
      35 TRT01A  Xanomeline Low Dose                        AEACN
      36 TRT01A  Xanomeline Low Dose                        AEACN
      37 TRT01A              Placebo                        AEACN
      38 TRT01A              Placebo                        AEACN
      39 TRT01A              Placebo                        AEACN
      40 TRT01A Xanomeline High Dose                        AEACN
      41 TRT01A Xanomeline High Dose                        AEACN
      42 TRT01A Xanomeline High Dose                        AEACN
      43 TRT01A  Xanomeline Low Dose                        AEACN
      44 TRT01A  Xanomeline Low Dose                        AEACN
      45 TRT01A  Xanomeline Low Dose                        AEACN
      46 TRT01A              Placebo                        AEACN
      47 TRT01A              Placebo                        AEACN
      48 TRT01A              Placebo                        AEACN
      49 TRT01A Xanomeline High Dose                        AEACN
      50 TRT01A Xanomeline High Dose                        AEACN
      51 TRT01A Xanomeline High Dose                        AEACN
      52 TRT01A  Xanomeline Low Dose                        AEACN
      53 TRT01A  Xanomeline Low Dose                        AEACN
      54 TRT01A  Xanomeline Low Dose                        AEACN
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
      10                 TRUE hierarchical         n          n        69       69
      11                 TRUE hierarchical         N          N        86       86
      12                 TRUE hierarchical         p          % 0.8023256       80
      13                 TRUE hierarchical         n          n        70       70
      14                 TRUE hierarchical         N          N        72       72
      15                 TRUE hierarchical         p          % 0.9722222       97
      16                 TRUE hierarchical         n          n        86       86
      17                 TRUE hierarchical         N          N        96       96
      18                 TRUE hierarchical         p          % 0.8958333       90
      19                    1 hierarchical         n          n        42       42
      20                    1 hierarchical         N          N        86       86
      21                    1 hierarchical         p          % 0.4883721       49
      22                    1 hierarchical         n          n        51       51
      23                    1 hierarchical         N          N        72       72
      24                    1 hierarchical         p          % 0.7083333       71
      25                    1 hierarchical         n          n        53       53
      26                    1 hierarchical         N          N        96       96
      27                    1 hierarchical         p          % 0.5520833       55
      28                    2 hierarchical         n          n        44       44
      29                    2 hierarchical         N          N        86       86
      30                    2 hierarchical         p          % 0.5116279       51
      31                    2 hierarchical         n          n        55       55
      32                    2 hierarchical         N          N        72       72
      33                    2 hierarchical         p          % 0.7638889       76
      34                    2 hierarchical         n          n        65       65
      35                    2 hierarchical         N          N        96       96
      36                    2 hierarchical         p          % 0.6770833       68
      37                    3 hierarchical         n          n        50       50
      38                    3 hierarchical         N          N        86       86
      39                    3 hierarchical         p          % 0.5813953       58
      40                    3 hierarchical         n          n        54       54
      41                    3 hierarchical         N          N        72       72
      42                    3 hierarchical         p          %      0.75       75
      43                    3 hierarchical         n          n        56       56
      44                    3 hierarchical         N          N        96       96
      45                    3 hierarchical         p          % 0.5833333       58
      46                    4 hierarchical         n          n        35       35
      47                    4 hierarchical         N          N        86       86
      48                    4 hierarchical         p          % 0.4069767       41
      49                    4 hierarchical         n          n        50       50
      50                    4 hierarchical         N          N        72       72
      51                    4 hierarchical         p          % 0.6944444       69
      52                    4 hierarchical         n          n        61       61
      53                    4 hierarchical         N          N        96       96
      54                    4 hierarchical         p          % 0.6354167       64
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
      26                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      27                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      28                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      29                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      30                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      31                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      32                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      33                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      34                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      35                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      36                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      37                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      38                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      39                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      40                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      41                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      42                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      43                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      44                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      45                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      46                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      47                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      48                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      49                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      50                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      51                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      52                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      53                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      54                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
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
      26    NULL  NULL     stat_3
      27    NULL  NULL     stat_3
      28    NULL  NULL     stat_1
      29    NULL  NULL     stat_1
      30    NULL  NULL     stat_1
      31    NULL  NULL     stat_2
      32    NULL  NULL     stat_2
      33    NULL  NULL     stat_2
      34    NULL  NULL     stat_3
      35    NULL  NULL     stat_3
      36    NULL  NULL     stat_3
      37    NULL  NULL     stat_1
      38    NULL  NULL     stat_1
      39    NULL  NULL     stat_1
      40    NULL  NULL     stat_2
      41    NULL  NULL     stat_2
      42    NULL  NULL     stat_2
      43    NULL  NULL     stat_3
      44    NULL  NULL     stat_3
      45    NULL  NULL     stat_3
      46    NULL  NULL     stat_1
      47    NULL  NULL     stat_1
      48    NULL  NULL     stat_1
      49    NULL  NULL     stat_2
      50    NULL  NULL     stat_2
      51    NULL  NULL     stat_2
      52    NULL  NULL     stat_3
      53    NULL  NULL     stat_3
      54    NULL  NULL     stat_3

---

    Code
      as.data.frame(ard[[4]]$tbl_hierarchical)
    Output
         group1         group1_level                     variable
      1    <NA>                 NULL                       TRT01A
      2    <NA>                 NULL                       TRT01A
      3    <NA>                 NULL                       TRT01A
      4    <NA>                 NULL                       TRT01A
      5    <NA>                 NULL                       TRT01A
      6    <NA>                 NULL                       TRT01A
      7    <NA>                 NULL                       TRT01A
      8    <NA>                 NULL                       TRT01A
      9    <NA>                 NULL                       TRT01A
      10 TRT01A              Placebo ..ard_hierarchical_overall..
      11 TRT01A              Placebo ..ard_hierarchical_overall..
      12 TRT01A              Placebo ..ard_hierarchical_overall..
      13 TRT01A Xanomeline High Dose ..ard_hierarchical_overall..
      14 TRT01A Xanomeline High Dose ..ard_hierarchical_overall..
      15 TRT01A Xanomeline High Dose ..ard_hierarchical_overall..
      16 TRT01A  Xanomeline Low Dose ..ard_hierarchical_overall..
      17 TRT01A  Xanomeline Low Dose ..ard_hierarchical_overall..
      18 TRT01A  Xanomeline Low Dose ..ard_hierarchical_overall..
      19 TRT01A              Placebo                        AESEV
      20 TRT01A              Placebo                        AESEV
      21 TRT01A              Placebo                        AESEV
      22 TRT01A Xanomeline High Dose                        AESEV
      23 TRT01A Xanomeline High Dose                        AESEV
      24 TRT01A Xanomeline High Dose                        AESEV
      25 TRT01A  Xanomeline Low Dose                        AESEV
      26 TRT01A  Xanomeline Low Dose                        AESEV
      27 TRT01A  Xanomeline Low Dose                        AESEV
      28 TRT01A              Placebo                        AESEV
      29 TRT01A              Placebo                        AESEV
      30 TRT01A              Placebo                        AESEV
      31 TRT01A Xanomeline High Dose                        AESEV
      32 TRT01A Xanomeline High Dose                        AESEV
      33 TRT01A Xanomeline High Dose                        AESEV
      34 TRT01A  Xanomeline Low Dose                        AESEV
      35 TRT01A  Xanomeline Low Dose                        AESEV
      36 TRT01A  Xanomeline Low Dose                        AESEV
      37 TRT01A              Placebo                        AESEV
      38 TRT01A              Placebo                        AESEV
      39 TRT01A              Placebo                        AESEV
      40 TRT01A Xanomeline High Dose                        AESEV
      41 TRT01A Xanomeline High Dose                        AESEV
      42 TRT01A Xanomeline High Dose                        AESEV
      43 TRT01A  Xanomeline Low Dose                        AESEV
      44 TRT01A  Xanomeline Low Dose                        AESEV
      45 TRT01A  Xanomeline Low Dose                        AESEV
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
      10                 TRUE hierarchical         n          n         69       69
      11                 TRUE hierarchical         N          N         86       86
      12                 TRUE hierarchical         p          %  0.8023256       80
      13                 TRUE hierarchical         n          n         70       70
      14                 TRUE hierarchical         N          N         72       72
      15                 TRUE hierarchical         p          %  0.9722222       97
      16                 TRUE hierarchical         n          n         86       86
      17                 TRUE hierarchical         N          N         96       96
      18                 TRUE hierarchical         p          %  0.8958333       90
      19                    1 hierarchical         n          n         60       60
      20                    1 hierarchical         N          N         86       86
      21                    1 hierarchical         p          %  0.6976744       70
      22                    1 hierarchical         n          n         66       66
      23                    1 hierarchical         N          N         72       72
      24                    1 hierarchical         p          %  0.9166667       92
      25                    1 hierarchical         n          n         65       65
      26                    1 hierarchical         N          N         96       96
      27                    1 hierarchical         p          %  0.6770833       68
      28                    2 hierarchical         n          n         28       28
      29                    2 hierarchical         N          N         86       86
      30                    2 hierarchical         p          %  0.3255814       33
      31                    2 hierarchical         n          n         48       48
      32                    2 hierarchical         N          N         72       72
      33                    2 hierarchical         p          %  0.6666667       67
      34                    2 hierarchical         n          n         60       60
      35                    2 hierarchical         N          N         96       96
      36                    2 hierarchical         p          %      0.625       63
      37                    3 hierarchical         n          n          7        7
      38                    3 hierarchical         N          N         86       86
      39                    3 hierarchical         p          % 0.08139535      8.1
      40                    3 hierarchical         n          n          8        8
      41                    3 hierarchical         N          N         72       72
      42                    3 hierarchical         p          %  0.1111111       11
      43                    3 hierarchical         n          n         16       16
      44                    3 hierarchical         N          N         96       96
      45                    3 hierarchical         p          %  0.1666667       17
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
      26                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      27                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      28                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      29                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      30                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      31                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      32                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      33                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      34                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      35                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      36                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      37                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      38                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      39                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      40                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      41                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      42                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      43                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      44                                                                                                                                              function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      45                                                                                                                                                            function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
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
      26    NULL  NULL     stat_3
      27    NULL  NULL     stat_3
      28    NULL  NULL     stat_1
      29    NULL  NULL     stat_1
      30    NULL  NULL     stat_1
      31    NULL  NULL     stat_2
      32    NULL  NULL     stat_2
      33    NULL  NULL     stat_2
      34    NULL  NULL     stat_3
      35    NULL  NULL     stat_3
      36    NULL  NULL     stat_3
      37    NULL  NULL     stat_1
      38    NULL  NULL     stat_1
      39    NULL  NULL     stat_1
      40    NULL  NULL     stat_2
      41    NULL  NULL     stat_2
      42    NULL  NULL     stat_2
      43    NULL  NULL     stat_3
      44    NULL  NULL     stat_3
      45    NULL  NULL     stat_3

