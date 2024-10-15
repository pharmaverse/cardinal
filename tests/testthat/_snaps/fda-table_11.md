# Table 11 generation works with default values

    Code
      as.data.frame(res$table)
    Output
           **Body System or Organ Class**  \n    **FMQ (Narrow)** **A: Drug X**  \nN = 134 **B: Placebo**  \nN = 134 **C: Combination**  \nN = 132
      1  Patients with at least one AE leading to discontinuation                83 (61.9)                 90 (67.2)                     88 (66.7)
      2                                                    cl A.1                53 (39.6)                 55 (41.0)                     69 (52.3)
      3                                                      FMQ1                22 (16.4)                 21 (15.7)                     37 (28.0)
      4                                                      FMQ2                24 (17.9)                 31 (23.1)                     33 (25.0)
      5                                                      FMQ3                28 (20.9)                 25 (18.7)                     31 (23.5)
      6                                                    cl B.1                35 (26.1)                 41 (30.6)                     36 (27.3)
      7                                                      FMQ1                 12 (9.0)                 17 (12.7)                     19 (14.4)
      8                                                      FMQ2                  9 (6.7)                 21 (15.7)                     20 (15.2)
      9                                                      FMQ3                19 (14.2)                  11 (8.2)                       7 (5.3)
      10                                                   cl B.2                36 (26.9)                 33 (24.6)                     35 (26.5)
      11                                                     FMQ1                16 (11.9)                 15 (11.2)                      12 (9.1)
      12                                                     FMQ2                17 (12.7)                  12 (9.0)                     16 (12.1)
      13                                                     FMQ3                 11 (8.2)                  13 (9.7)                     15 (11.4)
      14                                                   cl C.2                26 (19.4)                 39 (29.1)                     43 (32.6)
      15                                                     FMQ1                 11 (8.2)                  12 (9.0)                     19 (14.4)
      16                                                     FMQ2                 11 (8.2)                 15 (11.2)                     14 (10.6)
      17                                                     FMQ3                  8 (6.0)                 14 (10.4)                     14 (10.6)
      18                                                   cl D.1                51 (38.1)                 51 (38.1)                     60 (45.5)
      19                                                     FMQ1                22 (16.4)                 22 (16.4)                     32 (24.2)
      20                                                     FMQ2                24 (17.9)                 25 (18.7)                     33 (25.0)
      21                                                     FMQ3                19 (14.2)                 24 (17.9)                     26 (19.7)
      22                                                   cl D.2                35 (26.1)                 46 (34.3)                     44 (33.3)
      23                                                     FMQ1                 11 (8.2)                 23 (17.2)                     17 (12.9)
      24                                                     FMQ2                18 (13.4)                 16 (11.9)                     18 (13.6)
      25                                                     FMQ3                 11 (8.2)                 16 (11.9)                     15 (11.4)

---

    Code
      res$ard
    Message
      {cards} data frame: 162 x 13
    Output
         group1 group1_level   group2 group2_level variable variable_level stat_name stat_label  stat
      1     ARM    A: Drug X AEBODSYS       cl A.1 FMQ01NAM           FMQ1         n          n    29
      2     ARM    A: Drug X AEBODSYS       cl A.1 FMQ01NAM           FMQ1         N          N   134
      3     ARM    A: Drug X AEBODSYS       cl A.1 FMQ01NAM           FMQ1         p          % 0.216
      4     ARM    B: Place… AEBODSYS       cl A.1 FMQ01NAM           FMQ1         n          n    28
      5     ARM    B: Place… AEBODSYS       cl A.1 FMQ01NAM           FMQ1         N          N   134
      6     ARM    B: Place… AEBODSYS       cl A.1 FMQ01NAM           FMQ1         p          % 0.209
      7     ARM    C: Combi… AEBODSYS       cl A.1 FMQ01NAM           FMQ1         n          n    46
      8     ARM    C: Combi… AEBODSYS       cl A.1 FMQ01NAM           FMQ1         N          N   132
      9     ARM    C: Combi… AEBODSYS       cl A.1 FMQ01NAM           FMQ1         p          % 0.348
      10    ARM    A: Drug X AEBODSYS       cl B.1 FMQ01NAM           FMQ1         n          n    13
    Message
      i 152 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error

# Table 11 generation works with gtsummary with custom values

    Code
      as.data.frame(res)
    Output
           **Body System or Organ Class**  \n    **FMQ (Narrow)** **A: Drug X**  \nN = 134 **B: Placebo**  \nN = 134 **C: Combination**  \nN = 132
      1  Patients with at least one AE leading to discontinuation                83 (61.9)                 90 (67.2)                     88 (66.7)
      2                                                    cl A.1                53 (39.6)                 55 (41.0)                     69 (52.3)
      3                                                      FMQ1                22 (16.4)                 21 (15.7)                     37 (28.0)
      4                                                      FMQ2                24 (17.9)                 31 (23.1)                     33 (25.0)
      5                                                      FMQ3                28 (20.9)                 25 (18.7)                     31 (23.5)
      6                                                    cl B.1                35 (26.1)                 41 (30.6)                     36 (27.3)
      7                                                      FMQ1                 12 (9.0)                 17 (12.7)                     19 (14.4)
      8                                                      FMQ2                  9 (6.7)                 21 (15.7)                     20 (15.2)
      9                                                      FMQ3                19 (14.2)                  11 (8.2)                       7 (5.3)
      10                                                   cl B.2                36 (26.9)                 33 (24.6)                     35 (26.5)
      11                                                     FMQ1                16 (11.9)                 15 (11.2)                      12 (9.1)
      12                                                     FMQ2                17 (12.7)                  12 (9.0)                     16 (12.1)
      13                                                     FMQ3                 11 (8.2)                  13 (9.7)                     15 (11.4)
      14                                                   cl C.2                26 (19.4)                 39 (29.1)                     43 (32.6)
      15                                                     FMQ1                 11 (8.2)                  12 (9.0)                     19 (14.4)
      16                                                     FMQ2                 11 (8.2)                 15 (11.2)                     14 (10.6)
      17                                                     FMQ3                  8 (6.0)                 14 (10.4)                     14 (10.6)
      18                                                   cl D.1                51 (38.1)                 51 (38.1)                     60 (45.5)
      19                                                     FMQ1                22 (16.4)                 22 (16.4)                     32 (24.2)
      20                                                     FMQ2                24 (17.9)                 25 (18.7)                     33 (25.0)
      21                                                     FMQ3                19 (14.2)                 24 (17.9)                     26 (19.7)
      22                                                   cl D.2                35 (26.1)                 46 (34.3)                     44 (33.3)
      23                                                     FMQ1                 11 (8.2)                 23 (17.2)                     17 (12.9)
      24                                                     FMQ2                18 (13.4)                 16 (11.9)                     18 (13.6)
      25                                                     FMQ3                 11 (8.2)                 16 (11.9)                     15 (11.4)

# Table 11 generation works with rtables with custom values

    Code
      res
    Output
      Table 11. Patients with FDA Medical Query (Broad) Leading to Treatment Discontinuation, Safety Population,
       Pooled Analyses(1)
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————
      Body System or Organ Class(2)                              A: Drug X    B: Placebo   C: Combination
        FMQ (Broad)                                               (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————————————————————————————————————
      Patients with at least one AE leading to discontinuation   49 (36.6%)   60 (44.8%)     56 (42.4%)  
      cl B.2                                                     34 (25.4%)   41 (30.6%)     41 (31.1%)  
        FMQ1                                                     12 (9.0%)    14 (10.4%)     18 (13.6%)  
        FMQ2                                                     18 (13.4%)   19 (14.2%)     17 (12.9%)  
        FMQ3                                                     13 (9.7%)    17 (12.7%)     18 (13.6%)  
      cl C.1                                                     28 (20.9%)   36 (26.9%)     32 (24.2%)  
        FMQ1                                                     10 (7.5%)    15 (11.2%)     14 (10.6%)  
        FMQ2                                                     13 (9.7%)    19 (14.2%)     18 (13.6%)  
        FMQ3                                                     11 (8.2%)     9 (6.7%)      16 (12.1%)  
      ———————————————————————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
       (1) Duration = [e.g., X-week double-blind treatment period or median and a range indicating pooled trial
       durations].
       (2) Each FMQ is aligned to a single SOC based on clinical judgement. However, please be aware that some FMQs
       may contain PTs from more than one SOC.
      
      Abbreviations: CI, confidence interval; FMQ, FDA Medical Query;
      MedDRA, Medical Dictionary for Regulatory Activities; N, number of patients in treatment arm;
      n, number of patients with adverse event; SOC, System Organ Class

# Table 11 generation works with rtables with risk difference column

    Code
      res
    Output
      Body System or Organ Class                                 A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
        FMQ (Narrow)                                              (N=134)      (N=134)        (N=132)                 (N=268)           
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      Patients with at least one AE leading to discontinuation   83 (61.9%)   90 (67.2%)     88 (66.7%)          5.2 (-6.2 - 16.7)      
      cl A.1                                                     53 (39.6%)   55 (41.0%)     69 (52.3%)          1.5 (-10.3 - 13.2)     
        FMQ1                                                     22 (16.4%)   21 (15.7%)     37 (28.0%)          -0.7 (-9.5 - 8.0)      
        FMQ2                                                     24 (17.9%)   31 (23.1%)     33 (25.0%)          5.2 (-4.4 - 14.9)      
        FMQ3                                                     28 (20.9%)   25 (18.7%)     31 (23.5%)          -2.2 (-11.8 - 7.3)     
      cl B.1                                                     35 (26.1%)   41 (30.6%)     36 (27.3%)          4.5 (-6.3 - 15.3)      
        FMQ1                                                     12 (9.0%)    17 (12.7%)     19 (14.4%)          3.7 (-3.7 - 11.2)      
        FMQ2                                                      9 (6.7%)    21 (15.7%)     20 (15.2%)           9.0 (1.5 - 16.4)      
        FMQ3                                                     19 (14.2%)   11 (8.2%)       7 (5.3%)           -6.0 (-13.5 - 1.5)     
      cl B.2                                                     36 (26.9%)   33 (24.6%)     35 (26.5%)          -2.2 (-12.7 - 8.2)     
        FMQ1                                                     16 (11.9%)   15 (11.2%)     12 (9.1%)           -0.7 (-8.4 - 6.9)      
        FMQ2                                                     17 (12.7%)   12 (9.0%)      16 (12.1%)          -3.7 (-11.2 - 3.7)     
        FMQ3                                                     11 (8.2%)    13 (9.7%)      15 (11.4%)           1.5 (-5.3 - 8.3)      
      cl C.2                                                     26 (19.4%)   39 (29.1%)     43 (32.6%)          9.7 (-0.5 - 19.9)      
        FMQ1                                                     11 (8.2%)    12 (9.0%)      19 (14.4%)           0.7 (-6.0 - 7.5)      
        FMQ2                                                     11 (8.2%)    15 (11.2%)     14 (10.6%)          3.0 (-4.1 - 10.1)      
        FMQ3                                                      8 (6.0%)    14 (10.4%)     14 (10.6%)          4.5 (-2.1 - 11.0)      
      cl D.1                                                     51 (38.1%)   51 (38.1%)     60 (45.5%)          0.0 (-11.6 - 11.6)     
        FMQ1                                                     22 (16.4%)   22 (16.4%)     32 (24.2%)           0.0 (-8.9 - 8.9)      
        FMQ2                                                     24 (17.9%)   25 (18.7%)     33 (25.0%)          0.7 (-8.5 - 10.0)      
        FMQ3                                                     19 (14.2%)   24 (17.9%)     26 (19.7%)          3.7 (-5.0 - 12.5)      
      cl D.2                                                     35 (26.1%)   46 (34.3%)     44 (33.3%)          8.2 (-2.7 - 19.2)      
        FMQ1                                                     11 (8.2%)    23 (17.2%)     17 (12.9%)           9.0 (1.1 - 16.9)      
        FMQ2                                                     18 (13.4%)   16 (11.9%)     18 (13.6%)          -1.5 (-9.5 - 6.5)      
        FMQ3                                                     11 (8.2%)    16 (11.9%)     15 (11.4%)          3.7 (-3.5 - 10.9)      

