# Table 34 generation works with default values

    Code
      res
    Output
      Body System or Organ Class   A: Drug X    B: Placebo   C: Combination
        FMQ (Narrow)                (N=134)      (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————————————
      cl A.1                                                               
        FMQ1                                                               
          trm A.1.1.1.1             7 (5.2%)     6 (4.5%)      13 (9.8%)   
          trm A.1.1.1.2            12 (9.0%)     8 (6.0%)      18 (13.6%)  
        FMQ2                                                               
          trm A.1.1.1.1            13 (9.7%)    10 (7.5%)      12 (9.1%)   
          trm A.1.1.1.2            12 (9.0%)    10 (7.5%)       8 (6.1%)   
        FMQ3                                                               
          trm A.1.1.1.1             8 (6.0%)     8 (6.0%)      13 (9.8%)   
          trm A.1.1.1.2            13 (9.7%)    11 (8.2%)      11 (8.3%)   
      cl B.1                                                               
        FMQ1                                                               
          trm B.1.1.1.1             8 (6.0%)    11 (8.2%)       7 (5.3%)   
        FMQ2                                                               
          trm B.1.1.1.1             5 (3.7%)    12 (9.0%)      16 (12.1%)  
        FMQ3                                                               
          trm B.1.1.1.1            10 (7.5%)     7 (5.2%)       5 (3.8%)   
      cl B.2                                                               
        FMQ1                                                               
          trm B.2.1.2.1            13 (9.7%)    15 (11.2%)      9 (6.8%)   
        FMQ2                                                               
          trm B.2.1.2.1            12 (9.0%)     9 (6.7%)      10 (7.6%)   
        FMQ3                                                               
          trm B.2.1.2.1             6 (4.5%)     7 (5.2%)       9 (6.8%)   
      cl C.2                                                               
        FMQ1                                                               
          trm C.2.1.2.1             9 (6.7%)     9 (6.7%)      12 (9.1%)   
        FMQ2                                                               
          trm C.2.1.2.1             6 (4.5%)     8 (6.0%)       8 (6.1%)   
        FMQ3                                                               
          trm C.2.1.2.1             6 (4.5%)     9 (6.7%)      10 (7.6%)   
      cl D.1                                                               
        FMQ1                                                               
          trm D.1.1.1.1             9 (6.7%)     9 (6.7%)      12 (9.1%)   
          trm D.1.1.4.2            14 (10.4%)   10 (7.5%)      16 (12.1%)  
        FMQ2                                                               
          trm D.1.1.1.1            15 (11.2%)   10 (7.5%)      16 (12.1%)  
          trm D.1.1.4.2            10 (7.5%)    10 (7.5%)      10 (7.6%)   
        FMQ3                                                               
          trm D.1.1.1.1             9 (6.7%)    10 (7.5%)      12 (9.1%)   
          trm D.1.1.4.2             6 (4.5%)    11 (8.2%)       9 (6.8%)   
      cl D.2                                                               
        FMQ1                                                               
          trm D.2.1.5.3             8 (6.0%)    11 (8.2%)       9 (6.8%)   
        FMQ2                                                               
          trm D.2.1.5.3            14 (10.4%)   15 (11.2%)     14 (10.6%)  
        FMQ3                                                               
          trm D.2.1.5.3            11 (8.2%)     9 (6.7%)      11 (8.3%)   

# Table 34 generation works with custom values

    Code
      res
    Output
      Table 34. Patients With Serious Adverse Events(1) by System Organ Class, FDA Medical Query (Broad) and Preferred Term, Safety Population, Pooled Analyses or Trial X(2)
      
      ——————————————————————————————————————————————————————————————————————————
      Body System or Organ Class(3)(4)   A: Drug X   B: Placebo   C: Combination
        FMQ (Broad)                       (N=134)     (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————————————————
      cl B.2                                                                    
        FMQ1                                                                    
          trm B.2.2.3.1                  8 (6.0%)    10 (7.5%)       8 (6.1%)   
        FMQ2                                                                    
          trm B.2.2.3.1                  12 (9.0%)   12 (9.0%)      13 (9.8%)   
        FMQ3                                                                    
          trm B.2.2.3.1                  8 (6.0%)    16 (11.9%)      6 (4.5%)   
      cl C.1                                                                    
        FMQ1                                                                    
          trm C.1.1.1.3                  7 (5.2%)    11 (8.2%)      14 (10.6%)  
        FMQ2                                                                    
          trm C.1.1.1.3                  10 (7.5%)   16 (11.9%)      7 (5.3%)   
        FMQ3                                                                    
          trm C.1.1.1.3                  8 (6.0%)     5 (3.7%)      12 (9.1%)   
      ——————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used
       (1) Defined as any untoward medical occurrence that, at any dose that results in death, is life-threatening, requires hospitalization or prolongation of existing
       hospitalization, results in persistent incapacity or substantial disruption of the ability to conduct normal life functions, or is a congenital anomaly, or birth defect.
       (2) Duration = [e.g., X-week double-blind treatment period or, median and a range indicating pooled trial durations].
       (3) Treatment-emergent adverse event defined as [definition].
       (4) Each FMQ is aligned to a single SOC based on clinical judgement. However, please be aware that some FMQs may contain PTs from more than one SOC.
      
      Abbreviations: CI, confidence interval; FMQ, FDA Medical Query; N, number of patients in treatment arm;
      n, number of patients with at least one event; SOC, System Organ Class

# Table 34 generation works with risk difference column

    Code
      res
    Output
      Body System or Organ Class   A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
        FMQ (Narrow)                (N=134)      (N=134)        (N=132)                 (N=268)           
      ————————————————————————————————————————————————————————————————————————————————————————————————————
      cl A.1                                                                                              
        FMQ1                                                                                              
          trm A.1.1.1.1             7 (5.2%)     6 (4.5%)      13 (9.8%)           -0.7 (-5.9 - 4.4)      
          trm A.1.1.1.2            12 (9.0%)     8 (6.0%)      18 (13.6%)          -3.0 (-9.3 - 3.3)      
        FMQ2                                                                                              
          trm A.1.1.1.1            13 (9.7%)    10 (7.5%)      12 (9.1%)           -2.2 (-8.9 - 4.5)      
          trm A.1.1.1.2            12 (9.0%)    10 (7.5%)       8 (6.1%)           -1.5 (-8.1 - 5.1)      
        FMQ3                                                                                              
          trm A.1.1.1.1             8 (6.0%)     8 (6.0%)      13 (9.8%)            0.0 (-5.7 - 5.7)      
          trm A.1.1.1.2            13 (9.7%)    11 (8.2%)      11 (8.3%)           -1.5 (-8.3 - 5.3)      
      cl B.1                                                                                              
        FMQ1                                                                                              
          trm B.1.1.1.1             8 (6.0%)    11 (8.2%)       7 (5.3%)            2.2 (-3.9 - 8.4)      
        FMQ2                                                                                              
          trm B.1.1.1.1             5 (3.7%)    12 (9.0%)      16 (12.1%)          5.2 (-0.6 - 11.0)      
        FMQ3                                                                                              
          trm B.1.1.1.1            10 (7.5%)     7 (5.2%)       5 (3.8%)           -2.2 (-8.1 - 3.6)      
      cl B.2                                                                                              
        FMQ1                                                                                              
          trm B.2.1.2.1            13 (9.7%)    15 (11.2%)      9 (6.8%)            1.5 (-5.8 - 8.8)      
        FMQ2                                                                                              
          trm B.2.1.2.1            12 (9.0%)     9 (6.7%)      10 (7.6%)           -2.2 (-8.7 - 4.2)      
        FMQ3                                                                                              
          trm B.2.1.2.1             6 (4.5%)     7 (5.2%)       9 (6.8%)            0.7 (-4.4 - 5.9)      
      cl C.2                                                                                              
        FMQ1                                                                                              
          trm C.2.1.2.1             9 (6.7%)     9 (6.7%)      12 (9.1%)            0.0 (-6.0 - 6.0)      
        FMQ2                                                                                              
          trm C.2.1.2.1             6 (4.5%)     8 (6.0%)       8 (6.1%)            1.5 (-3.8 - 6.8)      
        FMQ3                                                                                              
          trm C.2.1.2.1             6 (4.5%)     9 (6.7%)      10 (7.6%)            2.2 (-3.3 - 7.7)      
      cl D.1                                                                                              
        FMQ1                                                                                              
          trm D.1.1.1.1             9 (6.7%)     9 (6.7%)      12 (9.1%)            0.0 (-6.0 - 6.0)      
          trm D.1.1.4.2            14 (10.4%)   10 (7.5%)      16 (12.1%)          -3.0 (-9.8 - 3.8)      
        FMQ2                                                                                              
          trm D.1.1.1.1            15 (11.2%)   10 (7.5%)      16 (12.1%)          -3.7 (-10.7 - 3.2)     
          trm D.1.1.4.2            10 (7.5%)    10 (7.5%)      10 (7.6%)            0.0 (-6.3 - 6.3)      
        FMQ3                                                                                              
          trm D.1.1.1.1             9 (6.7%)    10 (7.5%)      12 (9.1%)            0.7 (-5.4 - 6.9)      
          trm D.1.1.4.2             6 (4.5%)    11 (8.2%)       9 (6.8%)            3.7 (-2.1 - 9.6)      
      cl D.2                                                                                              
        FMQ1                                                                                              
          trm D.2.1.5.3             8 (6.0%)    11 (8.2%)       9 (6.8%)            2.2 (-3.9 - 8.4)      
        FMQ2                                                                                              
          trm D.2.1.5.3            14 (10.4%)   15 (11.2%)     14 (10.6%)           0.7 (-6.7 - 8.2)      
        FMQ3                                                                                              
          trm D.2.1.5.3            11 (8.2%)     9 (6.7%)      11 (8.3%)           -1.5 (-7.8 - 4.8)      

