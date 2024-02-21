# Table 38 generation works with default values

    Code
      res
    Output
      Body System or Organ Class                                            
        FMQ (Broad)                 A: Drug X    B: Placebo   C: Combination
          Dictionary-Derived Term    (N=134)      (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————————————
      cl B.2                                                                
        FMQ1                        20 (14.9%)   17 (12.7%)     22 (16.7%)  
          dcd B.2.2.3.1             20 (14.9%)   17 (12.7%)     22 (16.7%)  
        FMQ2                        22 (16.4%)   25 (18.7%)     21 (15.9%)  
          dcd B.2.2.3.1             22 (16.4%)   25 (18.7%)     21 (15.9%)  
        FMQ3                        18 (13.4%)   24 (17.9%)     23 (17.4%)  
          dcd B.2.2.3.1             18 (13.4%)   24 (17.9%)     23 (17.4%)  
      cl C.1                                                                
        FMQ1                        14 (10.4%)   19 (14.2%)     21 (15.9%)  
          dcd C.1.1.1.3             14 (10.4%)   19 (14.2%)     21 (15.9%)  
        FMQ2                        17 (12.7%)   22 (16.4%)     19 (14.4%)  
          dcd C.1.1.1.3             17 (12.7%)   22 (16.4%)     19 (14.4%)  
        FMQ3                        20 (14.9%)   16 (11.9%)     19 (14.4%)  
          dcd C.1.1.1.3             20 (14.9%)   16 (11.9%)     19 (14.4%)  

# Table 38 generation works with custom values

    Code
      res
    Output
      Table 38. Patients With Adverse Events by System Organ Class, FDA Medical Query (Narrow)(1)
       and Preferred Term, Safety Population, Pooled Analysis (or Trial X)(2)
      
      ————————————————————————————————————————————————————————————————————————
      Body System or Organ Class(3)                                           
        FMQ (Narrow)                  A: Drug X    B: Placebo   C: Combination
          Dictionary-Derived Term      (N=134)      (N=134)        (N=132)    
      ————————————————————————————————————————————————————————————————————————
      cl A.1                                                                  
        FMQ1                          32 (23.9%)   29 (21.6%)     48 (36.4%)  
          dcd A.1.1.1.1               17 (12.7%)   13 (9.7%)      29 (22.0%)  
          dcd A.1.1.1.2               20 (14.9%)   20 (14.9%)     26 (19.7%)  
        FMQ2                          35 (26.1%)   40 (29.9%)     39 (29.5%)  
          dcd A.1.1.1.1               24 (17.9%)   25 (18.7%)     30 (22.7%)  
          dcd A.1.1.1.2               18 (13.4%)   18 (13.4%)     13 (9.8%)   
        FMQ3                          37 (27.6%)   39 (29.1%)     38 (28.8%)  
          dcd A.1.1.1.1               19 (14.2%)   18 (13.4%)     21 (15.9%)  
          dcd A.1.1.1.2               21 (15.7%)   23 (17.2%)     23 (17.4%)  
      cl B.1                                                                  
        FMQ1                          19 (14.2%)   21 (15.7%)     21 (15.9%)  
          dcd B.1.1.1.1               19 (14.2%)   21 (15.7%)     21 (15.9%)  
        FMQ2                          14 (10.4%)   21 (15.7%)     24 (18.2%)  
          dcd B.1.1.1.1               14 (10.4%)   21 (15.7%)     24 (18.2%)  
        FMQ3                          21 (15.7%)   16 (11.9%)     10 (7.6%)   
          dcd B.1.1.1.1               21 (15.7%)   16 (11.9%)     10 (7.6%)   
      cl B.2                                                                  
        FMQ1                          22 (16.4%)   22 (16.4%)     20 (15.2%)  
          dcd B.2.1.2.1               22 (16.4%)   22 (16.4%)     20 (15.2%)  
        FMQ2                          20 (14.9%)   15 (11.2%)     24 (18.2%)  
          dcd B.2.1.2.1               20 (14.9%)   15 (11.2%)     24 (18.2%)  
        FMQ3                          16 (11.9%)   17 (12.7%)     20 (15.2%)  
          dcd B.2.1.2.1               16 (11.9%)   17 (12.7%)     20 (15.2%)  
      cl C.2                                                                  
        FMQ1                          17 (12.7%)   15 (11.2%)     23 (17.4%)  
          dcd C.2.1.2.1               17 (12.7%)   15 (11.2%)     23 (17.4%)  
        FMQ2                          12 (9.0%)    19 (14.2%)     19 (14.4%)  
          dcd C.2.1.2.1               12 (9.0%)    19 (14.2%)     19 (14.4%)  
        FMQ3                          12 (9.0%)    16 (11.9%)     19 (14.4%)  
          dcd C.2.1.2.1               12 (9.0%)    16 (11.9%)     19 (14.4%)  
      cl D.1                                                                  
        FMQ1                          37 (27.6%)   30 (22.4%)     44 (33.3%)  
          dcd D.1.1.1.1               18 (13.4%)   17 (12.7%)     21 (15.9%)  
          dcd D.1.1.4.2               23 (17.2%)   15 (11.2%)     25 (18.9%)  
        FMQ2                          35 (26.1%)   33 (24.6%)     40 (30.3%)  
          dcd D.1.1.1.1               22 (16.4%)   18 (13.4%)     26 (19.7%)  
          dcd D.1.1.4.2               18 (13.4%)   16 (11.9%)     18 (13.6%)  
        FMQ3                          30 (22.4%)   28 (20.9%)     37 (28.0%)  
          dcd D.1.1.1.1               15 (11.2%)   13 (9.7%)      19 (14.4%)  
          dcd D.1.1.4.2               16 (11.9%)   18 (13.4%)     18 (13.6%)  
      cl D.2                                                                  
        FMQ1                          17 (12.7%)   27 (20.1%)     22 (16.7%)  
          dcd D.2.1.5.3               17 (12.7%)   27 (20.1%)     22 (16.7%)  
        FMQ2                          25 (18.7%)   21 (15.7%)     24 (18.2%)  
          dcd D.2.1.5.3               25 (18.7%)   21 (15.7%)     24 (18.2%)  
        FMQ3                          13 (9.7%)    20 (14.9%)     19 (14.4%)  
          dcd D.2.1.5.3               13 (9.7%)    20 (14.9%)     19 (14.4%)  
      ————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used]
       (1) Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled trial durations].
       (2) Treatment-emergent adverse event defined as [definition]. MedDRA version X.
       (3) Each FMQ is aligned to a single SOC based on clinical judgment. However,
       please be aware that some FMQs may contain PTs from more than one SOC.
      
      Abbreviations: CI, confidence interval; FMQ, FDA Medical Query; N, number of patients in treatment arm;
      n, number of patients with at least one event; SOC, System Organ Class

# Table 38 generation works with risk difference column

    Code
      res
    Output
      Body System or Organ Class                                                                           
        FMQ (Broad)                 A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
          Dictionary-Derived Term    (N=134)      (N=134)        (N=132)                 (N=268)           
      —————————————————————————————————————————————————————————————————————————————————————————————————————
      cl B.2                                                                                               
        FMQ1                        20 (14.9%)   17 (12.7%)     22 (16.7%)          -2.2 (-10.5 - 6.0)     
          dcd B.2.2.3.1             20 (14.9%)   17 (12.7%)     22 (16.7%)          -2.2 (-10.5 - 6.0)     
        FMQ2                        22 (16.4%)   25 (18.7%)     21 (15.9%)          2.2 (-6.9 - 11.3)      
          dcd B.2.2.3.1             22 (16.4%)   25 (18.7%)     21 (15.9%)          2.2 (-6.9 - 11.3)      
        FMQ3                        18 (13.4%)   24 (17.9%)     23 (17.4%)          4.5 (-4.2 - 13.2)      
          dcd B.2.2.3.1             18 (13.4%)   24 (17.9%)     23 (17.4%)          4.5 (-4.2 - 13.2)      
      cl C.1                                                                                               
        FMQ1                        14 (10.4%)   19 (14.2%)     21 (15.9%)          3.7 (-4.1 - 11.6)      
          dcd C.1.1.1.3             14 (10.4%)   19 (14.2%)     21 (15.9%)          3.7 (-4.1 - 11.6)      
        FMQ2                        17 (12.7%)   22 (16.4%)     19 (14.4%)          3.7 (-4.7 - 12.2)      
          dcd C.1.1.1.3             17 (12.7%)   22 (16.4%)     19 (14.4%)          3.7 (-4.7 - 12.2)      
        FMQ3                        20 (14.9%)   16 (11.9%)     19 (14.4%)          -3.0 (-11.1 - 5.2)     
          dcd C.1.1.1.3             20 (14.9%)   16 (11.9%)     19 (14.4%)          -3.0 (-11.1 - 5.2)     

