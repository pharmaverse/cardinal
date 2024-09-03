# Table 32 generation works with default values

    Code
      res
    Output
      $table
      Diastolic Blood Pressure    A: Drug X    B: Placebo    C: Combination
      (Pa)                         (N=134)       (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————————————
      <60                             0             0              0       
      >60                        134 (100%)    134 (100%)      132 (100%)  
      >90                        134 (100%)    134 (100%)     131 (99.2%)  
      >110                       123 (91.8%)   111 (82.8%)    107 (81.1%)  
      >=120                      88 (65.7%)    70 (52.2%)      76 (57.6%)  
      
      $ard
    Message
      {cards} data frame: 111 x 11
    Output
         group1 group1_level variable variable_level stat_name stat_label stat
      1     ARM    A: Drug X      L60          FALSE         n          n  134
      2     ARM    A: Drug X      L60          FALSE         N          N  134
      3     ARM    A: Drug X      L60          FALSE         p          %    1
      4     ARM    A: Drug X      L60           TRUE         n          n    0
      5     ARM    A: Drug X      L60           TRUE         N          N  134
      6     ARM    A: Drug X      L60           TRUE         p          %    0
      7     ARM    B: Place…      L60          FALSE         n          n  134
      8     ARM    B: Place…      L60          FALSE         N          N  134
      9     ARM    B: Place…      L60          FALSE         p          %    1
      10    ARM    B: Place…      L60           TRUE         n          n    0
    Message
      i 101 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

---

    Code
      res2
    Output
      Diastolic Blood Pressure    A: Drug X    B: Placebo    C: Combination
      (Pa)                         (N=134)       (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————————————
      <60                             0             0              0       
      >60                        134 (100%)    134 (100%)      132 (100%)  
      >90                        134 (100%)    134 (100%)     131 (99.2%)  
      >110                       123 (91.8%)   111 (82.8%)    107 (81.1%)  
      >=120                      88 (65.7%)    70 (52.2%)      76 (57.6%)  

---

    Code
      res3
    Message
      {cards} data frame: 111 x 11
    Output
         group1 group1_level variable variable_level stat_name stat_label stat
      1     ARM    A: Drug X      L60          FALSE         n          n  134
      2     ARM    A: Drug X      L60          FALSE         N          N  134
      3     ARM    A: Drug X      L60          FALSE         p          %    1
      4     ARM    A: Drug X      L60           TRUE         n          n    0
      5     ARM    A: Drug X      L60           TRUE         N          N  134
      6     ARM    A: Drug X      L60           TRUE         p          %    0
      7     ARM    B: Place…      L60          FALSE         n          n  134
      8     ARM    B: Place…      L60          FALSE         N          N  134
      9     ARM    B: Place…      L60          FALSE         p          %    1
      10    ARM    B: Place…      L60           TRUE         n          n    0
    Message
      i 101 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error

---

    Code
      res
    Output
      # A tibble: 5 x 8
        variable var_type    row_type var_label label    stat_1       stat_2    stat_3
        <chr>    <chr>       <chr>    <chr>     <chr>    <chr>        <chr>     <chr> 
      1 L60      dichotomous label    &lt;60    &lt;60   0 (0.0%)     0 (0.0%)  0 (0.~
      2 G60      dichotomous label    &gt;60    &gt;60   134 (100.0%) 134 (100~ 132 (~
      3 G90      dichotomous label    &gt;90    &gt;90   134 (100.0%) 134 (100~ 131 (~
      4 G110     dichotomous label    &gt;110   &gt;110  123 (91.8%)  111 (82.~ 107 (~
      5 GE120    dichotomous label    &gt;=120  &gt;=120 88 (65.7%)   70 (52.2~ 76 (5~

# Table 32 generation works with custom values

    Code
      res
    Output
      $table
      Table 32. Percentage of Patients With Maximum Diastolic Blood Pressure by Category
       of Blood Pressure Postbaseline, Safety Population, Pooled Analysis
      
      ———————————————————————————————————————————————————————————————————————————————————
                                                                                 Total   
      Diastolic Blood Pressure    A: Drug X    B: Placebo    C: Combination   Population 
      (Pa)                         (N=134)       (N=134)        (N=132)         (N=400)  
      ———————————————————————————————————————————————————————————————————————————————————
      <60                             0             0              0               0     
      >60                        134 (100%)    134 (100%)      132 (100%)     400 (100%) 
      >90                        134 (100%)    134 (100%)     131 (99.2%)     399 (99.8%)
      >110                       123 (91.8%)   111 (82.8%)    107 (81.1%)     341 (85.2%)
      >=120                      88 (65.7%)    70 (52.2%)      76 (57.6%)     234 (58.5%)
      ———————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      
      Abbreviations: CI, confidence interval; n, number of patients with indicated blood pressure;
      N, number of patients in treatment arm with available blood pressure data
      
      $ard
    Message
      {cards} data frame: 111 x 11
    Output
         group1 group1_level variable variable_level stat_name stat_label stat
      1     ARM    A: Drug X      L60          FALSE         n          n  134
      2     ARM    A: Drug X      L60          FALSE         N          N  134
      3     ARM    A: Drug X      L60          FALSE         p          %    1
      4     ARM    A: Drug X      L60           TRUE         n          n    0
      5     ARM    A: Drug X      L60           TRUE         N          N  134
      6     ARM    A: Drug X      L60           TRUE         p          %    0
      7     ARM    B: Place…      L60          FALSE         n          n  134
      8     ARM    B: Place…      L60          FALSE         N          N  134
      9     ARM    B: Place…      L60          FALSE         p          %    1
      10    ARM    B: Place…      L60           TRUE         n          n    0
    Message
      i 101 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

---

    Code
      res
    Output
      # A tibble: 5 x 9
        variable var_type    row_type var_label label    stat_1   stat_2 stat_3 stat_0
        <chr>    <chr>       <chr>    <chr>     <chr>    <chr>    <chr>  <chr>  <chr> 
      1 L60      dichotomous label    &lt;60    &lt;60   0 (0.0%) 0 (0.~ 0 (0.~ 0 (0.~
      2 G60      dichotomous label    &gt;60    &gt;60   134 (10~ 134 (~ 132 (~ 400 (~
      3 G90      dichotomous label    &gt;90    &gt;90   134 (10~ 134 (~ 131 (~ 399 (~
      4 G110     dichotomous label    &gt;110   &gt;110  123 (91~ 111 (~ 107 (~ 341 (~
      5 GE120    dichotomous label    &gt;=120  &gt;=120 88 (65.~ 70 (5~ 76 (5~ 234 (~

# Table 32 generation works with pruned rows

    Code
      res
    Output
      $table
      Diastolic Blood Pressure    A: Drug X    B: Placebo    C: Combination
      (Pa)                         (N=134)       (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————————————
      >60                        134 (100%)    134 (100%)      132 (100%)  
      >90                        134 (100%)    134 (100%)     131 (99.2%)  
      >110                       123 (91.8%)   111 (82.8%)    107 (81.1%)  
      >=120                      88 (65.7%)    70 (52.2%)      76 (57.6%)  
      
      $ard
    Message
      {cards} data frame: 111 x 11
    Output
         group1 group1_level variable variable_level stat_name stat_label stat
      1     ARM    A: Drug X      L60          FALSE         n          n  134
      2     ARM    A: Drug X      L60          FALSE         N          N  134
      3     ARM    A: Drug X      L60          FALSE         p          %    1
      4     ARM    A: Drug X      L60           TRUE         n          n    0
      5     ARM    A: Drug X      L60           TRUE         N          N  134
      6     ARM    A: Drug X      L60           TRUE         p          %    0
      7     ARM    B: Place…      L60          FALSE         n          n  134
      8     ARM    B: Place…      L60          FALSE         N          N  134
      9     ARM    B: Place…      L60          FALSE         p          %    1
      10    ARM    B: Place…      L60           TRUE         n          n    0
    Message
      i 101 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

# Table 32 generation works with risk difference column

    Code
      res
    Output
      $table
      Diastolic Blood Pressure    A: Drug X    B: Placebo    C: Combination   Risk Difference (%) (95% CI)
      (Pa)                         (N=134)       (N=134)        (N=132)                 (N=268)           
      ————————————————————————————————————————————————————————————————————————————————————————————————————
      <60                             0             0              0                0.0 (0.0 - 0.0)       
      >60                        134 (100%)    134 (100%)      132 (100%)           0.0 (0.0 - 0.0)       
      >90                        134 (100%)    134 (100%)     131 (99.2%)           0.0 (0.0 - 0.0)       
      >110                       123 (91.8%)   111 (82.8%)    107 (81.1%)         -9.0 (-16.9 - -1.1)     
      >=120                      88 (65.7%)    70 (52.2%)      76 (57.6%)         -13.4 (-25.1 - -1.8)    
      
      $ard
    Message
      {cards} data frame: 111 x 11
    Output
         group1 group1_level variable variable_level stat_name stat_label stat
      1     ARM    A: Drug X      L60          FALSE         n          n  134
      2     ARM    A: Drug X      L60          FALSE         N          N  134
      3     ARM    A: Drug X      L60          FALSE         p          %    1
      4     ARM    A: Drug X      L60           TRUE         n          n    0
      5     ARM    A: Drug X      L60           TRUE         N          N  134
      6     ARM    A: Drug X      L60           TRUE         p          %    0
      7     ARM    B: Place…      L60          FALSE         n          n  134
      8     ARM    B: Place…      L60          FALSE         N          N  134
      9     ARM    B: Place…      L60          FALSE         p          %    1
      10    ARM    B: Place…      L60           TRUE         n          n    0
    Message
      i 101 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

# Table 32 generation missing values and ADSL

    Code
      res
    Output
      # A tibble: 5 x 9
        variable var_type    row_type var_label label    stat_1   stat_2 stat_3 stat_0
        <chr>    <chr>       <chr>    <chr>     <chr>    <chr>    <chr>  <chr>  <chr> 
      1 L60      dichotomous label    &lt;60    &lt;60   0 (0.0%) 0 (0.~ 0 (0.~ 0 (0.~
      2 G60      dichotomous label    &gt;60    &gt;60   114 (85~ 96 (7~ 96 (7~ 306 (~
      3 G90      dichotomous label    &gt;90    &gt;90   114 (85~ 96 (7~ 95 (7~ 305 (~
      4 G110     dichotomous label    &gt;110   &gt;110  103 (76~ 78 (5~ 78 (5~ 259 (~
      5 GE120    dichotomous label    &gt;=120  &gt;=120 71 (53.~ 52 (3~ 53 (4~ 176 (~

