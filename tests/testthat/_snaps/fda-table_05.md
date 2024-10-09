# Table 05 generation works with default values

    Code
      as.data.frame(res$table)
    Output
                          **Parameter** **A: Drug X**  \nN = 134 **B: Placebo**  \nN = 134 **C: Combination**  \nN = 132
      1     Duration of Treatment, days                     <NA>                      <NA>                          <NA>
      2                       Mean (SD)          199.58 (115.07)           199.74 (108.12)               195.78 (122.03)
      3               Median (Min, Max)    205.50 (2.00, 394.00)     198.50 (1.00, 389.00)         201.00 (0.00, 399.00)
      4             Interquartile range          102.00 - 299.00           106.25 - 298.75                89.50 - 303.25
      5   Total exposure (person years)        26,744.00 (73.22)         26,765.00 (73.28)             25,843.00 (70.75)
      6   Patients Treated, by duration                     <NA>                      <NA>                          <NA>
      7  Any duration (at least 1 dose)             134 (100.0%)              134 (100.0%)                   130 (98.5%)
      8                        <1 month                 6 (4.5%)                  5 (3.7%)                    15 (11.4%)
      9                       >=1 month              128 (95.5%)               129 (96.3%)                   117 (88.6%)
      10                     >=3 months              102 (76.1%)               107 (79.9%)                    99 (75.0%)
      11                     >=6 months               70 (52.2%)                72 (53.7%)                    70 (53.0%)
      12                    >=12 months                11 (8.2%)                  6 (4.5%)                      9 (6.8%)

---

    Code
      res$ard
    Message
      {cards} data frame: 63 x 12
    Output
         group1 group1_level variable variable_level    stat_name stat_label    stat stat_fmt
      1     ARM    A: Drug X   TRTDUR                        mean       Mean 199.582   199.58
      2     ARM    A: Drug X   TRTDUR                          sd         SD 115.065   115.07
      3     ARM    A: Drug X   TRTDUR                      median     Median   205.5    205.5
      4     ARM    A: Drug X   TRTDUR                         min        Min       2        2
      5     ARM    A: Drug X   TRTDUR                         max        Max     394      394
      6     ARM    A: Drug X   TRTDUR                         p25         Q1     102      102
      7     ARM    A: Drug X   TRTDUR                         p75         Q3     299      299
      8     ARM    A: Drug X   TRTDUR                tot_exposure  tot_expo…   26744    26744
      9     ARM    A: Drug X   TRTDUR                  person_yrs  person_y…  73.221    73.22
      10    ARM    B: Place…   TRTDUR                        mean       Mean 199.739   199.74
    Message
      i 53 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error

# Table 05 generation works with gtsummary with custom values

    Code
      as.data.frame(res)
    Output
                          **Parameter** **A: Drug X**  \nN = 134
      1    Duration of Treatment, years                     <NA>
      2                       Mean (SD)              0.55 (0.32)
      3               Median (Min, Max)        0.56 (0.01, 1.08)
      4             Interquartile range              0.28 - 0.82
      5   Total exposure (person years)            73.22 (73.22)
      6   Patients Treated, by duration                     <NA>
      7  Any duration (at least 1 dose)             134 (100.0%)
      8                        <1 month                 6 (4.5%)
      9                       >=1 month              128 (95.5%)
      10                     >=3 months              102 (76.1%)
      11                     >=6 months               70 (52.2%)
      12                    >=12 months                11 (8.2%)
         **B: Placebo**  \nN = 134 **C: Combination**  \nN = 132
      1                       <NA>                          <NA>
      2                0.55 (0.30)                   0.54 (0.33)
      3          0.54 (0.00, 1.07)             0.55 (0.00, 1.09)
      4                0.29 - 0.82                   0.25 - 0.83
      5              73.28 (73.28)                 70.75 (70.75)
      6                       <NA>                          <NA>
      7               134 (100.0%)                   130 (98.5%)
      8                   5 (3.7%)                    15 (11.4%)
      9                129 (96.3%)                   117 (88.6%)
      10               107 (79.9%)                    99 (75.0%)
      11                72 (53.7%)                    70 (53.0%)
      12                  6 (4.5%)                      9 (6.8%)

# Table 05 generation works with rtables with custom values

    Code
      res
    Output
      Table 5. Duration of Treatment Exposure, Safety Population, Pooled Analyses*
      
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                              Total       
                                             A: Drug X            B: Placebo         C: Combination         Population    
      Parameter                               (N=134)              (N=134)              (N=132)              (N=400)      
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

# Table 05 generation works with rtables with NA values/pruned rows

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

# Table 05 generation works with rtables with risk difference column

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

