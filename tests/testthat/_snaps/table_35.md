# Table 35 generation works with default values

    Code
      res
    Output
                           A: Drug X    B: Placebo   C: Combination
      System Organ Class    (N=134)      (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————
      cl A.1               78 (63.9%)   75 (61.0%)     89 (74.2%)  
      cl B.1               47 (38.5%)   49 (39.8%)     43 (35.8%)  
      cl B.2               79 (64.8%)   74 (60.2%)     85 (70.8%)  
      cl C.1               43 (35.2%)   46 (37.4%)     43 (35.8%)  
      cl C.2               35 (28.7%)   48 (39.0%)     55 (45.8%)  
      cl D.1               79 (64.8%)   67 (54.5%)     80 (66.7%)  
      cl D.2               47 (38.5%)   58 (47.2%)     57 (47.5%)  

# Table 35 generation works with custom values

    Code
      res
    Output
      Table 35. Patients With Adverse Events1 by System Organ Class,
       Safety Population, Pooled Analysis
      
      ———————————————————————————————————————————————————————————————————————————
      System Organ Class                                                 Total   
                           A: Drug X    B: Placebo   C: Combination   Population 
                            (N=134)      (N=134)        (N=132)         (N=400)  
      ———————————————————————————————————————————————————————————————————————————
      cl A.1               78 (63.9%)   75 (61.0%)     89 (74.2%)     242 (66.3%)
      cl B.1               47 (38.5%)   49 (39.8%)     43 (35.8%)     139 (38.1%)
      cl B.2               79 (64.8%)   74 (60.2%)     85 (70.8%)     238 (65.2%)
      cl C.1               43 (35.2%)   46 (37.4%)     43 (35.8%)     132 (36.2%)
      cl C.2               35 (28.7%)   48 (39.0%)     55 (45.8%)     138 (37.8%)
      cl D.1               79 (64.8%)   67 (54.5%)     80 (66.7%)     226 (61.9%)
      cl D.2               47 (38.5%)   58 (47.2%)     57 (47.5%)     162 (44.4%)
      ———————————————————————————————————————————————————————————————————————————
      
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
      System Organ Class    (N=134)      (N=134)        (N=132)                 (N=268)           
      ————————————————————————————————————————————————————————————————————————————————————————————
      cl A.1               78 (58.2%)   75 (56.0%)     89 (67.4%)          -2.2 (-14.1 - 9.6)     
      cl B.1               47 (35.1%)   49 (36.6%)     43 (32.6%)          1.5 (-10.0 - 13.0)     
      cl B.2               79 (59.0%)   74 (55.2%)     85 (64.4%)          -3.7 (-15.6 - 8.1)     
      cl C.1               43 (32.1%)   46 (34.3%)     43 (32.6%)          2.2 (-9.0 - 13.5)      
      cl C.2               35 (26.1%)   48 (35.8%)     55 (41.7%)          9.7 (-1.3 - 20.7)      
      cl D.1               79 (59.0%)   67 (50.0%)     80 (60.6%)          -9.0 (-20.8 - 2.9)     
      cl D.2               47 (35.1%)   58 (43.3%)     57 (43.2%)          8.2 (-3.4 - 19.9)      

# Table 35 generation works with some NA values

    Code
      res
    Output
                           A: Drug X    B: Placebo   C: Combination
      System Organ Class    (N=134)      (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————
      cl A.1               78 (63.9%)   75 (61.0%)     89 (74.2%)  
      cl B.1               47 (38.5%)   49 (39.8%)     43 (35.8%)  
      cl B.2               79 (64.8%)   74 (60.2%)     84 (70.0%)  
      cl C.1               43 (35.2%)   46 (37.4%)     42 (35.0%)  
      cl C.2               34 (27.9%)   48 (39.0%)     55 (45.8%)  
      cl D.1               79 (64.8%)   67 (54.5%)     79 (65.8%)  
      cl D.2               47 (38.5%)   58 (47.2%)     57 (47.5%)  
      <Missing>             2 (1.6%)     2 (1.6%)       6 (5.0%)   

