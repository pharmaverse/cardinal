# Table 32 generation works with default values

    Code
      res
    Output
      Diastolic Blood Pressure   A: Drug X    B: Placebo   C: Combination
      (Pa)                        (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————
      <60                        72 (53.7%)   83 (61.9%)     78 (59.1%)  
      >60                        62 (46.3%)   51 (38.1%)     54 (40.9%)  
      >90                            0            0              0       
      >110                           0            0              0       
      >=120                          0            0              0       

# Table 32 generation works with custom values

    Code
      res
    Output
      Table 32. Percentage of Patients With Maximum Diastolic Blood Pressure by Category
       of Blood Pressure Postbaseline, Safety Population, Pooled Analysis
      
      —————————————————————————————————————————————————————————————————————————————————
                                                                               Total   
      Diastolic Blood Pressure   A: Drug X    B: Placebo   C: Combination   Population 
      (Pa)                        (N=134)      (N=134)        (N=132)         (N=400)  
      —————————————————————————————————————————————————————————————————————————————————
      <60                        72 (53.7%)   83 (61.9%)     78 (59.1%)     233 (58.2%)
      >60                        62 (46.3%)   51 (38.1%)     54 (40.9%)     167 (41.8%)
      >90                            0            0              0               0     
      >110                           0            0              0               0     
      >=120                          0            0              0               0     
      —————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      
      Abbreviations: CI, confidence interval; n, number of patients with indicated blood pressure;
      N, number of patients in treatment arm with available blood pressure data

# Table 32 generation works with pruned rows

    Code
      res
    Output
      Diastolic Blood Pressure   A: Drug X    B: Placebo   C: Combination
      (Pa)                        (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————
      <60                        72 (53.7%)   83 (61.9%)     78 (59.1%)  
      >60                        62 (46.3%)   51 (38.1%)     54 (40.9%)  

# Table 32 generation works with risk difference column

    Code
      res
    Output
      Diastolic Blood Pressure   A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
      (Pa)                        (N=134)      (N=134)        (N=132)                 (N=268)           
      ——————————————————————————————————————————————————————————————————————————————————————————————————
      <60                        72 (53.7%)   83 (61.9%)     78 (59.1%)          8.2 (-3.6 - 20.0)      
      >60                        62 (46.3%)   51 (38.1%)     54 (40.9%)          -8.2 (-20.0 - 3.6)     
      >90                            0            0              0                0.0 (0.0 - 0.0)       
      >110                           0            0              0                0.0 (0.0 - 0.0)       
      >=120                          0            0              0                0.0 (0.0 - 0.0)       

# Table 32 (gtsum) generation works with default values

    Code
      res
    Output
      NULL

---

    Code
      res
    Output
        variable    var_type var_label row_type    label       stat_1       stat_2
      1      L60 dichotomous    &lt;60    label   &lt;60 72.0 (53.7%) 83.0 (61.9%)
      2      G60 dichotomous    &gt;60    label   &gt;60 62.0 (46.3%) 51.0 (38.1%)
      3      G90 dichotomous    &gt;90    label   &gt;90   0.0 (0.0%)   0.0 (0.0%)
      4     G110 dichotomous   &gt;110    label  &gt;110   0.0 (0.0%)   0.0 (0.0%)
      5    GE120 dichotomous  &gt;=120    label &gt;=120   0.0 (0.0%)   0.0 (0.0%)
              stat_3
      1 78.0 (59.1%)
      2 54.0 (40.9%)
      3   0.0 (0.0%)
      4   0.0 (0.0%)
      5   0.0 (0.0%)

# Table 32 (gtsum) generation works with custom values

    Code
      res
    Output
        **Characteristic** **A: Drug X**  \n(N=134) **B: Placebo**  \n(N=134)
      1                <60             72.0 (53.7%)              83.0 (61.9%)
      2                >60             62.0 (46.3%)              51.0 (38.1%)
      3                >90               0.0 (0.0%)                0.0 (0.0%)
      4               >110               0.0 (0.0%)                0.0 (0.0%)
      5              >=120               0.0 (0.0%)                0.0 (0.0%)
        **C: Combination**  \n(N=132) **Total Population**  \n(N=400)
      1                  78.0 (59.1%)                   233.0 (58.3%)
      2                  54.0 (40.9%)                   167.0 (41.8%)
      3                    0.0 (0.0%)                      0.0 (0.0%)
      4                    0.0 (0.0%)                      0.0 (0.0%)
      5                    0.0 (0.0%)                      0.0 (0.0%)

---

    Code
      res
    Output
        variable    var_type var_label row_type    label       stat_1       stat_2
      1      L60 dichotomous    &lt;60    label   &lt;60 72.0 (53.7%) 83.0 (61.9%)
      2      G60 dichotomous    &gt;60    label   &gt;60 62.0 (46.3%) 51.0 (38.1%)
      3      G90 dichotomous    &gt;90    label   &gt;90   0.0 (0.0%)   0.0 (0.0%)
      4     G110 dichotomous   &gt;110    label  &gt;110   0.0 (0.0%)   0.0 (0.0%)
      5    GE120 dichotomous  &gt;=120    label &gt;=120   0.0 (0.0%)   0.0 (0.0%)
              stat_3        stat_0
      1 78.0 (59.1%) 233.0 (58.3%)
      2 54.0 (40.9%) 167.0 (41.8%)
      3   0.0 (0.0%)    0.0 (0.0%)
      4   0.0 (0.0%)    0.0 (0.0%)
      5   0.0 (0.0%)    0.0 (0.0%)

