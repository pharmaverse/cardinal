# Table 09 generation works with default values

    Code
      res
    Output
      System Organ Class                       A: Drug X    B: Placebo    C: Combination
        Reported Term for the Adverse Event     (N=134)       (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————————————————————————
      Any SAE                                 104 (77.6%)   101 (75.4%)     99 (75.0%)  
      cl A                                    48 (35.8%)    48 (35.8%)      50 (37.9%)  
        trm A.1.1.1.2                         48 (35.8%)    48 (35.8%)      50 (37.9%)  
      cl B                                    79 (59.0%)    78 (58.2%)      76 (57.6%)  
        trm B.1.1.1.1                         47 (35.1%)    49 (36.6%)      43 (32.6%)  
        trm B.2.2.3.1                         48 (35.8%)    54 (40.3%)      51 (38.6%)  
      cl D                                    50 (37.3%)    42 (31.3%)      51 (38.6%)  
        trm D.1.1.1.1                         50 (37.3%)    42 (31.3%)      51 (38.6%)  

# Table 09 generation works with custom values

    Code
      res
    Output
      Table 9. Patients With Serious Adverse Events(1) by System Organ Class and Preferred Term, Safety Population, Pooled Analyses(2)
      
      ——————————————————————————————————————————————————————————————————————————————————
      System Organ Class                       A: Drug X    B: Placebo    C: Combination
        Reported Term for the Adverse Event     (N=134)       (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————————————————————————
      Any SAE                                 104 (77.6%)   101 (75.4%)     99 (75.0%)  
      cl A                                    48 (35.8%)    48 (35.8%)      50 (37.9%)  
        trm A.1.1.1.2                         48 (35.8%)    48 (35.8%)      50 (37.9%)  
      cl B                                    79 (59.0%)    78 (58.2%)      76 (57.6%)  
        trm B.1.1.1.1                         47 (35.1%)    49 (36.6%)      43 (32.6%)  
        trm B.2.2.3.1                         48 (35.8%)    54 (40.3%)      51 (38.6%)  
      cl D                                    50 (37.3%)    42 (31.3%)      51 (38.6%)  
        trm D.1.1.1.1                         50 (37.3%)    42 (31.3%)      51 (38.6%)  
      ——————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      (1) Defined as any untoward medical occurrence that, at any dose that results in death, is life-threatening,
      requires hospitalization or prolongation of existing hospitalization, results in persistent incapacity or
      substantial disruption of the ability to conduct normal life functions, or is a congenital anomaly or
      birth defect.
      (2) Duration = [e.g., X week double-blind treatment period or median and
      a range indicating pooled trial durations].
      
      Abbreviations: AE, adverse event; CI, confidence interval; N, number of patients in treatment arm;
      n, number of patients with adverse event; PT, preferred term; SAE, serious adverse event;
      SOC, System Organ Class

