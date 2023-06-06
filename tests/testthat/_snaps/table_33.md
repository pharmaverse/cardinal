# Table 33 generation works with default values

    Code
      res
    Output
      Blood Pressure   A: Drug X    B: Placebo   C: Combination
      (Pa)              (N=134)      (N=134)        (N=132)    
      —————————————————————————————————————————————————————————
      SBP <90          134 (100%)   134 (100%)     132 (100%)  
      DBP <60          72 (53.7%)   83 (61.9%)     78 (59.1%)  

# Table 33 generation works with custom values

    Code
      res
    Output
      Table 33. Percentage of Patients Meeting Specific Hypotension Levels
       Postbaseline, Safety Population, Pooled Analysis
      
      ———————————————————————————————————————————————————————————————————————
      Blood Pressure                                                 Total   
      (Pa)             A: Drug X    B: Placebo   C: Combination   Population 
                        (N=134)      (N=134)        (N=132)         (N=400)  
      ———————————————————————————————————————————————————————————————————————
      SBP <90          134 (100%)   134 (100%)     132 (100%)     400 (100%) 
      DBP <60          72 (53.7%)   83 (61.9%)     78 (59.1%)     233 (58.2%)
      ———————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      (1) Difference is shown between [treatment arms] (e.g., difference is shown
      between Drug Name dosage X vs. placebo).
      
      Abbreviations: CI, confidence interval; N, number of patients in treatment arm with
      available blood pressure data; n, number of patients with indicated blood pressure

# Table 33 generation works with pruned rows

    Code
      res
    Output
      Blood Pressure   A: Drug X    B: Placebo   C: Combination
      (Pa)              (N=134)      (N=134)        (N=132)    
      —————————————————————————————————————————————————————————
      DBP <60          72 (53.7%)   83 (61.9%)     78 (59.1%)  

