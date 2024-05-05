# Table 32 generation works with default values

    Code
      res
    Output
      Diastolic Blood Pressure    A: Drug X    B: Placebo    C: Combination
      (Pa)                         (N=134)       (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————————————
      <60                             0             0              0       
      >60                        134 (100%)    134 (100%)      132 (100%)  
      >90                        134 (100%)    134 (100%)     131 (99.2%)  
      >110                       123 (91.8%)   111 (82.8%)    107 (81.1%)  
      >=120                      88 (65.7%)    70 (52.2%)      76 (57.6%)  

# Table 32 generation works with custom values

    Code
      res
    Output
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

# Table 32 generation works with pruned rows

    Code
      res
    Output
      Diastolic Blood Pressure    A: Drug X    B: Placebo    C: Combination
      (Pa)                         (N=134)       (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————————————
      >60                        134 (100%)    134 (100%)      132 (100%)  
      >90                        134 (100%)    134 (100%)     131 (99.2%)  
      >110                       123 (91.8%)   111 (82.8%)    107 (81.1%)  
      >=120                      88 (65.7%)    70 (52.2%)      76 (57.6%)  

# Table 32 generation works with risk difference column

    Code
      res
    Output
      Diastolic Blood Pressure    A: Drug X    B: Placebo    C: Combination   Risk Difference (%) (95% CI)
      (Pa)                         (N=134)       (N=134)        (N=132)                 (N=268)           
      ————————————————————————————————————————————————————————————————————————————————————————————————————
      <60                             0             0              0                0.0 (0.0 - 0.0)       
      >60                        134 (100%)    134 (100%)      132 (100%)           0.0 (0.0 - 0.0)       
      >90                        134 (100%)    134 (100%)     131 (99.2%)           0.0 (0.0 - 0.0)       
      >110                       123 (91.8%)   111 (82.8%)    107 (81.1%)         -9.0 (-16.9 - -1.1)     
      >=120                      88 (65.7%)    70 (52.2%)      76 (57.6%)         -13.4 (-25.1 - -1.8)    

# Table 32 (gtsum) generation works with default values

    Code
      res
    Output
      # A tibble: 5 x 8
        variable var_type    var_label row_type label    stat_1       stat_2    stat_3
        <chr>    <chr>       <chr>     <chr>    <chr>    <chr>        <chr>     <chr> 
      1 L60      dichotomous &lt;60    label    &lt;60   0 (0.0%)     0 (0.0%)  0 (0.~
      2 G60      dichotomous &gt;60    label    &gt;60   134 (100.0%) 134 (100~ 132 (~
      3 G90      dichotomous &gt;90    label    &gt;90   134 (100.0%) 134 (100~ 131 (~
      4 G110     dichotomous &gt;110   label    &gt;110  123 (91.8%)  111 (82.~ 107 (~
      5 GE120    dichotomous &gt;=120  label    &gt;=120 88 (65.7%)   70 (52.2~ 76 (5~

# Table 32 (gtsum) generation works with custom values

    Code
      res
    Output
      # A tibble: 5 x 9
        variable var_type    var_label row_type label    stat_1   stat_2 stat_3 stat_0
        <chr>    <chr>       <chr>     <chr>    <chr>    <chr>    <chr>  <chr>  <chr> 
      1 L60      dichotomous &lt;60    label    &lt;60   0 (0.0%) 0 (0.~ 0 (0.~ 0 (0.~
      2 G60      dichotomous &gt;60    label    &gt;60   134 (10~ 134 (~ 132 (~ 400 (~
      3 G90      dichotomous &gt;90    label    &gt;90   134 (10~ 134 (~ 131 (~ 399 (~
      4 G110     dichotomous &gt;110   label    &gt;110  123 (91~ 111 (~ 107 (~ 341 (~
      5 GE120    dichotomous &gt;=120  label    &gt;=120 88 (65.~ 70 (5~ 76 (5~ 234 (~

# Table 32 (gtsum) generation missing values and ADSL

    Code
      res
    Output
      # A tibble: 5 x 9
        variable var_type    var_label row_type label    stat_1   stat_2 stat_3 stat_0
        <chr>    <chr>       <chr>     <chr>    <chr>    <chr>    <chr>  <chr>  <chr> 
      1 L60      dichotomous &lt;60    label    &lt;60   0 (0.0%) 0 (0.~ 0 (0.~ 0 (0.~
      2 G60      dichotomous &gt;60    label    &gt;60   114 (85~ 96 (7~ 96 (7~ 306 (~
      3 G90      dichotomous &gt;90    label    &gt;90   114 (85~ 96 (7~ 95 (7~ 305 (~
      4 G110     dichotomous &gt;110   label    &gt;110  103 (76~ 78 (5~ 78 (5~ 259 (~
      5 GE120    dichotomous &gt;=120  label    &gt;=120 71 (53.~ 52 (3~ 53 (4~ 176 (~

