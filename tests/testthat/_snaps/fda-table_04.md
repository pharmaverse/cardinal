# fda-table_04() works

    Code
      as.data.frame(ard$tbl_summary)[1:25, ]
    Output
         group1         group1_level variable variable_level        context stat_name
      1  TRT01A              Placebo    SAFFL           TRUE tabulate_value         n
      2  TRT01A              Placebo    SAFFL           TRUE tabulate_value         N
      3  TRT01A              Placebo    SAFFL           TRUE tabulate_value         p
      4  TRT01A              Placebo    ITTFL           TRUE tabulate_value         n
      5  TRT01A              Placebo    ITTFL           TRUE tabulate_value         N
      6  TRT01A              Placebo    ITTFL           TRUE tabulate_value         p
      7  TRT01A              Placebo  rand_fl           TRUE tabulate_value         n
      8  TRT01A              Placebo  rand_fl           TRUE tabulate_value         N
      9  TRT01A              Placebo  rand_fl           TRUE tabulate_value         p
      10 TRT01A              Placebo  prot_fl           TRUE tabulate_value         n
      11 TRT01A              Placebo  prot_fl           TRUE tabulate_value         N
      12 TRT01A              Placebo  prot_fl           TRUE tabulate_value         p
      13 TRT01A Xanomeline High Dose    SAFFL           TRUE tabulate_value         n
      14 TRT01A Xanomeline High Dose    SAFFL           TRUE tabulate_value         N
      15 TRT01A Xanomeline High Dose    SAFFL           TRUE tabulate_value         p
      16 TRT01A Xanomeline High Dose    ITTFL           TRUE tabulate_value         n
      17 TRT01A Xanomeline High Dose    ITTFL           TRUE tabulate_value         N
      18 TRT01A Xanomeline High Dose    ITTFL           TRUE tabulate_value         p
      19 TRT01A Xanomeline High Dose  rand_fl           TRUE tabulate_value         n
      20 TRT01A Xanomeline High Dose  rand_fl           TRUE tabulate_value         N
      21 TRT01A Xanomeline High Dose  rand_fl           TRUE tabulate_value         p
      22 TRT01A Xanomeline High Dose  prot_fl           TRUE tabulate_value         n
      23 TRT01A Xanomeline High Dose  prot_fl           TRUE tabulate_value         N
      24 TRT01A Xanomeline High Dose  prot_fl           TRUE tabulate_value         p
      25 TRT01A  Xanomeline Low Dose    SAFFL           TRUE tabulate_value         n
         stat_label      stat
      1           n        86
      2           N        86
      3           %         1
      4           n        86
      5           N        86
      6           %         1
      7           n        86
      8           N        86
      9           %         1
      10          n        58
      11          N        86
      12          % 0.6744186
      13          n        72
      14          N        72
      15          %         1
      16          n        72
      17          N        72
      18          %         1
      19          n        72
      20          N        72
      21          %         1
      22          n        27
      23          N        72
      24          %     0.375
      25          n        96
                                                                                                                                                                              fmt_fun
      1  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      2                                                                                                                                                                             0
      3  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      4  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      5                                                                                                                                                                             0
      6  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      7  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      8                                                                                                                                                                             0
      9  function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      10 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      11                                                                                                                                                                            0
      12 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      13 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      14                                                                                                                                                                            0
      15 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      16 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      17                                                                                                                                                                            0
      18 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      19 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      20                                                                                                                                                                            0
      21 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      22 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      23                                                                                                                                                                            0
      24 function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
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
      13    NULL  NULL     stat_2
      14    NULL  NULL     stat_2
      15    NULL  NULL     stat_2
      16    NULL  NULL     stat_2
      17    NULL  NULL     stat_2
      18    NULL  NULL     stat_2
      19    NULL  NULL     stat_2
      20    NULL  NULL     stat_2
      21    NULL  NULL     stat_2
      22    NULL  NULL     stat_2
      23    NULL  NULL     stat_2
      24    NULL  NULL     stat_2
      25    NULL  NULL     stat_3

