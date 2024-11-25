# Table 35 generation works with gtsummary with custom values

    Code
      as.data.frame(res)
    Output
        row_type var_label variable  label    stat_1    stat_2    stat_3
      1    level    <br /> AEBODSYS cl A.1 78 (58.2) 75 (56.0) 89 (67.4)
      2    level    <br /> AEBODSYS cl B.1 47 (35.1) 49 (36.6) 43 (32.6)
      3    level    <br /> AEBODSYS cl B.2 79 (59.0) 74 (55.2) 85 (64.4)
      4    level    <br /> AEBODSYS cl C.1 43 (32.1) 46 (34.3) 43 (32.6)
      5    level    <br /> AEBODSYS cl C.2 35 (26.1) 48 (35.8) 55 (41.7)
      6    level    <br /> AEBODSYS cl D.1 79 (59.0) 67 (50.0) 80 (60.6)
      7    level    <br /> AEBODSYS cl D.2 47 (35.1) 58 (43.3) 57 (43.2)

# Table 35 generation works with gtsummary missing values

    Code
      as.data.frame(res)
    Output
        row_type var_label variable           label    stat_1    stat_2    stat_3
      1    level    <br /> AEBODSYS          cl A.1 78 (58.2) 75 (56.0) 89 (67.4)
      2    level    <br /> AEBODSYS          cl B.1 47 (35.1) 49 (36.6) 43 (32.6)
      3    level    <br /> AEBODSYS          cl B.2 79 (59.0) 74 (55.2) 84 (63.6)
      4    level    <br /> AEBODSYS          cl C.1 43 (32.1) 46 (34.3) 42 (31.8)
      5    level    <br /> AEBODSYS          cl C.2 34 (25.4) 48 (35.8) 55 (41.7)
      6    level    <br /> AEBODSYS          cl D.1 79 (59.0) 67 (50.0) 79 (59.8)
      7    level    <br /> AEBODSYS          cl D.2 47 (35.1) 58 (43.3) 57 (43.2)
      8    level    <br /> AEBODSYS &lt;Missing&gt;   2 (1.5)   2 (1.5)   6 (4.5)

