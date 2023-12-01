# Table 07 generation works with default values

    Code
      res
    Output
                                        A: Drug X    B: Placebo   C: Combination
      Deaths                             (N=134)      (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————————————————
      Total deaths                      24 (17.9%)   19 (14.2%)     20 (15.2%)  
        ADVERSE EVENT                   8 (33.3%)    6 (31.6%)      10 (50.0%)  
        DISEASE PROGRESSION             8 (33.3%)    5 (26.3%)      6 (30.0%)   
        LOST TO FOLLOW UP                2 (8.3%)     1 (5.3%)       1 (5.0%)   
        MISSING                          2 (8.3%)    3 (15.8%)       1 (5.0%)   
        Post-study reporting of death    1 (4.2%)     1 (5.3%)       1 (5.0%)   
        SUICIDE                          2 (8.3%)    2 (10.5%)       1 (5.0%)   
        UNKNOWN                          1 (4.2%)     1 (5.3%)          0       
      Treatment-emergent deaths         12 (9.0%)    15 (11.2%)     16 (12.1%)  
        ADVERSE EVENT                   3 (25.0%)    5 (33.3%)      9 (56.2%)   
        DISEASE PROGRESSION             3 (25.0%)    5 (33.3%)      4 (25.0%)   
        LOST TO FOLLOW UP                1 (8.3%)        0              0       
        MISSING                         2 (16.7%)     1 (6.7%)       1 (6.2%)   
        Post-study reporting of death       0         1 (6.7%)       1 (6.2%)   
        SUICIDE                         2 (16.7%)    2 (13.3%)       1 (6.2%)   
        UNKNOWN                          1 (8.3%)     1 (6.7%)          0       
      Nontreatment-emergent deaths      12 (9.0%)     4 (3.0%)       4 (3.0%)   
        ADVERSE EVENT                   5 (41.7%)    1 (25.0%)      1 (25.0%)   
        DISEASE PROGRESSION             5 (41.7%)        0          2 (50.0%)   
        LOST TO FOLLOW UP                1 (8.3%)    1 (25.0%)      1 (25.0%)   
        MISSING                             0        2 (50.0%)          0       
        Post-study reporting of death    1 (8.3%)        0              0       

# Table 07 generation works with custom values

    Code
      res
    Output
      Table 7. Deaths, Safety Population, Pooled Analyses (1)
      
      ———————————————————————————————————————————————————————————————————————————
                                         A: Drug X    B: Placebo   C: Combination
      Deaths                              (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————————————
      Total deaths                       24 (17.9%)   19 (14.2%)     20 (15.2%)  
        ADVERSE EVENT                    8 (33.3%)    6 (31.6%)      10 (50.0%)  
        DISEASE PROGRESSION              8 (33.3%)    5 (26.3%)      6 (30.0%)   
        LOST TO FOLLOW UP                 2 (8.3%)     1 (5.3%)       1 (5.0%)   
        MISSING                           2 (8.3%)    3 (15.8%)       1 (5.0%)   
        Post-study reporting of death     1 (4.2%)     1 (5.3%)       1 (5.0%)   
        SUICIDE                           2 (8.3%)    2 (10.5%)       1 (5.0%)   
        UNKNOWN                           1 (4.2%)     1 (5.3%)          0       
      Treatment-emergent deaths {1}      12 (9.0%)    15 (11.2%)     16 (12.1%)  
        ADVERSE EVENT                    3 (25.0%)    5 (33.3%)      9 (56.2%)   
        DISEASE PROGRESSION              3 (25.0%)    5 (33.3%)      4 (25.0%)   
        LOST TO FOLLOW UP                 1 (8.3%)        0              0       
        MISSING                          2 (16.7%)     1 (6.7%)       1 (6.2%)   
        Post-study reporting of death        0         1 (6.7%)       1 (6.2%)   
        SUICIDE                          2 (16.7%)    2 (13.3%)       1 (6.2%)   
        UNKNOWN                           1 (8.3%)     1 (6.7%)          0       
      Nontreatment-emergent deaths {2}   12 (9.0%)     4 (3.0%)       4 (3.0%)   
        ADVERSE EVENT                    5 (41.7%)    1 (25.0%)      1 (25.0%)   
        DISEASE PROGRESSION              5 (41.7%)        0          2 (50.0%)   
        LOST TO FOLLOW UP                 1 (8.3%)    1 (25.0%)      1 (25.0%)   
        MISSING                              0        2 (50.0%)          0       
        Post-study reporting of death     1 (8.3%)        0              0       
      ———————————————————————————————————————————————————————————————————————————
      
      {1} - Treatment-emergent AE defined as [definition]. MedDRA version X.
      {2} - Defined as [(e.g., deaths beyond the protocol-defined, treatment-emergent adverse event period in the
            same trial or deaths from other trials with drug)].
      ———————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      (1) Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled trial
      durations].
      
      Abbreviations: AE, adverse event; MedDRA, Medical Dictionary for Regulatory Activities;
      N, number of patients in treatment arm; n, number of patients with adverse event

# Table 07 generation works with NA values/pruned rows

    Code
      res
    Output
                                        A: Drug X    B: Placebo   C: Combination
      Deaths                             (N=134)      (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————————————————
      Total deaths                      24 (17.9%)   19 (14.2%)     20 (15.2%)  
        ADVERSE EVENT                   8 (33.3%)    6 (31.6%)      10 (50.0%)  
        DISEASE PROGRESSION             8 (33.3%)    5 (26.3%)      6 (30.0%)   
        LOST TO FOLLOW UP                   0            0              0       
        MISSING                         4 (16.7%)    4 (21.1%)      2 (10.0%)   
        Post-study reporting of death    1 (4.2%)     1 (5.3%)       1 (5.0%)   
        SUICIDE                          2 (8.3%)    2 (10.5%)       1 (5.0%)   
        UNKNOWN                          1 (4.2%)     1 (5.3%)          0       
      Treatment-emergent deaths         12 (9.0%)    15 (11.2%)     16 (12.1%)  
        ADVERSE EVENT                   3 (25.0%)    5 (33.3%)      9 (56.2%)   
        DISEASE PROGRESSION             3 (25.0%)    5 (33.3%)      4 (25.0%)   
        LOST TO FOLLOW UP                   0            0              0       
        MISSING                         3 (25.0%)     1 (6.7%)       1 (6.2%)   
        Post-study reporting of death       0         1 (6.7%)       1 (6.2%)   
        SUICIDE                         2 (16.7%)    2 (13.3%)       1 (6.2%)   
        UNKNOWN                          1 (8.3%)     1 (6.7%)          0       
      Nontreatment-emergent deaths      12 (9.0%)     4 (3.0%)       4 (3.0%)   
        ADVERSE EVENT                   5 (41.7%)    1 (25.0%)      1 (25.0%)   
        DISEASE PROGRESSION             5 (41.7%)        0          2 (50.0%)   
        LOST TO FOLLOW UP                   0            0              0       
        MISSING                          1 (8.3%)    3 (75.0%)      1 (25.0%)   
        Post-study reporting of death    1 (8.3%)        0              0       
        SUICIDE                             0            0              0       
        UNKNOWN                             0            0              0       

---

    Code
      res
    Output
                                        A: Drug X    B: Placebo   C: Combination
      Deaths                             (N=134)      (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————————————————
      Total deaths                      24 (17.9%)   19 (14.2%)     20 (15.2%)  
        ADVERSE EVENT                   8 (33.3%)    6 (31.6%)      10 (50.0%)  
        DISEASE PROGRESSION             8 (33.3%)    5 (26.3%)      6 (30.0%)   
        MISSING                         4 (16.7%)    4 (21.1%)      2 (10.0%)   
        Post-study reporting of death    1 (4.2%)     1 (5.3%)       1 (5.0%)   
        SUICIDE                          2 (8.3%)    2 (10.5%)       1 (5.0%)   
        UNKNOWN                          1 (4.2%)     1 (5.3%)          0       
      Treatment-emergent deaths         12 (9.0%)    15 (11.2%)     16 (12.1%)  
        ADVERSE EVENT                   3 (25.0%)    5 (33.3%)      9 (56.2%)   
        DISEASE PROGRESSION             3 (25.0%)    5 (33.3%)      4 (25.0%)   
        MISSING                         3 (25.0%)     1 (6.7%)       1 (6.2%)   
        Post-study reporting of death       0         1 (6.7%)       1 (6.2%)   
        SUICIDE                         2 (16.7%)    2 (13.3%)       1 (6.2%)   
        UNKNOWN                          1 (8.3%)     1 (6.7%)          0       
      Nontreatment-emergent deaths      12 (9.0%)     4 (3.0%)       4 (3.0%)   
        ADVERSE EVENT                   5 (41.7%)    1 (25.0%)      1 (25.0%)   
        DISEASE PROGRESSION             5 (41.7%)        0          2 (50.0%)   
        MISSING                          1 (8.3%)    3 (75.0%)      1 (25.0%)   
        Post-study reporting of death    1 (8.3%)        0              0       

# Table 07 generation works with risk difference column

    Code
      res
    Output
                                        A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
      Deaths                             (N=134)      (N=134)        (N=132)                 (N=268)           
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      Total deaths                      24 (17.9%)   19 (14.2%)     20 (15.2%)          -3.7 (-12.5 - 5.0)     
        ADVERSE EVENT                   8 (33.3%)    6 (31.6%)      10 (50.0%)          -1.5 (-6.8 - 3.8)      
        DISEASE PROGRESSION             8 (33.3%)    5 (26.3%)      6 (30.0%)           -2.2 (-7.4 - 2.9)      
        LOST TO FOLLOW UP                2 (8.3%)     1 (5.3%)       1 (5.0%)           -0.7 (-3.3 - 1.8)      
        MISSING                          2 (8.3%)    3 (15.8%)       1 (5.0%)            0.7 (-2.5 - 4.0)      
        Post-study reporting of death    1 (4.2%)     1 (5.3%)       1 (5.0%)            0.0 (-2.1 - 2.1)      
        SUICIDE                          2 (8.3%)    2 (10.5%)       1 (5.0%)            0.0 (-2.9 - 2.9)      
        UNKNOWN                          1 (4.2%)     1 (5.3%)          0                0.0 (-2.1 - 2.1)      
      Treatment-emergent deaths         12 (9.0%)    15 (11.2%)     16 (12.1%)           2.2 (-5.0 - 9.4)      
        ADVERSE EVENT                   3 (25.0%)    5 (33.3%)      9 (56.2%)            1.5 (-2.6 - 5.6)      
        DISEASE PROGRESSION             3 (25.0%)    5 (33.3%)      4 (25.0%)            1.5 (-2.6 - 5.6)      
        LOST TO FOLLOW UP                1 (8.3%)        0              0               -0.7 (-2.2 - 0.7)      
        MISSING                         2 (16.7%)     1 (6.7%)       1 (6.2%)           -0.7 (-3.3 - 1.8)      
        Post-study reporting of death       0         1 (6.7%)       1 (6.2%)            0.7 (-0.7 - 2.2)      
        SUICIDE                         2 (16.7%)    2 (13.3%)       1 (6.2%)            0.0 (-2.9 - 2.9)      
        UNKNOWN                          1 (8.3%)     1 (6.7%)          0                0.0 (-2.1 - 2.1)      
      Nontreatment-emergent deaths      12 (9.0%)     4 (3.0%)       4 (3.0%)          -6.0 (-11.6 - -0.3)     
        ADVERSE EVENT                   5 (41.7%)    1 (25.0%)      1 (25.0%)           -3.0 (-6.5 - 0.5)      
        DISEASE PROGRESSION             5 (41.7%)        0          2 (50.0%)           -3.7 (-6.9 - -0.5)     
        LOST TO FOLLOW UP                1 (8.3%)    1 (25.0%)      1 (25.0%)            0.0 (-2.1 - 2.1)      
        MISSING                             0        2 (50.0%)          0                1.5 (-0.6 - 3.5)      
        Post-study reporting of death    1 (8.3%)        0              0               -0.7 (-2.2 - 0.7)      

