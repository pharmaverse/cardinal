# Table 02 generation works with default values

    Code
      res
    Output
                                                        A: Drug X            B: Placebo         C: Combination      Total Population 
      Characteristic                                     (N=134)              (N=134)              (N=132)              (N=400)      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      Sex                                                                                                                            
        F                                                79 (59%)            82 (61.2%)            70 (53%)           231 (57.8%)    
        M                                                55 (41%)            52 (38.8%)            62 (47%)           169 (42.2%)    
      Age                                                                                                                            
        Mean (SD)                                       33.8 (6.6)           35.4 (7.9)           35.4 (7.7)           34.9 (7.4)    
        Median (Min - Max)                          33.0 (21.0 - 50.0)   35.0 (21.0 - 62.0)   35.0 (20.0 - 69.0)   34.0 (20.0 - 69.0)
      Age Group                                                                                                                      
        >=17 to <65                                     134 (100%)           134 (100%)          131 (99.2%)          399 (99.8%)    
        >=65                                                0                    0                 1 (0.8%)             1 (0.2%)     
      Race                                                                                                                           
        ASIAN                                           68 (50.7%)            67 (50%)            73 (55.3%)           208 (52%)     
        BLACK OR AFRICAN AMERICAN                       31 (23.1%)           28 (20.9%)           32 (24.2%)           91 (22.8%)    
        WHITE                                           27 (20.1%)           26 (19.4%)           21 (15.9%)           74 (18.5%)    
        AMERICAN INDIAN OR ALASKA NATIVE                  8 (6%)             11 (8.2%)             6 (4.5%)            25 (6.2%)     
        MULTIPLE                                            0                 1 (0.7%)                0                 1 (0.2%)     
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER           0                 1 (0.7%)                0                 1 (0.2%)     
      Ethnicity                                                                                                                      
        NOT REPORTED                                     6 (4.5%)            10 (7.5%)            11 (8.3%)            27 (6.8%)     
        HISPANIC OR LATINO                              15 (11.2%)           18 (13.4%)           15 (11.4%)            48 (12%)     
        NOT HISPANIC OR LATINO                         104 (77.6%)          103 (76.9%)          101 (76.5%)           308 (77%)     
        UNKNOWN                                          9 (6.7%)             3 (2.2%)             5 (3.8%)            17 (4.2%)     
      Country                                                                                                                        
        CHN                                             74 (55.2%)           81 (60.4%)           64 (48.5%)          219 (54.8%)    
        USA                                             10 (7.5%)            13 (9.7%)            17 (12.9%)            40 (10%)     
        BRA                                             13 (9.7%)             7 (5.2%)            10 (7.6%)            30 (7.5%)     
        PAK                                              12 (9%)              9 (6.7%)            10 (7.6%)            31 (7.8%)     
        NGA                                               8 (6%)              7 (5.2%)            11 (8.3%)            26 (6.5%)     
        RUS                                              5 (3.7%)              8 (6%)              6 (4.5%)            19 (4.8%)     
        JPN                                              5 (3.7%)              4 (3%)              9 (6.8%)            18 (4.5%)     
        GBR                                               4 (3%)              3 (2.2%)             2 (1.5%)             9 (2.2%)     
        CAN                                              3 (2.2%)             2 (1.5%)             3 (2.3%)              8 (2%)      

# Table 02 generation works with custom values

    Code
      res
    Output
      Table 2. Baseline Demographic and Clinical Characteristics Safety Population, Pooled Analyses
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                        A: Drug X            B: Placebo         C: Combination      Total Population 
      Characteristic                                     (N=134)              (N=134)              (N=132)              (N=400)      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      Sex                                                                                                                            
        F                                                79 (59%)            82 (61.2%)            70 (53%)           231 (57.8%)    
        M                                                55 (41%)            52 (38.8%)            62 (47%)           169 (42.2%)    
      Age, years                                                                                                                     
        Mean (SD)                                       33.8 (6.6)           35.4 (7.9)           35.4 (7.7)           34.9 (7.4)    
        Median (Min - Max)                          33.0 (21.0 - 50.0)   35.0 (21.0 - 62.0)   35.0 (20.0 - 69.0)   34.0 (20.0 - 69.0)
      Age Group, years                                                                                                               
        >=17 to <65                                     134 (100%)           134 (100%)          131 (99.2%)          399 (99.8%)    
        >=65                                                0                    0                 1 (0.8%)             1 (0.2%)     
      Race                                                                                                                           
        ASIAN                                           68 (50.7%)            67 (50%)            73 (55.3%)           208 (52%)     
        BLACK OR AFRICAN AMERICAN                       31 (23.1%)           28 (20.9%)           32 (24.2%)           91 (22.8%)    
        WHITE                                           27 (20.1%)           26 (19.4%)           21 (15.9%)           74 (18.5%)    
        AMERICAN INDIAN OR ALASKA NATIVE                  8 (6%)             11 (8.2%)             6 (4.5%)            25 (6.2%)     
        MULTIPLE                                            0                 1 (0.7%)                0                 1 (0.2%)     
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER           0                 1 (0.7%)                0                 1 (0.2%)     
      Ethnicity                                                                                                                      
        NOT REPORTED                                     6 (4.5%)            10 (7.5%)            11 (8.3%)            27 (6.8%)     
        HISPANIC OR LATINO                              15 (11.2%)           18 (13.4%)           15 (11.4%)            48 (12%)     
        NOT HISPANIC OR LATINO                         104 (77.6%)          103 (76.9%)          101 (76.5%)           308 (77%)     
        UNKNOWN                                          9 (6.7%)             3 (2.2%)             5 (3.8%)            17 (4.2%)     
      Country of Participation                                                                                                       
        CHN                                             74 (55.2%)           81 (60.4%)           64 (48.5%)          219 (54.8%)    
        USA                                             10 (7.5%)            13 (9.7%)            17 (12.9%)            40 (10%)     
        BRA                                             13 (9.7%)             7 (5.2%)            10 (7.6%)            30 (7.5%)     
        PAK                                              12 (9%)              9 (6.7%)            10 (7.6%)            31 (7.8%)     
        NGA                                               8 (6%)              7 (5.2%)            11 (8.3%)            26 (6.5%)     
        RUS                                              5 (3.7%)              8 (6%)              6 (4.5%)            19 (4.8%)     
        JPN                                              5 (3.7%)              4 (3%)              9 (6.8%)            18 (4.5%)     
        GBR                                               4 (3%)              3 (2.2%)             2 (1.5%)             9 (2.2%)     
        CAN                                              3 (2.2%)             2 (1.5%)             3 (2.3%)              8 (2%)      
      Baseline Temperature (C)                                                                                                       
        Mean (SD)                                       49.7 (8.3)           50.9 (7.4)           49.1 (8.2)           49.9 (8.0)    
        Median (Min - Max)                          50.4 (29.0 - 69.1)   51.5 (30.7 - 67.7)   48.7 (20.6 - 70.5)   50.3 (20.6 - 70.5)
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      
      Abbreviations: N, number of patients in treatment arm; n, number of patients with given characteristic; SD, standard deviation

# Table 02 generation works with some NA values

    Code
      res
    Output
                       A: Drug X    B: Placebo   C: Combination   Total Population
      Characteristic    (N=134)      (N=134)        (N=132)           (N=400)     
      ————————————————————————————————————————————————————————————————————————————
      Sex                                                                         
        F              68 (50.7%)   68 (50.7%)      62 (47%)        198 (49.5%)   
        M              50 (37.3%)   48 (35.8%)     54 (40.9%)        152 (38%)    
        <Missing>      16 (11.9%)   18 (13.4%)     16 (12.1%)        50 (12.5%)   

