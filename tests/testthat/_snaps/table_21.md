# Table 21 generation works with default values

    Code
      res
    Output
                                                     A: Drug X    B: Placebo    C: Combination
      Characteristic                                  (N=134)       (N=134)        (N=132)    
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

# Table 21 generation works with custom values

    Code
      res
    Output
      Table 21. Overview of Serious Adverse Events(1) by Demographic Subgroup, Safety Population, Pooled Analysis (or Trial X)
      
      ————————————————————————————————————————————————————————————————————————————————————————
                                                     A: Drug X    B: Placebo    C: Combination
      Characteristic                                  (N=134)       (N=134)        (N=132)    
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
      ETHNIC                                                                                  
        NOT REPORTED                                 6 (100%)       7 (70%)       7 (63.6%)   
        HISPANIC OR LATINO                          11 (73.3%)    13 (72.2%)      11 (73.3%)  
        NOT HISPANIC OR LATINO                      81 (77.9%)    80 (77.7%)      78 (77.2%)  
        UNKNOWN                                      6 (66.7%)     1 (33.3%)       3 (60%)    
      ————————————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      (1) Defined as any untoward medical occurrence that, at any dose that results in death, is life-threatening,
      requires hospitalization or prolongation of existing hospitalization, results in persistent incapacity or
      substantial disruption of the ability to conduct normal life functions, or is a congenital anomaly or
      birth defect. 
      
      Abbreviations: N, number of patients in treatment arm; n, number of patients with adverse event;
      Ns, total number of patients for each specific subgroup; SAE, serious adverse event

