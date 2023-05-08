# Table 13 generation works with default values

    Code
      res
    Output
                                            A: Drug X    B: Placebo   C: Combination
      Reported Term for the Adverse Event    (N=134)      (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————————————————————
      trm A.1.1.1.1                         50 (37.3%)   45 (33.6%)     63 (47.7%)  
      trm A.1.1.1.2                         48 (35.8%)   48 (35.8%)     50 (37.9%)  
      trm B.1.1.1.1                         47 (35.1%)   49 (36.6%)     43 (32.6%)  
      trm B.2.1.2.1                         49 (36.6%)   44 (32.8%)     52 (39.4%)  
      trm B.2.2.3.1                         48 (35.8%)   54 (40.3%)     51 (38.6%)  
      trm C.1.1.1.3                         43 (32.1%)   46 (34.3%)     43 (32.6%)  
      trm C.2.1.2.1                         35 (26.1%)   48 (35.8%)     55 (41.7%)  
      trm D.1.1.1.1                         50 (37.3%)   42 (31.3%)     51 (38.6%)  
      trm D.1.1.4.2                         48 (35.8%)   42 (31.3%)     50 (37.9%)  
      trm D.2.1.5.3                         47 (35.1%)   58 (43.3%)     57 (43.2%)  

# Table 13 generation works with custom values

    Code
      res
    Output
      Table 13. Patients With Common Adverse Events(1) Occurring at >=40% Frequency, Safety Population, Pooled Analyses(2)
      
      ————————————————————————————————————————————————————————————
                          A: Drug X    B: Placebo   C: Combination
      Preferred Term(3)    (N=134)      (N=134)        (N=132)    
      ————————————————————————————————————————————————————————————
      trm A.1.1.1.1       50 (37.3%)   45 (33.6%)     63 (47.7%)  
      trm B.2.2.3.1       48 (35.8%)   54 (40.3%)     51 (38.6%)  
      trm C.2.1.2.1       35 (26.1%)   48 (35.8%)     55 (41.7%)  
      trm D.2.1.5.3       47 (35.1%)   58 (43.3%)     57 (43.2%)  
      ————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      (1) Treatment-emergent adverse event defined as [definition]. MedDRA version X.
      (2) Duration = [e.g., X week double-blind treatment period or median and a range indicating
      pooled trial durations].
      (3) Coded as MedDRA preferred terms.
      
      Abbreviations: CI, confidence interval; MedDRA, Medical Dictionary for Regulatory Activities;
      N, number of patients in treatment arm; n, number of patients with adverse event; PT, preferred term

