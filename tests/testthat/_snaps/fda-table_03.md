# Table 3 generation works with default values

    Code
      res
    Output
      Disposition                              A: Drug X    B: Placebo    C: Combination
      ——————————————————————————————————————————————————————————————————————————————————
      Patients screened                           134           134            132      
      Screening failures                       42 (31.3%)   32 (23.9%)      26 (19.7%)  
        Inclusion/exclusion criteria not met    6 (4.5%)     10 (7.5%)      10 (7.6%)   
        Patient noncompliance                  12 (9.0%)     2 (1.5%)        6 (4.5%)   
        Consent withdrawn                      13 (9.7%)     12 (9.0%)       5 (3.8%)   
        Other                                  11 (8.2%)     8 (6.0%)        5 (3.8%)   
      Patients enrolled                        92 (68.7%)   102 (76.1%)    106 (80.3%)  
      Patients randomized                      92 (68.7%)   102 (76.1%)    106 (80.3%)  

# Table 3 generation works with custom values

    Code
      res
    Output
      Table 3. Patients Screening and Enrollment, Trials A and B
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                              Total   
                                               A: Drug X    B: Placebo    C: Combination   Population 
      Disposition                               (N=134)       (N=134)        (N=132)         (N=400)  
      ————————————————————————————————————————————————————————————————————————————————————————————————
      Patients screened                           134           134            132             400    
      Screening failures                       42 (31.3%)   32 (23.9%)      26 (19.7%)     100 (25.0%)
        Inclusion/exclusion criteria not met    6 (4.5%)     10 (7.5%)      10 (7.6%)       26 (6.5%) 
        Patient noncompliance                  12 (9.0%)     2 (1.5%)        6 (4.5%)       20 (5.0%) 
        Consent withdrawn                      13 (9.7%)     12 (9.0%)       5 (3.8%)       30 (7.5%) 
        Other                                  11 (8.2%)     8 (6.0%)        5 (3.8%)       24 (6.0%) 
      Patients enrolled                        92 (68.7%)   102 (76.1%)    106 (80.3%)     300 (75.0%)
      Patients randomized                      92 (68.7%)   102 (76.1%)    106 (80.3%)     300 (75.0%)
      ————————————————————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].

