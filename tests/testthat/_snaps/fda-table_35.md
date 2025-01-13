# Table 35 generation works with default values

    Code
      as.data.frame(res$table)
    Output
        row_type var_label variable  label    stat_1    stat_2    stat_3
      1    level    <br /> AEBODSYS cl A.1 78 (59.1) 75 (57.7) 89 (55.6)
      2    level    <br /> AEBODSYS cl B.1 47 (83.9) 49 (81.7) 43 (69.4)
      3    level    <br /> AEBODSYS cl B.2 79 (61.2) 74 (53.6) 85 (59.4)
      4    level    <br /> AEBODSYS cl C.1 43 (78.2) 46 (73.0) 43 (67.2)
      5    level    <br /> AEBODSYS cl C.2 35 (72.9) 48 (90.6) 55 (84.6)
      6    level    <br /> AEBODSYS cl D.1 79 (62.2) 67 (63.2) 80 (59.3)
      7    level    <br /> AEBODSYS cl D.2 47 (75.8) 58 (80.6) 57 (77.0)

---

    Code
      res$ard
    Message
      {cards} data frame: 72 x 11
    Output
         group1 group1_level variable variable_level stat_name stat_label  stat
      1     ARM    A: Drug X AEBODSYS         cl A.1         n          n    78
      2     ARM    A: Drug X AEBODSYS         cl A.1         N          N   132
      3     ARM    A: Drug X AEBODSYS         cl A.1         p          % 0.591
      4     ARM    A: Drug X AEBODSYS         cl B.1         n          n    47
      5     ARM    A: Drug X AEBODSYS         cl B.1         N          N    56
      6     ARM    A: Drug X AEBODSYS         cl B.1         p          % 0.839
      7     ARM    A: Drug X AEBODSYS         cl B.2         n          n    79
      8     ARM    A: Drug X AEBODSYS         cl B.2         N          N   129
      9     ARM    A: Drug X AEBODSYS         cl B.2         p          % 0.612
      10    ARM    A: Drug X AEBODSYS         cl C.1         n          n    43
    Message
      i 62 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error

# Table 35 generation works with gtsummary with custom values

    Code
      as.data.frame(res)
    Output
        row_type var_label variable  label    stat_1    stat_2    stat_3
      1    level    <br /> AEBODSYS cl A.1 78 (58.2) 75 (56.0) 89 (67.4)
      2    level    <br /> AEBODSYS cl B.1 47 (35.1) 49 (36.6) 43 (32.6)
      3    level    <br /> AEBODSYS cl B.2 79 (59.0) 74 (55.2) 85 (64.4)
      4    level    <br /> AEBODSYS cl C.1 43 (32.1) 46 (34.3) 43 (32.6)
      5    level    <br /> AEBODSYS cl C.2 35 (26.1) 48 (35.8) 55 (41.7)
      6    level    <br /> AEBODSYS cl D.1 79 (59.0) 67 (50.0) 80 (60.6)
      7    level    <br /> AEBODSYS cl D.2 47 (35.1) 58 (43.3) 57 (43.2)

# Table 35 generation works with gtsummary missing values

    Code
      as.data.frame(res)
    Output
        row_type var_label variable           label    stat_1    stat_2    stat_3
      1    level    <br /> AEBODSYS          cl A.1 78 (58.2) 75 (56.0) 89 (67.4)
      2    level    <br /> AEBODSYS          cl B.1 47 (35.1) 49 (36.6) 43 (32.6)
      3    level    <br /> AEBODSYS          cl B.2 79 (59.0) 74 (55.2) 84 (63.6)
      4    level    <br /> AEBODSYS          cl C.1 43 (32.1) 46 (34.3) 42 (31.8)
      5    level    <br /> AEBODSYS          cl C.2 34 (25.4) 48 (35.8) 55 (41.7)
      6    level    <br /> AEBODSYS          cl D.1 79 (59.0) 67 (50.0) 79 (59.8)
      7    level    <br /> AEBODSYS          cl D.2 47 (35.1) 58 (43.3) 57 (43.2)
      8    level    <br /> AEBODSYS &lt;Missing&gt;   2 (1.5)   2 (1.5)   6 (4.5)

# Table 35 generation works with custom values

    Code
      res
    Output
      Table 35. Patients With Adverse Events1 by System Organ Class,
       Safety Population, Pooled Analysis
      
      ———————————————————————————————————————————————————————————————————————————————————
                                                                                 Total   
                                   A: Drug X    B: Placebo   C: Combination   Population 
      Body System or Organ Class    (N=134)      (N=134)        (N=132)         (N=400)  
      ———————————————————————————————————————————————————————————————————————————————————
      cl A.1                       78 (58.2%)   75 (56.0%)     89 (67.4%)     242 (60.5%)
      cl B.2                       79 (59.0%)   74 (55.2%)     85 (64.4%)     238 (59.5%)
      cl D.1                       79 (59.0%)   67 (50.0%)     80 (60.6%)     226 (56.5%)
      cl D.2                       47 (35.1%)   58 (43.3%)     57 (43.2%)     162 (40.5%)
      cl B.1                       47 (35.1%)   49 (36.6%)     43 (32.6%)     139 (34.8%)
      cl C.2                       35 (26.1%)   48 (35.8%)     55 (41.7%)     138 (34.5%)
      cl C.1                       43 (32.1%)   46 (34.3%)     43 (32.6%)     132 (33.0%)
      ———————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      (1) Treatment-emergent adverse event defined as [definition].
      (2) Duration = [e.g., X week double-blind treatment period or median
      and a range indicating pooled trial durations].
      (3) Difference is shown between [treatment arms] (e.g., difference
      is shown between Drug Name dosage X vs. placebo).
      (4) Table display is ordered by the risk difference.
      
      Abbreviations: CI, confidence interval;
      N, number of patients in treatment arm;
      n, number of patients with at least one event

# Table 35 generation works with risk difference column

    Code
      res
    Output
                                   A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
      Body System or Organ Class    (N=134)      (N=134)        (N=132)                 (N=268)           
      ————————————————————————————————————————————————————————————————————————————————————————————————————
      cl A.1                       78 (58.2%)   75 (56.0%)     89 (67.4%)          -2.2 (-14.1 - 9.6)     
      cl B.2                       79 (59.0%)   74 (55.2%)     85 (64.4%)          -3.7 (-15.6 - 8.1)     
      cl D.1                       79 (59.0%)   67 (50.0%)     80 (60.6%)          -9.0 (-20.8 - 2.9)     
      cl D.2                       47 (35.1%)   58 (43.3%)     57 (43.2%)          8.2 (-3.4 - 19.9)      
      cl B.1                       47 (35.1%)   49 (36.6%)     43 (32.6%)          1.5 (-10.0 - 13.0)     
      cl C.2                       35 (26.1%)   48 (35.8%)     55 (41.7%)          9.7 (-1.3 - 20.7)      
      cl C.1                       43 (32.1%)   46 (34.3%)     43 (32.6%)          2.2 (-9.0 - 13.5)      

# Table 35 generation works with some NA values

    Code
      res
    Output
                                   A: Drug X    B: Placebo   C: Combination
      Body System or Organ Class    (N=134)      (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————————————
      cl A.1                       78 (58.2%)   75 (56.0%)     89 (67.4%)  
      cl B.2                       79 (59.0%)   74 (55.2%)     85 (64.4%)  
      cl D.1                       79 (59.0%)   67 (50.0%)     80 (60.6%)  
      cl D.2                       47 (35.1%)   58 (43.3%)     57 (43.2%)  
      cl B.1                       47 (35.1%)   49 (36.6%)     43 (32.6%)  
      cl C.2                       35 (26.1%)   48 (35.8%)     55 (41.7%)  
      cl C.1                       43 (32.1%)   46 (34.3%)     43 (32.6%)  

# Table 35 generation works with custom values (SOC variable and label)

    Code
      res
    Output
                                                                        Total   
                          A: Drug X    B: Placebo   C: Combination   Population 
      AEBODSYS var used    (N=134)      (N=134)        (N=132)         (N=400)  
      ——————————————————————————————————————————————————————————————————————————
      cl A.1              78 (58.2%)   75 (56.0%)     89 (67.4%)     242 (60.5%)
      cl B.2              79 (59.0%)   74 (55.2%)     85 (64.4%)     238 (59.5%)
      cl D.1              79 (59.0%)   67 (50.0%)     80 (60.6%)     226 (56.5%)
      cl D.2              47 (35.1%)   58 (43.3%)     57 (43.2%)     162 (40.5%)
      cl B.1              47 (35.1%)   49 (36.6%)     43 (32.6%)     139 (34.8%)
      cl C.2              35 (26.1%)   48 (35.8%)     55 (41.7%)     138 (34.5%)
      cl C.1              43 (32.1%)   46 (34.3%)     43 (32.6%)     132 (33.0%)

# Table 35 generation works with pruning

    Code
      res
    Output
                                   A: Drug X    B: Placebo   C: Combination
      Body System or Organ Class    (N=134)      (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————————————
      cl A.1                       78 (58.2%)   75 (56.0%)     89 (67.4%)  
      cl B.2                       79 (59.0%)   74 (55.2%)     85 (64.4%)  
      cl D.1                       79 (59.0%)   67 (50.0%)     80 (60.6%)  
      cl D.2                       47 (35.1%)   58 (43.3%)     57 (43.2%)  
      cl B.1                       47 (35.1%)   49 (36.6%)     43 (32.6%)  
      cl C.2                       35 (26.1%)   48 (35.8%)     55 (41.7%)  
      cl C.1                       43 (32.1%)   46 (34.3%)     43 (32.6%)  

