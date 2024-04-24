# Table 22 generation works with default values

    Code
      res
    Output
                                                     A: Drug X    B: Placebo    C: Combination
      Characteristic                                  (N=621)       (N=633)        (N=715)    
      ————————————————————————————————————————————————————————————————————————————————————————
      Any AE, n (%)                                 122 (91.0%)   123 (91.8%)    120 (90.9%)  
      SEX, n (%)                                                                              
        F                                           72 (91.1%)    77 (93.9%)      65 (92.9%)  
        M                                           50 (90.9%)    46 (88.5%)      55 (88.7%)  
      Age Group, years, n (%)                                                                 
        >=17 to <65                                  122 (91%)    123 (91.8%)    119 (90.8%)  
        >=65                                             0             0           1 (100%)   
      RACE, n (%)                                                                             
        ASIAN                                       61 (89.7%)    62 (92.5%)      63 (86.3%)  
        BLACK OR AFRICAN AMERICAN                   28 (90.3%)    24 (85.7%)      31 (96.9%)  
        WHITE                                       26 (96.3%)    25 (96.2%)      21 (100%)   
        AMERICAN INDIAN OR ALASKA NATIVE             7 (87.5%)    10 (90.9%)      5 (83.3%)   
        MULTIPLE                                         0         1 (100%)           0       
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER        0         1 (100%)           0       
        OTHER                                            0             0              0       
        UNKNOWN                                          0             0              0       
      ETHNIC, n (%)                                                                           
        HISPANIC OR LATINO                          13 (86.7%)    17 (94.4%)      13 (86.7%)  
        NOT HISPANIC OR LATINO                      95 (91.3%)    94 (91.3%)      93 (92.1%)  
        NOT REPORTED                                 6 (100%)      10 (100%)      10 (90.9%)  
        UNKNOWN                                      8 (88.9%)     2 (66.7%)       4 (80%)    

# Table 22 generation works with custom values: N_s denominator and overall column

    Code
      res
    Output
                                                     A: Drug X    B: Placebo    C: Combination   Total population
      Characteristic                                  (N=134)       (N=134)        (N=132)           (N=400)     
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
      Any AE, n (%)                                 122 (91.0%)   123 (91.8%)    120 (90.9%)       365 (91.2%)   
      SEX, n (%)                                                                                                 
        F                                           72 (91.1%)    77 (93.9%)      65 (92.9%)       214 (92.6%)   
        M                                           50 (90.9%)    46 (88.5%)      55 (88.7%)       151 (89.3%)   
      AGEGR1, n (%)                                                                                              
        >=17 to <65                                  122 (91%)    123 (91.8%)    119 (90.8%)       364 (91.2%)   
        >=65                                             0             0           1 (100%)          1 (100%)    
      RACE, n (%)                                                                                                
        ASIAN                                       61 (89.7%)    62 (92.5%)      63 (86.3%)       186 (89.4%)   
        BLACK OR AFRICAN AMERICAN                   28 (90.3%)    24 (85.7%)      31 (96.9%)        83 (91.2%)   
        WHITE                                       26 (96.3%)    25 (96.2%)      21 (100%)         72 (97.3%)   
        AMERICAN INDIAN OR ALASKA NATIVE             7 (87.5%)    10 (90.9%)      5 (83.3%)          22 (88%)    
        MULTIPLE                                         0         1 (100%)           0              1 (100%)    
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER        0         1 (100%)           0              1 (100%)    
        OTHER                                            0             0              0                 0        
        UNKNOWN                                          0             0              0                 0        
      ETHNIC, n (%)                                                                                              
        HISPANIC OR LATINO                          13 (86.7%)    17 (94.4%)      13 (86.7%)        43 (89.6%)   
        NOT HISPANIC OR LATINO                      95 (91.3%)    94 (91.3%)      93 (92.1%)       282 (91.6%)   
        NOT REPORTED                                 6 (100%)      10 (100%)      10 (90.9%)        26 (96.3%)   
        UNKNOWN                                      8 (88.9%)     2 (66.7%)       4 (80%)          14 (82.4%)   

# Table 22 generation works with custom values: N_col denominator and no overall column

    Code
      res
    Output
      Table 22. Overview of Adverse Events1 by Demographic Subgroup, Safety Population, Pooled Analysis (or Trial X)
      
      ————————————————————————————————————————————————————————————————————————————————————————
                                                     A: Drug X    B: Placebo    C: Combination
      Characteristic                                  (N=134)       (N=134)        (N=132)    
      ————————————————————————————————————————————————————————————————————————————————————————
      Any AE, n (%)                                 122 (91.0%)   123 (91.8%)    120 (90.9%)  
      SEX, n (%)                                                                              
        F                                           72 (53.7%)    77 (57.5%)      65 (49.2%)  
        M                                           50 (37.3%)    46 (34.3%)      55 (41.7%)  
      Age Group, years, n (%)                                                                 
        >=17 to <65                                  122 (91%)    123 (91.8%)    119 (90.2%)  
        >=65                                             0             0           1 (0.8%)   
      RACE, n (%)                                                                             
        ASIAN                                       61 (45.5%)    62 (46.3%)      63 (47.7%)  
        BLACK OR AFRICAN AMERICAN                   28 (20.9%)    24 (17.9%)      31 (23.5%)  
        WHITE                                       26 (19.4%)    25 (18.7%)      21 (15.9%)  
        AMERICAN INDIAN OR ALASKA NATIVE             7 (5.2%)      10 (7.5%)       5 (3.8%)   
        MULTIPLE                                         0         1 (0.7%)           0       
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER        0         1 (0.7%)           0       
      ETHNIC, n (%)                                                                           
        HISPANIC OR LATINO                           13 (9.7%)    17 (12.7%)      13 (9.8%)   
        NOT HISPANIC OR LATINO                      95 (70.9%)    94 (70.1%)      93 (70.5%)  
        NOT REPORTED                                 6 (4.5%)      10 (7.5%)      10 (7.6%)   
        UNKNOWN                                       8 (6%)       2 (1.5%)         4 (3%)    
      ————————————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      (1) Treatment-emergent adverse event defined as [definition]. MedDRA version X.
      
      Abbreviations: MedDRA, Medical Dictionary for Regulatory Activities.;
      N, number of patients in treatment arm; n, number of patients with adverse event;
      Ns, total number of patients for each specific subgroup

# Table 22 generation works with some NA values

    Code
      res
    Output
                            A: Drug X    B: Placebo    C: Combination   Total population
      Characteristic         (N=134)       (N=134)        (N=132)           (N=400)     
      ——————————————————————————————————————————————————————————————————————————————————
      Any AE, n (%)        122 (91.0%)   123 (91.8%)    120 (90.9%)       365 (91.2%)   
      Age (group), n (%)                                                                
        >=17 to <65        122 (100%)    122 (99.2%)    119 (99.2%)       363 (99.5%)   
        >=65                    0             0           1 (0.8%)          1 (0.3%)    
        <Missing>            11 (9%)      11 (8.9%)       7 (5.8%)         29 (7.9%)    
      Sex, n (%)                                                                        
        F                   72 (59%)     77 (62.6%)      65 (54.2%)       214 (58.6%)   
        M                   50 (41%)     46 (37.4%)      55 (45.8%)       151 (41.4%)   
        <Missing>          13 (10.7%)     16 (13%)       17 (14.2%)        46 (12.6%)   

