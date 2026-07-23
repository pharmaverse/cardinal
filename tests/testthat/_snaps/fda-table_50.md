# fda-table_50() works

    Code
      as.data.frame(ard[[1]]$tbl_hierarchical)[1:25, ]
    Output
           group1         group1_level variable       variable_level      context
      1      <NA>                 NULL   TRT01A              Placebo     tabulate
      2      <NA>                 NULL   TRT01A              Placebo     tabulate
      3      <NA>                 NULL   TRT01A              Placebo     tabulate
      4      <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      5      <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      6      <NA>                 NULL   TRT01A Xanomeline High Dose     tabulate
      7      <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      8      <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      9      <NA>                 NULL   TRT01A  Xanomeline Low Dose     tabulate
      10   TRT01A              Placebo    AESER        Any SAE, n(%) hierarchical
      11   TRT01A              Placebo    AESER        Any SAE, n(%) hierarchical
      12   TRT01A              Placebo    AESER        Any SAE, n(%) hierarchical
      13   TRT01A Xanomeline High Dose    AESER        Any SAE, n(%) hierarchical
      14   TRT01A Xanomeline High Dose    AESER        Any SAE, n(%) hierarchical
      15   TRT01A Xanomeline High Dose    AESER        Any SAE, n(%) hierarchical
      16   TRT01A  Xanomeline Low Dose    AESER        Any SAE, n(%) hierarchical
      17   TRT01A  Xanomeline Low Dose    AESER        Any SAE, n(%) hierarchical
      18   TRT01A  Xanomeline Low Dose    AESER        Any SAE, n(%) hierarchical
      NA     <NA>                 NULL     <NA>                 NULL         <NA>
      NA.1   <NA>                 NULL     <NA>                 NULL         <NA>
      NA.2   <NA>                 NULL     <NA>                 NULL         <NA>
      NA.3   <NA>                 NULL     <NA>                 NULL         <NA>
      NA.4   <NA>                 NULL     <NA>                 NULL         <NA>
      NA.5   <NA>                 NULL     <NA>                 NULL         <NA>
      NA.6   <NA>                 NULL     <NA>                 NULL         <NA>
           stat_name stat_label       stat stat_fmt
      1            n          n         86       86
      2            N          N        254      254
      3            p          %  0.3385827     33.9
      4            n          n         72       72
      5            N          N        254      254
      6            p          %  0.2834646     28.3
      7            n          n         96       96
      8            N          N        254      254
      9            p          %  0.3779528     37.8
      10           n          n          0        0
      11           N          N         86       86
      12           p          %          0        0
      13           n          n          1        1
      14           N          N         72       72
      15           p          % 0.01388889      1.4
      16           n          n          2        2
      17           N          N         96       96
      18           p          % 0.02083333      2.1
      NA        <NA>       <NA>       NULL     NULL
      NA.1      <NA>       <NA>       NULL     NULL
      NA.2      <NA>       <NA>       NULL     NULL
      NA.3      <NA>       <NA>       NULL     NULL
      NA.4      <NA>       <NA>       NULL     NULL
      NA.5      <NA>       <NA>       NULL     NULL
      NA.6      <NA>       <NA>       NULL     NULL
                                                                                                                                                                                                                                                                                                                             fmt_fun
      1                                                                                                                                                                                                                                                                                                                            0
      2                                                                                                                                                                                                                                                                                                                            0
      3    function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      4                                                                                                                                                                                                                                                                                                                            0
      5                                                                                                                                                                                                                                                                                                                            0
      6    function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      7                                                                                                                                                                                                                                                                                                                            0
      8                                                                                                                                                                                                                                                                                                                            0
      9    function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      10                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      11                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      12                                                                                                                                                              function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      13                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      14                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      15                                                                                                                                                              function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      16                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      17                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      18                                                                                                                                                              function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      NA                                                                                                                                                                                                                                                                                                                        NULL
      NA.1                                                                                                                                                                                                                                                                                                                      NULL
      NA.2                                                                                                                                                                                                                                                                                                                      NULL
      NA.3                                                                                                                                                                                                                                                                                                                      NULL
      NA.4                                                                                                                                                                                                                                                                                                                      NULL
      NA.5                                                                                                                                                                                                                                                                                                                      NULL
      NA.6                                                                                                                                                                                                                                                                                                                      NULL
           warning error gts_column
      1       NULL  NULL     stat_1
      2       NULL  NULL     stat_1
      3       NULL  NULL     stat_1
      4       NULL  NULL     stat_2
      5       NULL  NULL     stat_2
      6       NULL  NULL     stat_2
      7       NULL  NULL     stat_3
      8       NULL  NULL     stat_3
      9       NULL  NULL     stat_3
      10      NULL  NULL     stat_1
      11      NULL  NULL     stat_1
      12      NULL  NULL     stat_1
      13      NULL  NULL     stat_2
      14      NULL  NULL     stat_2
      15      NULL  NULL     stat_2
      16      NULL  NULL     stat_3
      17      NULL  NULL     stat_3
      18      NULL  NULL     stat_3
      NA      NULL  NULL       <NA>
      NA.1    NULL  NULL       <NA>
      NA.2    NULL  NULL       <NA>
      NA.3    NULL  NULL       <NA>
      NA.4    NULL  NULL       <NA>
      NA.5    NULL  NULL       <NA>
      NA.6    NULL  NULL       <NA>

---

    Code
      as.data.frame(ard[[2]]$tbl_hierarchical)[1:25, ]
    Output
         group1         group1_level group2 group2_level variable
      1    <NA>                 NULL   <NA>         NULL   TRT01A
      2    <NA>                 NULL   <NA>         NULL   TRT01A
      3    <NA>                 NULL   <NA>         NULL   TRT01A
      4    <NA>                 NULL   <NA>         NULL   TRT01A
      5    <NA>                 NULL   <NA>         NULL   TRT01A
      6    <NA>                 NULL   <NA>         NULL   TRT01A
      7    <NA>                 NULL   <NA>         NULL   TRT01A
      8    <NA>                 NULL   <NA>         NULL   TRT01A
      9    <NA>                 NULL   <NA>         NULL   TRT01A
      10 TRT01A              Placebo  SEXGR   Sex, n (%)   SEXGR1
      11 TRT01A              Placebo  SEXGR   Sex, n (%)   SEXGR1
      12 TRT01A              Placebo  SEXGR   Sex, n (%)   SEXGR1
      13 TRT01A Xanomeline High Dose  SEXGR   Sex, n (%)   SEXGR1
      14 TRT01A Xanomeline High Dose  SEXGR   Sex, n (%)   SEXGR1
      15 TRT01A Xanomeline High Dose  SEXGR   Sex, n (%)   SEXGR1
      16 TRT01A  Xanomeline Low Dose  SEXGR   Sex, n (%)   SEXGR1
      17 TRT01A  Xanomeline Low Dose  SEXGR   Sex, n (%)   SEXGR1
      18 TRT01A  Xanomeline Low Dose  SEXGR   Sex, n (%)   SEXGR1
      19 TRT01A              Placebo  SEXGR   Sex, n (%)   SEXGR1
      20 TRT01A              Placebo  SEXGR   Sex, n (%)   SEXGR1
      21 TRT01A              Placebo  SEXGR   Sex, n (%)   SEXGR1
      22 TRT01A Xanomeline High Dose  SEXGR   Sex, n (%)   SEXGR1
      23 TRT01A Xanomeline High Dose  SEXGR   Sex, n (%)   SEXGR1
      24 TRT01A Xanomeline High Dose  SEXGR   Sex, n (%)   SEXGR1
      25 TRT01A  Xanomeline Low Dose  SEXGR   Sex, n (%)   SEXGR1
               variable_level      context stat_name stat_label      stat stat_fmt
      1               Placebo     tabulate         n          n         0        0
      2               Placebo     tabulate         N          N         3        3
      3               Placebo     tabulate         p          %         0      0.0
      4  Xanomeline High Dose     tabulate         n          n         1        1
      5  Xanomeline High Dose     tabulate         N          N         3        3
      6  Xanomeline High Dose     tabulate         p          % 0.3333333     33.3
      7   Xanomeline Low Dose     tabulate         n          n         2        2
      8   Xanomeline Low Dose     tabulate         N          N         3        3
      9   Xanomeline Low Dose     tabulate         p          % 0.6666667     66.7
      10                    F hierarchical         n          n         0        0
      11                    F hierarchical         N          N         0        0
      12                    F hierarchical         p          %       NaN       NA
      13                    F hierarchical         n          n         1        1
      14                    F hierarchical         N          N         1        1
      15                    F hierarchical         p          %         1      100
      16                    F hierarchical         n          n         1        1
      17                    F hierarchical         N          N         2        2
      18                    F hierarchical         p          %       0.5       50
      19                    M hierarchical         n          n         0        0
      20                    M hierarchical         N          N         0        0
      21                    M hierarchical         p          %       NaN       NA
      22                    M hierarchical         n          n         0        0
      23                    M hierarchical         N          N         1        1
      24                    M hierarchical         p          %         0        0
      25                    M hierarchical         n          n         1        1
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
      as.data.frame(ard[[3]]$tbl_hierarchical)[1:25, ]
    Output
           group1         group1_level group2           group2_level variable
      1      <NA>                 NULL   <NA>                   NULL   TRT01A
      2      <NA>                 NULL   <NA>                   NULL   TRT01A
      3      <NA>                 NULL   <NA>                   NULL   TRT01A
      4      <NA>                 NULL   <NA>                   NULL   TRT01A
      5      <NA>                 NULL   <NA>                   NULL   TRT01A
      6      <NA>                 NULL   <NA>                   NULL   TRT01A
      7      <NA>                 NULL   <NA>                   NULL   TRT01A
      8      <NA>                 NULL   <NA>                   NULL   TRT01A
      9      <NA>                 NULL   <NA>                   NULL   TRT01A
      10   TRT01A              Placebo  AGEGR Age group, years, n(%)   AGEGR1
      11   TRT01A              Placebo  AGEGR Age group, years, n(%)   AGEGR1
      12   TRT01A              Placebo  AGEGR Age group, years, n(%)   AGEGR1
      13   TRT01A Xanomeline High Dose  AGEGR Age group, years, n(%)   AGEGR1
      14   TRT01A Xanomeline High Dose  AGEGR Age group, years, n(%)   AGEGR1
      15   TRT01A Xanomeline High Dose  AGEGR Age group, years, n(%)   AGEGR1
      16   TRT01A  Xanomeline Low Dose  AGEGR Age group, years, n(%)   AGEGR1
      17   TRT01A  Xanomeline Low Dose  AGEGR Age group, years, n(%)   AGEGR1
      18   TRT01A  Xanomeline Low Dose  AGEGR Age group, years, n(%)   AGEGR1
      NA     <NA>                 NULL   <NA>                   NULL     <NA>
      NA.1   <NA>                 NULL   <NA>                   NULL     <NA>
      NA.2   <NA>                 NULL   <NA>                   NULL     <NA>
      NA.3   <NA>                 NULL   <NA>                   NULL     <NA>
      NA.4   <NA>                 NULL   <NA>                   NULL     <NA>
      NA.5   <NA>                 NULL   <NA>                   NULL     <NA>
      NA.6   <NA>                 NULL   <NA>                   NULL     <NA>
                 variable_level      context stat_name stat_label      stat stat_fmt
      1                 Placebo     tabulate         n          n         0        0
      2                 Placebo     tabulate         N          N         3        3
      3                 Placebo     tabulate         p          %         0      0.0
      4    Xanomeline High Dose     tabulate         n          n         1        1
      5    Xanomeline High Dose     tabulate         N          N         3        3
      6    Xanomeline High Dose     tabulate         p          % 0.3333333     33.3
      7     Xanomeline Low Dose     tabulate         n          n         2        2
      8     Xanomeline Low Dose     tabulate         N          N         3        3
      9     Xanomeline Low Dose     tabulate         p          % 0.6666667     66.7
      10                    >64 hierarchical         n          n         0        0
      11                    >64 hierarchical         N          N         0        0
      12                    >64 hierarchical         p          %       NaN       NA
      13                    >64 hierarchical         n          n         1        1
      14                    >64 hierarchical         N          N         1        1
      15                    >64 hierarchical         p          %         1      100
      16                    >64 hierarchical         n          n         2        2
      17                    >64 hierarchical         N          N         2        2
      18                    >64 hierarchical         p          %         1      100
      NA                   NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.1                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.2                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.3                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.4                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.5                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.6                 NULL         <NA>      <NA>       <NA>      NULL     NULL
                                                                                                                                                                                                                                                                                                                             fmt_fun
      1                                                                                                                                                                                                                                                                                                                            0
      2                                                                                                                                                                                                                                                                                                                            0
      3    function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      4                                                                                                                                                                                                                                                                                                                            0
      5                                                                                                                                                                                                                                                                                                                            0
      6    function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      7                                                                                                                                                                                                                                                                                                                            0
      8                                                                                                                                                                                                                                                                                                                            0
      9    function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      10                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      11                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      12                                                                                                                                                              function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      13                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      14                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      15                                                                                                                                                              function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      16                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      17                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      18                                                                                                                                                              function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      NA                                                                                                                                                                                                                                                                                                                        NULL
      NA.1                                                                                                                                                                                                                                                                                                                      NULL
      NA.2                                                                                                                                                                                                                                                                                                                      NULL
      NA.3                                                                                                                                                                                                                                                                                                                      NULL
      NA.4                                                                                                                                                                                                                                                                                                                      NULL
      NA.5                                                                                                                                                                                                                                                                                                                      NULL
      NA.6                                                                                                                                                                                                                                                                                                                      NULL
           warning error gts_column
      1       NULL  NULL     stat_1
      2       NULL  NULL     stat_1
      3       NULL  NULL     stat_1
      4       NULL  NULL     stat_2
      5       NULL  NULL     stat_2
      6       NULL  NULL     stat_2
      7       NULL  NULL     stat_3
      8       NULL  NULL     stat_3
      9       NULL  NULL     stat_3
      10      NULL  NULL     stat_1
      11      NULL  NULL     stat_1
      12      NULL  NULL     stat_1
      13      NULL  NULL     stat_2
      14      NULL  NULL     stat_2
      15      NULL  NULL     stat_2
      16      NULL  NULL     stat_3
      17      NULL  NULL     stat_3
      18      NULL  NULL     stat_3
      NA      NULL  NULL       <NA>
      NA.1    NULL  NULL       <NA>
      NA.2    NULL  NULL       <NA>
      NA.3    NULL  NULL       <NA>
      NA.4    NULL  NULL       <NA>
      NA.5    NULL  NULL       <NA>
      NA.6    NULL  NULL       <NA>

---

    Code
      as.data.frame(ard[[4]]$tbl_hierarchical)[1:25, ]
    Output
           group1         group1_level group2 group2_level variable
      1      <NA>                 NULL   <NA>         NULL   TRT01A
      2      <NA>                 NULL   <NA>         NULL   TRT01A
      3      <NA>                 NULL   <NA>         NULL   TRT01A
      4      <NA>                 NULL   <NA>         NULL   TRT01A
      5      <NA>                 NULL   <NA>         NULL   TRT01A
      6      <NA>                 NULL   <NA>         NULL   TRT01A
      7      <NA>                 NULL   <NA>         NULL   TRT01A
      8      <NA>                 NULL   <NA>         NULL   TRT01A
      9      <NA>                 NULL   <NA>         NULL   TRT01A
      10   TRT01A              Placebo RACEGR   Race, n(%)  RACEGR1
      11   TRT01A              Placebo RACEGR   Race, n(%)  RACEGR1
      12   TRT01A              Placebo RACEGR   Race, n(%)  RACEGR1
      13   TRT01A Xanomeline High Dose RACEGR   Race, n(%)  RACEGR1
      14   TRT01A Xanomeline High Dose RACEGR   Race, n(%)  RACEGR1
      15   TRT01A Xanomeline High Dose RACEGR   Race, n(%)  RACEGR1
      16   TRT01A  Xanomeline Low Dose RACEGR   Race, n(%)  RACEGR1
      17   TRT01A  Xanomeline Low Dose RACEGR   Race, n(%)  RACEGR1
      18   TRT01A  Xanomeline Low Dose RACEGR   Race, n(%)  RACEGR1
      NA     <NA>                 NULL   <NA>         NULL     <NA>
      NA.1   <NA>                 NULL   <NA>         NULL     <NA>
      NA.2   <NA>                 NULL   <NA>         NULL     <NA>
      NA.3   <NA>                 NULL   <NA>         NULL     <NA>
      NA.4   <NA>                 NULL   <NA>         NULL     <NA>
      NA.5   <NA>                 NULL   <NA>         NULL     <NA>
      NA.6   <NA>                 NULL   <NA>         NULL     <NA>
                 variable_level      context stat_name stat_label      stat stat_fmt
      1                 Placebo     tabulate         n          n         0        0
      2                 Placebo     tabulate         N          N         3        3
      3                 Placebo     tabulate         p          %         0      0.0
      4    Xanomeline High Dose     tabulate         n          n         1        1
      5    Xanomeline High Dose     tabulate         N          N         3        3
      6    Xanomeline High Dose     tabulate         p          % 0.3333333     33.3
      7     Xanomeline Low Dose     tabulate         n          n         2        2
      8     Xanomeline Low Dose     tabulate         N          N         3        3
      9     Xanomeline Low Dose     tabulate         p          % 0.6666667     66.7
      10                  White hierarchical         n          n         0        0
      11                  White hierarchical         N          N         0        0
      12                  White hierarchical         p          %       NaN       NA
      13                  White hierarchical         n          n         1        1
      14                  White hierarchical         N          N         1        1
      15                  White hierarchical         p          %         1      100
      16                  White hierarchical         n          n         2        2
      17                  White hierarchical         N          N         2        2
      18                  White hierarchical         p          %         1      100
      NA                   NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.1                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.2                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.3                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.4                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.5                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.6                 NULL         <NA>      <NA>       <NA>      NULL     NULL
                                                                                                                                                                                                                                                                                                                             fmt_fun
      1                                                                                                                                                                                                                                                                                                                            0
      2                                                                                                                                                                                                                                                                                                                            0
      3    function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      4                                                                                                                                                                                                                                                                                                                            0
      5                                                                                                                                                                                                                                                                                                                            0
      6    function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      7                                                                                                                                                                                                                                                                                                                            0
      8                                                                                                                                                                                                                                                                                                                            0
      9    function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      10                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      11                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      12                                                                                                                                                              function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      13                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      14                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      15                                                                                                                                                              function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      16                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      17                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      18                                                                                                                                                              function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      NA                                                                                                                                                                                                                                                                                                                        NULL
      NA.1                                                                                                                                                                                                                                                                                                                      NULL
      NA.2                                                                                                                                                                                                                                                                                                                      NULL
      NA.3                                                                                                                                                                                                                                                                                                                      NULL
      NA.4                                                                                                                                                                                                                                                                                                                      NULL
      NA.5                                                                                                                                                                                                                                                                                                                      NULL
      NA.6                                                                                                                                                                                                                                                                                                                      NULL
           warning error gts_column
      1       NULL  NULL     stat_1
      2       NULL  NULL     stat_1
      3       NULL  NULL     stat_1
      4       NULL  NULL     stat_2
      5       NULL  NULL     stat_2
      6       NULL  NULL     stat_2
      7       NULL  NULL     stat_3
      8       NULL  NULL     stat_3
      9       NULL  NULL     stat_3
      10      NULL  NULL     stat_1
      11      NULL  NULL     stat_1
      12      NULL  NULL     stat_1
      13      NULL  NULL     stat_2
      14      NULL  NULL     stat_2
      15      NULL  NULL     stat_2
      16      NULL  NULL     stat_3
      17      NULL  NULL     stat_3
      18      NULL  NULL     stat_3
      NA      NULL  NULL       <NA>
      NA.1    NULL  NULL       <NA>
      NA.2    NULL  NULL       <NA>
      NA.3    NULL  NULL       <NA>
      NA.4    NULL  NULL       <NA>
      NA.5    NULL  NULL       <NA>
      NA.6    NULL  NULL       <NA>

---

    Code
      as.data.frame(ard[[5]]$tbl_hierarchical)[1:25, ]
    Output
           group1         group1_level   group2    group2_level  variable
      1      <NA>                 NULL     <NA>            NULL    TRT01A
      2      <NA>                 NULL     <NA>            NULL    TRT01A
      3      <NA>                 NULL     <NA>            NULL    TRT01A
      4      <NA>                 NULL     <NA>            NULL    TRT01A
      5      <NA>                 NULL     <NA>            NULL    TRT01A
      6      <NA>                 NULL     <NA>            NULL    TRT01A
      7      <NA>                 NULL     <NA>            NULL    TRT01A
      8      <NA>                 NULL     <NA>            NULL    TRT01A
      9      <NA>                 NULL     <NA>            NULL    TRT01A
      10   TRT01A              Placebo ETHNICGR Ethnicity, n(%) ETHNICGR1
      11   TRT01A              Placebo ETHNICGR Ethnicity, n(%) ETHNICGR1
      12   TRT01A              Placebo ETHNICGR Ethnicity, n(%) ETHNICGR1
      13   TRT01A Xanomeline High Dose ETHNICGR Ethnicity, n(%) ETHNICGR1
      14   TRT01A Xanomeline High Dose ETHNICGR Ethnicity, n(%) ETHNICGR1
      15   TRT01A Xanomeline High Dose ETHNICGR Ethnicity, n(%) ETHNICGR1
      16   TRT01A  Xanomeline Low Dose ETHNICGR Ethnicity, n(%) ETHNICGR1
      17   TRT01A  Xanomeline Low Dose ETHNICGR Ethnicity, n(%) ETHNICGR1
      18   TRT01A  Xanomeline Low Dose ETHNICGR Ethnicity, n(%) ETHNICGR1
      NA     <NA>                 NULL     <NA>            NULL      <NA>
      NA.1   <NA>                 NULL     <NA>            NULL      <NA>
      NA.2   <NA>                 NULL     <NA>            NULL      <NA>
      NA.3   <NA>                 NULL     <NA>            NULL      <NA>
      NA.4   <NA>                 NULL     <NA>            NULL      <NA>
      NA.5   <NA>                 NULL     <NA>            NULL      <NA>
      NA.6   <NA>                 NULL     <NA>            NULL      <NA>
                 variable_level      context stat_name stat_label      stat stat_fmt
      1                 Placebo     tabulate         n          n         0        0
      2                 Placebo     tabulate         N          N         3        3
      3                 Placebo     tabulate         p          %         0      0.0
      4    Xanomeline High Dose     tabulate         n          n         1        1
      5    Xanomeline High Dose     tabulate         N          N         3        3
      6    Xanomeline High Dose     tabulate         p          % 0.3333333     33.3
      7     Xanomeline Low Dose     tabulate         n          n         2        2
      8     Xanomeline Low Dose     tabulate         N          N         3        3
      9     Xanomeline Low Dose     tabulate         p          % 0.6666667     66.7
      10                  WHITE hierarchical         n          n         0        0
      11                  WHITE hierarchical         N          N         0        0
      12                  WHITE hierarchical         p          %       NaN       NA
      13                  WHITE hierarchical         n          n         1        1
      14                  WHITE hierarchical         N          N         1        1
      15                  WHITE hierarchical         p          %         1      100
      16                  WHITE hierarchical         n          n         2        2
      17                  WHITE hierarchical         N          N         2        2
      18                  WHITE hierarchical         p          %         1      100
      NA                   NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.1                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.2                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.3                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.4                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.5                 NULL         <NA>      <NA>       <NA>      NULL     NULL
      NA.6                 NULL         <NA>      <NA>       <NA>      NULL     NULL
                                                                                                                                                                                                                                                                                                                             fmt_fun
      1                                                                                                                                                                                                                                                                                                                            0
      2                                                                                                                                                                                                                                                                                                                            0
      3    function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      4                                                                                                                                                                                                                                                                                                                            0
      5                                                                                                                                                                                                                                                                                                                            0
      6    function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      7                                                                                                                                                                                                                                                                                                                            0
      8                                                                                                                                                                                                                                                                                                                            0
      9    function (x) , {,     res <- ifelse(is.na(x), NA_character_, str_trim(format(round_fun(x * ,         scale, digits = digits), nsmall = digits))),     if (!is.null(width)) {,         res <- ifelse(nchar(res) >= width | is.na(res), res, ,             paste0(strrep(" ", width - nchar(res)), res)),     },     res, }
      10                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      11                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      12                                                                                                                                                              function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      13                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      14                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      15                                                                                                                                                              function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      16                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      17                                                                                                                                                function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      18                                                                                                                                                              function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      NA                                                                                                                                                                                                                                                                                                                        NULL
      NA.1                                                                                                                                                                                                                                                                                                                      NULL
      NA.2                                                                                                                                                                                                                                                                                                                      NULL
      NA.3                                                                                                                                                                                                                                                                                                                      NULL
      NA.4                                                                                                                                                                                                                                                                                                                      NULL
      NA.5                                                                                                                                                                                                                                                                                                                      NULL
      NA.6                                                                                                                                                                                                                                                                                                                      NULL
           warning error gts_column
      1       NULL  NULL     stat_1
      2       NULL  NULL     stat_1
      3       NULL  NULL     stat_1
      4       NULL  NULL     stat_2
      5       NULL  NULL     stat_2
      6       NULL  NULL     stat_2
      7       NULL  NULL     stat_3
      8       NULL  NULL     stat_3
      9       NULL  NULL     stat_3
      10      NULL  NULL     stat_1
      11      NULL  NULL     stat_1
      12      NULL  NULL     stat_1
      13      NULL  NULL     stat_2
      14      NULL  NULL     stat_2
      15      NULL  NULL     stat_2
      16      NULL  NULL     stat_3
      17      NULL  NULL     stat_3
      18      NULL  NULL     stat_3
      NA      NULL  NULL       <NA>
      NA.1    NULL  NULL       <NA>
      NA.2    NULL  NULL       <NA>
      NA.3    NULL  NULL       <NA>
      NA.4    NULL  NULL       <NA>
      NA.5    NULL  NULL       <NA>
      NA.6    NULL  NULL       <NA>

