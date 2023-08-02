# Table 02 generation works with default values

    Code
      res
    Output
                                                        A: Drug X            B: Placebo         C: Combination      Total Population 
      Characteristic                                     (N=134)              (N=134)              (N=132)              (N=400)      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      Sex                                                                                                                            
        F                                                79 (59%)            82 (61.2%)            70 (53%)           231 (57.8%)    
        M                                                55 (41%)            52 (38.8%)            62 (47%)           169 (42.2%)    
      Age                                                                                                                            
        Mean (SD)                                       33.8 (6.6)           35.4 (7.9)           35.4 (7.7)           34.9 (7.4)    
        Median (Min - Max)                          33.0 (21.0 - 50.0)   35.0 (21.0 - 62.0)   35.0 (20.0 - 69.0)   34.0 (20.0 - 69.0)
      Age Group                                                                                                                      
        >=17 to <65                                     134 (100%)           134 (100%)          131 (99.2%)          399 (99.8%)    
        >=65                                                0                    0                 1 (0.8%)             1 (0.2%)     
      Race                                                                                                                           
        ASIAN                                           68 (50.7%)            67 (50%)            73 (55.3%)           208 (52%)     
        BLACK OR AFRICAN AMERICAN                       31 (23.1%)           28 (20.9%)           32 (24.2%)           91 (22.8%)    
        WHITE                                           27 (20.1%)           26 (19.4%)           21 (15.9%)           74 (18.5%)    
        AMERICAN INDIAN OR ALASKA NATIVE                  8 (6%)             11 (8.2%)             6 (4.5%)            25 (6.2%)     
        MULTIPLE                                            0                 1 (0.7%)                0                 1 (0.2%)     
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER           0                 1 (0.7%)                0                 1 (0.2%)     
      Ethnicity                                                                                                                      
        NOT REPORTED                                     6 (4.5%)            10 (7.5%)            11 (8.3%)            27 (6.8%)     
        HISPANIC OR LATINO                              15 (11.2%)           18 (13.4%)           15 (11.4%)            48 (12%)     
        NOT HISPANIC OR LATINO                         104 (77.6%)          103 (76.9%)          101 (76.5%)           308 (77%)     
        UNKNOWN                                          9 (6.7%)             3 (2.2%)             5 (3.8%)            17 (4.2%)     
      Country                                                                                                                        
        CHN                                             74 (55.2%)           81 (60.4%)           64 (48.5%)          219 (54.8%)    
        USA                                             10 (7.5%)            13 (9.7%)            17 (12.9%)            40 (10%)     
        BRA                                             13 (9.7%)             7 (5.2%)            10 (7.6%)            30 (7.5%)     
        PAK                                              12 (9%)              9 (6.7%)            10 (7.6%)            31 (7.8%)     
        NGA                                               8 (6%)              7 (5.2%)            11 (8.3%)            26 (6.5%)     
        RUS                                              5 (3.7%)              8 (6%)              6 (4.5%)            19 (4.8%)     
        JPN                                              5 (3.7%)              4 (3%)              9 (6.8%)            18 (4.5%)     
        GBR                                               4 (3%)              3 (2.2%)             2 (1.5%)             9 (2.2%)     
        CAN                                              3 (2.2%)             2 (1.5%)             3 (2.3%)              8 (2%)      

# Table 02 generation works with custom values

    Code
      res
    Output
      Table 2. Baseline Demographic and Clinical Characteristics Safety Population, Pooled Analyses
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                        A: Drug X            B: Placebo         C: Combination      Total Population 
      Characteristic                                     (N=134)              (N=134)              (N=132)              (N=400)      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      Sex                                                                                                                            
        F                                                79 (59%)            82 (61.2%)            70 (53%)           231 (57.8%)    
        M                                                55 (41%)            52 (38.8%)            62 (47%)           169 (42.2%)    
      Age, years                                                                                                                     
        Mean (SD)                                       33.8 (6.6)           35.4 (7.9)           35.4 (7.7)           34.9 (7.4)    
        Median (Min - Max)                          33.0 (21.0 - 50.0)   35.0 (21.0 - 62.0)   35.0 (20.0 - 69.0)   34.0 (20.0 - 69.0)
      Age Group, years                                                                                                               
        >=17 to <65                                     134 (100%)           134 (100%)          131 (99.2%)          399 (99.8%)    
        >=65                                                0                    0                 1 (0.8%)             1 (0.2%)     
      Race                                                                                                                           
        ASIAN                                           68 (50.7%)            67 (50%)            73 (55.3%)           208 (52%)     
        BLACK OR AFRICAN AMERICAN                       31 (23.1%)           28 (20.9%)           32 (24.2%)           91 (22.8%)    
        WHITE                                           27 (20.1%)           26 (19.4%)           21 (15.9%)           74 (18.5%)    
        AMERICAN INDIAN OR ALASKA NATIVE                  8 (6%)             11 (8.2%)             6 (4.5%)            25 (6.2%)     
        MULTIPLE                                            0                 1 (0.7%)                0                 1 (0.2%)     
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER           0                 1 (0.7%)                0                 1 (0.2%)     
      Ethnicity                                                                                                                      
        NOT REPORTED                                     6 (4.5%)            10 (7.5%)            11 (8.3%)            27 (6.8%)     
        HISPANIC OR LATINO                              15 (11.2%)           18 (13.4%)           15 (11.4%)            48 (12%)     
        NOT HISPANIC OR LATINO                         104 (77.6%)          103 (76.9%)          101 (76.5%)           308 (77%)     
        UNKNOWN                                          9 (6.7%)             3 (2.2%)             5 (3.8%)            17 (4.2%)     
      Country of Participation                                                                                                       
        CHN                                             74 (55.2%)           81 (60.4%)           64 (48.5%)          219 (54.8%)    
        USA                                             10 (7.5%)            13 (9.7%)            17 (12.9%)            40 (10%)     
        BRA                                             13 (9.7%)             7 (5.2%)            10 (7.6%)            30 (7.5%)     
        PAK                                              12 (9%)              9 (6.7%)            10 (7.6%)            31 (7.8%)     
        NGA                                               8 (6%)              7 (5.2%)            11 (8.3%)            26 (6.5%)     
        RUS                                              5 (3.7%)              8 (6%)              6 (4.5%)            19 (4.8%)     
        JPN                                              5 (3.7%)              4 (3%)              9 (6.8%)            18 (4.5%)     
        GBR                                               4 (3%)              3 (2.2%)             2 (1.5%)             9 (2.2%)     
        CAN                                              3 (2.2%)             2 (1.5%)             3 (2.3%)              8 (2%)      
      Baseline Temperature (C)                                                                                                       
        Mean (SD)                                       49.7 (8.3)           50.9 (7.4)           49.1 (8.2)           49.9 (8.0)    
        Median (Min - Max)                          50.4 (29.0 - 69.1)   51.5 (30.7 - 67.7)   48.7 (20.6 - 70.5)   50.3 (20.6 - 70.5)
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      
      Abbreviations: N, number of patients in treatment arm; n, number of patients with given characteristic; SD, standard deviation

# Table 02 generation works with some NA values

    Code
      res
    Output
                       A: Drug X    B: Placebo   C: Combination   Total Population
      Characteristic    (N=134)      (N=134)        (N=132)           (N=400)     
      ————————————————————————————————————————————————————————————————————————————
      Sex                                                                         
        F              68 (50.7%)   68 (50.7%)      62 (47%)        198 (49.5%)   
        M              50 (37.3%)   48 (35.8%)     54 (40.9%)        152 (38%)    
        <Missing>      16 (11.9%)   18 (13.4%)     16 (12.1%)        50 (12.5%)   

# Table 02 generation (tplyr) works with default values

    Code
      res
    Output
      # A tibble: 31 x 6
         row_label2                                    `A: Drug X\n(N=134)` `B: Placebo\n(N=134)` `C: Combination\n(N=132)` `Total Population\n(N=400)` ..tfrmt_row_grp_lbl
         <chr>                                         <chr>                <chr>                 <chr>                     <chr>                       <lgl>              
       1 "Sex"                                          <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       2 "  F"                                         "79 (59.0%)"         "82 (61.2%)"          "70 (53.0%)"              "231 (57.8%)"               FALSE              
       3 "  M"                                         "55 (41.0%)"         "52 (38.8%)"          "62 (47.0%)"              "169 (42.2%)"               FALSE              
       4 "Age"                                          <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       5 "  Mean (SD)"                                 "33.8 ( 6.6)"        "35.4 ( 7.9)"         "35.4 ( 7.7)"             "34.9 ( 7.4)"               FALSE              
       6 "  Median (Min - Max)"                        "33.0 (21.0 - 50.0)" "35.0 (21.0 - 62.0)"  "35.0 (20.0 - 69.0)"      "34.0 (20.0 - 69.0)"        FALSE              
       7 "Age Group"                                    <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       8 "  >=17 to <65"                               "134 (100.0%)"       "134 (100.0%)"        "131 (99.2%)"             "399 (99.8%)"               FALSE              
       9 "  >=65"                                      " 0 "                " 0 "                 " 1 ( 0.8%)"              " 1 ( 0.2%)"                FALSE              
      10 "Race"                                         <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      11 "  ASIAN"                                     "68 (50.7%)"         "67 (50.0%)"          "73 (55.3%)"              "208 (52.0%)"               FALSE              
      12 "  BLACK OR AFRICAN AMERICAN"                 "31 (23.1%)"         "28 (20.9%)"          "32 (24.2%)"              "91 (22.8%)"                FALSE              
      13 "  WHITE"                                     "27 (20.1%)"         "26 (19.4%)"          "21 (15.9%)"              "74 (18.5%)"                FALSE              
      14 "  AMERICAN INDIAN OR ALASKA NATIVE"          " 8 ( 6.0%)"         "11 ( 8.2%)"          " 6 ( 4.5%)"              "25 ( 6.2%)"                FALSE              
      15 "  MULTIPLE"                                  " 0 "                " 1 ( 0.7%)"          " 0 "                     " 1 ( 0.2%)"                FALSE              
      16 "  NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" " 0 "                " 1 ( 0.7%)"          " 0 "                     " 1 ( 0.2%)"                FALSE              
      17 "Ethnicity"                                    <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      18 "   NOT REPORTED"                             " 6 ( 4.5%)"         "10 ( 7.5%)"          "11 ( 8.3%)"              "27 ( 6.8%)"                FALSE              
      19 "  HISPANIC OR LATINO"                        "15 (11.2%)"         "18 (13.4%)"          "15 (11.4%)"              "48 (12.0%)"                FALSE              
      20 "  NOT HISPANIC OR LATINO"                    "104 (77.6%)"        "103 (76.9%)"         "101 (76.5%)"             "308 (77.0%)"               FALSE              
      21 "  UNKNOWN"                                   " 9 ( 6.7%)"         " 3 ( 2.2%)"          " 5 ( 3.8%)"              "17 ( 4.2%)"                FALSE              
      22 "Country"                                      <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      23 "  CHN"                                       "74 (55.2%)"         "81 (60.4%)"          "64 (48.5%)"              "219 (54.8%)"               FALSE              
      24 "  USA"                                       "10 ( 7.5%)"         "13 ( 9.7%)"          "17 (12.9%)"              "40 (10.0%)"                FALSE              
      25 "  BRA"                                       "13 ( 9.7%)"         " 7 ( 5.2%)"          "10 ( 7.6%)"              "30 ( 7.5%)"                FALSE              
      26 "  PAK"                                       "12 ( 9.0%)"         " 9 ( 6.7%)"          "10 ( 7.6%)"              "31 ( 7.8%)"                FALSE              
      27 "  NGA"                                       " 8 ( 6.0%)"         " 7 ( 5.2%)"          "11 ( 8.3%)"              "26 ( 6.5%)"                FALSE              
      28 "  RUS"                                       " 5 ( 3.7%)"         " 8 ( 6.0%)"          " 6 ( 4.5%)"              "19 ( 4.8%)"                FALSE              
      29 "  JPN"                                       " 5 ( 3.7%)"         " 4 ( 3.0%)"          " 9 ( 6.8%)"              "18 ( 4.5%)"                FALSE              
      30 "  GBR"                                       " 4 ( 3.0%)"         " 3 ( 2.2%)"          " 2 ( 1.5%)"              " 9 ( 2.2%)"                FALSE              
      31 "  CAN"                                       " 3 ( 2.2%)"         " 2 ( 1.5%)"          " 3 ( 2.3%)"              " 8 ( 2.0%)"                FALSE              

# Table 02 generation (tplyr) works with `tplyr_raw` = TRUE

    Code
      res
    Output
      # A tibble: 35 x 6
         row_label1       row_label2                                  `var1_A: Drug X`     `var1_B: Placebo`     `var1_C: Combination`     `var1_Total Population`  
         <chr>            <chr>                                       <chr>                <chr>                 <chr>                     <chr>                    
       1 "Characteristic" ""                                          "A: Drug X\n(N=134)" "B: Placebo\n(N=134)" "C: Combination\n(N=132)" "Total Population\n(N=0)"
       2 "Sex"            "F"                                         "79 (59.0%)"         "82 (61.2%)"          "70 (53.0%)"              "231 (57.8%)"            
       3 ""               "M"                                         "55 (41.0%)"         "52 (38.8%)"          "62 (47.0%)"              "169 (42.2%)"            
       4 ""               ""                                          ""                   ""                    ""                        ""                       
       5 "Age"            "Mean (SD)"                                 "33.8 ( 6.6)"        "35.4 ( 7.9)"         "35.4 ( 7.7)"             "34.9 ( 7.4)"            
       6 ""               "Median (Min - Max)"                        "33.0 (21.0 - 50.0)" "35.0 (21.0 - 62.0)"  "35.0 (20.0 - 69.0)"      "34.0 (20.0 - 69.0)"     
       7 ""               ""                                          ""                   ""                    ""                        ""                       
       8 "Age Group"      ">=17 to <65"                               "134 (100.0%)"       "134 (100.0%)"        "131 (99.2%)"             "399 (99.8%)"            
       9 ""               ">=65"                                      " 0 ( 0.0%)"         " 0 ( 0.0%)"          " 1 ( 0.8%)"              " 1 ( 0.2%)"             
      10 ""               ""                                          ""                   ""                    ""                        ""                       
      11 "Race"           "ASIAN"                                     "68 (50.7%)"         "67 (50.0%)"          "73 (55.3%)"              "208 (52.0%)"            
      12 ""               "BLACK OR AFRICAN AMERICAN"                 "31 (23.1%)"         "28 (20.9%)"          "32 (24.2%)"              "91 (22.8%)"             
      13 ""               "WHITE"                                     "27 (20.1%)"         "26 (19.4%)"          "21 (15.9%)"              "74 (18.5%)"             
      14 ""               "AMERICAN INDIAN OR ALASKA NATIVE"          " 8 ( 6.0%)"         "11 ( 8.2%)"          " 6 ( 4.5%)"              "25 ( 6.2%)"             
      15 ""               "MULTIPLE"                                  " 0 ( 0.0%)"         " 1 ( 0.7%)"          " 0 ( 0.0%)"              " 1 ( 0.2%)"             
      16 ""               "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" " 0 ( 0.0%)"         " 1 ( 0.7%)"          " 0 ( 0.0%)"              " 1 ( 0.2%)"             
      17 ""               "OTHER"                                     " 0 ( 0.0%)"         " 0 ( 0.0%)"          " 0 ( 0.0%)"              " 0 ( 0.0%)"             
      18 ""               "UNKNOWN"                                   " 0 ( 0.0%)"         " 0 ( 0.0%)"          " 0 ( 0.0%)"              " 0 ( 0.0%)"             
      19 ""               ""                                          ""                   ""                    ""                        ""                       
      20 "Ethnicity"      " NOT REPORTED"                             " 6 ( 4.5%)"         "10 ( 7.5%)"          "11 ( 8.3%)"              "27 ( 6.8%)"             
      21 ""               "HISPANIC OR LATINO"                        "15 (11.2%)"         "18 (13.4%)"          "15 (11.4%)"              "48 (12.0%)"             
      22 ""               "NOT HISPANIC OR LATINO"                    "104 (77.6%)"        "103 (76.9%)"         "101 (76.5%)"             "308 (77.0%)"            
      23 ""               "UNKNOWN"                                   " 9 ( 6.7%)"         " 3 ( 2.2%)"          " 5 ( 3.8%)"              "17 ( 4.2%)"             
      24 ""               ""                                          ""                   ""                    ""                        ""                       
      25 "Country"        "CHN"                                       "74 (55.2%)"         "81 (60.4%)"          "64 (48.5%)"              "219 (54.8%)"            
      26 ""               "USA"                                       "10 ( 7.5%)"         "13 ( 9.7%)"          "17 (12.9%)"              "40 (10.0%)"             
      27 ""               "BRA"                                       "13 ( 9.7%)"         " 7 ( 5.2%)"          "10 ( 7.6%)"              "30 ( 7.5%)"             
      28 ""               "PAK"                                       "12 ( 9.0%)"         " 9 ( 6.7%)"          "10 ( 7.6%)"              "31 ( 7.8%)"             
      29 ""               "NGA"                                       " 8 ( 6.0%)"         " 7 ( 5.2%)"          "11 ( 8.3%)"              "26 ( 6.5%)"             
      30 ""               "RUS"                                       " 5 ( 3.7%)"         " 8 ( 6.0%)"          " 6 ( 4.5%)"              "19 ( 4.8%)"             
      31 ""               "JPN"                                       " 5 ( 3.7%)"         " 4 ( 3.0%)"          " 9 ( 6.8%)"              "18 ( 4.5%)"             
      32 ""               "GBR"                                       " 4 ( 3.0%)"         " 3 ( 2.2%)"          " 2 ( 1.5%)"              " 9 ( 2.2%)"             
      33 ""               "CAN"                                       " 3 ( 2.2%)"         " 2 ( 1.5%)"          " 3 ( 2.3%)"              " 8 ( 2.0%)"             
      34 ""               "CHE"                                       " 0 ( 0.0%)"         " 0 ( 0.0%)"          " 0 ( 0.0%)"              " 0 ( 0.0%)"             
      35 ""               ""                                          ""                   ""                    ""                        ""                       

# Table 02 generation (tplyr) works with custom values

    Code
      res
    Output
      # A tibble: 37 x 6
         row_label2                                    `A: Drug X\n(N=134)` `B: Placebo\n(N=134)` `C: Combination\n(N=132)` `Total Population\n(N=400)` ..tfrmt_row_grp_lbl
         <chr>                                         <chr>                <chr>                 <chr>                     <chr>                       <lgl>              
       1 "Sex"                                          <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       2 "  F"                                         "79 (59.0%)"         "82 (61.2%)"          "70 (53.0%)"              "231 (57.8%)"               FALSE              
       3 "  M"                                         "55 (41.0%)"         "52 (38.8%)"          "62 (47.0%)"              "169 (42.2%)"               FALSE              
       4 "Age, years"                                   <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       5 "  Mean (SD)"                                 "33.8 ( 6.6)"        "35.4 ( 7.9)"         "35.4 ( 7.7)"             "34.9 ( 7.4)"               FALSE              
       6 "  Median (Min - Max)"                        "33.0 (21.0 - 50.0)" "35.0 (21.0 - 62.0)"  "35.0 (20.0 - 69.0)"      "34.0 (20.0 - 69.0)"        FALSE              
       7 "Age Group, years"                             <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       8 "  >=17 to <65"                               "134 (100.0%)"       "134 (100.0%)"        "131 (99.2%)"             "399 (99.8%)"               FALSE              
       9 "  >=65"                                      " 0 "                " 0 "                 " 1 ( 0.8%)"              " 1 ( 0.2%)"                FALSE              
      10 "Race"                                         <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      11 "  ASIAN"                                     "68 (50.7%)"         "67 (50.0%)"          "73 (55.3%)"              "208 (52.0%)"               FALSE              
      12 "  BLACK OR AFRICAN AMERICAN"                 "31 (23.1%)"         "28 (20.9%)"          "32 (24.2%)"              "91 (22.8%)"                FALSE              
      13 "  WHITE"                                     "27 (20.1%)"         "26 (19.4%)"          "21 (15.9%)"              "74 (18.5%)"                FALSE              
      14 "  AMERICAN INDIAN OR ALASKA NATIVE"          " 8 ( 6.0%)"         "11 ( 8.2%)"          " 6 ( 4.5%)"              "25 ( 6.2%)"                FALSE              
      15 "  MULTIPLE"                                  " 0 "                " 1 ( 0.7%)"          " 0 "                     " 1 ( 0.2%)"                FALSE              
      16 "  NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" " 0 "                " 1 ( 0.7%)"          " 0 "                     " 1 ( 0.2%)"                FALSE              
      17 "  OTHER"                                     " 0 "                " 0 "                 " 0 "                     " 0 "                       FALSE              
      18 "  UNKNOWN"                                   " 0 "                " 0 "                 " 0 "                     " 0 "                       FALSE              
      19 "Ethnicity"                                    <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      20 "   NOT REPORTED"                             " 6 ( 4.5%)"         "10 ( 7.5%)"          "11 ( 8.3%)"              "27 ( 6.8%)"                FALSE              
      21 "  HISPANIC OR LATINO"                        "15 (11.2%)"         "18 (13.4%)"          "15 (11.4%)"              "48 (12.0%)"                FALSE              
      22 "  NOT HISPANIC OR LATINO"                    "104 (77.6%)"        "103 (76.9%)"         "101 (76.5%)"             "308 (77.0%)"               FALSE              
      23 "  UNKNOWN"                                   " 9 ( 6.7%)"         " 3 ( 2.2%)"          " 5 ( 3.8%)"              "17 ( 4.2%)"                FALSE              
      24 "Country of Participation"                     <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      25 "  CHN"                                       "74 (55.2%)"         "81 (60.4%)"          "64 (48.5%)"              "219 (54.8%)"               FALSE              
      26 "  USA"                                       "10 ( 7.5%)"         "13 ( 9.7%)"          "17 (12.9%)"              "40 (10.0%)"                FALSE              
      27 "  BRA"                                       "13 ( 9.7%)"         " 7 ( 5.2%)"          "10 ( 7.6%)"              "30 ( 7.5%)"                FALSE              
      28 "  PAK"                                       "12 ( 9.0%)"         " 9 ( 6.7%)"          "10 ( 7.6%)"              "31 ( 7.8%)"                FALSE              
      29 "  NGA"                                       " 8 ( 6.0%)"         " 7 ( 5.2%)"          "11 ( 8.3%)"              "26 ( 6.5%)"                FALSE              
      30 "  RUS"                                       " 5 ( 3.7%)"         " 8 ( 6.0%)"          " 6 ( 4.5%)"              "19 ( 4.8%)"                FALSE              
      31 "  JPN"                                       " 5 ( 3.7%)"         " 4 ( 3.0%)"          " 9 ( 6.8%)"              "18 ( 4.5%)"                FALSE              
      32 "  GBR"                                       " 4 ( 3.0%)"         " 3 ( 2.2%)"          " 2 ( 1.5%)"              " 9 ( 2.2%)"                FALSE              
      33 "  CAN"                                       " 3 ( 2.2%)"         " 2 ( 1.5%)"          " 3 ( 2.3%)"              " 8 ( 2.0%)"                FALSE              
      34 "  CHE"                                       " 0 "                " 0 "                 " 0 "                     " 0 "                       FALSE              
      35 "Baseline Temperature (C)"                     <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      36 "  Mean (SD)"                                 "49.7 ( 8.3)"        "50.9 ( 7.4)"         "49.1 ( 8.2)"             "49.9 ( 8.0)"               FALSE              
      37 "  Median (Min - Max)"                        "50.4 (29.0 - 69.1)" "51.5 (30.7 - 67.7)"  "48.7 (20.6 - 70.5)"      "50.3 (20.6 - 70.5)"        FALSE              

---

    Code
      res
    Output
      $title
      [1] "Table 2. Baseline Demographic and Clinical Characteristics Safety Population, Pooled Analyses"
      
      $subtitle
      [1] ""
      
      $preheader
      NULL
      

# Table 02 generation (tplyr) works with some NA values

    Code
      res
    Output
      # A tibble: 4 x 6
        row_label2    `A: Drug X\n(N=134)` `B: Placebo\n(N=134)` `C: Combination\n(N=132)` `Total Population\n(N=400)` ..tfrmt_row_grp_lbl
        <chr>         <chr>                <chr>                 <chr>                     <chr>                       <lgl>              
      1 "Sex"         <NA>                 <NA>                  <NA>                      <NA>                        TRUE               
      2 "  F"         68 (50.7%)           68 (50.7%)            62 (47.0%)                198 (49.5%)                 FALSE              
      3 "  M"         50 (37.3%)           48 (35.8%)            54 (40.9%)                152 (38.0%)                 FALSE              
      4 "  <Missing>" 16 (11.9%)           18 (13.4%)            16 (12.1%)                50 (12.5%)                  FALSE              

