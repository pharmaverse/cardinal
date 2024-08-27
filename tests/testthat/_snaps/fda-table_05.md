# Table 05 generation works with default values

    Code
      res
    Output
      $table
                                               A: Drug X                B: Placebo             C: Combination    
      Parameter                                 (N=134)                  (N=134)                  (N=132)        
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
      Duration of Treatment, days                                                                                
        Mean (SD)                           199.58 (115.07)          199.74 (108.12)          195.78 (122.03)    
        Median (min - max)               205.50 (2.00 - 394.00)   198.50 (1.00 - 389.00)   201.00 (0.00 - 399.00)
        Interquartile range                 102.00 - 299.00          106.25 - 298.75           89.50 - 303.25    
        Total exposure (person years)       26744.00 (73.22)         26765.00 (73.28)         25843.00 (70.75)   
      Patients Treated, by duration                                                                              
        Any duration (at least 1 dose)         134 (100%)               134 (100%)              130 (98.5%)      
        <1 month                                6 (4.5%)                 5 (3.7%)                15 (11.4%)      
        >=1 month                             128 (95.5%)              129 (96.3%)              117 (88.6%)      
        >=3 months                            102 (76.1%)              107 (79.9%)               99 (75.0%)      
        >=6 months                             70 (52.2%)               72 (53.7%)               70 (53.0%)      
        >=12 months                            11 (8.2%)                 6 (4.5%)                 9 (6.8%)       
      
      $ard
    Message
      {cards} data frame: 63 x 12
    Output
         group1 group1_level variable variable_level    stat_name stat_label    stat stat_fmt
      1     ARM    A: Drug X   TRTDUR                        mean       Mean 199.582   199.58
      2     ARM    A: Drug X   TRTDUR                          sd         SD 115.065   115.07
      3     ARM    A: Drug X   TRTDUR                      median     Median   205.5    205.5
      4     ARM    A: Drug X   TRTDUR                         min        Min       2        2
      5     ARM    A: Drug X   TRTDUR                         max        Max     394      394
      6     ARM    A: Drug X   TRTDUR                         p25         Q1     102      102
      7     ARM    A: Drug X   TRTDUR                         p75         Q3     299      299
      8     ARM    A: Drug X   TRTDUR                tot_exposure  tot_expo…   26744    26744
      9     ARM    A: Drug X   TRTDUR                  person_yrs  person_y…  73.221    73.22
      10    ARM    B: Place…   TRTDUR                        mean       Mean 199.739   199.74
    Message
      i 53 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

---

    Code
      res2
    Output
                                               A: Drug X                B: Placebo             C: Combination    
      Parameter                                 (N=134)                  (N=134)                  (N=132)        
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
      Duration of Treatment, days                                                                                
        Mean (SD)                           199.58 (115.07)          199.74 (108.12)          195.78 (122.03)    
        Median (min - max)               205.50 (2.00 - 394.00)   198.50 (1.00 - 389.00)   201.00 (0.00 - 399.00)
        Interquartile range                 102.00 - 299.00          106.25 - 298.75           89.50 - 303.25    
        Total exposure (person years)       26744.00 (73.22)         26765.00 (73.28)         25843.00 (70.75)   
      Patients Treated, by duration                                                                              
        Any duration (at least 1 dose)         134 (100%)               134 (100%)              130 (98.5%)      
        <1 month                                6 (4.5%)                 5 (3.7%)                15 (11.4%)      
        >=1 month                             128 (95.5%)              129 (96.3%)              117 (88.6%)      
        >=3 months                            102 (76.1%)              107 (79.9%)               99 (75.0%)      
        >=6 months                             70 (52.2%)               72 (53.7%)               70 (53.0%)      
        >=12 months                            11 (8.2%)                 6 (4.5%)                 9 (6.8%)       

---

    Code
      res3[, 1:9] %>% data.frame()
    Output
         group1 group1_level variable variable_level     context    stat_name   stat_label       stat stat_fmt
      1     ARM            1   TRTDUR           NULL  continuous         mean         Mean   199.5821   199.58
      2     ARM            1   TRTDUR           NULL  continuous           sd           SD    115.065   115.07
      3     ARM            1   TRTDUR           NULL  continuous       median       Median      205.5    205.5
      4     ARM            1   TRTDUR           NULL  continuous          min          Min          2        2
      5     ARM            1   TRTDUR           NULL  continuous          max          Max        394      394
      6     ARM            1   TRTDUR           NULL  continuous          p25           Q1        102      102
      7     ARM            1   TRTDUR           NULL  continuous          p75           Q3        299      299
      8     ARM            1   TRTDUR           NULL  continuous tot_exposure tot_exposure      26744    26744
      9     ARM            1   TRTDUR           NULL  continuous   person_yrs   person_yrs   73.22108    73.22
      10    ARM            2   TRTDUR           NULL  continuous         mean         Mean   199.7388   199.74
      11    ARM            2   TRTDUR           NULL  continuous           sd           SD   108.1237   108.12
      12    ARM            2   TRTDUR           NULL  continuous       median       Median      198.5    198.5
      13    ARM            2   TRTDUR           NULL  continuous          min          Min          1        1
      14    ARM            2   TRTDUR           NULL  continuous          max          Max        389      389
      15    ARM            2   TRTDUR           NULL  continuous          p25           Q1        106      106
      16    ARM            2   TRTDUR           NULL  continuous          p75           Q3        299      299
      17    ARM            2   TRTDUR           NULL  continuous tot_exposure tot_exposure      26765    26765
      18    ARM            2   TRTDUR           NULL  continuous   person_yrs   person_yrs   73.27858    73.28
      19    ARM            3   TRTDUR           NULL  continuous         mean         Mean   195.7803   195.78
      20    ARM            3   TRTDUR           NULL  continuous           sd           SD   122.0277   122.03
      21    ARM            3   TRTDUR           NULL  continuous       median       Median        201      201
      22    ARM            3   TRTDUR           NULL  continuous          min          Min          0        0
      23    ARM            3   TRTDUR           NULL  continuous          max          Max        399      399
      24    ARM            3   TRTDUR           NULL  continuous          p25           Q1         87       87
      25    ARM            3   TRTDUR           NULL  continuous          p75           Q3      303.5    303.5
      26    ARM            3   TRTDUR           NULL  continuous tot_exposure tot_exposure      25843    25843
      27    ARM            3   TRTDUR           NULL  continuous   person_yrs   person_yrs   70.75428    70.75
      28    ARM            1    D_ANY           TRUE dichotomous            n            n        134     NULL
      29    ARM            1    D_ANY           TRUE dichotomous            p            %          1     NULL
      30    ARM            2    D_ANY           TRUE dichotomous            n            n        134     NULL
      31    ARM            2    D_ANY           TRUE dichotomous            p            %          1     NULL
      32    ARM            3    D_ANY           TRUE dichotomous            n            n        130     NULL
      33    ARM            3    D_ANY           TRUE dichotomous            p            %  0.9848485     NULL
      34    ARM            1    D_LT1           TRUE dichotomous            n            n          6     NULL
      35    ARM            1    D_LT1           TRUE dichotomous            p            % 0.04477612     NULL
      36    ARM            2    D_LT1           TRUE dichotomous            n            n          5     NULL
      37    ARM            2    D_LT1           TRUE dichotomous            p            % 0.03731343     NULL
      38    ARM            3    D_LT1           TRUE dichotomous            n            n         15     NULL
      39    ARM            3    D_LT1           TRUE dichotomous            p            %  0.1136364     NULL
      40    ARM            1    D_GT1           TRUE dichotomous            n            n        128     NULL
      41    ARM            1    D_GT1           TRUE dichotomous            p            %  0.9552239     NULL
      42    ARM            2    D_GT1           TRUE dichotomous            n            n        129     NULL
      43    ARM            2    D_GT1           TRUE dichotomous            p            %  0.9626866     NULL
      44    ARM            3    D_GT1           TRUE dichotomous            n            n        117     NULL
      45    ARM            3    D_GT1           TRUE dichotomous            p            %  0.8863636     NULL
      46    ARM            1    D_GT3           TRUE dichotomous            n            n        102     NULL
      47    ARM            1    D_GT3           TRUE dichotomous            p            %   0.761194     NULL
      48    ARM            2    D_GT3           TRUE dichotomous            n            n        107     NULL
      49    ARM            2    D_GT3           TRUE dichotomous            p            %  0.7985075     NULL
      50    ARM            3    D_GT3           TRUE dichotomous            n            n         99     NULL
      51    ARM            3    D_GT3           TRUE dichotomous            p            %       0.75     NULL
      52    ARM            1    D_GT6           TRUE dichotomous            n            n         70     NULL
      53    ARM            1    D_GT6           TRUE dichotomous            p            %  0.5223881     NULL
      54    ARM            2    D_GT6           TRUE dichotomous            n            n         72     NULL
      55    ARM            2    D_GT6           TRUE dichotomous            p            %  0.5373134     NULL
      56    ARM            3    D_GT6           TRUE dichotomous            n            n         70     NULL
      57    ARM            3    D_GT6           TRUE dichotomous            p            %   0.530303     NULL
      58    ARM            1   D_GT12           TRUE dichotomous            n            n         11     NULL
      59    ARM            1   D_GT12           TRUE dichotomous            p            % 0.08208955     NULL
      60    ARM            2   D_GT12           TRUE dichotomous            n            n          6     NULL
      61    ARM            2   D_GT12           TRUE dichotomous            p            % 0.04477612     NULL
      62    ARM            3   D_GT12           TRUE dichotomous            n            n          9     NULL
      63    ARM            3   D_GT12           TRUE dichotomous            p            % 0.06818182     NULL

# Table 05 generation works with rtables engine with custom values

    Code
      res
    Output
      $table
      Table 5. Duration of Treatment Exposure, Safety Population, Pooled Analyses*
      
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                              Total       
                                             A: Drug X            B: Placebo         C: Combination         Population    
      Parameter                               (N=134)              (N=134)              (N=132)              (N=400)      
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      Duration of Treatment, years                                                                                        
        Mean (SD)                           0.55 (0.32)          0.55 (0.30)          0.54 (0.33)          0.54 (0.31)    
        Median (min - max)               0.56 (0.01 - 1.08)   0.54 (0.00 - 1.07)   0.55 (0.00 - 1.09)   0.55 (0.00 - 1.09)
        Interquartile range                 0.28 - 0.82          0.29 - 0.82          0.25 - 0.83          0.28 - 0.82    
        Total exposure (person years)      73.22 (73.22)        73.28 (73.28)        70.75 (70.75)       217.25 (217.25)  
      Patients Treated, by duration                                                                                       
        Any duration (at least 1 dose)       134 (100%)           134 (100%)          130 (98.5%)          398 (99.5%)    
        <1 month                              6 (4.5%)             5 (3.7%)            15 (11.4%)           26 (6.5%)     
        >=1 month                           128 (95.5%)          129 (96.3%)          117 (88.6%)          374 (93.5%)    
        >=3 months                          102 (76.1%)          107 (79.9%)           99 (75.0%)          308 (77.0%)    
        >=6 months                           70 (52.2%)           72 (53.7%)           70 (53.0%)          212 (53.0%)    
        >=12 months                          11 (8.2%)             6 (4.5%)             9 (6.8%)            26 (6.5%)     
      ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      * Duration = [e.g., X-week double-blind treatment period or median and a range indicating pooled trial durations].
      
      Abbreviations: CI, confidence interval; N, number of patients in treatment arm;
        n, number of patients with given treatment duration; NA, not applicable; SD, standard deviation
      
      $ard
    Message
      {cards} data frame: 63 x 12
    Output
         group1 group1_level variable variable_level    stat_name stat_label   stat
      1     ARM    A: Drug X   TRTDUR                        mean       Mean  0.546
      2     ARM    A: Drug X   TRTDUR                          sd         SD  0.315
      3     ARM    A: Drug X   TRTDUR                      median     Median  0.563
      4     ARM    A: Drug X   TRTDUR                         min        Min  0.005
      5     ARM    A: Drug X   TRTDUR                         max        Max  1.079
      6     ARM    A: Drug X   TRTDUR                         p25         Q1  0.279
      7     ARM    A: Drug X   TRTDUR                         p75         Q3  0.819
      8     ARM    A: Drug X   TRTDUR                tot_exposure  tot_expo… 73.221
      9     ARM    A: Drug X   TRTDUR                  person_yrs  person_y… 73.221
      10    ARM    B: Place…   TRTDUR                        mean       Mean  0.547
         stat_fmt
      1      0.55
      2      0.32
      3      0.56
      4      0.01
      5      1.08
      6      0.28
      7      0.82
      8     73.22
      9     73.22
      10     0.55
    Message
      i 53 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

# Table 05 generation works with rtables engine with NA values/pruned rows

    Code
      res
    Output
      $table
                                               A: Drug X               B: Placebo            C: Combination    
      Parameter                                 (N=134)                 (N=134)                  (N=132)       
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      Duration of Treatment, days                                                                              
        Mean (SD)                            92.42 (47.05)           98.56 (47.83)            81.82 (52.92)    
        Median (min - max)               96.00 (2.00 - 180.00)   104.00 (1.00 - 178.00)   77.00 (0.00 - 171.00)
        Interquartile range                 49.75 - 129.00           57.50 - 133.50          32.75 - 124.50    
        Total exposure (person years)       5915.00 (16.19)         6111.00 (16.73)          5073.00 (13.89)   
      Patients Treated, by duration                                                                            
        Any duration (at least 1 dose)        64 (47.8%)               62 (46.3%)              60 (45.5%)      
        <1 month                               6 (4.5%)                 5 (3.7%)               15 (11.4%)      
        >=1 month                             58 (43.3%)               57 (42.5%)              47 (35.6%)      
        >=3 months                            32 (23.9%)               35 (26.1%)              29 (22.0%)      
        >=6 months                                 0                       0                        0          
        >=12 months                                0                       0                        0          
      
      $ard
    Message
      {cards} data frame: 63 x 12
    Output
         group1 group1_level variable variable_level    stat_name stat_label   stat
      1     ARM    A: Drug X   TRTDUR                        mean       Mean 92.422
      2     ARM    A: Drug X   TRTDUR                          sd         SD 47.047
      3     ARM    A: Drug X   TRTDUR                      median     Median     96
      4     ARM    A: Drug X   TRTDUR                         min        Min      2
      5     ARM    A: Drug X   TRTDUR                         max        Max    180
      6     ARM    A: Drug X   TRTDUR                         p25         Q1   49.5
      7     ARM    A: Drug X   TRTDUR                         p75         Q3    129
      8     ARM    A: Drug X   TRTDUR                tot_exposure  tot_expo…   5915
      9     ARM    A: Drug X   TRTDUR                  person_yrs  person_y… 16.194
      10    ARM    B: Place…   TRTDUR                        mean       Mean 98.565
         stat_fmt
      1     92.42
      2     47.05
      3        96
      4         2
      5       180
      6      49.5
      7       129
      8      5915
      9     16.19
      10    98.56
    Message
      i 53 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

---

    Code
      res
    Output
      $table
                                               A: Drug X               B: Placebo            C: Combination    
      Parameter                                 (N=134)                 (N=134)                  (N=132)       
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      Duration of Treatment, days                                                                              
        Mean (SD)                            92.42 (47.05)           98.56 (47.83)            81.82 (52.92)    
        Median (min - max)               96.00 (2.00 - 180.00)   104.00 (1.00 - 178.00)   77.00 (0.00 - 171.00)
        Interquartile range                 49.75 - 129.00           57.50 - 133.50          32.75 - 124.50    
        Total exposure (person years)       5915.00 (16.19)         6111.00 (16.73)          5073.00 (13.89)   
      Patients Treated, by duration                                                                            
        Any duration (at least 1 dose)        64 (47.8%)               62 (46.3%)              60 (45.5%)      
        <1 month                               6 (4.5%)                 5 (3.7%)               15 (11.4%)      
        >=1 month                             58 (43.3%)               57 (42.5%)              47 (35.6%)      
        >=3 months                            32 (23.9%)               35 (26.1%)              29 (22.0%)      
      
      $ard
    Message
      {cards} data frame: 63 x 12
    Output
         group1 group1_level variable variable_level    stat_name stat_label   stat
      1     ARM    A: Drug X   TRTDUR                        mean       Mean 92.422
      2     ARM    A: Drug X   TRTDUR                          sd         SD 47.047
      3     ARM    A: Drug X   TRTDUR                      median     Median     96
      4     ARM    A: Drug X   TRTDUR                         min        Min      2
      5     ARM    A: Drug X   TRTDUR                         max        Max    180
      6     ARM    A: Drug X   TRTDUR                         p25         Q1   49.5
      7     ARM    A: Drug X   TRTDUR                         p75         Q3    129
      8     ARM    A: Drug X   TRTDUR                tot_exposure  tot_expo…   5915
      9     ARM    A: Drug X   TRTDUR                  person_yrs  person_y… 16.194
      10    ARM    B: Place…   TRTDUR                        mean       Mean 98.565
         stat_fmt
      1     92.42
      2     47.05
      3        96
      4         2
      5       180
      6      49.5
      7       129
      8      5915
      9     16.19
      10    98.56
    Message
      i 53 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

# Table 05 generation works with rtables engine with risk difference column

    Code
      res
    Output
      $table
                                               A: Drug X                B: Placebo             C: Combination       Risk Difference (%) (95% CI)
      Parameter                                 (N=134)                  (N=134)                  (N=132)                     (N=268)           
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      Duration of Treatment, days                                                                                                               
        Mean (SD)                           199.58 (115.07)          199.74 (108.12)          195.78 (122.03)                    NA             
        Median (min - max)               205.50 (2.00 - 394.00)   198.50 (1.00 - 389.00)   201.00 (0.00 - 399.00)                NA             
        Interquartile range                 102.00 - 299.00          106.25 - 298.75           89.50 - 303.25                    NA             
        Total exposure (person years)       26744.00 (73.22)         26765.00 (73.28)         25843.00 (70.75)                   NA             
      Patients Treated, by duration                                                                                                             
        Any duration (at least 1 dose)         134 (100%)               134 (100%)              130 (98.5%)               0.0 (0.0 - 0.0)       
        <1 month                                6 (4.5%)                 5 (3.7%)                15 (11.4%)              -0.7 (-5.5 - 4.0)      
        >=1 month                             128 (95.5%)              129 (96.3%)              117 (88.6%)               0.7 (-4.0 - 5.5)      
        >=3 months                            102 (76.1%)              107 (79.9%)               99 (75.0%)              3.7 (-6.2 - 13.6)      
        >=6 months                             70 (52.2%)               72 (53.7%)               70 (53.0%)              1.5 (-10.5 - 13.4)     
        >=12 months                            11 (8.2%)                 6 (4.5%)                 9 (6.8%)               -3.7 (-9.6 - 2.1)      
      
      $ard
    Message
      {cards} data frame: 63 x 12
    Output
         group1 group1_level variable variable_level    stat_name stat_label    stat
      1     ARM    A: Drug X   TRTDUR                        mean       Mean 199.582
      2     ARM    A: Drug X   TRTDUR                          sd         SD 115.065
      3     ARM    A: Drug X   TRTDUR                      median     Median   205.5
      4     ARM    A: Drug X   TRTDUR                         min        Min       2
      5     ARM    A: Drug X   TRTDUR                         max        Max     394
      6     ARM    A: Drug X   TRTDUR                         p25         Q1     102
      7     ARM    A: Drug X   TRTDUR                         p75         Q3     299
      8     ARM    A: Drug X   TRTDUR                tot_exposure  tot_expo…   26744
      9     ARM    A: Drug X   TRTDUR                  person_yrs  person_y…  73.221
      10    ARM    B: Place…   TRTDUR                        mean       Mean 199.739
         stat_fmt
      1    199.58
      2    115.07
      3     205.5
      4         2
      5       394
      6       102
      7       299
      8     26744
      9     73.22
      10   199.74
    Message
      i 53 more rows
      i Use `print(n = ...)` to see more rows
      i 4 more variables: context, fmt_fn, warning, error
    Output
      

