# fda-table_03() works

    Code
      as.data.frame(ard[[1]]$tbl_summary)[1:25, ]
    Output
                   variable variable_level        context stat_name     stat_label
      1              SCRNFL           TRUE tabulate_value         n              n
      2              SCRNFL           TRUE tabulate_value         N              N
      3              SCRNFL           TRUE tabulate_value         p              %
      4              SCRNFL           NULL     attributes     label Variable Label
      5              SCRNFL           NULL     attributes     class Variable Class
      6              SCRNFL           NULL        missing     N_obs       No. obs.
      7              SCRNFL           NULL        missing    N_miss      N Missing
      8              SCRNFL           NULL        missing N_nonmiss  N Non-missing
      9              SCRNFL           NULL        missing    p_miss      % Missing
      10             SCRNFL           NULL        missing p_nonmiss  % Non-missing
      11    ..ard_total_n..           NULL        total_n         N              N
      NA               <NA>           NULL           <NA>      <NA>           <NA>
      NA.1             <NA>           NULL           <NA>      <NA>           <NA>
      NA.2             <NA>           NULL           <NA>      <NA>           <NA>
      NA.3             <NA>           NULL           <NA>      <NA>           <NA>
      NA.4             <NA>           NULL           <NA>      <NA>           <NA>
      NA.5             <NA>           NULL           <NA>      <NA>           <NA>
      NA.6             <NA>           NULL           <NA>      <NA>           <NA>
      NA.7             <NA>           NULL           <NA>      <NA>           <NA>
      NA.8             <NA>           NULL           <NA>      <NA>           <NA>
      NA.9             <NA>           NULL           <NA>      <NA>           <NA>
      NA.10            <NA>           NULL           <NA>      <NA>           <NA>
      NA.11            <NA>           NULL           <NA>      <NA>           <NA>
      NA.12            <NA>           NULL           <NA>      <NA>           <NA>
      NA.13            <NA>           NULL           <NA>      <NA>           <NA>
                         stat
      1                   306
      2                   306
      3                     1
      4     Subjects screened
      5               logical
      6                   306
      7                     0
      8                   306
      9                     0
      10                    1
      11                  306
      NA                 NULL
      NA.1               NULL
      NA.2               NULL
      NA.3               NULL
      NA.4               NULL
      NA.5               NULL
      NA.6               NULL
      NA.7               NULL
      NA.8               NULL
      NA.9               NULL
      NA.10              NULL
      NA.11              NULL
      NA.12              NULL
      NA.13              NULL
                                                                                                                                                                                 fmt_fun
      1     function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      2     function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      3                   function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      4                                                                                                                                                       .Primitive("as.character")
      5                                                                                                                                                                             NULL
      6     function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      7     function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      8     function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      9                   function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      10                  function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      11                                                                                                                                                                               0
      NA                                                                                                                                                                            NULL
      NA.1                                                                                                                                                                          NULL
      NA.2                                                                                                                                                                          NULL
      NA.3                                                                                                                                                                          NULL
      NA.4                                                                                                                                                                          NULL
      NA.5                                                                                                                                                                          NULL
      NA.6                                                                                                                                                                          NULL
      NA.7                                                                                                                                                                          NULL
      NA.8                                                                                                                                                                          NULL
      NA.9                                                                                                                                                                          NULL
      NA.10                                                                                                                                                                         NULL
      NA.11                                                                                                                                                                         NULL
      NA.12                                                                                                                                                                         NULL
      NA.13                                                                                                                                                                         NULL
            warning error gts_column
      1        NULL  NULL     stat_0
      2        NULL  NULL     stat_0
      3        NULL  NULL     stat_0
      4        NULL  NULL       <NA>
      5        NULL  NULL       <NA>
      6        NULL  NULL     stat_0
      7        NULL  NULL     stat_0
      8        NULL  NULL     stat_0
      9        NULL  NULL     stat_0
      10       NULL  NULL     stat_0
      11       NULL  NULL       <NA>
      NA       NULL  NULL       <NA>
      NA.1     NULL  NULL       <NA>
      NA.2     NULL  NULL       <NA>
      NA.3     NULL  NULL       <NA>
      NA.4     NULL  NULL       <NA>
      NA.5     NULL  NULL       <NA>
      NA.6     NULL  NULL       <NA>
      NA.7     NULL  NULL       <NA>
      NA.8     NULL  NULL       <NA>
      NA.9     NULL  NULL       <NA>
      NA.10    NULL  NULL       <NA>
      NA.11    NULL  NULL       <NA>
      NA.12    NULL  NULL       <NA>
      NA.13    NULL  NULL       <NA>

---

    Code
      as.data.frame(ard[[2]]$tbl_hierarchical)[1:25, ]
    Output
                               variable variable_level      context stat_name
      1    ..ard_hierarchical_overall..           TRUE hierarchical         n
      2    ..ard_hierarchical_overall..           TRUE hierarchical         N
      3    ..ard_hierarchical_overall..           TRUE hierarchical         p
      4                         SCRNFRS              3 hierarchical         n
      5                         SCRNFRS              3 hierarchical         N
      6                         SCRNFRS              3 hierarchical         p
      7                         SCRNFRS              1 hierarchical         n
      8                         SCRNFRS              1 hierarchical         N
      9                         SCRNFRS              1 hierarchical         p
      10                        SCRNFRS              4 hierarchical         n
      11                        SCRNFRS              4 hierarchical         N
      12                        SCRNFRS              4 hierarchical         p
      13                        SCRNFRS              2 hierarchical         n
      14                        SCRNFRS              2 hierarchical         N
      15                        SCRNFRS              2 hierarchical         p
      16                ..ard_total_n..           NULL      total_n         N
      NA                           <NA>           NULL         <NA>      <NA>
      NA.1                         <NA>           NULL         <NA>      <NA>
      NA.2                         <NA>           NULL         <NA>      <NA>
      NA.3                         <NA>           NULL         <NA>      <NA>
      NA.4                         <NA>           NULL         <NA>      <NA>
      NA.5                         <NA>           NULL         <NA>      <NA>
      NA.6                         <NA>           NULL         <NA>      <NA>
      NA.7                         <NA>           NULL         <NA>      <NA>
      NA.8                         <NA>           NULL         <NA>      <NA>
           stat_label       stat stat_fmt
      1             n         52       52
      2             N        306      306
      3             %  0.1699346       17
      4             n         11       11
      5             N        306      306
      6             % 0.03594771      3.6
      7             n         17       17
      8             N        306      306
      9             % 0.05555556      5.6
      10            n          7        7
      11            N        306      306
      12            % 0.02287582      2.3
      13            n         17       17
      14            N        306      306
      15            % 0.05555556      5.6
      16            N        306      306
      NA         <NA>       NULL     NULL
      NA.1       <NA>       NULL     NULL
      NA.2       <NA>       NULL     NULL
      NA.3       <NA>       NULL     NULL
      NA.4       <NA>       NULL     NULL
      NA.5       <NA>       NULL     NULL
      NA.6       <NA>       NULL     NULL
      NA.7       <NA>       NULL     NULL
      NA.8       <NA>       NULL     NULL
                                                                                                                                                                                fmt_fun
      1    function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      2    function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      3                  function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      4    function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      5    function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      6                  function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      7    function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      8    function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      9                  function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      10   function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      11   function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      12                 function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      13   function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      14   function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      15                 function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      16                                                                                                                                                                              0
      NA                                                                                                                                                                           NULL
      NA.1                                                                                                                                                                         NULL
      NA.2                                                                                                                                                                         NULL
      NA.3                                                                                                                                                                         NULL
      NA.4                                                                                                                                                                         NULL
      NA.5                                                                                                                                                                         NULL
      NA.6                                                                                                                                                                         NULL
      NA.7                                                                                                                                                                         NULL
      NA.8                                                                                                                                                                         NULL
           warning error gts_column
      1       NULL  NULL     stat_0
      2       NULL  NULL     stat_0
      3       NULL  NULL     stat_0
      4       NULL  NULL     stat_0
      5       NULL  NULL     stat_0
      6       NULL  NULL     stat_0
      7       NULL  NULL     stat_0
      8       NULL  NULL     stat_0
      9       NULL  NULL     stat_0
      10      NULL  NULL     stat_0
      11      NULL  NULL     stat_0
      12      NULL  NULL     stat_0
      13      NULL  NULL     stat_0
      14      NULL  NULL     stat_0
      15      NULL  NULL     stat_0
      16      NULL  NULL       <NA>
      NA      NULL  NULL       <NA>
      NA.1    NULL  NULL       <NA>
      NA.2    NULL  NULL       <NA>
      NA.3    NULL  NULL       <NA>
      NA.4    NULL  NULL       <NA>
      NA.5    NULL  NULL       <NA>
      NA.6    NULL  NULL       <NA>
      NA.7    NULL  NULL       <NA>
      NA.8    NULL  NULL       <NA>

---

    Code
      as.data.frame(ard[[3]]$tbl_summary)[1:25, ]
    Output
                  variable variable_level        context stat_name     stat_label
      1             ENRLFL           TRUE tabulate_value         n              n
      2             ENRLFL           TRUE tabulate_value         N              N
      3             ENRLFL           TRUE tabulate_value         p              %
      4             RANDFL           TRUE tabulate_value         n              n
      5             RANDFL           TRUE tabulate_value         N              N
      6             RANDFL           TRUE tabulate_value         p              %
      7             ENRLFL           NULL     attributes     label Variable Label
      8             ENRLFL           NULL     attributes     class Variable Class
      9             RANDFL           NULL     attributes     label Variable Label
      10            RANDFL           NULL     attributes     class Variable Class
      11            ENRLFL           NULL        missing     N_obs       No. obs.
      12            ENRLFL           NULL        missing    N_miss      N Missing
      13            ENRLFL           NULL        missing N_nonmiss  N Non-missing
      14            ENRLFL           NULL        missing    p_miss      % Missing
      15            ENRLFL           NULL        missing p_nonmiss  % Non-missing
      16            RANDFL           NULL        missing     N_obs       No. obs.
      17            RANDFL           NULL        missing    N_miss      N Missing
      18            RANDFL           NULL        missing N_nonmiss  N Non-missing
      19            RANDFL           NULL        missing    p_miss      % Missing
      20            RANDFL           NULL        missing p_nonmiss  % Non-missing
      21   ..ard_total_n..           NULL        total_n         N              N
      NA              <NA>           NULL           <NA>      <NA>           <NA>
      NA.1            <NA>           NULL           <NA>      <NA>           <NA>
      NA.2            <NA>           NULL           <NA>      <NA>           <NA>
      NA.3            <NA>           NULL           <NA>      <NA>           <NA>
                          stat
      1                    254
      2                    306
      3              0.8300654
      4                    254
      5                    306
      6              0.8300654
      7      Subjects enrolled
      8                logical
      9    Subjects randomized
      10               logical
      11                   306
      12                     0
      13                   306
      14                     0
      15                     1
      16                   306
      17                     0
      18                   306
      19                     0
      20                     1
      21                   306
      NA                  NULL
      NA.1                NULL
      NA.2                NULL
      NA.3                NULL
                                                                                                                                                                                fmt_fun
      1    function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      2    function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      3                  function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      4    function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      5    function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      6                  function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      7                                                                                                                                                      .Primitive("as.character")
      8                                                                                                                                                                            NULL
      9                                                                                                                                                      .Primitive("as.character")
      10                                                                                                                                                                           NULL
      11   function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      12   function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      13   function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      14                 function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      15                 function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      16   function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      17   function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      18   function (x) , style_number(x, digits = digits, big.mark = big.mark, decimal.mark = decimal.mark, ,     scale = scale, prefix = prefix, suffix = suffix, na = na, ,     ...)
      19                 function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      20                 function (x) , style_percent(x, prefix = prefix, suffix = suffix, digits = digits, ,     big.mark = big.mark, decimal.mark = decimal.mark, na = na, ,     ...)
      21                                                                                                                                                                              0
      NA                                                                                                                                                                           NULL
      NA.1                                                                                                                                                                         NULL
      NA.2                                                                                                                                                                         NULL
      NA.3                                                                                                                                                                         NULL
           warning error gts_column
      1       NULL  NULL     stat_0
      2       NULL  NULL     stat_0
      3       NULL  NULL     stat_0
      4       NULL  NULL     stat_0
      5       NULL  NULL     stat_0
      6       NULL  NULL     stat_0
      7       NULL  NULL       <NA>
      8       NULL  NULL       <NA>
      9       NULL  NULL       <NA>
      10      NULL  NULL       <NA>
      11      NULL  NULL     stat_0
      12      NULL  NULL     stat_0
      13      NULL  NULL     stat_0
      14      NULL  NULL     stat_0
      15      NULL  NULL     stat_0
      16      NULL  NULL     stat_0
      17      NULL  NULL     stat_0
      18      NULL  NULL     stat_0
      19      NULL  NULL     stat_0
      20      NULL  NULL     stat_0
      21      NULL  NULL       <NA>
      NA      NULL  NULL       <NA>
      NA.1    NULL  NULL       <NA>
      NA.2    NULL  NULL       <NA>
      NA.3    NULL  NULL       <NA>

