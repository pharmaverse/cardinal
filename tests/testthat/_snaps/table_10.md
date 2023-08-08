# Table 10 generation works with default values

    Code
      res
    Output
      Body System or Organ Class   A: Drug X    B: Placebo   C: Combination
        FMQ (Narrow)                (N=134)      (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————————————
      cl A.1                                                               
        FMQ1                       27 (20.1%)   17 (12.7%)     21 (15.9%)  
        FMQ2                       23 (17.2%)   17 (12.7%)     25 (18.9%)  
        FMQ3                       12 (9.0%)    22 (16.4%)     24 (18.2%)  
      cl B.1                                                               
        FMQ1                       12 (9.0%)     8 (6.0%)       8 (6.1%)   
        FMQ2                        9 (6.7%)    11 (8.2%)      11 (8.3%)   
        FMQ3                        8 (6.0%)     9 (6.7%)       9 (6.8%)   
      cl B.2                                                               
        FMQ1                        7 (5.2%)    10 (7.5%)      12 (9.1%)   
        FMQ2                        8 (6.0%)    13 (9.7%)      15 (11.4%)  
        FMQ3                       13 (9.7%)    10 (7.5%)       9 (6.8%)   
      cl C.2                                                               
        FMQ1                       11 (8.2%)    12 (9.0%)      10 (7.6%)   
        FMQ2                        5 (3.7%)    11 (8.2%)      10 (7.6%)   
        FMQ3                        7 (5.2%)     9 (6.7%)      13 (9.8%)   
      cl D.1                                                               
        FMQ1                       17 (12.7%)   13 (9.7%)      17 (12.9%)  
        FMQ2                       22 (16.4%)   13 (9.7%)      28 (21.2%)  
        FMQ3                       18 (13.4%)   14 (10.4%)     25 (18.9%)  
      cl D.2                                                               
        FMQ1                        6 (4.5%)    17 (12.7%)     14 (10.6%)  
        FMQ2                       14 (10.4%)    7 (5.2%)      10 (7.6%)   
        FMQ3                       12 (9.0%)     7 (5.2%)       9 (6.8%)   

# Table 10 generation works with custom values

    Code
      res
    Output
      Table 10. Patients With Serious Adverse Events(1) by System Organ Class and FDA Medical Query
       (Broad), Safety Population, Pooled Analyses(2)
      
      ———————————————————————————————————————————————————————————————————————
      Body System or Organ Class(3)   A: Drug X   B: Placebo   C: Combination
        FMQ (Broad)                    (N=134)     (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————————
      cl B.2                                                                 
        FMQ1                          13 (9.7%)    9 (6.7%)       8 (6.1%)   
        FMQ2                          9 (6.7%)    17 (12.7%)     12 (9.1%)   
        FMQ3                          9 (6.7%)    12 (9.0%)      10 (7.6%)   
      cl C.1                                                                 
        FMQ1                          11 (8.2%)    8 (6.0%)      10 (7.6%)   
        FMQ2                          9 (6.7%)    12 (9.0%)      15 (11.4%)  
        FMQ3                          4 (3.0%)    10 (7.5%)       6 (4.5%)   
      ———————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
       (1) Defined as any untoward medical occurrence that, at any dose that results in death, is life-threatening,
       requires hospitalization or prolongation of existing hospitalization, results in persistent incapacity or substantial
       disruption of the ability to conduct normal life functions, or is a congenital anomaly or birth defect.
       (2) Duration = [e.g., X-week double-blind treatment period or, median and a range indicating pooled trial
       durations].
       (3) Each FMQ is aligned to a single SOC based on clinical judgement. Howevere, please be aware that some FMQs
       may contain PTs from more than one SOC.
      
      Abbreviations: CI, confidence interval; FMQ, FDA Medical Query;
      MedDRA, Medical Dictionary for Regulatory Activities; N, number of patients in treatment arm;
      n, number of patients with adverse event; SOC, System Organ Class

