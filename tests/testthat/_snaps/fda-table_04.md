# Table 04 generation works with default values

    Code
      res
    Output
                                A: Drug X    B: Placebo   C: Combination
                                 (N=134)      (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————————
      Safety population         134 (100%)   134 (100%)     132 (100%)  
      Discontinued study drug   42 (31.3%)   40 (29.9%)     38 (28.8%)  
        Adverse event            3 (2.2%)     6 (4.5%)       5 (3.8%)   
        Lack of efficacy         2 (1.5%)     2 (1.5%)       3 (2.3%)   
        Protocol deviation          0            0              0       
        Death                   25 (18.7%)   23 (17.2%)     22 (16.7%)  
        Withdrawal by subject       0            0              0       
        Other                    3 (2.2%)     4 (3.0%)       3 (2.3%)   
      Discontinued study        42 (31.3%)   40 (29.9%)     38 (28.8%)  
        Death                   25 (18.7%)   23 (17.2%)     22 (16.7%)  
        Lost to follow-up           0            0              0       
        Withdrawal by subject       0            0              0       
        Physician decision          0            0              0       
        Protocol deviation       5 (3.7%)     3 (2.2%)       4 (3.0%)   
        Other                    3 (2.2%)     4 (3.0%)       3 (2.3%)   

# Table 04 generation works with custom values

    Code
      res
    Output
      Patient Disposition, Pooled Analyses (1,2)
      
      ——————————————————————————————————————————————————————————————————
                                A: Drug X    B: Placebo   C: Combination
                                 (N=134)      (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————————
      Patients randomized       58 (43.3%)   62 (46.3%)     72 (54.5%)  
      ITT/mITT population       134 (100%)   134 (100%)     132 (100%)  
      Safety population         134 (100%)   134 (100%)     132 (100%)  
      Per-protocol population   58 (43.3%)   62 (46.3%)     72 (54.5%)  
      Discontinued study drug   42 (31.3%)   40 (29.9%)     38 (28.8%)  
        Adverse event            3 (2.2%)     6 (4.5%)       5 (3.8%)   
        Lack of efficacy         2 (1.5%)     2 (1.5%)       3 (2.3%)   
        Death                   25 (18.7%)   23 (17.2%)     22 (16.7%)  
        Other                    3 (2.2%)     4 (3.0%)       3 (2.3%)   
      Discontinued study        42 (31.3%)   40 (29.9%)     38 (28.8%)  
        Death                   25 (18.7%)   23 (17.2%)     22 (16.7%)  
        Protocol deviation       5 (3.7%)     3 (2.2%)       4 (3.0%)   
        Other                    3 (2.2%)     4 (3.0%)       3 (2.3%)   
      ——————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      (1) Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled
      trial durations].
      (2) [Include route of administration for all treatment arms if different ROA were used in the drug
      development].
      (3) Difference is shown between [treatment arms] (e.g., difference is shown between Drug Name
      dosage X vs. placebo).
      
      Abbreviations: CI, confidence interval; ITT, intention-to-treat; mITT, modified intention-to-treat;
      N, number of patients in treatment arm; n, number of patients in specified population or group

