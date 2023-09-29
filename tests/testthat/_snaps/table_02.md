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
      # A tibble: 32 x 6
         row_label2                                      `A: Drug X\n(N=134)` `B: Placebo\n(N=134)` `C: Combination\n(N=132)` `Total Population\n(N=400)` ..tfrmt_row_grp_lbl
         <chr>                                           <chr>                <chr>                 <chr>                     <chr>                       <lgl>              
       1 "Characteristic"                                 <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       2 "  Sex"                                          <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       3 "    F"                                         "79 (59.0%)"         "82 (61.2%)"          "70 (53.0%)"              "231 (57.8%)"               FALSE              
       4 "    M"                                         "55 (41.0%)"         "52 (38.8%)"          "62 (47.0%)"              "169 (42.2%)"               FALSE              
       5 "  Age"                                          <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       6 "    Mean (SD)"                                 "33.8 ( 6.6)"        "35.4 ( 7.9)"         "35.4 ( 7.7)"             "34.9 ( 7.4)"               FALSE              
       7 "    Median (Min - Max)"                        "33.0 (21.0 - 50.0)" "35.0 (21.0 - 62.0)"  "35.0 (20.0 - 69.0)"      "34.0 (20.0 - 69.0)"        FALSE              
       8 "  Age Group"                                    <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       9 "    >=17 to <65"                               "134 (100.0%)"       "134 (100.0%)"        "131 (99.2%)"             "399 (99.8%)"               FALSE              
      10 "    >=65"                                      " 0 "                " 0 "                 " 1 ( 0.8%)"              " 1 ( 0.2%)"                FALSE              
      11 "  Race"                                         <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      12 "    ASIAN"                                     "68 (50.7%)"         "67 (50.0%)"          "73 (55.3%)"              "208 (52.0%)"               FALSE              
      13 "    BLACK OR AFRICAN AMERICAN"                 "31 (23.1%)"         "28 (20.9%)"          "32 (24.2%)"              "91 (22.8%)"                FALSE              
      14 "    WHITE"                                     "27 (20.1%)"         "26 (19.4%)"          "21 (15.9%)"              "74 (18.5%)"                FALSE              
      15 "    AMERICAN INDIAN OR ALASKA NATIVE"          " 8 ( 6.0%)"         "11 ( 8.2%)"          " 6 ( 4.5%)"              "25 ( 6.2%)"                FALSE              
      16 "    MULTIPLE"                                  " 0 "                " 1 ( 0.7%)"          " 0 "                     " 1 ( 0.2%)"                FALSE              
      17 "    NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" " 0 "                " 1 ( 0.7%)"          " 0 "                     " 1 ( 0.2%)"                FALSE              
      18 "  Ethnicity"                                    <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      19 "     NOT REPORTED"                             " 6 ( 4.5%)"         "10 ( 7.5%)"          "11 ( 8.3%)"              "27 ( 6.8%)"                FALSE              
      20 "    HISPANIC OR LATINO"                        "15 (11.2%)"         "18 (13.4%)"          "15 (11.4%)"              "48 (12.0%)"                FALSE              
      21 "    NOT HISPANIC OR LATINO"                    "104 (77.6%)"        "103 (76.9%)"         "101 (76.5%)"             "308 (77.0%)"               FALSE              
      22 "    UNKNOWN"                                   " 9 ( 6.7%)"         " 3 ( 2.2%)"          " 5 ( 3.8%)"              "17 ( 4.2%)"                FALSE              
      23 "  Country"                                      <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      24 "    CHN"                                       "74 (55.2%)"         "81 (60.4%)"          "64 (48.5%)"              "219 (54.8%)"               FALSE              
      25 "    USA"                                       "10 ( 7.5%)"         "13 ( 9.7%)"          "17 (12.9%)"              "40 (10.0%)"                FALSE              
      26 "    BRA"                                       "13 ( 9.7%)"         " 7 ( 5.2%)"          "10 ( 7.6%)"              "30 ( 7.5%)"                FALSE              
      27 "    PAK"                                       "12 ( 9.0%)"         " 9 ( 6.7%)"          "10 ( 7.6%)"              "31 ( 7.8%)"                FALSE              
      28 "    NGA"                                       " 8 ( 6.0%)"         " 7 ( 5.2%)"          "11 ( 8.3%)"              "26 ( 6.5%)"                FALSE              
      29 "    RUS"                                       " 5 ( 3.7%)"         " 8 ( 6.0%)"          " 6 ( 4.5%)"              "19 ( 4.8%)"                FALSE              
      30 "    JPN"                                       " 5 ( 3.7%)"         " 4 ( 3.0%)"          " 9 ( 6.8%)"              "18 ( 4.5%)"                FALSE              
      31 "    GBR"                                       " 4 ( 3.0%)"         " 3 ( 2.2%)"          " 2 ( 1.5%)"              " 9 ( 2.2%)"                FALSE              
      32 "    CAN"                                       " 3 ( 2.2%)"         " 2 ( 1.5%)"          " 3 ( 2.3%)"              " 8 ( 2.0%)"                FALSE              

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
      # A tibble: 38 x 6
         row_label2                                      `A: Drug X\n(N=134)` `B: Placebo\n(N=134)` `C: Combination\n(N=132)` `Total Population\n(N=400)` ..tfrmt_row_grp_lbl
         <chr>                                           <chr>                <chr>                 <chr>                     <chr>                       <lgl>              
       1 "Characteristic"                                 <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       2 "  Sex"                                          <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       3 "    F"                                         "79 (59.0%)"         "82 (61.2%)"          "70 (53.0%)"              "231 (57.8%)"               FALSE              
       4 "    M"                                         "55 (41.0%)"         "52 (38.8%)"          "62 (47.0%)"              "169 (42.2%)"               FALSE              
       5 "  Age, years"                                   <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       6 "    Mean (SD)"                                 "33.8 ( 6.6)"        "35.4 ( 7.9)"         "35.4 ( 7.7)"             "34.9 ( 7.4)"               FALSE              
       7 "    Median (Min - Max)"                        "33.0 (21.0 - 50.0)" "35.0 (21.0 - 62.0)"  "35.0 (20.0 - 69.0)"      "34.0 (20.0 - 69.0)"        FALSE              
       8 "  Age Group, years"                             <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
       9 "    >=17 to <65"                               "134 (100.0%)"       "134 (100.0%)"        "131 (99.2%)"             "399 (99.8%)"               FALSE              
      10 "    >=65"                                      " 0 "                " 0 "                 " 1 ( 0.8%)"              " 1 ( 0.2%)"                FALSE              
      11 "  Race"                                         <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      12 "    ASIAN"                                     "68 (50.7%)"         "67 (50.0%)"          "73 (55.3%)"              "208 (52.0%)"               FALSE              
      13 "    BLACK OR AFRICAN AMERICAN"                 "31 (23.1%)"         "28 (20.9%)"          "32 (24.2%)"              "91 (22.8%)"                FALSE              
      14 "    WHITE"                                     "27 (20.1%)"         "26 (19.4%)"          "21 (15.9%)"              "74 (18.5%)"                FALSE              
      15 "    AMERICAN INDIAN OR ALASKA NATIVE"          " 8 ( 6.0%)"         "11 ( 8.2%)"          " 6 ( 4.5%)"              "25 ( 6.2%)"                FALSE              
      16 "    MULTIPLE"                                  " 0 "                " 1 ( 0.7%)"          " 0 "                     " 1 ( 0.2%)"                FALSE              
      17 "    NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" " 0 "                " 1 ( 0.7%)"          " 0 "                     " 1 ( 0.2%)"                FALSE              
      18 "    OTHER"                                     " 0 "                " 0 "                 " 0 "                     " 0 "                       FALSE              
      19 "    UNKNOWN"                                   " 0 "                " 0 "                 " 0 "                     " 0 "                       FALSE              
      20 "  Ethnicity"                                    <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      21 "     NOT REPORTED"                             " 6 ( 4.5%)"         "10 ( 7.5%)"          "11 ( 8.3%)"              "27 ( 6.8%)"                FALSE              
      22 "    HISPANIC OR LATINO"                        "15 (11.2%)"         "18 (13.4%)"          "15 (11.4%)"              "48 (12.0%)"                FALSE              
      23 "    NOT HISPANIC OR LATINO"                    "104 (77.6%)"        "103 (76.9%)"         "101 (76.5%)"             "308 (77.0%)"               FALSE              
      24 "    UNKNOWN"                                   " 9 ( 6.7%)"         " 3 ( 2.2%)"          " 5 ( 3.8%)"              "17 ( 4.2%)"                FALSE              
      25 "  Country of Participation"                     <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      26 "    CHN"                                       "74 (55.2%)"         "81 (60.4%)"          "64 (48.5%)"              "219 (54.8%)"               FALSE              
      27 "    USA"                                       "10 ( 7.5%)"         "13 ( 9.7%)"          "17 (12.9%)"              "40 (10.0%)"                FALSE              
      28 "    BRA"                                       "13 ( 9.7%)"         " 7 ( 5.2%)"          "10 ( 7.6%)"              "30 ( 7.5%)"                FALSE              
      29 "    PAK"                                       "12 ( 9.0%)"         " 9 ( 6.7%)"          "10 ( 7.6%)"              "31 ( 7.8%)"                FALSE              
      30 "    NGA"                                       " 8 ( 6.0%)"         " 7 ( 5.2%)"          "11 ( 8.3%)"              "26 ( 6.5%)"                FALSE              
      31 "    RUS"                                       " 5 ( 3.7%)"         " 8 ( 6.0%)"          " 6 ( 4.5%)"              "19 ( 4.8%)"                FALSE              
      32 "    JPN"                                       " 5 ( 3.7%)"         " 4 ( 3.0%)"          " 9 ( 6.8%)"              "18 ( 4.5%)"                FALSE              
      33 "    GBR"                                       " 4 ( 3.0%)"         " 3 ( 2.2%)"          " 2 ( 1.5%)"              " 9 ( 2.2%)"                FALSE              
      34 "    CAN"                                       " 3 ( 2.2%)"         " 2 ( 1.5%)"          " 3 ( 2.3%)"              " 8 ( 2.0%)"                FALSE              
      35 "    CHE"                                       " 0 "                " 0 "                 " 0 "                     " 0 "                       FALSE              
      36 "  Baseline Temperature (C)"                     <NA>                 <NA>                  <NA>                      <NA>                       TRUE               
      37 "    Mean (SD)"                                 "49.7 ( 8.3)"        "50.9 ( 7.4)"         "49.1 ( 8.2)"             "49.9 ( 8.0)"               FALSE              
      38 "    Median (Min - Max)"                        "50.4 (29.0 - 69.1)" "51.5 (30.7 - 67.7)"  "48.7 (20.6 - 70.5)"      "50.3 (20.6 - 70.5)"        FALSE              

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
      # A tibble: 5 x 6
        row_label2       `A: Drug X\n(N=134)` `B: Placebo\n(N=134)` `C: Combination\n(N=132)` `Total Population\n(N=400)` ..tfrmt_row_grp_lbl
        <chr>            <chr>                <chr>                 <chr>                     <chr>                       <lgl>              
      1 "Characteristic" <NA>                 <NA>                  <NA>                      <NA>                        TRUE               
      2 "  Sex"          <NA>                 <NA>                  <NA>                      <NA>                        TRUE               
      3 "    F"          68 (50.7%)           68 (50.7%)            62 (47.0%)                198 (49.5%)                 FALSE              
      4 "    M"          50 (37.3%)           48 (35.8%)            54 (40.9%)                152 (38.0%)                 FALSE              
      5 "    <Missing>"  16 (11.9%)           18 (13.4%)            16 (12.1%)                50 (12.5%)                  FALSE              

# Table 02 generation (gtsum) works with default values

    Code
      res
    Output
         variable    var_type var_label row_type                                         label                stat_1                stat_2                stat_3                stat_0
      1       SEX categorical       Sex    label                                           Sex                                                                                        
      2       SEX categorical       Sex    level                                             F              79 (59%)              82 (61%)              70 (53%)             231 (58%)
      3       SEX categorical       Sex    level                                             M              55 (41%)              52 (39%)              62 (47%)             169 (42%)
      4       AGE continuous2       Age    label                                           Age                                                                                        
      5       AGE continuous2       Age    level                                     Mean (SD)          33.77 (6.55)          35.43 (7.90)          35.43 (7.72)          34.88 (7.44)
      6       AGE continuous2       Age    level                                Median (Range) 33.00 (21.00 - 50.00) 35.00 (21.00 - 62.00) 35.00 (20.00 - 69.00) 34.00 (20.00 - 69.00)
      7    AGEGR1 categorical Age Group    label                                     Age Group                                                                                        
      8    AGEGR1 categorical Age Group    level                             &gt;=17 to &lt;65            134 (100%)            134 (100%)             131 (99%)            399 (100%)
      9    AGEGR1 categorical Age Group    level                                       &gt;=65                0 (0%)                0 (0%)              1 (0.8%)              1 (0.3%)
      10     RACE categorical      Race    label                                          Race                                                                                        
      11     RACE categorical      Race    level                                         ASIAN              68 (51%)              67 (50%)              73 (55%)             208 (52%)
      12     RACE categorical      Race    level                     BLACK OR AFRICAN AMERICAN              31 (23%)              28 (21%)              32 (24%)              91 (23%)
      13     RACE categorical      Race    level                                         WHITE              27 (20%)              26 (19%)              21 (16%)              74 (19%)
      14     RACE categorical      Race    level              AMERICAN INDIAN OR ALASKA NATIVE              8 (6.0%)             11 (8.2%)              6 (4.5%)             25 (6.3%)
      15     RACE categorical      Race    level                                      MULTIPLE                0 (0%)              1 (0.7%)                0 (0%)              1 (0.3%)
      16     RACE categorical      Race    level     NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER                0 (0%)              1 (0.7%)                0 (0%)              1 (0.3%)
      17     RACE categorical      Race    level                                         OTHER                0 (0%)                0 (0%)                0 (0%)                0 (0%)
      18     RACE categorical      Race    level                                       UNKNOWN                0 (0%)                0 (0%)                0 (0%)                0 (0%)
      19   ETHNIC categorical Ethnicity    label                                     Ethnicity                                                                                        
      20   ETHNIC categorical Ethnicity    level                                  NOT REPORTED              6 (4.5%)             10 (7.5%)             11 (8.3%)             27 (6.8%)
      21   ETHNIC categorical Ethnicity    level                            HISPANIC OR LATINO              15 (11%)              18 (13%)              15 (11%)              48 (12%)
      22   ETHNIC categorical Ethnicity    level                        NOT HISPANIC OR LATINO             104 (78%)             103 (77%)             101 (77%)             308 (77%)
      23   ETHNIC categorical Ethnicity    level                                       UNKNOWN              9 (6.7%)              3 (2.2%)              5 (3.8%)             17 (4.3%)
      24  COUNTRY categorical   Country    label                                       Country                                                                                        
      25  COUNTRY categorical   Country    level                                           CHN              74 (55%)              81 (60%)              64 (48%)             219 (55%)
      26  COUNTRY categorical   Country    level                                           USA             10 (7.5%)             13 (9.7%)              17 (13%)              40 (10%)
      27  COUNTRY categorical   Country    level                                           BRA             13 (9.7%)              7 (5.2%)             10 (7.6%)             30 (7.5%)
      28  COUNTRY categorical   Country    level                                           PAK             12 (9.0%)              9 (6.7%)             10 (7.6%)             31 (7.8%)
      29  COUNTRY categorical   Country    level                                           NGA              8 (6.0%)              7 (5.2%)             11 (8.3%)             26 (6.5%)
      30  COUNTRY categorical   Country    level                                           RUS              5 (3.7%)              8 (6.0%)              6 (4.5%)             19 (4.8%)
      31  COUNTRY categorical   Country    level                                           JPN              5 (3.7%)              4 (3.0%)              9 (6.8%)             18 (4.5%)
      32  COUNTRY categorical   Country    level                                           GBR              4 (3.0%)              3 (2.2%)              2 (1.5%)              9 (2.3%)
      33  COUNTRY categorical   Country    level                                           CAN              3 (2.2%)              2 (1.5%)              3 (2.3%)              8 (2.0%)
      34  COUNTRY categorical   Country    level                                           CHE                0 (0%)                0 (0%)                0 (0%)                0 (0%)

# Table 02 generation (gtsum) works with custom values

    Code
      res
    Output
         variable    var_type      var_label row_type                                         label                stat_1                stat_2                stat_3                stat_0
      1       SEX categorical            Sex    label                                           Sex                                                                                        
      2       SEX categorical            Sex    level                                             F              79 (59%)              82 (61%)              70 (53%)             231 (58%)
      3       SEX categorical            Sex    level                                             M              55 (41%)              52 (39%)              62 (47%)             169 (42%)
      4       AGE continuous2            Age    label                                           Age                                                                                        
      5       AGE continuous2            Age    level                                     Mean (SD)          33.77 (6.55)          35.43 (7.90)          35.43 (7.72)          34.88 (7.44)
      6       AGE continuous2            Age    level                                Median (Range) 33.00 (21.00 - 50.00) 35.00 (21.00 - 62.00) 35.00 (20.00 - 69.00) 34.00 (20.00 - 69.00)
      7    AGEGR1 categorical      Age Group    label                                     Age Group                                                                                        
      8    AGEGR1 categorical      Age Group    level                             &gt;=17 to &lt;65            134 (100%)            134 (100%)             131 (99%)            399 (100%)
      9    AGEGR1 categorical      Age Group    level                                       &gt;=65                0 (0%)                0 (0%)              1 (0.8%)              1 (0.3%)
      10     RACE categorical           Race    label                                          Race                                                                                        
      11     RACE categorical           Race    level                                         ASIAN              68 (51%)              67 (50%)              73 (55%)             208 (52%)
      12     RACE categorical           Race    level                     BLACK OR AFRICAN AMERICAN              31 (23%)              28 (21%)              32 (24%)              91 (23%)
      13     RACE categorical           Race    level                                         WHITE              27 (20%)              26 (19%)              21 (16%)              74 (19%)
      14     RACE categorical           Race    level              AMERICAN INDIAN OR ALASKA NATIVE              8 (6.0%)             11 (8.2%)              6 (4.5%)             25 (6.3%)
      15     RACE categorical           Race    level                                      MULTIPLE                0 (0%)              1 (0.7%)                0 (0%)              1 (0.3%)
      16     RACE categorical           Race    level     NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER                0 (0%)              1 (0.7%)                0 (0%)              1 (0.3%)
      17     RACE categorical           Race    level                                         OTHER                0 (0%)                0 (0%)                0 (0%)                0 (0%)
      18     RACE categorical           Race    level                                       UNKNOWN                0 (0%)                0 (0%)                0 (0%)                0 (0%)
      19   ETHNIC categorical      Ethnicity    label                                     Ethnicity                                                                                        
      20   ETHNIC categorical      Ethnicity    level                                  NOT REPORTED              6 (4.5%)             10 (7.5%)             11 (8.3%)             27 (6.8%)
      21   ETHNIC categorical      Ethnicity    level                            HISPANIC OR LATINO              15 (11%)              18 (13%)              15 (11%)              48 (12%)
      22   ETHNIC categorical      Ethnicity    level                        NOT HISPANIC OR LATINO             104 (78%)             103 (77%)             101 (77%)             308 (77%)
      23   ETHNIC categorical      Ethnicity    level                                       UNKNOWN              9 (6.7%)              3 (2.2%)              5 (3.8%)             17 (4.3%)
      24  COUNTRY categorical        Country    label                                       Country                                                                                        
      25  COUNTRY categorical        Country    level                                           CHN              74 (55%)              81 (60%)              64 (48%)             219 (55%)
      26  COUNTRY categorical        Country    level                                           USA             10 (7.5%)             13 (9.7%)              17 (13%)              40 (10%)
      27  COUNTRY categorical        Country    level                                           BRA             13 (9.7%)              7 (5.2%)             10 (7.6%)             30 (7.5%)
      28  COUNTRY categorical        Country    level                                           PAK             12 (9.0%)              9 (6.7%)             10 (7.6%)             31 (7.8%)
      29  COUNTRY categorical        Country    level                                           NGA              8 (6.0%)              7 (5.2%)             11 (8.3%)             26 (6.5%)
      30  COUNTRY categorical        Country    level                                           RUS              5 (3.7%)              8 (6.0%)              6 (4.5%)             19 (4.8%)
      31  COUNTRY categorical        Country    level                                           JPN              5 (3.7%)              4 (3.0%)              9 (6.8%)             18 (4.5%)
      32  COUNTRY categorical        Country    level                                           GBR              4 (3.0%)              3 (2.2%)              2 (1.5%)              9 (2.3%)
      33  COUNTRY categorical        Country    level                                           CAN              3 (2.2%)              2 (1.5%)              3 (2.3%)              8 (2.0%)
      34  COUNTRY categorical        Country    level                                           CHE                0 (0%)                0 (0%)                0 (0%)                0 (0%)
      35     AVAL continuous2 Analysis Value    label                                Analysis Value                                                                                        
      36     AVAL continuous2 Analysis Value    level                                     Mean (SD)          49.75 (8.27)          50.87 (7.42)          49.12 (8.25)          49.92 (8.00)
      37     AVAL continuous2 Analysis Value    level                                Median (Range) 50.44 (29.02 - 69.08) 51.51 (30.70 - 67.70) 48.69 (20.63 - 70.52) 50.27 (20.63 - 70.52)

# Table 02 generation (gtsum) works with some NA values

    Code
      res
    Output
        variable    var_type var_label row_type               label   stat_1   stat_2   stat_3    stat_0
      1      SEX categorical       Sex    label                 Sex                                     
      2      SEX categorical       Sex    level                   F 68 (51%) 68 (51%) 62 (47%) 198 (50%)
      3      SEX categorical       Sex    level                   M 50 (37%) 48 (36%) 54 (41%) 152 (38%)
      4      SEX categorical       Sex    level     &lt;Missing&gt; 16 (12%) 18 (13%) 16 (12%)  50 (13%)

