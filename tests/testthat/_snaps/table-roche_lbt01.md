# table-roche_lbt01() works

    Code
      as.data.frame(ard$`PARAM="Alanine Aminotransferase (U/L)"`$tbl_baseline_chg)[1:
        25, ]
    Output
         group1         group1_level variable variable_level context stat_name
      1  TRT01A              Placebo     AVAL       Baseline summary      mean
      2  TRT01A              Placebo     AVAL       Baseline summary        sd
      3  TRT01A              Placebo     AVAL       Baseline summary    median
      4  TRT01A              Placebo     AVAL       Baseline summary       min
      5  TRT01A              Placebo     AVAL       Baseline summary       max
      6  TRT01A              Placebo     AVAL         Week 4 summary      mean
      7  TRT01A              Placebo     AVAL         Week 4 summary        sd
      8  TRT01A              Placebo     AVAL         Week 4 summary    median
      9  TRT01A              Placebo     AVAL         Week 4 summary       min
      10 TRT01A              Placebo     AVAL         Week 4 summary       max
      11 TRT01A Xanomeline High Dose     AVAL       Baseline summary      mean
      12 TRT01A Xanomeline High Dose     AVAL       Baseline summary        sd
      13 TRT01A Xanomeline High Dose     AVAL       Baseline summary    median
      14 TRT01A Xanomeline High Dose     AVAL       Baseline summary       min
      15 TRT01A Xanomeline High Dose     AVAL       Baseline summary       max
      16 TRT01A Xanomeline High Dose     AVAL         Week 4 summary      mean
      17 TRT01A Xanomeline High Dose     AVAL         Week 4 summary        sd
      18 TRT01A Xanomeline High Dose     AVAL         Week 4 summary    median
      19 TRT01A Xanomeline High Dose     AVAL         Week 4 summary       min
      20 TRT01A Xanomeline High Dose     AVAL         Week 4 summary       max
      21 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary      mean
      22 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary        sd
      23 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary    median
      24 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary       min
      25 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary       max
         stat_label     stat
      1        Mean 17.56977
      2          SD 9.215767
      3      Median       15
      4         Min        7
      5         Max       69
      6        Mean 18.65823
      7          SD 12.90785
      8      Median       16
      9         Min        6
      10        Max      107
      11       Mean 19.16667
      12         SD 10.25039
      13     Median     16.5
      14        Min        6
      15        Max       64
      16       Mean 21.30556
      17         SD 9.505579
      18     Median       20
      19        Min        8
      20        Max       61
      21       Mean 18.14894
      22         SD 8.737458
      23     Median     16.5
      24        Min        5
      25        Max       70
                                                                                                                                                                                                          fmt_fun
      1  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      2  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      3  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      4  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      5  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      6  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      7  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      8  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      9  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      10 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      11 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      12 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      13 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      14 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      15 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      16 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      17 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      18 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      19 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      20 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      21 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      22 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      23 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      24 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      25 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
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
      11    NULL  NULL     stat_2
      12    NULL  NULL     stat_2
      13    NULL  NULL     stat_2
      14    NULL  NULL     stat_2
      15    NULL  NULL     stat_2
      16    NULL  NULL     stat_2
      17    NULL  NULL     stat_2
      18    NULL  NULL     stat_2
      19    NULL  NULL     stat_2
      20    NULL  NULL     stat_2
      21    NULL  NULL     stat_3
      22    NULL  NULL     stat_3
      23    NULL  NULL     stat_3
      24    NULL  NULL     stat_3
      25    NULL  NULL     stat_3

---

    Code
      as.data.frame(ard$`PARAM="Bilirubin (umol/L)"`$tbl_baseline_chg)[1:25, ]
    Output
         group1         group1_level variable variable_level context stat_name
      1  TRT01A              Placebo     AVAL       Baseline summary      mean
      2  TRT01A              Placebo     AVAL       Baseline summary        sd
      3  TRT01A              Placebo     AVAL       Baseline summary    median
      4  TRT01A              Placebo     AVAL       Baseline summary       min
      5  TRT01A              Placebo     AVAL       Baseline summary       max
      6  TRT01A              Placebo     AVAL         Week 4 summary      mean
      7  TRT01A              Placebo     AVAL         Week 4 summary        sd
      8  TRT01A              Placebo     AVAL         Week 4 summary    median
      9  TRT01A              Placebo     AVAL         Week 4 summary       min
      10 TRT01A              Placebo     AVAL         Week 4 summary       max
      11 TRT01A Xanomeline High Dose     AVAL       Baseline summary      mean
      12 TRT01A Xanomeline High Dose     AVAL       Baseline summary        sd
      13 TRT01A Xanomeline High Dose     AVAL       Baseline summary    median
      14 TRT01A Xanomeline High Dose     AVAL       Baseline summary       min
      15 TRT01A Xanomeline High Dose     AVAL       Baseline summary       max
      16 TRT01A Xanomeline High Dose     AVAL         Week 4 summary      mean
      17 TRT01A Xanomeline High Dose     AVAL         Week 4 summary        sd
      18 TRT01A Xanomeline High Dose     AVAL         Week 4 summary    median
      19 TRT01A Xanomeline High Dose     AVAL         Week 4 summary       min
      20 TRT01A Xanomeline High Dose     AVAL         Week 4 summary       max
      21 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary      mean
      22 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary        sd
      23 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary    median
      24 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary       min
      25 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary       max
         stat_label     stat
      1        Mean 9.703256
      2          SD  3.96451
      3      Median     8.55
      4         Min     5.13
      5         Max    25.65
      6        Mean 11.12582
      7          SD 13.56959
      8      Median     8.55
      9         Min     5.13
      10        Max   124.83
      11       Mean 11.18625
      12         SD  5.63089
      13     Median    10.26
      14        Min     3.42
      15        Max    39.33
      16       Mean 10.85375
      17         SD 5.617872
      18     Median     8.55
      19        Min     5.13
      20        Max     34.2
      21       Mean  9.53234
      22         SD 3.912998
      23     Median     8.55
      24        Min     5.13
      25        Max    27.36
                                                                                                                                                                                                          fmt_fun
      1  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      2  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      3  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      4  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      5  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      6  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      7  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      8  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      9  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      10 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      11 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      12 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      13 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      14 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      15 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      16 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      17 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      18 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      19 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      20 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      21 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      22 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      23 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      24 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      25 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
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
      11    NULL  NULL     stat_2
      12    NULL  NULL     stat_2
      13    NULL  NULL     stat_2
      14    NULL  NULL     stat_2
      15    NULL  NULL     stat_2
      16    NULL  NULL     stat_2
      17    NULL  NULL     stat_2
      18    NULL  NULL     stat_2
      19    NULL  NULL     stat_2
      20    NULL  NULL     stat_2
      21    NULL  NULL     stat_3
      22    NULL  NULL     stat_3
      23    NULL  NULL     stat_3
      24    NULL  NULL     stat_3
      25    NULL  NULL     stat_3

---

    Code
      as.data.frame(ard$`PARAM="Creatinine (umol/L)"`$tbl_baseline_chg)[1:25, ]
    Output
         group1         group1_level variable variable_level context stat_name
      1  TRT01A              Placebo     AVAL       Baseline summary      mean
      2  TRT01A              Placebo     AVAL       Baseline summary        sd
      3  TRT01A              Placebo     AVAL       Baseline summary    median
      4  TRT01A              Placebo     AVAL       Baseline summary       min
      5  TRT01A              Placebo     AVAL       Baseline summary       max
      6  TRT01A              Placebo     AVAL         Week 4 summary      mean
      7  TRT01A              Placebo     AVAL         Week 4 summary        sd
      8  TRT01A              Placebo     AVAL         Week 4 summary    median
      9  TRT01A              Placebo     AVAL         Week 4 summary       min
      10 TRT01A              Placebo     AVAL         Week 4 summary       max
      11 TRT01A Xanomeline High Dose     AVAL       Baseline summary      mean
      12 TRT01A Xanomeline High Dose     AVAL       Baseline summary        sd
      13 TRT01A Xanomeline High Dose     AVAL       Baseline summary    median
      14 TRT01A Xanomeline High Dose     AVAL       Baseline summary       min
      15 TRT01A Xanomeline High Dose     AVAL       Baseline summary       max
      16 TRT01A Xanomeline High Dose     AVAL         Week 4 summary      mean
      17 TRT01A Xanomeline High Dose     AVAL         Week 4 summary        sd
      18 TRT01A Xanomeline High Dose     AVAL         Week 4 summary    median
      19 TRT01A Xanomeline High Dose     AVAL         Week 4 summary       min
      20 TRT01A Xanomeline High Dose     AVAL         Week 4 summary       max
      21 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary      mean
      22 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary        sd
      23 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary    median
      24 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary       min
      25 TRT01A  Xanomeline Low Dose     AVAL       Baseline summary       max
         stat_label     stat
      1        Mean 97.65116
      2          SD 17.77889
      3      Median    97.24
      4         Min    61.88
      5         Max   159.12
      6        Mean 98.64146
      7          SD 18.55696
      8      Median    97.24
      9         Min    70.72
      10        Max    176.8
      11       Mean 103.2561
      12         SD 20.06123
      13     Median    97.24
      14        Min    61.88
      15        Max   159.12
      16       Mean 105.8344
      17         SD 20.66369
      18     Median   106.08
      19        Min    70.72
      20        Max    176.8
      21       Mean  103.823
      22         SD 19.39938
      23     Median   101.66
      24        Min    70.72
      25        Max   167.96
                                                                                                                                                                                                          fmt_fun
      1  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      2  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      3  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      4  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      5  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      6  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      7  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      8  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      9  function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      10 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      11 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      12 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      13 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      14 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      15 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      16 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      17 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      18 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      19 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      20 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      21 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      22 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      23 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      24 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
      25 function (x) , style_roche_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     inf = inf, nan = nan, ...)
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
      11    NULL  NULL     stat_2
      12    NULL  NULL     stat_2
      13    NULL  NULL     stat_2
      14    NULL  NULL     stat_2
      15    NULL  NULL     stat_2
      16    NULL  NULL     stat_2
      17    NULL  NULL     stat_2
      18    NULL  NULL     stat_2
      19    NULL  NULL     stat_2
      20    NULL  NULL     stat_2
      21    NULL  NULL     stat_3
      22    NULL  NULL     stat_3
      23    NULL  NULL     stat_3
      24    NULL  NULL     stat_3
      25    NULL  NULL     stat_3

