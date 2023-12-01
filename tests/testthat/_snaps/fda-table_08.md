# Table 08 generation works with default values

    Code
      res
    Output
                                                                   Dosing    Study           Cause of Death                              
                                                Age/              Duration   Day of              MedDRA                 Cause of Death   
        Study Arm           Patient ID         Gender   Dosage     (Days)    Death           Preferred Term              Verbatim Term   
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        A: Drug X      AB12345-BRA-2-id-296     44/F    4800 mg      37        NA                  NA                         NA         
                       AB12345-CHN-1-id-315     32/M    6480 mg      37        NA                  NA                         NA         
                        AB12345-CHN-1-id-71     33/M    7440 mg      37        NA                  NA                         NA         
                       AB12345-CHN-11-id-116    30/M    8880 mg      37        NA                  NA                         NA         
                       AB12345-CHN-14-id-161    33/F    6480 mg      37        NA                  NA                         NA         
                       AB12345-CHN-14-id-168    39/M    6960 mg      37        NA                  NA                         NA         
                       AB12345-CHN-17-id-309    36/F    7200 mg      37        NA                  NA                         NA         
                        AB12345-CHN-2-id-22     29/M    8400 mg      38       409                MISSING                     OTHER       
                       AB12345-CHN-2-id-272     41/F    4320 mg      37       773          DISEASE PROGRESSION        PROGRESSIVE DISEASE
                       AB12345-CHN-2-id-274     40/F    5520 mg      37       890                SUICIDE                     OTHER       
                       AB12345-CHN-2-id-284     36/F    7200 mg      38        NA                  NA                         NA         
                        AB12345-CHN-4-id-73     24/F    7920 mg      37        NA                  NA                         NA         
                       AB12345-PAK-12-id-328    21/F    7680 mg      37        NA                  NA                         NA         
                        AB12345-RUS-1-id-52     40/F    6960 mg      37       1069         DISEASE PROGRESSION        PROGRESSIVE DISEASE
                       AB12345-USA-11-id-32     24/F    7200 mg      37        NA                  NA                         NA         
                       AB12345-USA-11-id-339    39/F    5280 mg      37       878                UNKNOWN                     OTHER       
        B: Placebo     AB12345-BRA-12-id-59     36/M    6480 mg      38        NA                  NA                         NA         
                       AB12345-CHN-1-id-156     32/F    6000 mg      37       542                SUICIDE                     OTHER       
                       AB12345-CHN-1-id-186     27/M    5520 mg      37        NA                  NA                         NA         
                       AB12345-CHN-1-id-212     30/F    5040 mg      37        NA                  NA                         NA         
                       AB12345-CHN-1-id-346     21/M    7920 mg      37       834             ADVERSE EVENT              ADVERSE EVENT   
                       AB12345-CHN-11-id-54     26/M    5040 mg      37        NA                  NA                         NA         
                       AB12345-CHN-11-id-90     37/F    5760 mg      37        NA                  NA                         NA         
                       AB12345-CHN-13-id-19     30/F    7440 mg      37        NA                  NA                         NA         
                       AB12345-CHN-13-id-239    58/F    6720 mg      37        NA                  NA                         NA         
                       AB12345-CHN-5-id-231     37/F    4800 mg      37       468             ADVERSE EVENT              ADVERSE EVENT   
                       AB12345-CHN-7-id-267     40/M    5280 mg      37        NA                  NA                         NA         
                       AB12345-GBR-17-id-211    62/M    5760 mg      37       455          DISEASE PROGRESSION        PROGRESSIVE DISEASE
      C: Combination   AB12345-BRA-1-id-265     25/M    6000 mg      37       872                SUICIDE                     OTHER       
                       AB12345-CHN-1-id-233     36/F    7680 mg      37       406                MISSING                     OTHER       
                        AB12345-CHN-1-id-74     23/F    8400 mg      37        NA                  NA                         NA         
                        AB12345-CHN-1-id-78     44/F    8160 mg      37        NA                  NA                         NA         
                       AB12345-CHN-11-id-146    28/F    5040 mg      37        NA                  NA                         NA         
                       AB12345-CHN-11-id-158    24/F    7200 mg      37        NA                  NA                         NA         
                       AB12345-CHN-11-id-184    38/F    8400 mg      37       1029         DISEASE PROGRESSION        PROGRESSIVE DISEASE
                       AB12345-CHN-14-id-143    36/F    6720 mg      37        NA                  NA                         NA         
                       AB12345-CHN-2-id-292     32/F    6960 mg      37        NA                  NA                         NA         
                       AB12345-CHN-4-id-115     38/M    5760 mg      37        NA                  NA                         NA         
                       AB12345-GBR-11-id-390    69/M    6000 mg      37        NA                  NA                         NA         
                        AB12345-PAK-1-id-95     28/F    6240 mg      37       1027    Post-study reporting of death          OTHER       
                       AB12345-PAK-2-id-188     23/F    7200 mg      37        NA                  NA                         NA         
                       AB12345-PAK-2-id-191     38/F    5520 mg      37        NA                  NA                         NA         
                        AB12345-PAK-5-id-20     40/M    6960 mg      37        NA                  NA                         NA         
                       AB12345-USA-1-id-242     30/F    5760 mg      37        NA                  NA                         NA         

# Table 08 generation works with custom values

    Code
      res
    Output
      Table 8. All Individual Patient Deaths, Safety Population, Pooled Analyses (1)
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                   Dosing    Study      Cause of Death                         
                                                Age/              Duration   Day of         MedDRA            Cause of Death   
        Study Arm           Patient ID         Gender   Dosage     (Days)    Death      Preferred Term         Verbatim Term   
      —————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        A: Drug X      AB12345-CHN-1-id-277     41/M    8160 mg      37        -               -                     -         
                       AB12345-CHN-1-id-315     32/M    6480 mg      37        -               -                     -         
                       AB12345-CHN-11-id-124    41/M    7440 mg      37        -               -                     -         
                       AB12345-CHN-11-id-132    30/F    6000 mg      37        -               -                     -         
                       AB12345-CHN-11-id-153    41/M    7680 mg      37        -               -                     -         
                       AB12345-CHN-11-id-167    28/F    4800 mg      37        -               -                     -         
                       AB12345-CHN-11-id-392    39/M    5280 mg      37        -               -                     -         
                       AB12345-CHN-12-id-396    25/F    8880 mg      37        -               -                     -         
                       AB12345-CHN-14-id-161    33/F    6480 mg      37        -               -                     -         
                       AB12345-CHN-18-id-170    31/M    7200 mg      37        -               -                     -         
                        AB12345-CHN-2-id-22     29/M    8400 mg      38       409           MISSING                OTHER       
                       AB12345-CHN-2-id-272     41/F    4320 mg      37       773     DISEASE PROGRESSION   PROGRESSIVE DISEASE
                       AB12345-CHN-2-id-286     30/F    8400 mg      37        -               -                     -         
                       AB12345-CHN-3-id-271     24/F    4320 mg      37        -               -                     -         
                        AB12345-RUS-1-id-52     40/F    6960 mg      37       1069    DISEASE PROGRESSION   PROGRESSIVE DISEASE
                       AB12345-USA-3-id-282     38/M    4800 mg      37        -               -                     -         
        B: Placebo     AB12345-CHN-1-id-156     32/F    6000 mg      37       542           SUICIDE                OTHER       
                       AB12345-CHN-1-id-346     21/M    7920 mg      37       834        ADVERSE EVENT         ADVERSE EVENT   
                       AB12345-CHN-11-id-358    32/F    4560 mg      37        -               -                     -         
                       AB12345-CHN-11-id-362    39/F    6240 mg      37        -               -                     -         
                       AB12345-CHN-11-id-364    48/F    4800 mg      37        -               -                     -         
                       AB12345-CHN-12-id-322    37/M    7920 mg      37        -               -                     -         
                       AB12345-CHN-13-id-19     30/F    7440 mg      37        -               -                     -         
                       AB12345-CHN-17-id-48     32/F    6000 mg      37        -               -                     -         
                       AB12345-CHN-3-id-333     30/F    8160 mg      37        -               -                     -         
                       AB12345-CHN-5-id-338     37/F    7920 mg      38        -               -                     -         
                       AB12345-GBR-6-id-111     30/F    5520 mg      37        -               -                     -         
                       AB12345-NGA-2-id-308     26/F    5520 mg      37        -               -                     -         
                       AB12345-USA-1-id-269     35/F    8400 mg      37        -               -                     -         
                       AB12345-USA-12-id-226    30/M    5040 mg      37        -               -                     -         
                       AB12345-USA-4-id-190     53/M    4560 mg      37        -               -                     -         
      C: Combination   AB12345-BRA-11-id-321    33/F    9360 mg      37        -               -                     -         
                        AB12345-BRA-11-id-9     40/M    7200 mg      38       1091    DISEASE PROGRESSION   PROGRESSIVE DISEASE
                       AB12345-CHN-1-id-233     36/F    7680 mg      37       406           MISSING                OTHER       
                       AB12345-CHN-1-id-376     41/F    5760 mg      38        -               -                     -         
                       AB12345-CHN-14-id-143    36/F    6720 mg      37        -               -                     -         
                       AB12345-CHN-15-id-297    31/M    8880 mg      37        -               -                     -         
                       AB12345-CHN-17-id-31     35/F    5760 mg      37        -               -                     -         
                       AB12345-JPN-11-id-135    37/F    5760 mg      37        -               -                     -         
                       AB12345-NGA-1-id-198     32/F    7680 mg      37        -               -                     -         
                       AB12345-NGA-1-id-357     41/M    5040 mg      37        -               -                     -         
                       AB12345-NGA-11-id-173    24/F    6000 mg      37        -               -                     -         
                       AB12345-NGA-11-id-334    20/M    5280 mg      37        -               -                     -         
                       AB12345-PAK-2-id-188     23/F    7200 mg      37        -               -                     -         
      —————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
      
      Source: [include Applicant source, datasets and/or software tools used].
      (1) Duration = [e.g., X week double-blind treatment period or median and a range indicating
      pooled trial durations].
      Abbreviations: MedDRA, Medical Dictionary for Regulatory Activities; PT, preferred term

