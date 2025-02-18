# Table 10 generation(rtables) works with default values, BROAD

    Code
      res
    Output
      Body System or Organ Class   A: Drug X   B: Placebo   C: Combination
        FMQ (Broad)                 (N=134)     (N=134)        (N=132)    
      ————————————————————————————————————————————————————————————————————
      cl B.2                                                              
        FMQ1                       8 (6.0%)    10 (7.5%)       8 (6.1%)   
        FMQ2                       12 (9.0%)   12 (9.0%)      13 (9.8%)   
        FMQ3                       8 (6.0%)    16 (11.9%)      6 (4.5%)   
      cl C.1                                                              
        FMQ1                       7 (5.2%)    11 (8.2%)      14 (10.6%)  
        FMQ2                       10 (7.5%)   16 (11.9%)      7 (5.3%)   
        FMQ3                       8 (6.0%)     5 (3.7%)      12 (9.1%)   

# Table 10 generation(rtables) works with default values

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
        FMQ1                          8 (6.0%)    10 (7.5%)       8 (6.1%)   
        FMQ2                          12 (9.0%)   12 (9.0%)      13 (9.8%)   
        FMQ3                          8 (6.0%)    16 (11.9%)      6 (4.5%)   
      cl C.1                                                                 
        FMQ1                          7 (5.2%)    11 (8.2%)      14 (10.6%)  
        FMQ2                          10 (7.5%)   16 (11.9%)      7 (5.3%)   
        FMQ3                          8 (6.0%)     5 (3.7%)      12 (9.1%)   
      ———————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
       (1) Defined as any untoward medical occurrence that, at any dose that results in death, is life-threatening,
       requires hospitalization or prolongation of existing hospitalization, results in persistent incapacity or substantial
       disruption of the ability to conduct normal life functions, or is a congenital anomaly or birth defect.
       (2) Duration = [e.g., X-week double-blind treatment period or, median and a range indicating pooled trial
       durations].
       (3) Each FMQ is aligned to a single SOC based on clinical judgement. However, please be aware that some FMQs
       may contain PTs from more than one SOC.
      
      Abbreviations: CI, confidence interval; FMQ, FDA Medical Query;
      MedDRA, Medical Dictionary for Regulatory Activities; N, number of patients in treatment arm;
      n, number of patients with adverse event; SOC, System Organ Class

# Table 10 generation (rtables) works with risk difference column

    Code
      res
    Output
      Body System or Organ Class   A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
        FMQ (Narrow)                (N=134)      (N=134)        (N=132)                 (N=268)           
      ————————————————————————————————————————————————————————————————————————————————————————————————————
      cl A.1                                                                                              
        FMQ1                       17 (12.7%)   14 (10.4%)     29 (22.0%)          -2.2 (-9.9 - 5.4)      
        FMQ2                       23 (17.2%)   20 (14.9%)     20 (15.2%)          -2.2 (-11.0 - 6.5)     
        FMQ3                       20 (14.9%)   19 (14.2%)     23 (17.4%)          -0.7 (-9.2 - 7.7)      
      cl B.1                                                                                              
        FMQ1                        8 (6.0%)    11 (8.2%)       7 (5.3%)            2.2 (-3.9 - 8.4)      
        FMQ2                        5 (3.7%)    12 (9.0%)      16 (12.1%)          5.2 (-0.6 - 11.0)      
        FMQ3                       10 (7.5%)     7 (5.2%)       5 (3.8%)           -2.2 (-8.1 - 3.6)      
      cl B.2                                                                                              
        FMQ1                       13 (9.7%)    15 (11.2%)      9 (6.8%)            1.5 (-5.8 - 8.8)      
        FMQ2                       12 (9.0%)     9 (6.7%)      10 (7.6%)           -2.2 (-8.7 - 4.2)      
        FMQ3                        6 (4.5%)     7 (5.2%)       9 (6.8%)            0.7 (-4.4 - 5.9)      
      cl C.2                                                                                              
        FMQ1                        9 (6.7%)     9 (6.7%)      12 (9.1%)            0.0 (-6.0 - 6.0)      
        FMQ2                        6 (4.5%)     8 (6.0%)       8 (6.1%)            1.5 (-3.8 - 6.8)      
        FMQ3                        6 (4.5%)     9 (6.7%)      10 (7.6%)            2.2 (-3.3 - 7.7)      
      cl D.1                                                                                              
        FMQ1                       23 (17.2%)   17 (12.7%)     27 (20.5%)          -4.5 (-13.0 - 4.0)     
        FMQ2                       22 (16.4%)   20 (14.9%)     25 (18.9%)          -1.5 (-10.2 - 7.2)     
        FMQ3                       15 (11.2%)   19 (14.2%)     21 (15.9%)          3.0 (-5.0 - 10.9)      
      cl D.2                                                                                              
        FMQ1                        8 (6.0%)    11 (8.2%)       9 (6.8%)            2.2 (-3.9 - 8.4)      
        FMQ2                       14 (10.4%)   15 (11.2%)     14 (10.6%)           0.7 (-6.7 - 8.2)      
        FMQ3                       11 (8.2%)     9 (6.7%)      11 (8.3%)           -1.5 (-7.8 - 4.8)      

