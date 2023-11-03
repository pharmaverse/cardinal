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
        variable    var_type var_label row_type    label         stat_1
      1      L60 dichotomous    &lt;60    label   &lt;60     0.0 (0.0%)
      2      G60 dichotomous    &gt;60    label   &gt;60 134.0 (100.0%)
      3      G90 dichotomous    &gt;90    label   &gt;90 134.0 (100.0%)
      4     G110 dichotomous   &gt;110    label  &gt;110  123.0 (91.8%)
      5    GE120 dichotomous  &gt;=120    label &gt;=120   88.0 (65.7%)
                stat_2         stat_3
      1     0.0 (0.0%)     0.0 (0.0%)
      2 134.0 (100.0%) 132.0 (100.0%)
      3 134.0 (100.0%)  131.0 (99.2%)
      4  111.0 (82.8%)  107.0 (81.1%)
      5   70.0 (52.2%)   76.0 (57.6%)

# Table 32 (gtsum) generation works with custom values

    Code
      res
    Output
        variable    var_type var_label row_type    label         stat_1
      1      L60 dichotomous    &lt;60    label   &lt;60     0.0 (0.0%)
      2      G60 dichotomous    &gt;60    label   &gt;60 134.0 (100.0%)
      3      G90 dichotomous    &gt;90    label   &gt;90 134.0 (100.0%)
      4     G110 dichotomous   &gt;110    label  &gt;110  123.0 (91.8%)
      5    GE120 dichotomous  &gt;=120    label &gt;=120   88.0 (65.7%)
                stat_2         stat_3         stat_0
      1     0.0 (0.0%)     0.0 (0.0%)     0.0 (0.0%)
      2 134.0 (100.0%) 132.0 (100.0%) 400.0 (100.0%)
      3 134.0 (100.0%)  131.0 (99.2%)  399.0 (99.8%)
      4  111.0 (82.8%)  107.0 (81.1%)  341.0 (85.3%)
      5   70.0 (52.2%)   76.0 (57.6%)  234.0 (58.5%)

