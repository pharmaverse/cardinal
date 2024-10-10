# Table 33 generation works with default values

    Code
      res
    Output
      $table
      Blood Pressure   A: Drug X   B: Placebo   C: Combination
      (Pa)              (N=134)     (N=134)        (N=132)    
      ————————————————————————————————————————————————————————
      SBP <90          9 (6.7%)    24 (17.9%)     12 (9.1%)   
      DBP <60          10 (7.5%)   13 (9.7%)      14 (10.6%)  
      
      $ard
    Message
      {cards} data frame: 52 x 11
    Output
         group1 group1_level variable variable_level stat_name stat_label  stat
      1     ARM    A: Drug X    SBP90          FALSE         n          n   125
      2     ARM    A: Drug X    SBP90          FALSE         N          N   134
      3     ARM    A: Drug X    SBP90          FALSE         p          % 0.933
      4     ARM    A: Drug X    SBP90           TRUE         n          n     9
      5     ARM    A: Drug X    SBP90           TRUE         N          N   134
      6     ARM    A: Drug X    SBP90           TRUE         p          % 0.067
      7     ARM    B: Place…    SBP90          FALSE         n          n   110
      8     ARM    B: Place…    SBP90          FALSE         N          N   134
      9     ARM    B: Place…    SBP90          FALSE         p          % 0.821
      10    ARM    B: Place…    SBP90           TRUE         n          n    24
    Message
      i 42 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

---

    Code
      res2
    Output
      Blood Pressure   A: Drug X   B: Placebo   C: Combination
      (Pa)              (N=134)     (N=134)        (N=132)    
      ————————————————————————————————————————————————————————
      SBP <90          9 (6.7%)    24 (17.9%)     12 (9.1%)   
      DBP <60          10 (7.5%)   13 (9.7%)      14 (10.6%)  

---

    Code
      res3
    Message
      {cards} data frame: 52 x 11
    Output
         group1 group1_level variable variable_level stat_name stat_label  stat
      1     ARM    A: Drug X    SBP90          FALSE         n          n   125
      2     ARM    A: Drug X    SBP90          FALSE         N          N   134
      3     ARM    A: Drug X    SBP90          FALSE         p          % 0.933
      4     ARM    A: Drug X    SBP90           TRUE         n          n     9
      5     ARM    A: Drug X    SBP90           TRUE         N          N   134
      6     ARM    A: Drug X    SBP90           TRUE         p          % 0.067
      7     ARM    B: Place…    SBP90          FALSE         n          n   110
      8     ARM    B: Place…    SBP90          FALSE         N          N   134
      9     ARM    B: Place…    SBP90          FALSE         p          % 0.821
      10    ARM    B: Place…    SBP90           TRUE         n          n    24
    Message
      i 42 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error

---

    Code
      res
    Output
      # A tibble: 2 x 8
        variable var_type    row_type var_label  label      stat_1    stat_2    stat_3
        <chr>    <chr>       <chr>    <chr>      <chr>      <chr>     <chr>     <chr> 
      1 SBP90    dichotomous label    SBP &lt;90 SBP &lt;90 9 (6.7%)  24 (17.9~ 12 (9~
      2 DBP60    dichotomous label    DBP &lt;60 DBP &lt;60 10 (7.5%) 13 (9.7%) 14 (1~

# Table 33 generation works with custom values

    Code
      res
    Output
      $table
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
      
      $ard
    Message
      {cards} data frame: 52 x 11
    Output
         group1 group1_level variable variable_level stat_name stat_label  stat
      1     ARM    A: Drug X    SBP90          FALSE         n          n   125
      2     ARM    A: Drug X    SBP90          FALSE         N          N   134
      3     ARM    A: Drug X    SBP90          FALSE         p          % 0.933
      4     ARM    A: Drug X    SBP90           TRUE         n          n     9
      5     ARM    A: Drug X    SBP90           TRUE         N          N   134
      6     ARM    A: Drug X    SBP90           TRUE         p          % 0.067
      7     ARM    B: Place…    SBP90          FALSE         n          n   110
      8     ARM    B: Place…    SBP90          FALSE         N          N   134
      9     ARM    B: Place…    SBP90          FALSE         p          % 0.821
      10    ARM    B: Place…    SBP90           TRUE         n          n    24
    Message
      i 42 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

---

    Code
      res
    Output
      # A tibble: 2 x 9
        variable var_type    row_type var_label  label     stat_1 stat_2 stat_3 stat_0
        <chr>    <chr>       <chr>    <chr>      <chr>     <chr>  <chr>  <chr>  <chr> 
      1 SBP90    dichotomous label    SBP &lt;90 SBP &lt;~ 9 (6.~ 24 (1~ 12 (9~ 45 (1~
      2 DBP60    dichotomous label    DBP &lt;60 DBP &lt;~ 10 (7~ 13 (9~ 14 (1~ 37 (9~

# Table 33 generation works with pruned rows

    Code
      res
    Output
      $table
      Blood Pressure   A: Drug X   B: Placebo   C: Combination
      (Pa)              (N=134)     (N=134)        (N=132)    
      ————————————————————————————————————————————————————————
      SBP <90          9 (6.7%)    24 (17.9%)     12 (9.1%)   
      DBP <60          10 (7.5%)   13 (9.7%)      14 (10.6%)  
      
      $ard
    Message
      {cards} data frame: 52 x 11
    Output
         group1 group1_level variable variable_level stat_name stat_label  stat
      1     ARM    A: Drug X    SBP90          FALSE         n          n   125
      2     ARM    A: Drug X    SBP90          FALSE         N          N   134
      3     ARM    A: Drug X    SBP90          FALSE         p          % 0.933
      4     ARM    A: Drug X    SBP90           TRUE         n          n     9
      5     ARM    A: Drug X    SBP90           TRUE         N          N   134
      6     ARM    A: Drug X    SBP90           TRUE         p          % 0.067
      7     ARM    B: Place…    SBP90          FALSE         n          n   110
      8     ARM    B: Place…    SBP90          FALSE         N          N   134
      9     ARM    B: Place…    SBP90          FALSE         p          % 0.821
      10    ARM    B: Place…    SBP90           TRUE         n          n    24
    Message
      i 42 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

# Table 33 generation works with risk difference column

    Code
      res
    Output
      $table
      Blood Pressure   A: Drug X   B: Placebo   C: Combination   Risk Difference (%) (95% CI)
      (Pa)              (N=134)     (N=134)        (N=132)                 (N=268)           
      ———————————————————————————————————————————————————————————————————————————————————————
      SBP <90          9 (6.7%)    24 (17.9%)     12 (9.1%)           11.2 (3.4 - 18.9)      
      DBP <60          10 (7.5%)   13 (9.7%)      14 (10.6%)           2.2 (-4.5 - 8.9)      
      
      $ard
    Message
      {cards} data frame: 52 x 11
    Output
         group1 group1_level variable variable_level stat_name stat_label  stat
      1     ARM    A: Drug X    SBP90          FALSE         n          n   125
      2     ARM    A: Drug X    SBP90          FALSE         N          N   134
      3     ARM    A: Drug X    SBP90          FALSE         p          % 0.933
      4     ARM    A: Drug X    SBP90           TRUE         n          n     9
      5     ARM    A: Drug X    SBP90           TRUE         N          N   134
      6     ARM    A: Drug X    SBP90           TRUE         p          % 0.067
      7     ARM    B: Place…    SBP90          FALSE         n          n   110
      8     ARM    B: Place…    SBP90          FALSE         N          N   134
      9     ARM    B: Place…    SBP90          FALSE         p          % 0.821
      10    ARM    B: Place…    SBP90           TRUE         n          n    24
    Message
      i 42 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

# Table 33 generation missing values and ADSL

    Code
      res
    Output
      # A tibble: 2 x 9
        variable var_type    row_type var_label  label     stat_1 stat_2 stat_3 stat_0
        <chr>    <chr>       <chr>    <chr>      <chr>     <chr>  <chr>  <chr>  <chr> 
      1 SBP90    dichotomous label    SBP &lt;90 SBP &lt;~ 9 (6.~ 21 (1~ 11 (8~ 41 (1~
      2 DBP60    dichotomous label    DBP &lt;60 DBP &lt;~ 10 (7~ 13 (9~ 13 (9~ 36 (9~

