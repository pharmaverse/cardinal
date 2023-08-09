# Table 12 generation works with default values

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

