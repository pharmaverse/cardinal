# Table 15 generation works with default values

    Code
      res
    Output
      FMQ (Narrow)           A: Drug X    B: Placebo   C: Combination
        Preferred Term        (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————
      Erectile Dysfunction                                           
        dcd A.1.1.1.1        13 (9.7%)     9 (6.7%)      19 (14.4%)  
        dcd A.1.1.1.2         9 (6.7%)     9 (6.7%)      13 (9.8%)   
        dcd B.1.1.1.1        10 (7.5%)    11 (8.2%)      14 (10.6%)  
        dcd B.2.1.2.1        11 (8.2%)    11 (8.2%)      18 (13.6%)  
        dcd C.2.1.2.1         7 (5.2%)     3 (2.2%)      13 (9.8%)   
        dcd D.1.1.1.1        19 (14.2%)    6 (4.5%)      16 (12.1%)  
        dcd D.1.1.4.2        11 (8.2%)     5 (3.7%)      14 (10.6%)  
        dcd D.2.1.5.3        13 (9.7%)     9 (6.7%)      12 (9.1%)   
      Gynecomastia                                                   
        dcd A.1.1.1.1         6 (4.5%)     8 (6.0%)      18 (13.6%)  
        dcd A.1.1.1.2        10 (7.5%)     6 (4.5%)      15 (11.4%)  
        dcd B.1.1.1.1        11 (8.2%)     8 (6.0%)      11 (8.3%)   
        dcd B.2.1.2.1        11 (8.2%)     7 (5.2%)      19 (14.4%)  
        dcd C.2.1.2.1         5 (3.7%)     9 (6.7%)      17 (12.9%)  
        dcd D.1.1.1.1         9 (6.7%)     7 (5.2%)      10 (7.6%)   
        dcd D.1.1.4.2        11 (8.2%)    16 (11.9%)     12 (9.1%)   
        dcd D.2.1.5.3         9 (6.7%)    12 (9.0%)      14 (10.6%)  

# Table 15 generation works with custom values

    Code
      res
    Output
      Table 15: Patients With Adverse Events by Male-Specific FDA Medical Query (Narrow) and Preferred Term, Male Safety Population, Pooled Analyses
      
      ———————————————————————————————————————————————————————————————
      FMQ (Narrow)           A: Drug X    B: Placebo   C: Combination
        Preferred Term        (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————
      Erectile Dysfunction                                           
        dcd A.1.1.1.1        13 (9.7%)     9 (6.7%)      19 (14.4%)  
        dcd A.1.1.1.2         9 (6.7%)     9 (6.7%)      13 (9.8%)   
        dcd B.1.1.1.1        10 (7.5%)    11 (8.2%)      14 (10.6%)  
        dcd B.2.1.2.1        11 (8.2%)    11 (8.2%)      18 (13.6%)  
        dcd C.2.1.2.1         7 (5.2%)     3 (2.2%)      13 (9.8%)   
        dcd D.1.1.1.1        19 (14.2%)    6 (4.5%)      16 (12.1%)  
        dcd D.1.1.4.2        11 (8.2%)     5 (3.7%)      14 (10.6%)  
        dcd D.2.1.5.3        13 (9.7%)     9 (6.7%)      12 (9.1%)   
      Gynecomastia                                                   
        dcd A.1.1.1.1         6 (4.5%)     8 (6.0%)      18 (13.6%)  
        dcd A.1.1.1.2        10 (7.5%)     6 (4.5%)      15 (11.4%)  
        dcd B.1.1.1.1        11 (8.2%)     8 (6.0%)      11 (8.3%)   
        dcd B.2.1.2.1        11 (8.2%)     7 (5.2%)      19 (14.4%)  
        dcd C.2.1.2.1         5 (3.7%)     9 (6.7%)      17 (12.9%)  
        dcd D.1.1.1.1         9 (6.7%)     7 (5.2%)      10 (7.6%)   
        dcd D.1.1.4.2        11 (8.2%)    16 (11.9%)     12 (9.1%)   
        dcd D.2.1.5.3         9 (6.7%)    12 (9.0%)      14 (10.6%)  
      ———————————————————————————————————————————————————————————————
      
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
      FMQ (Narrow)           A: Drug X    B: Placebo   C: Combination
        Preferred Term        (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————
      Erectile Dysfunction                                           
        dcd A.1.1.1.1        13 (9.7%)     9 (6.7%)      19 (14.4%)  
        dcd A.1.1.1.2         9 (6.7%)     9 (6.7%)      13 (9.8%)   
        dcd B.1.1.1.1        10 (7.5%)    11 (8.2%)      14 (10.6%)  
        dcd B.2.1.2.1        11 (8.2%)    11 (8.2%)      18 (13.6%)  
        dcd C.2.1.2.1         7 (5.2%)     3 (2.2%)      13 (9.8%)   
        dcd D.1.1.1.1        19 (14.2%)    6 (4.5%)      16 (12.1%)  
        dcd D.1.1.4.2        11 (8.2%)     5 (3.7%)      14 (10.6%)  
        dcd D.2.1.5.3        13 (9.7%)     9 (6.7%)      12 (9.1%)   
      Gynecomastia                                                   
        dcd A.1.1.1.1         6 (4.5%)     8 (6.0%)      18 (13.6%)  
        dcd A.1.1.1.2        10 (7.5%)     6 (4.5%)      15 (11.4%)  
        dcd B.1.1.1.1        11 (8.2%)     8 (6.0%)      11 (8.3%)   
        dcd B.2.1.2.1        11 (8.2%)     7 (5.2%)      19 (14.4%)  
        dcd C.2.1.2.1         5 (3.7%)     9 (6.7%)      17 (12.9%)  
        dcd D.1.1.1.1         9 (6.7%)     7 (5.2%)      10 (7.6%)   
        dcd D.1.1.4.2        11 (8.2%)    16 (11.9%)     12 (9.1%)   
        dcd D.2.1.5.3         9 (6.7%)    12 (9.0%)      14 (10.6%)  

# Table 15 generation works with risk difference column

    Code
      res
    Output
      FMQ (Narrow)           A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
        Preferred Term        (N=134)      (N=134)        (N=132)                 (N=266)           
      ——————————————————————————————————————————————————————————————————————————————————————————————
      Erectile Dysfunction                                                                          
        dcd A.1.1.1.1        13 (9.7%)     9 (6.7%)      19 (14.4%)          -4.7 (-12.5 - 3.1)     
        dcd A.1.1.1.2         9 (6.7%)     9 (6.7%)      13 (9.8%)           -3.1 (-9.8 - 3.5)      
        dcd B.1.1.1.1        10 (7.5%)    11 (8.2%)      14 (10.6%)          -3.1 (-10.0 - 3.7)     
        dcd B.2.1.2.1        11 (8.2%)    11 (8.2%)      18 (13.6%)          -5.4 (-12.9 - 2.0)     
        dcd C.2.1.2.1         7 (5.2%)     3 (2.2%)      13 (9.8%)           -4.6 (-11.0 - 1.7)     
        dcd D.1.1.1.1        19 (14.2%)    6 (4.5%)      16 (12.1%)          2.1 (-6.1 - 10.2)      
        dcd D.1.1.4.2        11 (8.2%)     5 (3.7%)      14 (10.6%)          -2.4 (-9.4 - 4.6)      
        dcd D.2.1.5.3        13 (9.7%)     9 (6.7%)      12 (9.1%)            0.6 (-6.4 - 7.6)      
      Gynecomastia                                                                                  
        dcd A.1.1.1.1         6 (4.5%)     8 (6.0%)      18 (13.6%)         -9.2 (-16.0 - -2.3)     
        dcd A.1.1.1.2        10 (7.5%)     6 (4.5%)      15 (11.4%)          -3.9 (-10.9 - 3.1)     
        dcd B.1.1.1.1        11 (8.2%)     8 (6.0%)      11 (8.3%)           -0.1 (-6.7 - 6.5)      
        dcd B.2.1.2.1        11 (8.2%)     7 (5.2%)      19 (14.4%)          -6.2 (-13.8 - 1.4)     
        dcd C.2.1.2.1         5 (3.7%)     9 (6.7%)      17 (12.9%)         -9.1 (-15.7 - -2.6)     
        dcd D.1.1.1.1         9 (6.7%)     7 (5.2%)      10 (7.6%)           -0.9 (-7.1 - 5.3)      
        dcd D.1.1.4.2        11 (8.2%)    16 (11.9%)     12 (9.1%)           -0.9 (-7.6 - 5.9)      
        dcd D.2.1.5.3         9 (6.7%)    12 (9.0%)      14 (10.6%)          -3.9 (-10.6 - 2.9)     

