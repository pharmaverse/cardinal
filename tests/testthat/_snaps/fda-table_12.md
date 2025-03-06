# Table 12 generation works with default values

    Code
      as.data.frame(res$table)
    Output
         **Body System or Organ Class**  \n    **Dictionary-Derived Term** **A: Drug X**  \nN = 134 **B: Placebo**  \nN = 134 **C: Combination**  \nN = 132
      1           Patients with at least one AE leading to discontinuation                86 (64.2)                 93 (69.4)                     90 (68.2)
      2                                                             cl A.1                53 (39.6)                 55 (41.0)                     69 (52.3)
      3                                                      dcd A.1.1.1.1                37 (27.6)                 37 (27.6)                     50 (37.9)
      4                                                      dcd A.1.1.1.2                33 (24.6)                 31 (23.1)                     40 (30.3)
      5                                                             cl B.1                35 (26.1)                 41 (30.6)                     36 (27.3)
      6                                                      dcd B.1.1.1.1                35 (26.1)                 41 (30.6)                     36 (27.3)
      7                                                             cl B.2                55 (41.0)                 56 (41.8)                     65 (49.2)
      8                                                      dcd B.2.1.2.1                36 (26.9)                 33 (24.6)                     35 (26.5)
      9                                                      dcd B.2.2.3.1                34 (25.4)                 41 (30.6)                     41 (31.1)
      10                                                            cl C.1                28 (20.9)                 36 (26.9)                     32 (24.2)
      11                                                     dcd C.1.1.1.3                28 (20.9)                 36 (26.9)                     32 (24.2)
      12                                                            cl C.2                26 (19.4)                 39 (29.1)                     43 (32.6)
      13                                                     dcd C.2.1.2.1                26 (19.4)                 39 (29.1)                     43 (32.6)
      14                                                            cl D.1                51 (38.1)                 51 (38.1)                     60 (45.5)
      15                                                     dcd D.1.1.1.1                29 (21.6)                 31 (23.1)                     37 (28.0)
      16                                                     dcd D.1.1.4.2                33 (24.6)                 34 (25.4)                     39 (29.5)
      17                                                            cl D.2                35 (26.1)                 46 (34.3)                     44 (33.3)
      18                                                     dcd D.2.1.5.3                35 (26.1)                 46 (34.3)                     44 (33.3)

---

    Code
      res$ard
    Message
      {cards} data frame: 90 x 13
    Output
         group1 group1_level   group2 group2_level variable variable_level stat_name stat_label  stat
      1     ARM    A: Drug X AEBODSYS       cl A.1  AEDECOD      dcd A.1.…         n          n    51
      2     ARM    A: Drug X AEBODSYS       cl A.1  AEDECOD      dcd A.1.…         N          N   134
      3     ARM    A: Drug X AEBODSYS       cl A.1  AEDECOD      dcd A.1.…         p          % 0.381
      4     ARM    B: Place… AEBODSYS       cl A.1  AEDECOD      dcd A.1.…         n          n    52
      5     ARM    B: Place… AEBODSYS       cl A.1  AEDECOD      dcd A.1.…         N          N   134
      6     ARM    B: Place… AEBODSYS       cl A.1  AEDECOD      dcd A.1.…         p          % 0.388
      7     ARM    C: Combi… AEBODSYS       cl A.1  AEDECOD      dcd A.1.…         n          n    73
      8     ARM    C: Combi… AEBODSYS       cl A.1  AEDECOD      dcd A.1.…         N          N   132
      9     ARM    C: Combi… AEBODSYS       cl A.1  AEDECOD      dcd A.1.…         p          % 0.553
      10    ARM    A: Drug X AEBODSYS       cl A.1  AEDECOD      dcd A.1.…         n          n    45
    Message
      i 80 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error

---

    Code
      res
    Output
      Body System or Organ Class                                 A: Drug X    B: Placebo   C: Combination
        Dictionary-Derived Term                                   (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————————————————————————————————————
      Patients with at least one AE leading to discontinuation   86 (64.2%)   93 (69.4%)     90 (68.2%)  
      cl A.1                                                     53 (39.6%)   55 (41.0%)     69 (52.3%)  
        dcd A.1.1.1.1                                            37 (27.6%)   37 (27.6%)     50 (37.9%)  
        dcd A.1.1.1.2                                            33 (24.6%)   31 (23.1%)     40 (30.3%)  
      cl B.1                                                     35 (26.1%)   41 (30.6%)     36 (27.3%)  
        dcd B.1.1.1.1                                            35 (26.1%)   41 (30.6%)     36 (27.3%)  
      cl B.2                                                     55 (41.0%)   56 (41.8%)     65 (49.2%)  
        dcd B.2.1.2.1                                            36 (26.9%)   33 (24.6%)     35 (26.5%)  
        dcd B.2.2.3.1                                            34 (25.4%)   41 (30.6%)     41 (31.1%)  
      cl C.1                                                     28 (20.9%)   36 (26.9%)     32 (24.2%)  
        dcd C.1.1.1.3                                            28 (20.9%)   36 (26.9%)     32 (24.2%)  
      cl C.2                                                     26 (19.4%)   39 (29.1%)     43 (32.6%)  
        dcd C.2.1.2.1                                            26 (19.4%)   39 (29.1%)     43 (32.6%)  
      cl D.1                                                     51 (38.1%)   51 (38.1%)     60 (45.5%)  
        dcd D.1.1.1.1                                            29 (21.6%)   31 (23.1%)     37 (28.0%)  
        dcd D.1.1.4.2                                            33 (24.6%)   34 (25.4%)     39 (29.5%)  
      cl D.2                                                     35 (26.1%)   46 (34.3%)     44 (33.3%)  
        dcd D.2.1.5.3                                            35 (26.1%)   46 (34.3%)     44 (33.3%)  

# Table 12 generation works with gtsummary with custom values

    Code
      as.data.frame(res)
    Output
         **Body System or Organ Class**  \n    **Dictionary-Derived Term** **A: Drug X**  \nN = 134 **B: Placebo**  \nN = 134 **C: Combination**  \nN = 132
      1           Patients with at least one AE leading to discontinuation                86 (64.2)                 93 (69.4)                     90 (68.2)
      2                                                             cl A.1                53 (39.6)                 55 (41.0)                     69 (52.3)
      3                                                      dcd A.1.1.1.1                37 (27.6)                 37 (27.6)                     50 (37.9)
      4                                                      dcd A.1.1.1.2                33 (24.6)                 31 (23.1)                     40 (30.3)
      5                                                             cl B.1                35 (26.1)                 41 (30.6)                     36 (27.3)
      6                                                      dcd B.1.1.1.1                35 (26.1)                 41 (30.6)                     36 (27.3)
      7                                                             cl B.2                55 (41.0)                 56 (41.8)                     65 (49.2)
      8                                                      dcd B.2.1.2.1                36 (26.9)                 33 (24.6)                     35 (26.5)
      9                                                      dcd B.2.2.3.1                34 (25.4)                 41 (30.6)                     41 (31.1)
      10                                                            cl C.1                28 (20.9)                 36 (26.9)                     32 (24.2)
      11                                                     dcd C.1.1.1.3                28 (20.9)                 36 (26.9)                     32 (24.2)
      12                                                            cl C.2                26 (19.4)                 39 (29.1)                     43 (32.6)
      13                                                     dcd C.2.1.2.1                26 (19.4)                 39 (29.1)                     43 (32.6)
      14                                                            cl D.1                51 (38.1)                 51 (38.1)                     60 (45.5)
      15                                                     dcd D.1.1.1.1                29 (21.6)                 31 (23.1)                     37 (28.0)
      16                                                     dcd D.1.1.4.2                33 (24.6)                 34 (25.4)                     39 (29.5)
      17                                                            cl D.2                35 (26.1)                 46 (34.3)                     44 (33.3)
      18                                                     dcd D.2.1.5.3                35 (26.1)                 46 (34.3)                     44 (33.3)

# Table 12 generation works with custom values

    Code
      res
    Output
      Table 12. Patients With Adverse Events(1) Leading to Treatment Discontinuation by System Organ Class and Preferred Term,
       Safety Population, Pooled Analyses(2)
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————
      Body System or Organ Class                                 A: Drug X    B: Placebo   C: Combination
        Preferred Term                                            (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————————————————————————————————————
      Patients with at least one AE leading to discontinuation   86 (64.2%)   93 (69.4%)     90 (68.2%)  
      cl A.1                                                     53 (39.6%)   55 (41.0%)     69 (52.3%)  
        dcd A.1.1.1.1                                            37 (27.6%)   37 (27.6%)     50 (37.9%)  
        dcd A.1.1.1.2                                            33 (24.6%)   31 (23.1%)     40 (30.3%)  
      cl B.1                                                     35 (26.1%)   41 (30.6%)     36 (27.3%)  
        dcd B.1.1.1.1                                            35 (26.1%)   41 (30.6%)     36 (27.3%)  
      cl B.2                                                     55 (41.0%)   56 (41.8%)     65 (49.2%)  
        dcd B.2.1.2.1                                            36 (26.9%)   33 (24.6%)     35 (26.5%)  
        dcd B.2.2.3.1                                            34 (25.4%)   41 (30.6%)     41 (31.1%)  
      cl C.1                                                     28 (20.9%)   36 (26.9%)     32 (24.2%)  
        dcd C.1.1.1.3                                            28 (20.9%)   36 (26.9%)     32 (24.2%)  
      cl C.2                                                     26 (19.4%)   39 (29.1%)     43 (32.6%)  
        dcd C.2.1.2.1                                            26 (19.4%)   39 (29.1%)     43 (32.6%)  
      cl D.1                                                     51 (38.1%)   51 (38.1%)     60 (45.5%)  
        dcd D.1.1.1.1                                            29 (21.6%)   31 (23.1%)     37 (28.0%)  
        dcd D.1.1.4.2                                            33 (24.6%)   34 (25.4%)     39 (29.5%)  
      cl D.2                                                     35 (26.1%)   46 (34.3%)     44 (33.3%)  
        dcd D.2.1.5.3                                            35 (26.1%)   46 (34.3%)     44 (33.3%)  
      ———————————————————————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
       (1) Treatment-emergent adverse event defined as [definition]. MedDRA version X.
       (2) Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled trial durations].
      
      Abbreviations: CI, confidence interval; MedDRA, Medical Dictionary for Regulatory Activities; N, number of patients
      in treatment arm; n, number of patients with at least one event; PT, preferred term; SOC, System Organ Class

# Table 12 generation works with risk difference column

    Code
      res
    Output
      Body System or Organ Class                                 A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
        Dictionary-Derived Term                                   (N=134)      (N=134)        (N=132)                 (N=268)           
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      Patients with at least one AE leading to discontinuation   86 (64.2%)   93 (69.4%)     90 (68.2%)          5.2 (-6.0 - 16.5)      
      cl A.1                                                     53 (39.6%)   55 (41.0%)     69 (52.3%)          1.5 (-10.3 - 13.2)     
        dcd A.1.1.1.1                                            37 (27.6%)   37 (27.6%)     50 (37.9%)          0.0 (-10.7 - 10.7)     
        dcd A.1.1.1.2                                            33 (24.6%)   31 (23.1%)     40 (30.3%)          -1.5 (-11.7 - 8.7)     
      cl B.1                                                     35 (26.1%)   41 (30.6%)     36 (27.3%)          4.5 (-6.3 - 15.3)      
        dcd B.1.1.1.1                                            35 (26.1%)   41 (30.6%)     36 (27.3%)          4.5 (-6.3 - 15.3)      
      cl B.2                                                     55 (41.0%)   56 (41.8%)     65 (49.2%)          0.7 (-11.0 - 12.5)     
        dcd B.2.1.2.1                                            36 (26.9%)   33 (24.6%)     35 (26.5%)          -2.2 (-12.7 - 8.2)     
        dcd B.2.2.3.1                                            34 (25.4%)   41 (30.6%)     41 (31.1%)          5.2 (-5.5 - 16.0)      
      cl C.1                                                     28 (20.9%)   36 (26.9%)     32 (24.2%)          6.0 (-4.2 - 16.2)      
        dcd C.1.1.1.3                                            28 (20.9%)   36 (26.9%)     32 (24.2%)          6.0 (-4.2 - 16.2)      
      cl C.2                                                     26 (19.4%)   39 (29.1%)     43 (32.6%)          9.7 (-0.5 - 19.9)      
        dcd C.2.1.2.1                                            26 (19.4%)   39 (29.1%)     43 (32.6%)          9.7 (-0.5 - 19.9)      
      cl D.1                                                     51 (38.1%)   51 (38.1%)     60 (45.5%)          0.0 (-11.6 - 11.6)     
        dcd D.1.1.1.1                                            29 (21.6%)   31 (23.1%)     37 (28.0%)          1.5 (-8.5 - 11.5)      
        dcd D.1.1.4.2                                            33 (24.6%)   34 (25.4%)     39 (29.5%)          0.7 (-9.6 - 11.1)      
      cl D.2                                                     35 (26.1%)   46 (34.3%)     44 (33.3%)          8.2 (-2.7 - 19.2)      
        dcd D.2.1.5.3                                            35 (26.1%)   46 (34.3%)     44 (33.3%)          8.2 (-2.7 - 19.2)      

