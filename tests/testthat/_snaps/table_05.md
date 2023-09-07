# Table 05 generation works with default values

    Code
      res
    Output
                                               A: Drug X                B: Placebo             C: Combination    
      Parameter                                 (N=134)                  (N=134)                  (N=132)        
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
      Duration of Treatment, days                                                                                
        Mean (SD)                           199.58 (115.07)          199.74 (108.12)          195.78 (122.03)    
        Median (min - max)               205.50 (2.00 - 394.00)   198.50 (1.00 - 389.00)   201.00 (0.00 - 399.00)
        Interquartile range                 102.00 - 299.00          106.25 - 298.75           89.50 - 303.25    
        Total exposure (person years)       26744.00 (73.22)         26765.00 (73.28)         25843.00 (70.75)   
      Patients Treated, by duration                                                                              
        Any duration (at least 1 dose)         134 (100%)               134 (100%)              130 (98.5%)      
        <1 month                                6 (4.5%)                 5 (3.7%)                15 (11.4%)      
        >=1 month                             128 (95.5%)              129 (96.3%)              117 (88.6%)      
        >=3 months                            102 (76.1%)              107 (79.9%)               99 (75.0%)      
        >=6 months                             70 (52.2%)               72 (53.7%)               70 (53.0%)      
        >=12 months                            11 (8.2%)                 6 (4.5%)                 9 (6.8%)       

# Table 05 generation works with custom values

    Code
      res
    Output
      Table 5. Duration of Treatment Exposure, Safety Population, Pooled Analyses*
      
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      Parameter                                                                                               Total       
                                             A: Drug X            B: Placebo         C: Combination         Population    
                                              (N=134)              (N=134)              (N=132)              (N=400)      
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      Duration of Treatment, years                                                                                        
        Mean (SD)                           0.55 (0.32)          0.55 (0.30)          0.54 (0.33)          0.54 (0.31)    
        Median (min - max)               0.56 (0.01 - 1.08)   0.54 (0.00 - 1.07)   0.55 (0.00 - 1.09)   0.55 (0.00 - 1.09)
        Interquartile range                 0.28 - 0.82          0.29 - 0.82          0.25 - 0.83          0.28 - 0.82    
        Total exposure (person years)      73.22 (73.22)        73.28 (73.28)        70.75 (70.75)       217.25 (217.25)  
      Patients Treated, by duration                                                                                       
        Any duration (at least 1 dose)       134 (100%)           134 (100%)          130 (98.5%)          398 (99.5%)    
        <1 month                              6 (4.5%)             5 (3.7%)            15 (11.4%)           26 (6.5%)     
        >=1 month                           128 (95.5%)          129 (96.3%)          117 (88.6%)          374 (93.5%)    
        >=3 months                          102 (76.1%)          107 (79.9%)           99 (75.0%)          308 (77.0%)    
        >=6 months                           70 (52.2%)           72 (53.7%)           70 (53.0%)          212 (53.0%)    
        >=12 months                          11 (8.2%)             6 (4.5%)             9 (6.8%)            26 (6.5%)     
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      * Duration = [e.g., X-week double-blind treatment period or median and a range indicating pooled trial durations].
      
      Abbreviations: CI, confidence interval; N, number of patients in treatment arm;
        n, number of patients with given treatment duration; NA, not applicable; SD, standard deviation

# Table 05 generation works with NA values/pruned rows

    Code
      res
    Output
                                               A: Drug X               B: Placebo            C: Combination    
      Parameter                                 (N=134)                 (N=134)                  (N=132)       
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      Duration of Treatment, days                                                                              
        Mean (SD)                            92.42 (47.05)           98.56 (47.83)            81.82 (52.92)    
        Median (min - max)               96.00 (2.00 - 180.00)   104.00 (1.00 - 178.00)   77.00 (0.00 - 171.00)
        Interquartile range                 49.75 - 129.00           57.50 - 133.50          32.75 - 124.50    
        Total exposure (person years)       5915.00 (16.19)         6111.00 (16.73)          5073.00 (13.89)   
      Patients Treated, by duration                                                                            
        Any duration (at least 1 dose)        64 (47.8%)               62 (46.3%)              60 (45.5%)      
        <1 month                               6 (4.5%)                 5 (3.7%)               15 (11.4%)      
        >=1 month                             58 (43.3%)               57 (42.5%)              47 (35.6%)      
        >=3 months                            32 (23.9%)               35 (26.1%)              29 (22.0%)      
        >=6 months                                 0                       0                        0          
        >=12 months                                0                       0                        0          

---

    Code
      res
    Output
                                               A: Drug X               B: Placebo            C: Combination    
      Parameter                                 (N=134)                 (N=134)                  (N=132)       
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      Duration of Treatment, days                                                                              
        Mean (SD)                            92.42 (47.05)           98.56 (47.83)            81.82 (52.92)    
        Median (min - max)               96.00 (2.00 - 180.00)   104.00 (1.00 - 178.00)   77.00 (0.00 - 171.00)
        Interquartile range                 49.75 - 129.00           57.50 - 133.50          32.75 - 124.50    
        Total exposure (person years)       5915.00 (16.19)         6111.00 (16.73)          5073.00 (13.89)   
      Patients Treated, by duration                                                                            
        Any duration (at least 1 dose)        64 (47.8%)               62 (46.3%)              60 (45.5%)      
        <1 month                               6 (4.5%)                 5 (3.7%)               15 (11.4%)      
        >=1 month                             58 (43.3%)               57 (42.5%)              47 (35.6%)      
        >=3 months                            32 (23.9%)               35 (26.1%)              29 (22.0%)      

# Table 05 generation works with risk difference column

    Code
      res
    Output
                                               A: Drug X                B: Placebo             C: Combination       Risk Difference (%) (95% CI)
      Parameter                                 (N=134)                  (N=134)                  (N=132)                     (N=268)           
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      Duration of Treatment, days                                                                                                               
        Mean (SD)                           199.58 (115.07)          199.74 (108.12)          195.78 (122.03)                    NA             
        Median (min - max)               205.50 (2.00 - 394.00)   198.50 (1.00 - 389.00)   201.00 (0.00 - 399.00)                NA             
        Interquartile range                 102.00 - 299.00          106.25 - 298.75           89.50 - 303.25                    NA             
        Total exposure (person years)       26744.00 (73.22)         26765.00 (73.28)         25843.00 (70.75)                   NA             
      Patients Treated, by duration                                                                                                             
        Any duration (at least 1 dose)         134 (100%)               134 (100%)              130 (98.5%)               0.0 (0.0 - 0.0)       
        <1 month                                6 (4.5%)                 5 (3.7%)                15 (11.4%)              -0.7 (-5.5 - 4.0)      
        >=1 month                             128 (95.5%)              129 (96.3%)              117 (88.6%)               0.7 (-4.0 - 5.5)      
        >=3 months                            102 (76.1%)              107 (79.9%)               99 (75.0%)              3.7 (-6.2 - 13.6)      
        >=6 months                             70 (52.2%)               72 (53.7%)               70 (53.0%)              1.5 (-10.5 - 13.4)     
        >=12 months                            11 (8.2%)                 6 (4.5%)                 9 (6.8%)               -3.7 (-9.6 - 2.1)      

