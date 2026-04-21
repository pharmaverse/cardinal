# fda-table_02() works

    Code
      as.data.frame(ard$tbl_summary)[1:25, ]
    Output
         group1 group1_level variable                   variable_level  context
      1  TRT01A      Placebo   AGEGR1                            18-64 tabulate
      2  TRT01A      Placebo   AGEGR1                            18-64 tabulate
      3  TRT01A      Placebo   AGEGR1                            18-64 tabulate
      4  TRT01A      Placebo   AGEGR1                              >64 tabulate
      5  TRT01A      Placebo   AGEGR1                              >64 tabulate
      6  TRT01A      Placebo   AGEGR1                              >64 tabulate
      7  TRT01A      Placebo      SEX                                F tabulate
      8  TRT01A      Placebo      SEX                                F tabulate
      9  TRT01A      Placebo      SEX                                F tabulate
      10 TRT01A      Placebo      SEX                                M tabulate
      11 TRT01A      Placebo      SEX                                M tabulate
      12 TRT01A      Placebo      SEX                                M tabulate
      13 TRT01A      Placebo     RACE AMERICAN INDIAN OR ALASKA NATIVE tabulate
      14 TRT01A      Placebo     RACE AMERICAN INDIAN OR ALASKA NATIVE tabulate
      15 TRT01A      Placebo     RACE AMERICAN INDIAN OR ALASKA NATIVE tabulate
      16 TRT01A      Placebo     RACE        BLACK OR AFRICAN AMERICAN tabulate
      17 TRT01A      Placebo     RACE        BLACK OR AFRICAN AMERICAN tabulate
      18 TRT01A      Placebo     RACE        BLACK OR AFRICAN AMERICAN tabulate
      19 TRT01A      Placebo     RACE                            WHITE tabulate
      20 TRT01A      Placebo     RACE                            WHITE tabulate
      21 TRT01A      Placebo     RACE                            WHITE tabulate
      22 TRT01A      Placebo   ETHNIC               HISPANIC OR LATINO tabulate
      23 TRT01A      Placebo   ETHNIC               HISPANIC OR LATINO tabulate
      24 TRT01A      Placebo   ETHNIC               HISPANIC OR LATINO tabulate
      25 TRT01A      Placebo   ETHNIC           NOT HISPANIC OR LATINO tabulate
         stat_name stat_label       stat
      1          n          n         14
      2          N          N         86
      3          p          %  0.1627907
      4          n          n         72
      5          N          N         86
      6          p          %  0.8372093
      7          n          n         53
      8          N          N         86
      9          p          %  0.6162791
      10         n          n         33
      11         N          N         86
      12         p          %  0.3837209
      13         n          n          0
      14         N          N         86
      15         p          %          0
      16         n          n          8
      17         N          N         86
      18         p          % 0.09302326
      19         n          n         78
      20         N          N         86
      21         p          %  0.9069767
      22         n          n          3
      23         N          N         86
      24         p          % 0.03488372
      25         n          n         83
                                                                                                                                                                              fmt_fun
      1  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      2  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      3                function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      4  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      5  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      6                function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      7  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      8  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      9                function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      10 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      11 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      12               function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      13 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      14 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      15               function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      16 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      17 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      18               function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      19 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      20 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      21               function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      22 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      23 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      24               function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      25 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
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
      20    NULL  NULL     stat_1
      21    NULL  NULL     stat_1
      22    NULL  NULL     stat_1
      23    NULL  NULL     stat_1
      24    NULL  NULL     stat_1
      25    NULL  NULL     stat_1

---

    Code
      as.data.frame(ard$add_overall)[1:25, ]
    Output
         variable                   variable_level  context stat_name stat_label
      1    AGEGR1                            18-64 tabulate         n          n
      2    AGEGR1                            18-64 tabulate         N          N
      3    AGEGR1                            18-64 tabulate         p          %
      4    AGEGR1                              >64 tabulate         n          n
      5    AGEGR1                              >64 tabulate         N          N
      6    AGEGR1                              >64 tabulate         p          %
      7       SEX                                F tabulate         n          n
      8       SEX                                F tabulate         N          N
      9       SEX                                F tabulate         p          %
      10      SEX                                M tabulate         n          n
      11      SEX                                M tabulate         N          N
      12      SEX                                M tabulate         p          %
      13     RACE AMERICAN INDIAN OR ALASKA NATIVE tabulate         n          n
      14     RACE AMERICAN INDIAN OR ALASKA NATIVE tabulate         N          N
      15     RACE AMERICAN INDIAN OR ALASKA NATIVE tabulate         p          %
      16     RACE        BLACK OR AFRICAN AMERICAN tabulate         n          n
      17     RACE        BLACK OR AFRICAN AMERICAN tabulate         N          N
      18     RACE        BLACK OR AFRICAN AMERICAN tabulate         p          %
      19     RACE                            WHITE tabulate         n          n
      20     RACE                            WHITE tabulate         N          N
      21     RACE                            WHITE tabulate         p          %
      22   ETHNIC               HISPANIC OR LATINO tabulate         n          n
      23   ETHNIC               HISPANIC OR LATINO tabulate         N          N
      24   ETHNIC               HISPANIC OR LATINO tabulate         p          %
      25   ETHNIC           NOT HISPANIC OR LATINO tabulate         n          n
                stat
      1           33
      2          254
      3    0.1299213
      4          221
      5          254
      6    0.8700787
      7          143
      8          254
      9    0.5629921
      10         111
      11         254
      12   0.4370079
      13           1
      14         254
      15 0.003937008
      16          23
      17         254
      18  0.09055118
      19         230
      20         254
      21   0.9055118
      22          12
      23         254
      24  0.04724409
      25         242
                                                                                                                                                                              fmt_fun
      1  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      2  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      3                function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      4  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      5  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      6                function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      7  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      8  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      9                function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      10 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      11 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      12               function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      13 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      14 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      15               function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      16 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      17 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      18               function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      19 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      20 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      21               function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      22 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      23 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      24               function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      25 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
         warning error gts_column
      1     NULL  NULL     stat_0
      2     NULL  NULL     stat_0
      3     NULL  NULL     stat_0
      4     NULL  NULL     stat_0
      5     NULL  NULL     stat_0
      6     NULL  NULL     stat_0
      7     NULL  NULL     stat_0
      8     NULL  NULL     stat_0
      9     NULL  NULL     stat_0
      10    NULL  NULL     stat_0
      11    NULL  NULL     stat_0
      12    NULL  NULL     stat_0
      13    NULL  NULL     stat_0
      14    NULL  NULL     stat_0
      15    NULL  NULL     stat_0
      16    NULL  NULL     stat_0
      17    NULL  NULL     stat_0
      18    NULL  NULL     stat_0
      19    NULL  NULL     stat_0
      20    NULL  NULL     stat_0
      21    NULL  NULL     stat_0
      22    NULL  NULL     stat_0
      23    NULL  NULL     stat_0
      24    NULL  NULL     stat_0
      25    NULL  NULL     stat_0

