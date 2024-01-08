# Table 35 generation works with default values

    Code
      res
    Output
                                   A: Drug X    B: Placebo   C: Combination
      Primary System Organ Class    (N=134)      (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————————————
      cl D                         96 (71.6%)   90 (67.2%)     98 (74.2%)  
      cl B                         96 (71.6%)   89 (66.4%)     97 (73.5%)  
      cl A                         78 (58.2%)   75 (56.0%)     89 (67.4%)  
      cl C                         67 (50.0%)   75 (56.0%)     79 (59.8%)  

# Table 35 generation works with custom values

    Code
      res
    Output
      Table 35. Patients With Adverse Events1 by System Organ Class,
       Safety Population, Pooled Analysis
      
      ———————————————————————————————————————————————————————————————————————————————————
      Primary System Organ Class                                                 Total   
                                   A: Drug X    B: Placebo   C: Combination   Population 
                                    (N=134)      (N=134)        (N=132)         (N=400)  
      ———————————————————————————————————————————————————————————————————————————————————
      cl D                         96 (71.6%)   90 (67.2%)     98 (74.2%)     284 (71.0%)
      cl B                         96 (71.6%)   89 (66.4%)     97 (73.5%)     282 (70.5%)
      cl A                         78 (58.2%)   75 (56.0%)     89 (67.4%)     242 (60.5%)
      cl C                         67 (50.0%)   75 (56.0%)     79 (59.8%)     221 (55.2%)
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
      Primary System Organ Class    (N=134)      (N=134)        (N=132)                 (N=268)           
      ————————————————————————————————————————————————————————————————————————————————————————————————————
      cl D                         96 (71.6%)   90 (67.2%)     98 (74.2%)          -4.5 (-15.5 - 6.5)     
      cl B                         96 (71.6%)   89 (66.4%)     97 (73.5%)          -5.2 (-16.3 - 5.8)     
      cl A                         78 (58.2%)   75 (56.0%)     89 (67.4%)          -2.2 (-14.1 - 9.6)     
      cl C                         67 (50.0%)   75 (56.0%)     79 (59.8%)          6.0 (-6.0 - 17.9)      

# Table 35 generation works with some NA values

    Code
      res
    Output
                                   A: Drug X    B: Placebo   C: Combination
      Primary System Organ Class    (N=134)      (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————————————
      cl D                         96 (71.6%)   90 (67.2%)     98 (74.2%)  
      cl B                         96 (71.6%)   89 (66.4%)     97 (73.5%)  
      cl A                         78 (58.2%)   75 (56.0%)     89 (67.4%)  
      cl C                         67 (50.0%)   75 (56.0%)     79 (59.8%)  

# Table 35 generation works with custom values (SOC variable and label)

    Code
      res
    Output
      AEBODSYS var used                                                 Total   
                          A: Drug X    B: Placebo   C: Combination   Population 
                           (N=134)      (N=134)        (N=132)         (N=400)  
      ——————————————————————————————————————————————————————————————————————————
      cl A.1              78 (58.2%)   75 (56.0%)     89 (67.4%)     242 (60.5%)
      cl B.2              79 (59.0%)   74 (55.2%)     85 (64.4%)     238 (59.5%)
      cl D.1              79 (59.0%)   67 (50.0%)     80 (60.6%)     226 (56.5%)
      cl D.2              47 (35.1%)   58 (43.3%)     57 (43.2%)     162 (40.5%)
      cl B.1              47 (35.1%)   49 (36.6%)     43 (32.6%)     139 (34.8%)
      cl C.2              35 (26.1%)   48 (35.8%)     55 (41.7%)     138 (34.5%)
      cl C.1              43 (32.1%)   46 (34.3%)     43 (32.6%)     132 (33.0%)

