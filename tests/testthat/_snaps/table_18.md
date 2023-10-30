# Table 18 generation works with default values

    Code
      res
    Output
      FMQ (Broad)                    A: Drug X    B: Placebo   C: Combination
        Preferred Term                (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————————
      Abnormal Uterine Bleeding                                              
        dcd B.2.2.3.1                 6 (4.5%)    14 (10.4%)      6 (4.5%)   
        dcd C.1.1.1.3                14 (10.4%)   13 (9.7%)      10 (7.6%)   
      Amenorrhea                                                             
        dcd B.2.2.3.1                12 (9.0%)    10 (7.5%)      10 (7.6%)   
        dcd C.1.1.1.3                13 (9.7%)    11 (8.2%)      10 (7.6%)   
      Bacterial Vaginosis                                                    
        dcd B.2.2.3.1                10 (7.5%)    10 (7.5%)       8 (6.1%)   
        dcd C.1.1.1.3                 8 (6.0%)    13 (9.7%)       5 (3.8%)   
      Decreased Menstrual Bleeding                                           
        dcd B.2.2.3.1                10 (7.5%)     5 (3.7%)       9 (6.8%)   
        dcd C.1.1.1.3                 3 (2.2%)    10 (7.5%)      12 (9.1%)   

# Table 18 generation works with custom values

    Code
      res
    Output
      Table 18: Patients With Adverse Events by Female-Specific FDA Medical Query (Broad) and Preferred Term, Female Safety Population, Pooled Analyses
      
      ———————————————————————————————————————————————————————————————————————
      FMQ (Broad)                    A: Drug X    B: Placebo   C: Combination
        Preferred Term                (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————————
      Abnormal Uterine Bleeding                                              
        dcd B.2.2.3.1                 6 (4.5%)    14 (10.4%)      6 (4.5%)   
        dcd C.1.1.1.3                14 (10.4%)   13 (9.7%)      10 (7.6%)   
      Amenorrhea                                                             
        dcd B.2.2.3.1                12 (9.0%)    10 (7.5%)      10 (7.6%)   
        dcd C.1.1.1.3                13 (9.7%)    11 (8.2%)      10 (7.6%)   
      Bacterial Vaginosis                                                    
        dcd B.2.2.3.1                10 (7.5%)    10 (7.5%)       8 (6.1%)   
        dcd C.1.1.1.3                 8 (6.0%)    13 (9.7%)       5 (3.8%)   
      Decreased Menstrual Bleeding                                           
        dcd B.2.2.3.1                10 (7.5%)     5 (3.7%)       9 (6.8%)   
        dcd C.1.1.1.3                 3 (2.2%)    10 (7.5%)      12 (9.1%)   
      ———————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
       (1) Treatment-emergent adverse event defined as [definition]. MedDRA version X.
       (2) Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled trial durations].
       (3) Difference is shown between [treatment arms] (e.g., difference is shown between Drug Name dosage X vs. placebo).
      
      Abbreviations: CI, confidence interval;
      FMQ, FDA Medical Query;
      MedDRA, Medical Dictionary for Regulatory Activities;
      N, number of patients in treatment arm;
      n, number of patients with at least one event;
      PT, preferred term

# Table 18 generation works with NA values/pruned rows

    Code
      res
    Output
      FMQ (Broad)                    A: Drug X    B: Placebo   C: Combination
        Preferred Term                (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————————
      Abnormal Uterine Bleeding                                              
        dcd B.2.2.3.1                 6 (4.5%)    14 (10.4%)      6 (4.5%)   
        dcd C.1.1.1.3                14 (10.4%)   13 (9.7%)      10 (7.6%)   
      Amenorrhea                                                             
        dcd B.2.2.3.1                12 (9.0%)    10 (7.5%)      10 (7.6%)   
        dcd C.1.1.1.3                13 (9.7%)    11 (8.2%)      10 (7.6%)   
      Bacterial Vaginosis                                                    
        dcd B.2.2.3.1                10 (7.5%)    10 (7.5%)       8 (6.1%)   
        dcd C.1.1.1.3                 8 (6.0%)    13 (9.7%)       5 (3.8%)   
      Decreased Menstrual Bleeding                                           
        dcd B.2.2.3.1                10 (7.5%)     5 (3.7%)       9 (6.8%)   
        dcd C.1.1.1.3                 3 (2.2%)    10 (7.5%)      12 (9.1%)   

# Table 18 generation works with risk difference column

    Code
      res
    Output
      FMQ (Broad)                    A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
        Preferred Term                (N=134)      (N=134)        (N=132)                 (N=266)           
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      Abnormal Uterine Bleeding                                                                             
        dcd B.2.2.3.1                 6 (4.5%)    14 (10.4%)      6 (4.5%)           -0.1 (-5.1 - 4.9)      
        dcd C.1.1.1.3                14 (10.4%)   13 (9.7%)      10 (7.6%)            2.9 (-4.0 - 9.7)      
      Amenorrhea                                                                                            
        dcd B.2.2.3.1                12 (9.0%)    10 (7.5%)      10 (7.6%)            1.4 (-5.2 - 8.0)      
        dcd C.1.1.1.3                13 (9.7%)    11 (8.2%)      10 (7.6%)            2.1 (-4.6 - 8.9)      
      Bacterial Vaginosis                                                                                   
        dcd B.2.2.3.1                10 (7.5%)    10 (7.5%)       8 (6.1%)            1.4 (-4.6 - 7.4)      
        dcd C.1.1.1.3                 8 (6.0%)    13 (9.7%)       5 (3.8%)            2.2 (-3.0 - 7.3)      
      Decreased Menstrual Bleeding                                                                          
        dcd B.2.2.3.1                10 (7.5%)     5 (3.7%)       9 (6.8%)            0.6 (-5.5 - 6.8)      
        dcd C.1.1.1.3                 3 (2.2%)    10 (7.5%)      12 (9.1%)          -6.9 (-12.4 - -1.3)     

