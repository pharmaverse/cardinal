# Table 06 generation works with default values

    Code
      res
    Output
                                                                             A: Drug X    B: Placebo    C: Combination
                                                                              (N=134)       (N=134)        (N=132)    
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      SAE                                                                   104 (85.2%)   101 (82.1%)     99 (82.5%)  
        SAEs with fatal outcome                                             76 (62.3%)    70 (56.9%)      75 (62.5%)  
        Life-threatening SAEs                                                9 (7.4%)     13 (10.6%)      19 (15.8%)  
        SAEs requiring hospitalization                                      24 (19.7%)    28 (22.8%)      29 (24.2%)  
        SAEs resulting in substantial disruption of normal life functions   28 (23.0%)    21 (17.1%)      23 (19.2%)  
        Congenital anomaly or birth defect                                  26 (21.3%)    27 (22.0%)      20 (16.7%)  
        Other                                                               30 (24.6%)    37 (30.1%)      32 (26.7%)  
      AE leading to permanent discontinuation of study drug                 27 (22.1%)    26 (21.1%)      30 (25.0%)  
      AE leading to dose modification of study drug                         71 (58.2%)    86 (69.9%)      83 (69.2%)  
        AE leading to interruption of study drug                             4 (3.3%)      4 (3.3%)        3 (2.5%)   
        AE leading to reduction of study drug                               46 (37.7%)    46 (37.4%)      51 (42.5%)  
        AE leading to dose delay of study drug                              20 (16.4%)    28 (22.8%)      30 (25.0%)  
        Other                                                               34 (27.9%)    48 (39.0%)      46 (38.3%)  
      Any AE                                                                122 (91.0%)   123 (91.8%)    120 (90.9%)  
        MILD                                                                 7 (5.2%)      9 (6.7%)        4 (3.0%)   
        MODERATE                                                            24 (17.9%)    24 (17.9%)      23 (17.4%)  
        SEVERE                                                              91 (67.9%)    90 (67.2%)      93 (70.5%)  

# Table 06 generation works with custom values

    Code
      res
    Output
      Table 6. Overview of Adverse Events(1), Safety Population, Pooled Analyses(2)
      
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                             A: Drug X    B: Placebo    C: Combination
                                                                              (N=134)       (N=134)        (N=132)    
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      SAE                                                                   104 (85.2%)   101 (82.1%)     99 (82.5%)  
        SAEs with fatal outcome                                             76 (62.3%)    70 (56.9%)      75 (62.5%)  
        Life-threatening SAEs                                                9 (7.4%)     13 (10.6%)      19 (15.8%)  
        SAEs requiring hospitalization                                      24 (19.7%)    28 (22.8%)      29 (24.2%)  
        SAEs resulting in substantial disruption of normal life functions   28 (23.0%)    21 (17.1%)      23 (19.2%)  
        Congenital anomaly or birth defect                                  26 (21.3%)    27 (22.0%)      20 (16.7%)  
        Other                                                               30 (24.6%)    37 (30.1%)      32 (26.7%)  
      AE leading to permanent discontinuation of study drug                 27 (22.1%)    26 (21.1%)      30 (25.0%)  
      AE leading to dose modification of study drug                         71 (58.2%)    86 (69.9%)      83 (69.2%)  
        AE leading to interruption of study drug                             4 (3.3%)      4 (3.3%)        3 (2.5%)   
        AE leading to reduction of study drug                               46 (37.7%)    46 (37.4%)      51 (42.5%)  
        AE leading to dose delay of study drug                              20 (16.4%)    28 (22.8%)      30 (25.0%)  
        Other                                                               34 (27.9%)    48 (39.0%)      46 (38.3%)  
      Any AE {1}                                                            122 (91.0%)   123 (91.8%)    120 (90.9%)  
        MILD                                                                 7 (5.2%)      9 (6.7%)        4 (3.0%)   
        MODERATE                                                            24 (17.9%)    24 (17.9%)      23 (17.4%)  
        SEVERE                                                              91 (67.9%)    90 (67.2%)      93 (70.5%)  
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      
      {1} - Severity as assessed by the investigator
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      (1) Treatment-emergent AE defined as [definition]. MedDRA version X.
      (2) Duration = [e.g., X-week double-blind treatment period or, median and a range indicating
      pooled trial durations].
      
      Abbreviations: AE, adverse event; CI, confidence interval; MedDRA, Medical Dictionary for
      Regulatory Activities; N, number of patients in treatment arm;
      n, number of patients with at least one event; SAE, serious adverse event

