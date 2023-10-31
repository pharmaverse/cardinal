# Table 14 generation works with default values

    Code
      res
    Output
      Body System or Organ Class                    BROAD                                      NARROW                 
        FMQ                        A: Drug X    B: Placebo   C: Combination   A: Drug X    B: Placebo   C: Combination
                                    (N=119)      (N=139)        (N=141)        (N=490)      (N=483)        (N=562)    
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      cl A.1                                                                                                          
        C.1.1.1.3/B.2.2.3.1 AESI       0            0              0              0            0              0       
        <Missing>                      0            0              0          78 (15.9%)   75 (15.5%)     89 (15.8%)  
      cl B.1                                                                                                          
        C.1.1.1.3/B.2.2.3.1 AESI       0            0              0              0            0              0       
        <Missing>                      0            0              0          47 (9.6%)    49 (10.1%)     43 (7.7%)   
      cl B.2                                                                                                          
        C.1.1.1.3/B.2.2.3.1 AESI   48 (40.3%)   54 (38.8%)     51 (36.2%)         0            0              0       
        <Missing>                      0            0              0          49 (10.0%)   44 (9.1%)      52 (9.3%)   
      cl C.1                                                                                                          
        C.1.1.1.3/B.2.2.3.1 AESI   43 (36.1%)   46 (33.1%)     43 (30.5%)         0            0              0       
        <Missing>                      0            0              0              0            0              0       
      cl C.2                                                                                                          
        C.1.1.1.3/B.2.2.3.1 AESI       0            0              0              0            0              0       
        <Missing>                      0            0              0          35 (7.1%)    48 (9.9%)      55 (9.8%)   
      cl D.1                                                                                                          
        C.1.1.1.3/B.2.2.3.1 AESI       0            0              0              0            0              0       
        <Missing>                      0            0              0          79 (16.1%)   67 (13.9%)     80 (14.2%)  
      cl D.2                                                                                                          
        C.1.1.1.3/B.2.2.3.1 AESI       0            0              0              0            0              0       
        <Missing>                      0            0              0          47 (9.6%)    58 (12.0%)     57 (10.1%)  

# Table 14 generation works with custom values

    Code
      res
    Output
      Table 14. Patients With Adverse Events(1) by System Organ Class and FDA Medical Query, Safety Population, Pooled Analyses(2)
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      Body System or Organ Class(3)                    BROAD                                      NARROW                 
        FMQ                           A: Drug X    B: Placebo   C: Combination   A: Drug X    B: Placebo   C: Combination
                                       (N=119)      (N=139)        (N=141)        (N=490)      (N=483)        (N=562)    
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      cl A.1                                                                                                             
        C.1.1.1.3/B.2.2.3.1 AESI          0            0              0              0            0              0       
        <Missing>                         0            0              0          78 (15.9%)   75 (15.5%)     89 (15.8%)  
      cl B.1                                                                                                             
        C.1.1.1.3/B.2.2.3.1 AESI          0            0              0              0            0              0       
        <Missing>                         0            0              0          47 (9.6%)    49 (10.1%)     43 (7.7%)   
      cl B.2                                                                                                             
        C.1.1.1.3/B.2.2.3.1 AESI      48 (40.3%)   54 (38.8%)     51 (36.2%)         0            0              0       
        <Missing>                         0            0              0          49 (10.0%)   44 (9.1%)      52 (9.3%)   
      cl C.1                                                                                                             
        C.1.1.1.3/B.2.2.3.1 AESI      43 (36.1%)   46 (33.1%)     43 (30.5%)         0            0              0       
        <Missing>                         0            0              0              0            0              0       
      cl C.2                                                                                                             
        C.1.1.1.3/B.2.2.3.1 AESI          0            0              0              0            0              0       
        <Missing>                         0            0              0          35 (7.1%)    48 (9.9%)      55 (9.8%)   
      cl D.1                                                                                                             
        C.1.1.1.3/B.2.2.3.1 AESI          0            0              0              0            0              0       
        <Missing>                         0            0              0          79 (16.1%)   67 (13.9%)     80 (14.2%)  
      cl D.2                                                                                                             
        C.1.1.1.3/B.2.2.3.1 AESI          0            0              0              0            0              0       
        <Missing>                         0            0              0          47 (9.6%)    58 (12.0%)     57 (10.1%)  
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used
       (1) Treatment-emergent AE defined as [definition]. MedDRA version X.
       (2) Duration = [e.g., X-week double-blind treatment period or, median and a range indicating pooled trial durations].
       (3) Each FMQ is aligned to a single SOC based on clinical judgement. However, please beaware that some FMQs may contain PTs from more than one SOC.
      
      Abbreviations: CI, confidence interval; FMQ, FDA Medical Query;
      MedDRA, Medical Dictionary for Regulatory Activities; N, number of patients in treatment arm;
      n, number of patients with at least one event; SOC, System Organ Class

# Table 14 generation works with NA values/pruned rows

    Code
      res
    Output
      Body System or Organ Class                    BROAD                                      NARROW                 
        FMQ                        A: Drug X    B: Placebo   C: Combination   A: Drug X    B: Placebo   C: Combination
                                    (N=119)      (N=139)        (N=141)        (N=490)      (N=483)        (N=562)    
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      cl A.1                                                                                                          
        <Missing>                      0            0              0          78 (15.9%)   75 (15.5%)     89 (15.8%)  
      cl B.1                                                                                                          
        <Missing>                      0            0              0          47 (9.6%)    49 (10.1%)     43 (7.7%)   
      cl B.2                                                                                                          
        C.1.1.1.3/B.2.2.3.1 AESI   48 (40.3%)   54 (38.8%)     51 (36.2%)         0            0              0       
        <Missing>                      0            0              0          49 (10.0%)   44 (9.1%)      52 (9.3%)   
      cl C.1                                                                                                          
        C.1.1.1.3/B.2.2.3.1 AESI   43 (36.1%)   46 (33.1%)     43 (30.5%)         0            0              0       
      cl C.2                                                                                                          
        <Missing>                      0            0              0          35 (7.1%)    48 (9.9%)      55 (9.8%)   
      cl D.1                                                                                                          
        <Missing>                      0            0              0          79 (16.1%)   67 (13.9%)     80 (14.2%)  
      cl D.2                                                                                                          
        <Missing>                      0            0              0          47 (9.6%)    58 (12.0%)     57 (10.1%)  

# Table 14 generation works with risk difference column

    Code
      res
    Output
      Body System or Organ Class                                    BROAD                                                                    NARROW                                 
        FMQ                        A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)   A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
                                    (N=119)      (N=139)        (N=141)                 (N=258)               (N=490)      (N=483)        (N=562)                 (N=973)           
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      cl A.1                                                                                                                                                                        
        C.1.1.1.3/B.2.2.3.1 AESI       0            0              0                0.0 (0.0 - 0.0)              0            0              0                0.0 (0.0 - 0.0)       
        <Missing>                      0            0              0                0.0 (0.0 - 0.0)          78 (15.9%)   75 (15.5%)     89 (15.8%)          -0.4 (-5.0 - 4.2)      
      cl B.1                                                                                                                                                                        
        C.1.1.1.3/B.2.2.3.1 AESI       0            0              0                0.0 (0.0 - 0.0)              0            0              0                0.0 (0.0 - 0.0)       
        <Missing>                      0            0              0                0.0 (0.0 - 0.0)          47 (9.6%)    49 (10.1%)     43 (7.7%)            0.6 (-3.2 - 4.3)      
      cl B.2                                                                                                                                                                        
        C.1.1.1.3/B.2.2.3.1 AESI   48 (40.3%)   54 (38.8%)     51 (36.2%)         -1.5 (-13.5 - 10.5)            0            0              0                0.0 (0.0 - 0.0)       
        <Missing>                      0            0              0                0.0 (0.0 - 0.0)          49 (10.0%)   44 (9.1%)      52 (9.3%)           -0.9 (-4.6 - 2.8)      
      cl C.1                                                                                                                                                                        
        C.1.1.1.3/B.2.2.3.1 AESI   43 (36.1%)   46 (33.1%)     43 (30.5%)          -3.0 (-14.7 - 8.6)            0            0              0                0.0 (0.0 - 0.0)       
        <Missing>                      0            0              0                0.0 (0.0 - 0.0)              0            0              0                0.0 (0.0 - 0.0)       
      cl C.2                                                                                                                                                                        
        C.1.1.1.3/B.2.2.3.1 AESI       0            0              0                0.0 (0.0 - 0.0)              0            0              0                0.0 (0.0 - 0.0)       
        <Missing>                      0            0              0                0.0 (0.0 - 0.0)          35 (7.1%)    48 (9.9%)      55 (9.8%)            2.8 (-0.7 - 6.3)      
      cl D.1                                                                                                                                                                        
        C.1.1.1.3/B.2.2.3.1 AESI       0            0              0                0.0 (0.0 - 0.0)              0            0              0                0.0 (0.0 - 0.0)       
        <Missing>                      0            0              0                0.0 (0.0 - 0.0)          79 (16.1%)   67 (13.9%)     80 (14.2%)          -2.3 (-6.7 - 2.2)      
      cl D.2                                                                                                                                                                        
        C.1.1.1.3/B.2.2.3.1 AESI       0            0              0                0.0 (0.0 - 0.0)              0            0              0                0.0 (0.0 - 0.0)       
        <Missing>                      0            0              0                0.0 (0.0 - 0.0)          47 (9.6%)    58 (12.0%)     57 (10.1%)           2.4 (-1.5 - 6.3)      

