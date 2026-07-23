# fda-table_50() works

    Code
      as.data.frame(ard[[1]]$tbl_hierarchical)[1:25, ]
    Output
           group1 group1_level variable variable_level      context stat_name
      1      <NA>         NULL   TRT01A              1     tabulate         n
      2      <NA>         NULL   TRT01A              1     tabulate         N
      3      <NA>         NULL   TRT01A              1     tabulate         p
      4      <NA>         NULL   TRT01A              2     tabulate         n
      5      <NA>         NULL   TRT01A              2     tabulate         N
      6      <NA>         NULL   TRT01A              2     tabulate         p
      7      <NA>         NULL   TRT01A              3     tabulate         n
      8      <NA>         NULL   TRT01A              3     tabulate         N
      9      <NA>         NULL   TRT01A              3     tabulate         p
      10   TRT01A            1    AESER              1 hierarchical         n
      11   TRT01A            1    AESER              1 hierarchical         N
      12   TRT01A            1    AESER              1 hierarchical         p
      13   TRT01A            2    AESER              1 hierarchical         n
      14   TRT01A            2    AESER              1 hierarchical         N
      15   TRT01A            2    AESER              1 hierarchical         p
      16   TRT01A            3    AESER              1 hierarchical         n
      17   TRT01A            3    AESER              1 hierarchical         N
      18   TRT01A            3    AESER              1 hierarchical         p
      NA     <NA>         NULL     <NA>           NULL         <NA>      <NA>
      NA.1   <NA>         NULL     <NA>           NULL         <NA>      <NA>
      NA.2   <NA>         NULL     <NA>           NULL         <NA>      <NA>
      NA.3   <NA>         NULL     <NA>           NULL         <NA>      <NA>
      NA.4   <NA>         NULL     <NA>           NULL         <NA>      <NA>
      NA.5   <NA>         NULL     <NA>           NULL         <NA>      <NA>
      NA.6   <NA>         NULL     <NA>           NULL         <NA>      <NA>
           stat_label       stat stat_fmt
      1             n         86       86
      2             N        254      254
      3             %  0.3385827     33.9
      4             n         72       72
      5             N        254      254
      6             %  0.2834646     28.3
      7             n         96       96
      8             N        254      254
      9             %  0.3779528     37.8
      10            n          0        0
      11            N         86       86
      12            %          0        0
      13            n          1        1
      14            N         72       72
      15            % 0.01388889      1.4
      16            n          2        2
      17            N         96       96
      18            % 0.02083333      2.1
      NA         <NA>       NULL     NULL
      NA.1       <NA>       NULL     NULL
      NA.2       <NA>       NULL     NULL
      NA.3       <NA>       NULL     NULL
      NA.4       <NA>       NULL     NULL
      NA.5       <NA>       NULL     NULL
      NA.6       <NA>       NULL     NULL
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
         group1 group1_level group2 group2_level variable variable_level      context
      1    <NA>         NULL   <NA>         NULL   TRT01A              1     tabulate
      2    <NA>         NULL   <NA>         NULL   TRT01A              1     tabulate
      3    <NA>         NULL   <NA>         NULL   TRT01A              1     tabulate
      4    <NA>         NULL   <NA>         NULL   TRT01A              2     tabulate
      5    <NA>         NULL   <NA>         NULL   TRT01A              2     tabulate
      6    <NA>         NULL   <NA>         NULL   TRT01A              2     tabulate
      7    <NA>         NULL   <NA>         NULL   TRT01A              3     tabulate
      8    <NA>         NULL   <NA>         NULL   TRT01A              3     tabulate
      9    <NA>         NULL   <NA>         NULL   TRT01A              3     tabulate
      10 TRT01A            1  SEXGR   Sex, n (%)   SEXGR1              1 hierarchical
      11 TRT01A            1  SEXGR   Sex, n (%)   SEXGR1              1 hierarchical
      12 TRT01A            1  SEXGR   Sex, n (%)   SEXGR1              1 hierarchical
      13 TRT01A            2  SEXGR   Sex, n (%)   SEXGR1              1 hierarchical
      14 TRT01A            2  SEXGR   Sex, n (%)   SEXGR1              1 hierarchical
      15 TRT01A            2  SEXGR   Sex, n (%)   SEXGR1              1 hierarchical
      16 TRT01A            3  SEXGR   Sex, n (%)   SEXGR1              1 hierarchical
      17 TRT01A            3  SEXGR   Sex, n (%)   SEXGR1              1 hierarchical
      18 TRT01A            3  SEXGR   Sex, n (%)   SEXGR1              1 hierarchical
      19 TRT01A            1  SEXGR   Sex, n (%)   SEXGR1              2 hierarchical
      20 TRT01A            1  SEXGR   Sex, n (%)   SEXGR1              2 hierarchical
      21 TRT01A            1  SEXGR   Sex, n (%)   SEXGR1              2 hierarchical
      22 TRT01A            2  SEXGR   Sex, n (%)   SEXGR1              2 hierarchical
      23 TRT01A            2  SEXGR   Sex, n (%)   SEXGR1              2 hierarchical
      24 TRT01A            2  SEXGR   Sex, n (%)   SEXGR1              2 hierarchical
      25 TRT01A            3  SEXGR   Sex, n (%)   SEXGR1              2 hierarchical
         stat_name stat_label      stat stat_fmt
      1          n          n         0        0
      2          N          N         3        3
      3          p          %         0      0.0
      4          n          n         1        1
      5          N          N         3        3
      6          p          % 0.3333333     33.3
      7          n          n         2        2
      8          N          N         3        3
      9          p          % 0.6666667     66.7
      10         n          n         0        0
      11         N          N         0        0
      12         p          %       NaN       NA
      13         n          n         1        1
      14         N          N         1        1
      15         p          %         1      100
      16         n          n         1        1
      17         N          N         2        2
      18         p          %       0.5       50
      19         n          n         0        0
      20         N          N         0        0
      21         p          %       NaN       NA
      22         n          n         0        0
      23         N          N         1        1
      24         p          %         0        0
      25         n          n         1        1
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
           group1 group1_level group2           group2_level variable variable_level
      1      <NA>         NULL   <NA>                   NULL   TRT01A              1
      2      <NA>         NULL   <NA>                   NULL   TRT01A              1
      3      <NA>         NULL   <NA>                   NULL   TRT01A              1
      4      <NA>         NULL   <NA>                   NULL   TRT01A              2
      5      <NA>         NULL   <NA>                   NULL   TRT01A              2
      6      <NA>         NULL   <NA>                   NULL   TRT01A              2
      7      <NA>         NULL   <NA>                   NULL   TRT01A              3
      8      <NA>         NULL   <NA>                   NULL   TRT01A              3
      9      <NA>         NULL   <NA>                   NULL   TRT01A              3
      10   TRT01A            1  AGEGR Age group, years, n(%)   AGEGR1              1
      11   TRT01A            1  AGEGR Age group, years, n(%)   AGEGR1              1
      12   TRT01A            1  AGEGR Age group, years, n(%)   AGEGR1              1
      13   TRT01A            2  AGEGR Age group, years, n(%)   AGEGR1              1
      14   TRT01A            2  AGEGR Age group, years, n(%)   AGEGR1              1
      15   TRT01A            2  AGEGR Age group, years, n(%)   AGEGR1              1
      16   TRT01A            3  AGEGR Age group, years, n(%)   AGEGR1              1
      17   TRT01A            3  AGEGR Age group, years, n(%)   AGEGR1              1
      18   TRT01A            3  AGEGR Age group, years, n(%)   AGEGR1              1
      NA     <NA>         NULL   <NA>                   NULL     <NA>           NULL
      NA.1   <NA>         NULL   <NA>                   NULL     <NA>           NULL
      NA.2   <NA>         NULL   <NA>                   NULL     <NA>           NULL
      NA.3   <NA>         NULL   <NA>                   NULL     <NA>           NULL
      NA.4   <NA>         NULL   <NA>                   NULL     <NA>           NULL
      NA.5   <NA>         NULL   <NA>                   NULL     <NA>           NULL
      NA.6   <NA>         NULL   <NA>                   NULL     <NA>           NULL
                context stat_name stat_label      stat stat_fmt
      1        tabulate         n          n         0        0
      2        tabulate         N          N         3        3
      3        tabulate         p          %         0      0.0
      4        tabulate         n          n         1        1
      5        tabulate         N          N         3        3
      6        tabulate         p          % 0.3333333     33.3
      7        tabulate         n          n         2        2
      8        tabulate         N          N         3        3
      9        tabulate         p          % 0.6666667     66.7
      10   hierarchical         n          n         0        0
      11   hierarchical         N          N         0        0
      12   hierarchical         p          %       NaN       NA
      13   hierarchical         n          n         1        1
      14   hierarchical         N          N         1        1
      15   hierarchical         p          %         1      100
      16   hierarchical         n          n         2        2
      17   hierarchical         N          N         2        2
      18   hierarchical         p          %         1      100
      NA           <NA>      <NA>       <NA>      NULL     NULL
      NA.1         <NA>      <NA>       <NA>      NULL     NULL
      NA.2         <NA>      <NA>       <NA>      NULL     NULL
      NA.3         <NA>      <NA>       <NA>      NULL     NULL
      NA.4         <NA>      <NA>       <NA>      NULL     NULL
      NA.5         <NA>      <NA>       <NA>      NULL     NULL
      NA.6         <NA>      <NA>       <NA>      NULL     NULL
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
           group1 group1_level group2 group2_level variable variable_level
      1      <NA>         NULL   <NA>         NULL   TRT01A              1
      2      <NA>         NULL   <NA>         NULL   TRT01A              1
      3      <NA>         NULL   <NA>         NULL   TRT01A              1
      4      <NA>         NULL   <NA>         NULL   TRT01A              2
      5      <NA>         NULL   <NA>         NULL   TRT01A              2
      6      <NA>         NULL   <NA>         NULL   TRT01A              2
      7      <NA>         NULL   <NA>         NULL   TRT01A              3
      8      <NA>         NULL   <NA>         NULL   TRT01A              3
      9      <NA>         NULL   <NA>         NULL   TRT01A              3
      10   TRT01A            1 RACEGR   Race, n(%)  RACEGR1              1
      11   TRT01A            1 RACEGR   Race, n(%)  RACEGR1              1
      12   TRT01A            1 RACEGR   Race, n(%)  RACEGR1              1
      13   TRT01A            2 RACEGR   Race, n(%)  RACEGR1              1
      14   TRT01A            2 RACEGR   Race, n(%)  RACEGR1              1
      15   TRT01A            2 RACEGR   Race, n(%)  RACEGR1              1
      16   TRT01A            3 RACEGR   Race, n(%)  RACEGR1              1
      17   TRT01A            3 RACEGR   Race, n(%)  RACEGR1              1
      18   TRT01A            3 RACEGR   Race, n(%)  RACEGR1              1
      NA     <NA>         NULL   <NA>         NULL     <NA>           NULL
      NA.1   <NA>         NULL   <NA>         NULL     <NA>           NULL
      NA.2   <NA>         NULL   <NA>         NULL     <NA>           NULL
      NA.3   <NA>         NULL   <NA>         NULL     <NA>           NULL
      NA.4   <NA>         NULL   <NA>         NULL     <NA>           NULL
      NA.5   <NA>         NULL   <NA>         NULL     <NA>           NULL
      NA.6   <NA>         NULL   <NA>         NULL     <NA>           NULL
                context stat_name stat_label      stat stat_fmt
      1        tabulate         n          n         0        0
      2        tabulate         N          N         3        3
      3        tabulate         p          %         0      0.0
      4        tabulate         n          n         1        1
      5        tabulate         N          N         3        3
      6        tabulate         p          % 0.3333333     33.3
      7        tabulate         n          n         2        2
      8        tabulate         N          N         3        3
      9        tabulate         p          % 0.6666667     66.7
      10   hierarchical         n          n         0        0
      11   hierarchical         N          N         0        0
      12   hierarchical         p          %       NaN       NA
      13   hierarchical         n          n         1        1
      14   hierarchical         N          N         1        1
      15   hierarchical         p          %         1      100
      16   hierarchical         n          n         2        2
      17   hierarchical         N          N         2        2
      18   hierarchical         p          %         1      100
      NA           <NA>      <NA>       <NA>      NULL     NULL
      NA.1         <NA>      <NA>       <NA>      NULL     NULL
      NA.2         <NA>      <NA>       <NA>      NULL     NULL
      NA.3         <NA>      <NA>       <NA>      NULL     NULL
      NA.4         <NA>      <NA>       <NA>      NULL     NULL
      NA.5         <NA>      <NA>       <NA>      NULL     NULL
      NA.6         <NA>      <NA>       <NA>      NULL     NULL
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
           group1 group1_level   group2    group2_level  variable variable_level
      1      <NA>         NULL     <NA>            NULL    TRT01A              1
      2      <NA>         NULL     <NA>            NULL    TRT01A              1
      3      <NA>         NULL     <NA>            NULL    TRT01A              1
      4      <NA>         NULL     <NA>            NULL    TRT01A              2
      5      <NA>         NULL     <NA>            NULL    TRT01A              2
      6      <NA>         NULL     <NA>            NULL    TRT01A              2
      7      <NA>         NULL     <NA>            NULL    TRT01A              3
      8      <NA>         NULL     <NA>            NULL    TRT01A              3
      9      <NA>         NULL     <NA>            NULL    TRT01A              3
      10   TRT01A            1 ETHNICGR Ethnicity, n(%) ETHNICGR1              1
      11   TRT01A            1 ETHNICGR Ethnicity, n(%) ETHNICGR1              1
      12   TRT01A            1 ETHNICGR Ethnicity, n(%) ETHNICGR1              1
      13   TRT01A            2 ETHNICGR Ethnicity, n(%) ETHNICGR1              1
      14   TRT01A            2 ETHNICGR Ethnicity, n(%) ETHNICGR1              1
      15   TRT01A            2 ETHNICGR Ethnicity, n(%) ETHNICGR1              1
      16   TRT01A            3 ETHNICGR Ethnicity, n(%) ETHNICGR1              1
      17   TRT01A            3 ETHNICGR Ethnicity, n(%) ETHNICGR1              1
      18   TRT01A            3 ETHNICGR Ethnicity, n(%) ETHNICGR1              1
      NA     <NA>         NULL     <NA>            NULL      <NA>           NULL
      NA.1   <NA>         NULL     <NA>            NULL      <NA>           NULL
      NA.2   <NA>         NULL     <NA>            NULL      <NA>           NULL
      NA.3   <NA>         NULL     <NA>            NULL      <NA>           NULL
      NA.4   <NA>         NULL     <NA>            NULL      <NA>           NULL
      NA.5   <NA>         NULL     <NA>            NULL      <NA>           NULL
      NA.6   <NA>         NULL     <NA>            NULL      <NA>           NULL
                context stat_name stat_label      stat stat_fmt
      1        tabulate         n          n         0        0
      2        tabulate         N          N         3        3
      3        tabulate         p          %         0      0.0
      4        tabulate         n          n         1        1
      5        tabulate         N          N         3        3
      6        tabulate         p          % 0.3333333     33.3
      7        tabulate         n          n         2        2
      8        tabulate         N          N         3        3
      9        tabulate         p          % 0.6666667     66.7
      10   hierarchical         n          n         0        0
      11   hierarchical         N          N         0        0
      12   hierarchical         p          %       NaN       NA
      13   hierarchical         n          n         1        1
      14   hierarchical         N          N         1        1
      15   hierarchical         p          %         1      100
      16   hierarchical         n          n         2        2
      17   hierarchical         N          N         2        2
      18   hierarchical         p          %         1      100
      NA           <NA>      <NA>       <NA>      NULL     NULL
      NA.1         <NA>      <NA>       <NA>      NULL     NULL
      NA.2         <NA>      <NA>       <NA>      NULL     NULL
      NA.3         <NA>      <NA>       <NA>      NULL     NULL
      NA.4         <NA>      <NA>       <NA>      NULL     NULL
      NA.5         <NA>      <NA>       <NA>      NULL     NULL
      NA.6         <NA>      <NA>       <NA>      NULL     NULL
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

