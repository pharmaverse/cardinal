# Table 32 generation works with default values

    Code
      as.data.frame(res$table)
    Output
        variable    var_type row_type var_label    label       stat_1       stat_2       stat_3
      1      L60 dichotomous    label    &lt;60   &lt;60     0 (0.0%)     0 (0.0%)     0 (0.0%)
      2      G60 dichotomous    label    &gt;60   &gt;60 134 (100.0%) 134 (100.0%) 132 (100.0%)
      3      G90 dichotomous    label    &gt;90   &gt;90 134 (100.0%) 134 (100.0%)  131 (99.2%)
      4     G110 dichotomous    label   &gt;110  &gt;110  123 (91.8%)  111 (82.8%)  107 (81.1%)
      5    GE120 dichotomous    label  &gt;=120 &gt;=120   88 (65.7%)   70 (52.2%)   76 (57.6%)

---

    Code
      res$ard
    Output
      $tbl_summary
    Message
      {cards} data frame: 142 x 12
    Output
         group1 group1_level variable variable_level stat_name stat_label stat gts_column
      1     ARM    A: Drug X      L60           TRUE         n          n    0     stat_1
      2     ARM    A: Drug X      L60           TRUE         N          N  134     stat_1
      3     ARM    A: Drug X      L60           TRUE         p          %    0     stat_1
      4     ARM    B: Place…      L60           TRUE         n          n    0     stat_2
      5     ARM    B: Place…      L60           TRUE         N          N  134     stat_2
      6     ARM    B: Place…      L60           TRUE         p          %    0     stat_2
      7     ARM    C: Combi…      L60           TRUE         n          n    0     stat_3
      8     ARM    C: Combi…      L60           TRUE         N          N  132     stat_3
      9     ARM    C: Combi…      L60           TRUE         p          %    0     stat_3
      10    ARM    A: Drug X      G60           TRUE         n          n  134     stat_1
    Message
      i 132 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

# Table 32 generation works with custom values

    Code
      as.data.frame(res$table)
    Output
        variable    var_type row_type var_label    label       stat_1       stat_2       stat_3       stat_0
      1      L60 dichotomous    label    &lt;60   &lt;60     0 (0.0%)     0 (0.0%)     0 (0.0%)     0 (0.0%)
      2      G60 dichotomous    label    &gt;60   &gt;60 134 (100.0%) 134 (100.0%) 132 (100.0%) 400 (100.0%)
      3      G90 dichotomous    label    &gt;90   &gt;90 134 (100.0%) 134 (100.0%)  131 (99.2%)  399 (99.8%)
      4     G110 dichotomous    label   &gt;110  &gt;110  123 (91.8%)  111 (82.8%)  107 (81.1%)  341 (85.3%)
      5    GE120 dichotomous    label  &gt;=120 &gt;=120   88 (65.7%)   70 (52.2%)   76 (57.6%)  234 (58.5%)

---

    Code
      res$ard
    Output
      $tbl_summary
    Message
      {cards} data frame: 142 x 12
    Output
         group1 group1_level variable variable_level stat_name stat_label stat gts_column
      1     ARM    A: Drug X      L60           TRUE         n          n    0     stat_1
      2     ARM    A: Drug X      L60           TRUE         N          N  134     stat_1
      3     ARM    A: Drug X      L60           TRUE         p          %    0     stat_1
      4     ARM    B: Place…      L60           TRUE         n          n    0     stat_2
      5     ARM    B: Place…      L60           TRUE         N          N  134     stat_2
      6     ARM    B: Place…      L60           TRUE         p          %    0     stat_2
      7     ARM    C: Combi…      L60           TRUE         n          n    0     stat_3
      8     ARM    C: Combi…      L60           TRUE         N          N  132     stat_3
      9     ARM    C: Combi…      L60           TRUE         p          %    0     stat_3
      10    ARM    A: Drug X      G60           TRUE         n          n  134     stat_1
    Message
      i 132 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      
      $add_overall
    Message
      {cards} data frame: 51 x 10
    Output
         variable variable_level stat_name stat_label  stat gts_column
      1       L60           TRUE         n          n     0     stat_0
      2       L60           TRUE         N          N   400     stat_0
      3       L60           TRUE         p          %     0     stat_0
      4       G60           TRUE         n          n   400     stat_0
      5       G60           TRUE         N          N   400     stat_0
      6       G60           TRUE         p          %     1     stat_0
      7       G90           TRUE         n          n   399     stat_0
      8       G90           TRUE         N          N   400     stat_0
      9       G90           TRUE         p          % 0.998     stat_0
      10     G110           TRUE         n          n   341     stat_0
    Message
      i 41 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

# Table 32 generation missing values and ADSL

    Code
      as.data.frame(res$table)
    Output
        variable    var_type row_type var_label    label      stat_1     stat_2     stat_3
      1      L60 dichotomous    label    &lt;60   &lt;60    0 (0.0%)   0 (0.0%)   0 (0.0%)
      2      G60 dichotomous    label    &gt;60   &gt;60 114 (85.1%) 96 (71.6%) 96 (72.7%)
      3      G90 dichotomous    label    &gt;90   &gt;90 114 (85.1%) 96 (71.6%) 95 (72.0%)
      4     G110 dichotomous    label   &gt;110  &gt;110 103 (76.9%) 78 (58.2%) 78 (59.1%)
      5    GE120 dichotomous    label  &gt;=120 &gt;=120  71 (53.0%) 52 (38.8%) 53 (40.2%)

---

    Code
      res$ard
    Output
      $tbl_summary
    Message
      {cards} data frame: 142 x 12
    Output
         group1 group1_level variable variable_level stat_name stat_label stat gts_column
      1     ARM    A: Drug X      L60           TRUE         n          n    0     stat_1
      2     ARM    A: Drug X      L60           TRUE         N          N  134     stat_1
      3     ARM    A: Drug X      L60           TRUE         p          %    0     stat_1
      4     ARM    B: Place…      L60           TRUE         n          n    0     stat_2
      5     ARM    B: Place…      L60           TRUE         N          N  134     stat_2
      6     ARM    B: Place…      L60           TRUE         p          %    0     stat_2
      7     ARM    C: Combi…      L60           TRUE         n          n    0     stat_3
      8     ARM    C: Combi…      L60           TRUE         N          N  132     stat_3
      9     ARM    C: Combi…      L60           TRUE         p          %    0     stat_3
      10    ARM    A: Drug X      G60           TRUE         n          n  114     stat_1
    Message
      i 132 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

