# Table 16 generation works with default values

    Code
      res
    Output
      FMQ (Broad)                A: Drug X    B: Placebo   C: Combination
        Preferred Term            (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————
      C.1.1.1.3/B.2.2.3.1 AESI                                           
        dcd B.2.2.3.1            18 (13.4%)   22 (16.4%)     25 (18.9%)  
        dcd C.1.1.1.3            13 (9.7%)    10 (7.5%)      16 (12.1%)  

# Table 16 generation works with custom values

    Code
      res
    Output
      Table 16: Patients With Adverse Events by Male-Specific FDA Medical Query (Broad) and Preferred Term, Male Safety Population, Pooled Analyses
      
      ———————————————————————————————————————————————————————————————————
      FMQ (Broad)                A: Drug X    B: Placebo   C: Combination
        Preferred Term            (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————
      C.1.1.1.3/B.2.2.3.1 AESI                                           
        dcd B.2.2.3.1            18 (13.4%)   22 (16.4%)     25 (18.9%)  
        dcd C.1.1.1.3            13 (9.7%)    10 (7.5%)      16 (12.1%)  
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

# Table 16 generation works with NA values/pruned rows

    Code
      res
    Output
      FMQ (Broad)                A: Drug X    B: Placebo   C: Combination
        Preferred Term            (N=134)      (N=134)        (N=132)    
      ———————————————————————————————————————————————————————————————————
      C.1.1.1.3/B.2.2.3.1 AESI                                           
        dcd B.2.2.3.1            18 (13.4%)   22 (16.4%)     25 (18.9%)  
        dcd C.1.1.1.3            13 (9.7%)    10 (7.5%)      16 (12.1%)  

# Table 16 generation works with risk difference column

    Code
      res
    Output
      FMQ (Broad)                A: Drug X    B: Placebo   C: Combination   Risk Difference (%) (95% CI)
        Preferred Term            (N=134)      (N=134)        (N=132)                 (N=266)           
      ——————————————————————————————————————————————————————————————————————————————————————————————————
      C.1.1.1.3/B.2.2.3.1 AESI                                                                          
        dcd B.2.2.3.1            18 (13.4%)   22 (16.4%)     25 (18.9%)          -5.5 (-14.3 - 3.3)     
        dcd C.1.1.1.3            13 (9.7%)    10 (7.5%)      16 (12.1%)          -2.4 (-9.9 - 5.1)      

