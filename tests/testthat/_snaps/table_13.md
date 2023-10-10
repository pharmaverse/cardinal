# Table 13 generation works with default values

    Code
      res
    Output
                                A: Drug X    B: Placebo   C: Combination
      Dictionary-Derived Term    (N=134)      (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————————
      dcd A.1.1.1.1             50 (37.3%)   45 (33.6%)     63 (47.7%)  
      dcd A.1.1.1.2             48 (35.8%)   48 (35.8%)     50 (37.9%)  
      dcd B.1.1.1.1             47 (35.1%)   49 (36.6%)     43 (32.6%)  
      dcd B.2.1.2.1             49 (36.6%)   44 (32.8%)     52 (39.4%)  
      dcd B.2.2.3.1             48 (35.8%)   54 (40.3%)     51 (38.6%)  
      dcd C.1.1.1.3             43 (32.1%)   46 (34.3%)     43 (32.6%)  
      dcd C.2.1.2.1             35 (26.1%)   48 (35.8%)     55 (41.7%)  
      dcd D.1.1.1.1             50 (37.3%)   42 (31.3%)     51 (38.6%)  
      dcd D.1.1.4.2             48 (35.8%)   42 (31.3%)     50 (37.9%)  
      dcd D.2.1.5.3             47 (35.1%)   58 (43.3%)     57 (43.2%)  

# Table 13 generation works with custom values

    Code
      res
    Output
      Table 13. Patients With Common Adverse Events(1) Occurring at >=40% Frequency, Safety Population, Pooled Analyses(2)
      
      ——————————————————————————————————————————————————————————————————————————
                          A: Drug X    B: Placebo   C: Combination      Total   
      Preferred Term(3)    (N=134)      (N=134)        (N=132)         (N=400)  
      ——————————————————————————————————————————————————————————————————————————
      dcd A.1.1.1.1       50 (37.3%)   45 (33.6%)     63 (47.7%)     158 (39.5%)
      dcd B.2.2.3.1       48 (35.8%)   54 (40.3%)     51 (38.6%)     153 (38.2%)
      dcd C.2.1.2.1       35 (26.1%)   48 (35.8%)     55 (41.7%)     138 (34.5%)
      dcd D.2.1.5.3       47 (35.1%)   58 (43.3%)     57 (43.2%)     162 (40.5%)
      ——————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      (1) Treatment-emergent adverse event defined as [definition]. MedDRA version X.
      (2) Duration = [e.g., X week double-blind treatment period or median and a range indicating
      pooled trial durations].
      (3) Coded as MedDRA preferred terms.
      
      Abbreviations: CI, confidence interval; MedDRA, Medical Dictionary for Regulatory Activities;
      N, number of patients in treatment arm; n, number of patients with adverse event; PT, preferred term

# Table 13 generation works with risk difference column

    Code
      res
    Output
                                A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
      Dictionary-Derived Term    (N=134)      (N=134)        (N=132)                 (N=268)           
      —————————————————————————————————————————————————————————————————————————————————————————————————
      dcd A.1.1.1.1             50 (37.3%)   45 (33.6%)     63 (47.7%)          -3.7 (-15.2 - 7.7)     
      dcd A.1.1.1.2             48 (35.8%)   48 (35.8%)     50 (37.9%)          0.0 (-11.5 - 11.5)     
      dcd B.1.1.1.1             47 (35.1%)   49 (36.6%)     43 (32.6%)          1.5 (-10.0 - 13.0)     
      dcd B.2.1.2.1             49 (36.6%)   44 (32.8%)     52 (39.4%)          -3.7 (-15.1 - 7.7)     
      dcd B.2.2.3.1             48 (35.8%)   54 (40.3%)     51 (38.6%)          4.5 (-7.1 - 16.1)      
      dcd C.1.1.1.3             43 (32.1%)   46 (34.3%)     43 (32.6%)          2.2 (-9.0 - 13.5)      
      dcd C.2.1.2.1             35 (26.1%)   48 (35.8%)     55 (41.7%)          9.7 (-1.3 - 20.7)      
      dcd D.1.1.1.1             50 (37.3%)   42 (31.3%)     51 (38.6%)          -6.0 (-17.3 - 5.4)     
      dcd D.1.1.4.2             48 (35.8%)   42 (31.3%)     50 (37.9%)          -4.5 (-15.8 - 6.8)     
      dcd D.2.1.5.3             47 (35.1%)   58 (43.3%)     57 (43.2%)          8.2 (-3.4 - 19.9)      

