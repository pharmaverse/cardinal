# Table 15 generation works with default values

    Code
      res
    Output
      FMQ (Narrow)       A: Drug X    B: Placebo   C: Combination
        Preferred Term    (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————
      <Missing>                                                  
        dcd A.1.1.1.1    16 (11.9%)   14 (10.4%)     30 (22.7%)  
        dcd A.1.1.1.2    16 (11.9%)   15 (11.2%)     26 (19.7%)  
        dcd B.1.1.1.1    19 (14.2%)   16 (11.9%)     19 (14.4%)  
        dcd B.2.1.2.1    20 (14.9%)   14 (10.4%)     30 (22.7%)  
        dcd C.2.1.2.1    12 (9.0%)    12 (9.0%)      25 (18.9%)  
        dcd D.1.1.1.1    25 (18.7%)   13 (9.7%)      24 (18.2%)  
        dcd D.1.1.4.2    18 (13.4%)   20 (14.9%)     23 (17.4%)  
        dcd D.2.1.5.3    21 (15.7%)   18 (13.4%)     23 (17.4%)  

# Table 15 generation works with custom values

    Code
      res
    Output
      Table 15: Patients With Adverse Events by Male-Specific FDA Medical Query (Narrow) and Preferred Term, Male Safety Population, Pooled Analyses
      
      ———————————————————————————————————————————————————————————
      FMQ (Narrow)       A: Drug X    B: Placebo   C: Combination
        Preferred Term    (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————
      <Missing>                                                  
        dcd A.1.1.1.1    16 (11.9%)   14 (10.4%)     30 (22.7%)  
        dcd A.1.1.1.2    16 (11.9%)   15 (11.2%)     26 (19.7%)  
        dcd B.1.1.1.1    19 (14.2%)   16 (11.9%)     19 (14.4%)  
        dcd B.2.1.2.1    20 (14.9%)   14 (10.4%)     30 (22.7%)  
        dcd C.2.1.2.1    12 (9.0%)    12 (9.0%)      25 (18.9%)  
        dcd D.1.1.1.1    25 (18.7%)   13 (9.7%)      24 (18.2%)  
        dcd D.1.1.4.2    18 (13.4%)   20 (14.9%)     23 (17.4%)  
        dcd D.2.1.5.3    21 (15.7%)   18 (13.4%)     23 (17.4%)  
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

# Table 15 generation works with NA values/pruned rows

    Code
      res
    Output
      FMQ (Narrow)       A: Drug X    B: Placebo   C: Combination
        Preferred Term    (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————
      <Missing>                                                  
        dcd A.1.1.1.1    16 (11.9%)   14 (10.4%)     30 (22.7%)  
        dcd A.1.1.1.2    16 (11.9%)   15 (11.2%)     26 (19.7%)  
        dcd B.1.1.1.1    19 (14.2%)   16 (11.9%)     19 (14.4%)  
        dcd B.2.1.2.1    20 (14.9%)   14 (10.4%)     30 (22.7%)  
        dcd C.2.1.2.1    12 (9.0%)    12 (9.0%)      25 (18.9%)  
        dcd D.1.1.1.1    25 (18.7%)   13 (9.7%)      24 (18.2%)  
        dcd D.1.1.4.2    18 (13.4%)   20 (14.9%)     23 (17.4%)  
        dcd D.2.1.5.3    21 (15.7%)   18 (13.4%)     23 (17.4%)  

# Table 15 generation works with risk difference column

    Code
      res
    Output
      FMQ (Narrow)       A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
        Preferred Term    (N=134)      (N=134)        (N=132)                 (N=266)           
      ——————————————————————————————————————————————————————————————————————————————————————————
      <Missing>                                                                                 
        dcd A.1.1.1.1    16 (11.9%)   14 (10.4%)     30 (22.7%)         -10.8 (-19.8 - -1.8)    
        dcd A.1.1.1.2    16 (11.9%)   15 (11.2%)     26 (19.7%)          -7.8 (-16.5 - 1.0)     
        dcd B.1.1.1.1    19 (14.2%)   16 (11.9%)     19 (14.4%)          -0.2 (-8.6 - 8.2)      
        dcd B.2.1.2.1    20 (14.9%)   14 (10.4%)     30 (22.7%)          -7.8 (-17.2 - 1.6)     
        dcd C.2.1.2.1    12 (9.0%)    12 (9.0%)      25 (18.9%)         -10.0 (-18.2 - -1.7)    
        dcd D.1.1.1.1    25 (18.7%)   13 (9.7%)      24 (18.2%)           0.5 (-8.8 - 9.8)      
        dcd D.1.1.4.2    18 (13.4%)   20 (14.9%)     23 (17.4%)          -4.0 (-12.7 - 4.7)     
        dcd D.2.1.5.3    21 (15.7%)   18 (13.4%)     23 (17.4%)          -1.8 (-10.7 - 7.2)     

