# Table 32 generation works with default values

    Code
      res
    Output
      Diastolic Blood Pressure   A: Drug X    B: Placebo   C: Combination
      (Pa)                        (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————
      <60                        72 (53.7%)   83 (61.9%)     78 (59.1%)  
      >60                        62 (46.3%)   51 (38.1%)     54 (40.9%)  
      >90                            0            0              0       
      >110                           0            0              0       
      >=120                          0            0              0       

# Table 32 generation works with custom values

    Code
      res
    Output
      Table 32. Percentage of Patients With Maximum Diastolic Blood Pressure by Category
       of Blood Pressure Postbaseline, Safety Population, Pooled Analysis
      
      —————————————————————————————————————————————————————————————————————————————————
      Diastolic Blood Pressure                                                 Total   
      (Pa)                       A: Drug X    B: Placebo   C: Combination   Population 
                                  (N=134)      (N=134)        (N=132)         (N=400)  
      —————————————————————————————————————————————————————————————————————————————————
      <60                        72 (53.7%)   83 (61.9%)     78 (59.1%)     233 (58.2%)
      >60                        62 (46.3%)   51 (38.1%)     54 (40.9%)     167 (41.8%)
      >90                            0            0              0               0     
      >110                           0            0              0               0     
      >=120                          0            0              0               0     
      —————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      
      Abbreviations: CI, confidence interval; n, number of patients with indicated blood pressure;
      N, number of patients in treatment arm with available blood pressure data

# Table 32 generation works with pruned rows

    Code
      res
    Output
      Diastolic Blood Pressure   A: Drug X    B: Placebo   C: Combination
      (Pa)                        (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————
      <60                        72 (53.7%)   83 (61.9%)     78 (59.1%)  
      >60                        62 (46.3%)   51 (38.1%)     54 (40.9%)  

