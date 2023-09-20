# Table 21 generation works with default values

    Code
      res
    Output
                                                     A: Drug X    B: Placebo    C: Combination
      Characteristic                                  (N=621)       (N=633)        (N=715)    
      ————————————————————————————————————————————————————————————————————————————————————————
      Any SAE                                       104 (77.6%)   101 (75.4%)     99 (75.0%)  
      SEX                                                                                     
        F                                           61 (77.2%)     64 (78%)       50 (71.4%)  
        M                                           43 (78.2%)    37 (71.2%)       49 (79%)   
      Age Group, years                                                                        
        >=17 to <65                                 104 (77.6%)   101 (75.4%)     98 (74.8%)  
        >=65                                             0             0           1 (100%)   
      RACE                                                                                    
        ASIAN                                       52 (76.5%)    46 (68.7%)      51 (69.9%)  
        BLACK OR AFRICAN AMERICAN                   23 (74.2%)    23 (82.1%)      26 (81.2%)  
        WHITE                                       22 (81.5%)    22 (84.6%)       17 (81%)   
        AMERICAN INDIAN OR ALASKA NATIVE             7 (87.5%)     8 (72.7%)      5 (83.3%)   
        MULTIPLE                                         0         1 (100%)           0       
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER        0         1 (100%)           0       
        OTHER                                            0             0              0       
        UNKNOWN                                          0             0              0       
      ETHNIC                                                                                  
        NOT REPORTED                                 6 (100%)       7 (70%)       7 (63.6%)   
        HISPANIC OR LATINO                          11 (73.3%)    13 (72.2%)      11 (73.3%)  
        NOT HISPANIC OR LATINO                      81 (77.9%)    80 (77.7%)      78 (77.2%)  
        UNKNOWN                                      6 (66.7%)     1 (33.3%)       3 (60%)    

# Table 21 generation works with custom values: N_s denominator and overall column

    Code
      res
    Output
                                                     A: Drug X    B: Placebo    C: Combination   Total population
      Characteristic                                  (N=134)       (N=134)        (N=132)           (N=400)     
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
      Any SAE                                       104 (77.6%)   101 (75.4%)     99 (75.0%)       304 (76.0%)   
      SEX                                                                                                        
        F                                           61 (77.2%)     64 (78%)       50 (71.4%)       175 (75.8%)   
        M                                           43 (78.2%)    37 (71.2%)       49 (79%)        129 (76.3%)   
      AGEGR1                                                                                                     
        >=17 to <65                                 104 (77.6%)   101 (75.4%)     98 (74.8%)       303 (75.9%)   
        >=65                                             0             0           1 (100%)          1 (100%)    
      RACE                                                                                                       
        ASIAN                                       52 (76.5%)    46 (68.7%)      51 (69.9%)       149 (71.6%)   
        BLACK OR AFRICAN AMERICAN                   23 (74.2%)    23 (82.1%)      26 (81.2%)        72 (79.1%)   
        WHITE                                       22 (81.5%)    22 (84.6%)       17 (81%)         61 (82.4%)   
        AMERICAN INDIAN OR ALASKA NATIVE             7 (87.5%)     8 (72.7%)      5 (83.3%)          20 (80%)    
        MULTIPLE                                         0         1 (100%)           0              1 (100%)    
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER        0         1 (100%)           0              1 (100%)    
        OTHER                                            0             0              0                 0        
        UNKNOWN                                          0             0              0                 0        
      ETHNIC                                                                                                     
        NOT REPORTED                                 6 (100%)       7 (70%)       7 (63.6%)         20 (74.1%)   
        HISPANIC OR LATINO                          11 (73.3%)    13 (72.2%)      11 (73.3%)        35 (72.9%)   
        NOT HISPANIC OR LATINO                      81 (77.9%)    80 (77.7%)      78 (77.2%)       239 (77.6%)   
        UNKNOWN                                      6 (66.7%)     1 (33.3%)       3 (60%)          10 (58.8%)   

# Table 21 generation works with custom values: N_col denominator and no overall column

    Code
      res
    Output
      Table 21. Overview of Serious Adverse Events1 by Demographic Subgroup, Safety Population,
      Pooled Analysis (or Trial X)
      
      ————————————————————————————————————————————————————————————————————————————————————————
                                                     A: Drug X    B: Placebo    C: Combination
      Characteristic                                  (N=134)       (N=134)        (N=132)    
      ————————————————————————————————————————————————————————————————————————————————————————
      Any SAE                                       104 (77.6%)   101 (75.4%)     99 (75.0%)  
      SEX                                                                                     
        F                                           61 (45.5%)    64 (47.8%)      50 (37.9%)  
        M                                           43 (32.1%)    37 (27.6%)      49 (37.1%)  
      Age Group, years                                                                        
        >=17 to <65                                 104 (77.6%)   101 (75.4%)     98 (74.2%)  
        >=65                                             0             0           1 (0.8%)   
      RACE                                                                                    
        ASIAN                                       52 (38.8%)    46 (34.3%)      51 (38.6%)  
        BLACK OR AFRICAN AMERICAN                   23 (17.2%)    23 (17.2%)      26 (19.7%)  
        WHITE                                       22 (16.4%)    22 (16.4%)      17 (12.9%)  
        AMERICAN INDIAN OR ALASKA NATIVE             7 (5.2%)       8 (6%)         5 (3.8%)   
        MULTIPLE                                         0         1 (0.7%)           0       
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER        0         1 (0.7%)           0       
      ETHNIC                                                                                  
        NOT REPORTED                                 6 (4.5%)      7 (5.2%)        7 (5.3%)   
        HISPANIC OR LATINO                           11 (8.2%)     13 (9.7%)      11 (8.3%)   
        NOT HISPANIC OR LATINO                      81 (60.4%)    80 (59.7%)      78 (59.1%)  
        UNKNOWN                                      6 (4.5%)      1 (0.7%)        3 (2.3%)   
      ————————————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      
      Defined as any untoward medical occurrence that, at any dose that results in death, is life-threatening, requires hospitalization or prolongation of existing hospitalization, results in persistent incapacity or substantial disruption of the ability to conduct normal life, functions, or is a congenital anomaly or birth defect. Abbreviations: N, number of patients in treatment arm; n, number of patients with adverse event; Ns, total number of patients for each specific subgroup; SAE, serious adverse event

# Table 21 generation works with some NA values

    Code
      res
    Output
                        A: Drug X    B: Placebo    C: Combination   Total population
      Characteristic     (N=134)       (N=134)        (N=132)           (N=400)     
      ——————————————————————————————————————————————————————————————————————————————
      Any SAE          104 (77.6%)   101 (75.4%)     99 (75.0%)       304 (76.0%)   
      Age (group)                                                                   
        >=17 to <65    104 (100%)    101 (100%)       98 (99%)        303 (99.7%)   
        >=65                0             0            1 (1%)           1 (0.3%)    
        <Missing>       5 (4.8%)       2 (2%)          1 (1%)           8 (2.6%)    
      Sex                                                                           
        F              61 (58.7%)    64 (63.4%)      50 (50.5%)       175 (57.6%)   
        M              43 (41.3%)    37 (36.6%)      49 (49.5%)       129 (42.4%)   
        <Missing>       7 (6.7%)       4 (4%)          3 (3%)          14 (4.6%)    

