# Table 18 generation works with default values

    Code
      res
    Output
      FMQ (Broad)                A: Drug X    B: Placebo   C: Combination
        Preferred Term            (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————
      C.1.1.1.3/B.2.2.3.1 AESI                                           
        dcd B.2.2.3.1            30 (22.4%)   32 (23.9%)     26 (19.7%)  
        dcd C.1.1.1.3            30 (22.4%)   36 (26.9%)     27 (20.5%)  

# Table 18 generation works with custom values

    Code
      res
    Output
      Table 18: Patients With Adverse Events by Female-Specific FDA Medical Query (Broad) and Preferred Term, Female Safety Population, Pooled Analyses
      
      ———————————————————————————————————————————————————————————————————
      FMQ (Broad)                A: Drug X    B: Placebo   C: Combination
        Preferred Term            (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————
      C.1.1.1.3/B.2.2.3.1 AESI                                           
        dcd B.2.2.3.1            30 (22.4%)   32 (23.9%)     26 (19.7%)  
        dcd C.1.1.1.3            30 (22.4%)   36 (26.9%)     27 (20.5%)  
      ———————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
       (1) Treatment-emergent adverse event defined as [definition]. MedDRA version X.
       (2) Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled trial durations].
       (3) Difference is shown between [treatment arms] (e.g., difference is shown between Drug Name dosage X vs. placebo).
      
      
      Abbreviations: CI, confidence interval;
      FMQ, FDA Medical Query;
      MedDRA, Medical Dictionary for Regulatory Activities;
      N, number of patients in treatment arm;
      n, number of patients with at least one event;
      PT, preferred term

# Table 18 generation works with NA values/pruned rows

    Code
      res
    Output
      FMQ (Broad)                A: Drug X    B: Placebo   C: Combination
        Preferred Term            (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————
      C.1.1.1.3/B.2.2.3.1 AESI                                           
        dcd B.2.2.3.1            30 (22.4%)   32 (23.9%)     26 (19.7%)  
        dcd C.1.1.1.3            30 (22.4%)   36 (26.9%)     27 (20.5%)  

# Table 18 generation works with risk difference column

    Code
      res
    Output
      FMQ (Broad)                A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
        Preferred Term            (N=134)      (N=134)        (N=132)                 (N=266)           
      ——————————————————————————————————————————————————————————————————————————————————————————————————
      C.1.1.1.3/B.2.2.3.1 AESI                                                                          
        dcd B.2.2.3.1            30 (22.4%)   32 (23.9%)     26 (19.7%)          2.7 (-7.1 - 12.5)      
        dcd C.1.1.1.3            30 (22.4%)   36 (26.9%)     27 (20.5%)          1.9 (-7.9 - 11.8)      

