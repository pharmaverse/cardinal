# Table 32 generation works with default values

    Code
      as.data.frame(res$table)
    Output
        **Diastolic Blood Pressure  \n(Pa)** **A: Drug X**  \nN = 134 **B: Placebo**  \nN = 134 **C: Combination**  \nN = 132
      1                                  <60                 0 (0.0%)                  0 (0.0%)                      0 (0.0%)
      2                                  >60             134 (100.0%)              134 (100.0%)                  132 (100.0%)
      3                                  >90             134 (100.0%)              134 (100.0%)                   131 (99.2%)
      4                                 >110              123 (91.8%)               111 (82.8%)                   107 (81.1%)
      5                                >=120               88 (65.7%)                70 (52.2%)                    76 (57.6%)

---

    Code
      res$ard
    Message
      {cards} data frame: 67 x 11
    Output
         group1 group1_level variable variable_level stat_name stat_label stat
      1     ARM    A: Drug X      L60           TRUE         n          n    0
      2     ARM    A: Drug X      L60           TRUE         N          N  134
      3     ARM    A: Drug X      L60           TRUE         p          %    0
      4     ARM    B: Place…      L60           TRUE         n          n    0
      5     ARM    B: Place…      L60           TRUE         N          N  134
      6     ARM    B: Place…      L60           TRUE         p          %    0
      7     ARM    C: Combi…      L60           TRUE         n          n    0
      8     ARM    C: Combi…      L60           TRUE         N          N  132
      9     ARM    C: Combi…      L60           TRUE         p          %    0
      10   <NA>                   L60                    label  Variable…  <60
    Message
      i 57 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error

---

    Code
      as.data.frame(res)
    Output
        **Diastolic Blood Pressure  \n(Pa)** **A: Drug X**  \nN = 134
      1                                  <60                 0 (0.0%)
      2                                  >60             134 (100.0%)
      3                                  >90             134 (100.0%)
      4                                 >110              123 (91.8%)
      5                                >=120               88 (65.7%)
        **B: Placebo**  \nN = 134 **C: Combination**  \nN = 132
      1                  0 (0.0%)                      0 (0.0%)
      2              134 (100.0%)                  132 (100.0%)
      3              134 (100.0%)                   131 (99.2%)
      4               111 (82.8%)                   107 (81.1%)
      5                70 (52.2%)                    76 (57.6%)

# Table 32 generation works with custom values

    Code
      as.data.frame(res)
    Output
        **Diastolic Blood Pressure  \n(Pa)** **A: Drug X**  \nN = 134
      1                                  <60                 0 (0.0%)
      2                                  >60             134 (100.0%)
      3                                  >90             134 (100.0%)
      4                                 >110              123 (91.8%)
      5                                >=120               88 (65.7%)
        **B: Placebo**  \nN = 134 **C: Combination**  \nN = 132
      1                  0 (0.0%)                      0 (0.0%)
      2              134 (100.0%)                  132 (100.0%)
      3              134 (100.0%)                   131 (99.2%)
      4               111 (82.8%)                   107 (81.1%)
      5                70 (52.2%)                    76 (57.6%)

---

    Code
      res
    Output
      Table 32. Percentage of Patients With Maximum Diastolic Blood Pressure by Category
       of Blood Pressure Postbaseline, Safety Population, Pooled Analysis
      
      ———————————————————————————————————————————————————————————————————————————————————
                                                                                 Total   
      Diastolic Blood Pressure    A: Drug X    C: Combination   B: Placebo    Population 
      (Pa)                         (N=134)        (N=132)         (N=134)       (N=400)  
      ———————————————————————————————————————————————————————————————————————————————————
      <60                             0              0               0             0     
      >60                        134 (100%)      132 (100%)     134 (100%)    400 (100%) 
      >90                        134 (100%)     131 (99.2%)     134 (100%)    399 (99.8%)
      >110                       123 (91.8%)    107 (81.1%)     111 (82.8%)   341 (85.2%)
      >=120                      88 (65.7%)      76 (57.6%)     70 (52.2%)    234 (58.5%)
      ———————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      
      Abbreviations: CI, confidence interval; n, number of patients with indicated blood pressure;
      N, number of patients in treatment arm with available blood pressure data

# Table 32 generation missing values and ADSL

    Code
      as.data.frame(res)
    Output
        **Diastolic Blood Pressure  \n(Pa)** **A: Drug X**  \nN = 134
      1                                  <60                 0 (0.0%)
      2                                  >60              114 (85.1%)
      3                                  >90              114 (85.1%)
      4                                 >110              103 (76.9%)
      5                                >=120               71 (53.0%)
        **B: Placebo**  \nN = 134 **C: Combination**  \nN = 132
      1                  0 (0.0%)                      0 (0.0%)
      2                96 (71.6%)                    96 (72.7%)
      3                96 (71.6%)                    95 (72.0%)
      4                78 (58.2%)                    78 (59.1%)
      5                52 (38.8%)                    53 (40.2%)

# Table 32 generation works with pruned rows

    Code
      res
    Output
      Diastolic Blood Pressure    A: Drug X    C: Combination   B: Placebo 
      (Pa)                         (N=134)        (N=132)         (N=134)  
      —————————————————————————————————————————————————————————————————————
      >60                        134 (100%)      132 (100%)     134 (100%) 
      >90                        134 (100%)     131 (99.2%)     134 (100%) 
      >110                       123 (91.8%)    107 (81.1%)     111 (82.8%)
      >=120                      88 (65.7%)      76 (57.6%)     70 (52.2%) 

# Table 32 generation works with risk difference column

    Code
      res
    Output
      Diastolic Blood Pressure    A: Drug X    C: Combination   B: Placebo    Risk Difference (%) (95% CI)
      (Pa)                         (N=134)        (N=132)         (N=134)               (N=268)           
      ————————————————————————————————————————————————————————————————————————————————————————————————————
      <60                             0              0               0              0.0 (0.0 - 0.0)       
      >60                        134 (100%)      132 (100%)     134 (100%)          0.0 (0.0 - 0.0)       
      >90                        134 (100%)     131 (99.2%)     134 (100%)          0.0 (0.0 - 0.0)       
      >110                       123 (91.8%)    107 (81.1%)     111 (82.8%)       -9.0 (-16.9 - -1.1)     
      >=120                      88 (65.7%)      76 (57.6%)     70 (52.2%)        -13.4 (-25.1 - -1.8)    

