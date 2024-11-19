# Table 33 generation works with default values

    Code
      as.data.frame(res$table)
    Output
        variable    var_type row_type  var_label      label    stat_1     stat_2     stat_3
      1    SBP90 dichotomous    label SBP &lt;90 SBP &lt;90  9 (6.7%) 24 (17.9%)  12 (9.1%)
      2    DBP60 dichotomous    label DBP &lt;60 DBP &lt;60 10 (7.5%)  13 (9.7%) 14 (10.6%)

---

    Code
      res$ard
    Output
      $tbl_summary
    Message
      {cards} data frame: 65 x 12
    Output
         group1 group1_level variable variable_level stat_name stat_label  stat gts_column
      1     ARM    A: Drug X    SBP90           TRUE         n          n     9     stat_1
      2     ARM    A: Drug X    SBP90           TRUE         N          N   134     stat_1
      3     ARM    A: Drug X    SBP90           TRUE         p          % 0.067     stat_1
      4     ARM    B: Place…    SBP90           TRUE         n          n    24     stat_2
      5     ARM    B: Place…    SBP90           TRUE         N          N   134     stat_2
      6     ARM    B: Place…    SBP90           TRUE         p          % 0.179     stat_2
      7     ARM    C: Combi…    SBP90           TRUE         n          n    12     stat_3
      8     ARM    C: Combi…    SBP90           TRUE         N          N   132     stat_3
      9     ARM    C: Combi…    SBP90           TRUE         p          % 0.091     stat_3
      10    ARM    A: Drug X    DBP60           TRUE         n          n    10     stat_1
    Message
      i 55 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

# Table 33 generation works with custom values

    Code
      as.data.frame(res$table)
    Output
        variable    var_type row_type  var_label      label    stat_1     stat_2     stat_3     stat_0
      1    SBP90 dichotomous    label SBP &lt;90 SBP &lt;90  9 (6.7%) 24 (17.9%)  12 (9.1%) 45 (11.3%)
      2    DBP60 dichotomous    label DBP &lt;60 DBP &lt;60 10 (7.5%)  13 (9.7%) 14 (10.6%)  37 (9.3%)

---

    Code
      res$ard
    Output
      $tbl_summary
    Message
      {cards} data frame: 65 x 12
    Output
         group1 group1_level variable variable_level stat_name stat_label  stat gts_column
      1     ARM    A: Drug X    SBP90           TRUE         n          n     9     stat_1
      2     ARM    A: Drug X    SBP90           TRUE         N          N   134     stat_1
      3     ARM    A: Drug X    SBP90           TRUE         p          % 0.067     stat_1
      4     ARM    B: Place…    SBP90           TRUE         n          n    24     stat_2
      5     ARM    B: Place…    SBP90           TRUE         N          N   134     stat_2
      6     ARM    B: Place…    SBP90           TRUE         p          % 0.179     stat_2
      7     ARM    C: Combi…    SBP90           TRUE         n          n    12     stat_3
      8     ARM    C: Combi…    SBP90           TRUE         N          N   132     stat_3
      9     ARM    C: Combi…    SBP90           TRUE         p          % 0.091     stat_3
      10    ARM    A: Drug X    DBP60           TRUE         n          n    10     stat_1
    Message
      i 55 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      
      $add_overall
    Message
      {cards} data frame: 21 x 10
    Output
         variable variable_level stat_name stat_label    stat gts_column
      1     SBP90           TRUE         n          n      45     stat_0
      2     SBP90           TRUE         N          N     400     stat_0
      3     SBP90           TRUE         p          %   0.113     stat_0
      4     DBP60           TRUE         n          n      37     stat_0
      5     DBP60           TRUE         N          N     400     stat_0
      6     DBP60           TRUE         p          %   0.093     stat_0
      7     SBP90                    label  Variable… SBP <90       <NA>
      8     SBP90                    class  Variable… logical       <NA>
      9     DBP60                    label  Variable… DBP <60       <NA>
      10    DBP60                    class  Variable… logical       <NA>
    Message
      i 11 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

---

    Code
      res
    Output
      Table 33. Percentage of Patients With Maximum Diastolic Blood Pressure by Category
       of Blood Pressure Postbaseline, Safety Population, Pooled Analysis
      
      —————————————————————————————————————————————————————————————————————
                                                                   Total   
      Blood Pressure   A: Drug X   B: Placebo   C: Combination   Population
      (Pa)              (N=134)     (N=134)        (N=132)        (N=400)  
      —————————————————————————————————————————————————————————————————————
      SBP <90          9 (6.7%)    24 (17.9%)     12 (9.1%)      45 (11.2%)
      DBP <60          10 (7.5%)   13 (9.7%)      14 (10.6%)     37 (9.2%) 
      —————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      
      Abbreviations: CI, confidence interval; n, number of patients with indicated blood pressure;
      N, number of patients in treatment arm with available blood pressure data

# Table 33 generation missing values and ADSL

    Code
      as.data.frame(res$table)
    Output
        variable    var_type row_type  var_label      label    stat_1     stat_2    stat_3
      1    SBP90 dichotomous    label SBP &lt;90 SBP &lt;90  9 (6.7%) 21 (15.7%) 11 (8.3%)
      2    DBP60 dichotomous    label DBP &lt;60 DBP &lt;60 10 (7.5%)  13 (9.7%) 13 (9.8%)

---

    Code
      res$ard
    Output
      $tbl_summary
    Message
      {cards} data frame: 65 x 12
    Output
         group1 group1_level variable variable_level stat_name stat_label  stat gts_column
      1     ARM    A: Drug X    SBP90           TRUE         n          n     9     stat_1
      2     ARM    A: Drug X    SBP90           TRUE         N          N   134     stat_1
      3     ARM    A: Drug X    SBP90           TRUE         p          % 0.067     stat_1
      4     ARM    B: Place…    SBP90           TRUE         n          n    21     stat_2
      5     ARM    B: Place…    SBP90           TRUE         N          N   134     stat_2
      6     ARM    B: Place…    SBP90           TRUE         p          % 0.157     stat_2
      7     ARM    C: Combi…    SBP90           TRUE         n          n    11     stat_3
      8     ARM    C: Combi…    SBP90           TRUE         N          N   132     stat_3
      9     ARM    C: Combi…    SBP90           TRUE         p          % 0.083     stat_3
      10    ARM    A: Drug X    DBP60           TRUE         n          n    10     stat_1
    Message
      i 55 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

# Table 33 generation works with pruned rows

    Code
      res
    Output
      Blood Pressure   A: Drug X   B: Placebo   C: Combination
      (Pa)              (N=134)     (N=134)        (N=132)    
      ————————————————————————————————————————————————————————
      SBP <90          9 (6.7%)    24 (17.9%)     12 (9.1%)   
      DBP <60          10 (7.5%)   13 (9.7%)      14 (10.6%)  

# Table 33 generation works with risk difference column

    Code
      res
    Output
      Blood Pressure   A: Drug X   B: Placebo   C: Combination   Risk Difference (%) (95% CI)
      (Pa)              (N=134)     (N=134)        (N=132)                 (N=268)           
      ———————————————————————————————————————————————————————————————————————————————————————
      SBP <90          9 (6.7%)    24 (17.9%)     12 (9.1%)           11.2 (3.4 - 18.9)      
      DBP <60          10 (7.5%)   13 (9.7%)      14 (10.6%)           2.2 (-4.5 - 8.9)      

