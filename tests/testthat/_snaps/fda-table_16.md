# Table 16 generation works with default values

    Code
      res
    Output
      FMQ (Broad)            A: Drug X   B: Placebo   C: Combination
        Preferred Term        (N=134)     (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————
      Erectile Dysfunction                                          
        dcd B.2.2.3.1        11 (8.2%)   12 (9.0%)      14 (10.6%)  
        dcd C.1.1.1.3        7 (5.2%)     5 (3.7%)       7 (5.3%)   
      Gynecomastia                                                  
        dcd B.2.2.3.1        10 (7.5%)   16 (11.9%)     15 (11.4%)  
        dcd C.1.1.1.3        7 (5.2%)     6 (4.5%)      10 (7.6%)   

# Table 16 generation works with custom values

    Code
      res
    Output
      Table 16: Patients With Adverse Events by Male-Specific FDA Medical Query (Broad) and Preferred Term, Male Safety Population, Pooled Analyses
      
      ——————————————————————————————————————————————————————————————
      FMQ (Broad)            A: Drug X   B: Placebo   C: Combination
        Preferred Term        (N=134)     (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————
      Erectile Dysfunction                                          
        dcd B.2.2.3.1        11 (8.2%)   12 (9.0%)      14 (10.6%)  
        dcd C.1.1.1.3        7 (5.2%)     5 (3.7%)       7 (5.3%)   
      Gynecomastia                                                  
        dcd B.2.2.3.1        10 (7.5%)   16 (11.9%)     15 (11.4%)  
        dcd C.1.1.1.3        7 (5.2%)     6 (4.5%)      10 (7.6%)   
      ——————————————————————————————————————————————————————————————
      
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

# Table 16 generation works with NA values/pruned rows

    Code
      res
    Output
      FMQ (Broad)            A: Drug X   B: Placebo   C: Combination
        Preferred Term        (N=134)     (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————
      Erectile Dysfunction                                          
        dcd B.2.2.3.1        11 (8.2%)   12 (9.0%)      14 (10.6%)  
        dcd C.1.1.1.3        7 (5.2%)     5 (3.7%)       7 (5.3%)   
      Gynecomastia                                                  
        dcd B.2.2.3.1        10 (7.5%)   16 (11.9%)     15 (11.4%)  
        dcd C.1.1.1.3        7 (5.2%)     6 (4.5%)      10 (7.6%)   

# Table 16 generation works with risk difference column

    Code
      res
    Output
      FMQ (Broad)            A: Drug X   B: Placebo   C: Combination   Risk Difference (%) (95% CI)
        Preferred Term        (N=134)     (N=134)        (N=132)                 (N=266)           
      —————————————————————————————————————————————————————————————————————————————————————————————
      Erectile Dysfunction                                                                         
        dcd B.2.2.3.1        11 (8.2%)   12 (9.0%)      14 (10.6%)          -2.4 (-9.4 - 4.6)      
        dcd C.1.1.1.3        7 (5.2%)     5 (3.7%)       7 (5.3%)           -0.1 (-5.4 - 5.3)      
      Gynecomastia                                                                                 
        dcd B.2.2.3.1        10 (7.5%)   16 (11.9%)     15 (11.4%)          -3.9 (-10.9 - 3.1)     
        dcd C.1.1.1.3        7 (5.2%)     6 (4.5%)      10 (7.6%)           -2.4 (-8.2 - 3.5)      

