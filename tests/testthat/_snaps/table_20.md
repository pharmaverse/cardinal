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
      Maximum severity {2}                                                        
        MILD                            16 (11.9%)    19 (14.2%)      17 (12.9%)  
        MODERATE                        41 (30.6%)    51 (38.1%)      45 (34.1%)  
        SEVERE                          50 (37.3%)    42 (31.3%)      51 (38.6%)  
      Serious {3}                       75 (70.1%)    77 (68.8%)      83 (73.5%)  
        Deaths                          50 (46.7%)    42 (37.5%)      51 (45.1%)  
      Resulting in discontinuation      35 (32.7%)    34 (30.4%)      33 (29.2%)  
      Relatedness {4}                   74 (69.2%)    74 (66.1%)      84 (74.3%)  
      Laboratory Assessment {5}         89 (66.4%)    86 (64.2%)      90 (68.2%)  
      ————————————————————————————————————————————————————————————————————————————
      
      {1} - Use FMQ grouping if appropriate.
      {2} - Use FMQ grouping if appropriate.
      {3} - Use FMQ grouping if appropriate.
      {4} - As determined by investigator.
      {5} - Include relevant laboratory results as appropriate for AESI evaluation.
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

