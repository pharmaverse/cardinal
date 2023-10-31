# Table 09 generation works with default values

    Code
      res
    Output
      System Organ Class           A: Drug X    B: Placebo    C: Combination
        Dictionary-Derived Term     (N=134)       (N=134)        (N=132)    
      ——————————————————————————————————————————————————————————————————————
      Any SAE                     104 (77.6%)   101 (75.4%)     99 (75.0%)  
      cl A                        48 (35.8%)    48 (35.8%)      50 (37.9%)  
        dcd A.1.1.1.2             48 (35.8%)    48 (35.8%)      50 (37.9%)  
      cl B                        79 (59.0%)    78 (58.2%)      76 (57.6%)  
        dcd B.1.1.1.1             47 (35.1%)    49 (36.6%)      43 (32.6%)  
        dcd B.2.2.3.1             48 (35.8%)    54 (40.3%)      51 (38.6%)  
      cl D                        50 (37.3%)    42 (31.3%)      51 (38.6%)  
        dcd D.1.1.1.1             50 (37.3%)    42 (31.3%)      51 (38.6%)  

# Table 09 generation works with custom values

    Code
      res
    Output
      Table 9. Patients With Serious Adverse Events(1) by System Organ Class and Preferred Term, Safety Population, Pooled Analyses(2)
      
      ————————————————————————————————————————————————————————————————————————————————————
      System Organ Class           A: Drug X    B: Placebo    C: Combination      Total   
        Dictionary-Derived Term     (N=134)       (N=134)        (N=132)         (N=400)  
      ————————————————————————————————————————————————————————————————————————————————————
      Any SAE                     104 (77.6%)   101 (75.4%)     99 (75.0%)     304 (76.0%)
      cl A                        48 (35.8%)    48 (35.8%)      50 (37.9%)     146 (36.5%)
        dcd A.1.1.1.2             48 (35.8%)    48 (35.8%)      50 (37.9%)     146 (36.5%)
      cl B                        79 (59.0%)    78 (58.2%)      76 (57.6%)     233 (58.2%)
        dcd B.1.1.1.1             47 (35.1%)    49 (36.6%)      43 (32.6%)     139 (34.8%)
        dcd B.2.2.3.1             48 (35.8%)    54 (40.3%)      51 (38.6%)     153 (38.2%)
      cl D                        50 (37.3%)    42 (31.3%)      51 (38.6%)     143 (35.8%)
        dcd D.1.1.1.1             50 (37.3%)    42 (31.3%)      51 (38.6%)     143 (35.8%)
      ————————————————————————————————————————————————————————————————————————————————————
      
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

# Table 09 (gt) generation works with default values
# Table 09 generation works with risk difference column
      $data
      # A tibble: 8 x 4
        AEDECOD       `A: Drug X` `B: Placebo` `C: Combination`
        <chr>         <chr>       <chr>        <chr>           
      1 Any SAE       104 (41.8%) 101 (39.6%)  99 (35.1%)      
      2 cl A          48 (19.3%)  48 (18.8%)   50 (17.7%)      
      3 dcd A.1.1.1.2 48 (19.3%)  48 (18.8%)   50 (17.7%)      
      4 cl B          79 (31.7%)  78 (30.6%)   76 (27.0%)      
      5 dcd B.1.1.1.1 47 (18.9%)  49 (19.2%)   43 (15.2%)      
      6 dcd B.2.2.3.1 48 (19.3%)  54 (21.2%)   51 (18.1%)      
      7 cl D          50 (20.1%)  42 (16.5%)   51 (18.1%)      
      8 dcd D.1.1.1.1 50 (20.1%)  42 (16.5%)   51 (18.1%)      
      
      $column_label
      $column_label[[1]]
      [1] "AEDECOD"
      
      $column_label[[2]]
      A: Drug X<br/>(N=249)
      
      $column_label[[3]]
      B: Placebo<br/>(N=255)
      
      $column_label[[4]]
      C: Combination<br/>(N=282)
      
      
      $header
      $header$title
      NULL
      
      $header$subtitle
      NULL
      
      $header$preheader
      NULL
      
      
      $footnotes
      list()
      

# Table 09 (gt) generation works with costum values

    Code
      res
    Output
      $data
      # A tibble: 8 x 7
        AEDECOD       `A: Drug X` `B: Placebo` `C: Combination` rd_A: Drug X-C: Comb~1
        <chr>         <chr>       <chr>        <chr>            <chr>                 
      1 Any SAE       104 (77.6%) 101 (75.4%)  99 (75.0%)       0.026 (-0.084,  0.136)
      2 cl A          48 (35.8%)  48 (35.8%)   50 (37.9%)       -0.021 (-0.14,  0.10) 
      3 dcd A.1.1.1.2 48 (35.8%)  48 (35.8%)   50 (37.9%)       -0.021 (-0.14,  0.10) 
      4 cl B          79 (59.0%)  78 (58.2%)   76 (57.6%)       0.014 (-0.11,  0.14)  
      5 dcd B.1.1.1.1 47 (35.1%)  49 (36.6%)   43 (32.6%)       0.025 (-0.096,  0.146)
      6 dcd B.2.2.3.1 48 (35.8%)  54 (40.3%)   51 (38.6%)       -0.028 (-0.152,  0.09~
      7 cl D          50 (37.3%)  42 (31.3%)   51 (38.6%)       -0.013 (-0.14,  0.11) 
      8 dcd D.1.1.1.1 50 (37.3%)  42 (31.3%)   51 (38.6%)       -0.013 (-0.14,  0.11) 
      # i abbreviated name: 1: `rd_A: Drug X-C: Combination`
      # i 2 more variables: `rd_A: Drug X-B: Placebo` <chr>, Total <chr>
      
      $column_label
      $column_label[[1]]
      [1] "AEDECOD"
      
      $column_label[[2]]
      A: Drug X<br/>(N=134)
      
      $column_label[[3]]
      B: Placebo<br/>(N=134)
      
      $column_label[[4]]
      C: Combination<br/>(N=132)
      
      $column_label[[5]]
      Risk Difference <br/>A: Drug X-C: Combination<br/> (%) (95% CI)
      
      $column_label[[6]]
      Risk Difference <br/>A: Drug X-B: Placebo<br/> (%) (95% CI)
      
      $column_label[[7]]
      Total<br/>(N=400)
      
      
      $header
      $header$title
      [1] "Table 9. Patients With Serious Adverse Events"
      
      $header$subtitle
      [1] "by System Organ Class and Preferred Term, Safety Population, Pooled Analyses"
      
      $header$preheader
      NULL
      
      
      $footnotes
      $footnotes[[1]]
      [1] "Duration = [e.g., X week double-blind treatment period or median and a range indicating pooled trial durations]."
      
      $footnotes[[2]]
      [1] "Difference is shown between [treatment arms] (e.g., difference is shown between Drug Name dosage X vs. placebo)."
      
      
      System Organ Class           A: Drug X    B: Placebo    C: Combination   Risk Difference (%) (95% CI)
        Dictionary-Derived Term     (N=134)       (N=134)        (N=132)                 (N=268)           
      —————————————————————————————————————————————————————————————————————————————————————————————————————
      Any SAE                     104 (77.6%)   101 (75.4%)     99 (75.0%)          -2.2 (-12.4 - 7.9)     
      cl A                        48 (35.8%)    48 (35.8%)      50 (37.9%)          0.0 (-11.5 - 11.5)     
        dcd A.1.1.1.2             48 (35.8%)    48 (35.8%)      50 (37.9%)          0.0 (-11.5 - 11.5)     
      cl B                        79 (59.0%)    78 (58.2%)      76 (57.6%)         -0.7 (-12.5 - 11.0)     
        dcd B.1.1.1.1             47 (35.1%)    49 (36.6%)      43 (32.6%)          1.5 (-10.0 - 13.0)     
        dcd B.2.2.3.1             48 (35.8%)    54 (40.3%)      51 (38.6%)          4.5 (-7.1 - 16.1)      
      cl D                        50 (37.3%)    42 (31.3%)      51 (38.6%)          -6.0 (-17.3 - 5.4)     
        dcd D.1.1.1.1             50 (37.3%)    42 (31.3%)      51 (38.6%)          -6.0 (-17.3 - 5.4)     
