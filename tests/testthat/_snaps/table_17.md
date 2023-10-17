# Table 17 generation works with default values

    Code
      res
    Output
      FMQ (Narrow)       A: Drug X    B: Placebo   C: Combination
        Preferred Term    (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————
      <Missing>                                                  
        dcd A.1.1.1.1    34 (25.4%)   31 (23.1%)     33 (25.0%)  
        dcd A.1.1.1.2    32 (23.9%)   33 (24.6%)     24 (18.2%)  
        dcd B.1.1.1.1    28 (20.9%)   33 (24.6%)     24 (18.2%)  
        dcd B.2.1.2.1    29 (21.6%)   30 (22.4%)     22 (16.7%)  
        dcd C.2.1.2.1    23 (17.2%)   36 (26.9%)     30 (22.7%)  
        dcd D.1.1.1.1    25 (18.7%)   29 (21.6%)     27 (20.5%)  
        dcd D.1.1.4.2    30 (22.4%)   22 (16.4%)     27 (20.5%)  
        dcd D.2.1.5.3    26 (19.4%)   40 (29.9%)     34 (25.8%)  

# Table 17 generation works with custom values

    Code
      res
    Output
      Table 17: Patients With Adverse Events by Female-Specific FDA Medical Query (Narrow) and Preferred Term, Female Safety Population, Pooled Analyses
      
      ———————————————————————————————————————————————————————————
      FMQ (Narrow)       A: Drug X    B: Placebo   C: Combination
        Preferred Term    (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————
      <Missing>                                                  
        dcd A.1.1.1.1    34 (25.4%)   31 (23.1%)     33 (25.0%)  
        dcd A.1.1.1.2    32 (23.9%)   33 (24.6%)     24 (18.2%)  
        dcd B.1.1.1.1    28 (20.9%)   33 (24.6%)     24 (18.2%)  
        dcd B.2.1.2.1    29 (21.6%)   30 (22.4%)     22 (16.7%)  
        dcd C.2.1.2.1    23 (17.2%)   36 (26.9%)     30 (22.7%)  
        dcd D.1.1.1.1    25 (18.7%)   29 (21.6%)     27 (20.5%)  
        dcd D.1.1.4.2    30 (22.4%)   22 (16.4%)     27 (20.5%)  
        dcd D.2.1.5.3    26 (19.4%)   40 (29.9%)     34 (25.8%)  
      ———————————————————————————————————————————————————————————
      
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

# Table 17 generation works with NA values/pruned rows

    Code
      res
    Output
      FMQ (Narrow)       A: Drug X    B: Placebo   C: Combination
        Preferred Term    (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————
      <Missing>                                                  
        dcd A.1.1.1.1    34 (25.4%)   31 (23.1%)     33 (25.0%)  
        dcd A.1.1.1.2    32 (23.9%)   33 (24.6%)     24 (18.2%)  
        dcd B.1.1.1.1    28 (20.9%)   33 (24.6%)     24 (18.2%)  
        dcd B.2.1.2.1    29 (21.6%)   30 (22.4%)     22 (16.7%)  
        dcd C.2.1.2.1    23 (17.2%)   36 (26.9%)     30 (22.7%)  
        dcd D.1.1.1.1    25 (18.7%)   29 (21.6%)     27 (20.5%)  
        dcd D.1.1.4.2    30 (22.4%)   22 (16.4%)     27 (20.5%)  
        dcd D.2.1.5.3    26 (19.4%)   40 (29.9%)     34 (25.8%)  

# Table 17 generation works with risk difference column

    Code
      res
    Output
      FMQ (Narrow)       A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
        Preferred Term    (N=134)      (N=134)        (N=132)                 (N=266)           
      ——————————————————————————————————————————————————————————————————————————————————————————
      <Missing>                                                                                 
        dcd A.1.1.1.1    34 (25.4%)   31 (23.1%)     33 (25.0%)          0.4 (-10.1 - 10.8)     
        dcd A.1.1.1.2    32 (23.9%)   33 (24.6%)     24 (18.2%)          5.7 (-4.1 - 15.5)      
        dcd B.1.1.1.1    28 (20.9%)   33 (24.6%)     24 (18.2%)          2.7 (-6.8 - 12.2)      
        dcd B.2.1.2.1    29 (21.6%)   30 (22.4%)     22 (16.7%)          5.0 (-4.5 - 14.4)      
        dcd C.2.1.2.1    23 (17.2%)   36 (26.9%)     30 (22.7%)          -5.6 (-15.1 - 4.0)     
        dcd D.1.1.1.1    25 (18.7%)   29 (21.6%)     27 (20.5%)          -1.8 (-11.3 - 7.7)     
        dcd D.1.1.4.2    30 (22.4%)   22 (16.4%)     27 (20.5%)          1.9 (-7.9 - 11.8)      
        dcd D.2.1.5.3    26 (19.4%)   40 (29.9%)     34 (25.8%)          -6.4 (-16.4 - 3.7)     

