# Table 35 generation works with default values

    Code
      as.data.frame(res$table)
    Output
        **System Organ Class** **A: Drug X**  \nN = 609 **B: Placebo**  \nN = 622 **C: Combination**  \nN = 703
      1                 cl A.1                 78 (59%)                  75 (58%)                      89 (56%)
      2                 cl B.1                 47 (84%)                  49 (82%)                      43 (69%)
      3                 cl B.2                 79 (61%)                  74 (54%)                      85 (59%)
      4                 cl C.1                 43 (78%)                  46 (73%)                      43 (67%)
      5                 cl C.2                 35 (73%)                  48 (91%)                      55 (85%)
      6                 cl D.1                 79 (62%)                  67 (63%)                      80 (59%)
      7                 cl D.2                 47 (76%)                  58 (81%)                      57 (77%)

---

    Code
      res$ard
    Output
      $tbl_hierarchical
    Message
      {cards} data frame: 72 x 13
    Output
         group1 group1_level variable variable_level stat_name stat_label  stat stat_fmt
      1     ARM    A: Drug X AEBODSYS         cl A.1         n          n    78       78
      2     ARM    A: Drug X AEBODSYS         cl A.1         N          N   132      132
      3     ARM    A: Drug X AEBODSYS         cl A.1         p          % 0.591       59
      4     ARM    A: Drug X AEBODSYS         cl B.1         n          n    47       47
      5     ARM    A: Drug X AEBODSYS         cl B.1         N          N    56       56
      6     ARM    A: Drug X AEBODSYS         cl B.1         p          % 0.839       84
      7     ARM    A: Drug X AEBODSYS         cl B.2         n          n    79       79
      8     ARM    A: Drug X AEBODSYS         cl B.2         N          N   129      129
      9     ARM    A: Drug X AEBODSYS         cl B.2         p          % 0.612       61
      10    ARM    A: Drug X AEBODSYS         cl C.1         n          n    43       43
    Message
      i 62 more rows
      i Use `print(n = ...)` to see more rows
      i 5 more variables: context, fmt_fn, warning, error, gts_column
    Output
      

# Table 35 generation works with gtsummary with custom values

    Code
      as.data.frame(res)
    Output
        **System Organ Class** **A: Drug X**  \nN = 134 **B: Placebo**  \nN = 134 **C: Combination**  \nN = 132
      1                 cl A.1                 78 (58%)                  75 (56%)                      89 (67%)
      2                 cl B.1                 47 (35%)                  49 (37%)                      43 (33%)
      3                 cl B.2                 79 (59%)                  74 (55%)                      85 (64%)
      4                 cl C.1                 43 (32%)                  46 (34%)                      43 (33%)
      5                 cl C.2                 35 (26%)                  48 (36%)                      55 (42%)
      6                 cl D.1                 79 (59%)                  67 (50%)                      80 (61%)
      7                 cl D.2                 47 (35%)                  58 (43%)                      57 (43%)

# Table 35 generation works with gtsummary missing values

    Code
      as.data.frame(res)
    Output
        **System Organ Class** **A: Drug X**  \nN = 134 **B: Placebo**  \nN = 134 **C: Combination**  \nN = 132
      1                 cl A.1                 78 (58%)                  75 (56%)                      89 (67%)
      2                 cl B.1                 47 (35%)                  49 (37%)                      43 (33%)
      3                 cl B.2                 79 (59%)                  74 (55%)                      84 (64%)
      4                 cl C.1                 43 (32%)                  46 (34%)                      42 (32%)
      5                 cl C.2                 34 (25%)                  48 (36%)                      55 (42%)
      6                 cl D.1                 79 (59%)                  67 (50%)                      79 (60%)
      7                 cl D.2                 47 (35%)                  58 (43%)                      57 (43%)
      8              <Missing>                 2 (1.5%)                  2 (1.5%)                      6 (4.5%)

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
      cl B.2                       79 (59.0%)   74 (55.2%)     84 (63.6%)  
      cl D.1                       79 (59.0%)   67 (50.0%)     79 (59.8%)  
      cl D.2                       47 (35.1%)   58 (43.3%)     57 (43.2%)  
      cl B.1                       47 (35.1%)   49 (36.6%)     43 (32.6%)  
      cl C.2                       34 (25.4%)   48 (35.8%)     55 (41.7%)  
      cl C.1                       43 (32.1%)   46 (34.3%)     42 (31.8%)  
      <Missing>                     2 (1.5%)     2 (1.5%)       6 (4.5%)   

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

