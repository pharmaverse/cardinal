# Table 20 generation works with default values

    Code
      res
    Output
                                      A: Drug X    B: Placebo    C: Combination
      AESI Assessment                  (N=134)       (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————————————————
      AE grouping related to AESI    107 (79.9%)   112 (83.6%)    113 (85.6%)  
        dcd A.1.1.1.1                50 (37.3%)    45 (33.6%)      63 (47.7%)  
        dcd A.1.1.1.2                48 (35.8%)    48 (35.8%)      50 (37.9%)  
        dcd D.1.1.1.1                50 (37.3%)    42 (31.3%)      51 (38.6%)  
        dcd D.1.1.4.2                48 (35.8%)    42 (31.3%)      50 (37.9%)  
        dcd D.2.1.5.3                47 (35.1%)    58 (43.3%)      57 (43.2%)  
      Maximum severity                                                         
        MILD                         16 (11.9%)    19 (14.2%)      17 (12.9%)  
        MODERATE                     41 (30.6%)    51 (38.1%)      45 (34.1%)  
        SEVERE                       50 (37.3%)    42 (31.3%)      51 (38.6%)  
      Serious                        75 (70.1%)    77 (68.8%)      83 (73.5%)  
        Deaths                       50 (46.7%)    42 (37.5%)      51 (45.1%)  
      Resulting in discontinuation   35 (32.7%)    34 (30.4%)      33 (29.2%)  
      Relatedness                    74 (69.2%)    74 (66.1%)      84 (74.3%)  
      Laboratory Assessment          89 (66.4%)    86 (64.2%)      90 (68.2%)  

# Table 20 generation works with custom values

    Code
      res
    Output
      Table 20. Adverse Events of Special Interest Assessment, Safety Population, Pooled Analysis (or Trial X) (1)
      
      ————————————————————————————————————————————————————————————————————————————
                                         A: Drug X    B: Placebo    C: Combination
      AESI Assessment                     (N=134)       (N=134)        (N=132)    
      ————————————————————————————————————————————————————————————————————————————
      AE grouping related to AESI {1}   107 (79.9%)   112 (83.6%)    113 (85.6%)  
        dcd A.1.1.1.1                   50 (37.3%)    45 (33.6%)      63 (47.7%)  
        dcd A.1.1.1.2                   48 (35.8%)    48 (35.8%)      50 (37.9%)  
        dcd D.1.1.1.1                   50 (37.3%)    42 (31.3%)      51 (38.6%)  
        dcd D.1.1.4.2                   48 (35.8%)    42 (31.3%)      50 (37.9%)  
        dcd D.2.1.5.3                   47 (35.1%)    58 (43.3%)      57 (43.2%)  
      Maximum severity {1}                                                        
        MILD                            16 (11.9%)    19 (14.2%)      17 (12.9%)  
        MODERATE                        41 (30.6%)    51 (38.1%)      45 (34.1%)  
        SEVERE                          50 (37.3%)    42 (31.3%)      51 (38.6%)  
      Serious {1}                       75 (70.1%)    77 (68.8%)      83 (73.5%)  
        Deaths                          50 (46.7%)    42 (37.5%)      51 (45.1%)  
      Resulting in discontinuation      35 (32.7%)    34 (30.4%)      33 (29.2%)  
      Relatedness {2}                   74 (69.2%)    74 (66.1%)      84 (74.3%)  
      Laboratory Assessment {3}         89 (66.4%)    86 (64.2%)      90 (68.2%)  
      ————————————————————————————————————————————————————————————————————————————
      
      {1} - Use FMQ grouping if appropriate.
      {2} - As determined by investigator.
      {3} - Include relevant laboratory results as appropriate for AESI evaluation.
      ————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      (1) Duration = [e.g., X week double-blind treatment period or median and
      a range indicating pooled trial durations].
      (2) Difference is shown between [treatment arms]
      (e.g., difference is shown between Drug Name dosage X vs. placebo).
      
      Abbreviations: AESI, adverse event of special interest; CI, confidence interval;
      N, number of patients in treatment arm; n, number of patients with at least one event

# Table 20 generation works with missing values/pruned rows

    Code
      res
    Output
                                      A: Drug X    B: Placebo    C: Combination
      AESI Assessment                  (N=134)       (N=134)        (N=132)    
      —————————————————————————————————————————————————————————————————————————
      AE grouping related to AESI    107 (79.9%)   112 (83.6%)    113 (85.6%)  
        dcd A.1.1.1.1                50 (37.3%)    45 (33.6%)      63 (47.7%)  
        dcd A.1.1.1.2                48 (35.8%)    48 (35.8%)      50 (37.9%)  
        dcd D.1.1.1.1                50 (37.3%)    42 (31.3%)      51 (38.6%)  
        dcd D.1.1.4.2                48 (35.8%)    42 (31.3%)      50 (37.9%)  
        dcd D.2.1.5.3                47 (35.1%)    58 (43.3%)      57 (43.2%)  
      Maximum severity                                                         
        MODERATE                     57 (42.5%)    70 (52.2%)      62 (47.0%)  
        SEVERE                       50 (37.3%)    42 (31.3%)      51 (38.6%)  
      Serious                        75 (70.1%)    77 (68.8%)      83 (73.5%)  
        Deaths                       50 (46.7%)    42 (37.5%)      51 (45.1%)  
      Resulting in discontinuation   35 (32.7%)    34 (30.4%)      33 (29.2%)  
      Relatedness                    74 (69.2%)    74 (66.1%)      84 (74.3%)  
      Laboratory Assessment          89 (66.4%)    86 (64.2%)      90 (68.2%)  

# Table 20 generation works with risk difference column

    Code
      res
    Output
                                      A: Drug X    B: Placebo    C: Combination   Risk Difference (%) (95% CI)
      AESI Assessment                  (N=134)       (N=134)        (N=132)                 (N=268)           
      ————————————————————————————————————————————————————————————————————————————————————————————————————————
      AE grouping related to AESI    107 (79.9%)   112 (83.6%)    113 (85.6%)          3.7 (-5.5 - 13.0)      
        dcd A.1.1.1.1                50 (37.3%)    45 (33.6%)      63 (47.7%)          -3.7 (-15.2 - 7.7)     
        dcd A.1.1.1.2                48 (35.8%)    48 (35.8%)      50 (37.9%)          0.0 (-11.5 - 11.5)     
        dcd D.1.1.1.1                50 (37.3%)    42 (31.3%)      51 (38.6%)          -6.0 (-17.3 - 5.4)     
        dcd D.1.1.4.2                48 (35.8%)    42 (31.3%)      50 (37.9%)          -4.5 (-15.8 - 6.8)     
        dcd D.2.1.5.3                47 (35.1%)    58 (43.3%)      57 (43.2%)          8.2 (-3.4 - 19.9)      
      Maximum severity                                                                                        
        MILD                         16 (11.9%)    19 (14.2%)      17 (12.9%)          2.2 (-5.8 - 10.3)      
        MODERATE                     41 (30.6%)    51 (38.1%)      45 (34.1%)          7.5 (-3.9 - 18.8)      
        SEVERE                       50 (37.3%)    42 (31.3%)      51 (38.6%)          -6.0 (-17.3 - 5.4)     
      Serious                        75 (56.0%)    77 (57.5%)      83 (62.9%)          1.5 (-10.4 - 13.4)     
        Deaths                       50 (37.3%)    42 (31.3%)      51 (38.6%)          -6.0 (-17.3 - 5.4)     
      Resulting in discontinuation   35 (26.1%)    34 (25.4%)      33 (25.0%)          -0.7 (-11.2 - 9.7)     
      Relatedness                    74 (55.2%)    74 (55.2%)      84 (63.6%)          0.0 (-11.9 - 11.9)     
      Laboratory Assessment          89 (66.4%)    86 (64.2%)      90 (68.2%)          -2.2 (-13.6 - 9.2)     

