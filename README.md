# falcon

<a href='https://pharmaverse.github.io/falcon/'><img src="quarto/assets/images/falcon.png" align="right" height="139" style="max-width: 100%;"/></a>

<!-- start badges -->
[![Pharmaverse](https://pharmaverse.org/shields/falcon.svg)](https://pharmaverse.org)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
![Check](https://github.com/pharmaverse/falcon/actions/workflows/check.yaml/badge.svg)
![Test Coverage](https://raw.githubusercontent.com/pharmaverse/falcon/_xml_coverage_reports/data/main/badge.svg)


![GitHub contributors](https://img.shields.io/github/contributors/pharmaverse/falcon)
![GitHub repo stars](https://img.shields.io/github/stars/pharmaverse/falcon?style=social)
![GitHub forks](https://img.shields.io/github/forks/pharmaverse/falcon?style=social)
<!-- end badges -->

The `falcon` R package contains table-generating functions to implement standard FDA Safety Tables according to the guidelines published in the [FDA Safety Tables and Figures Integrated Guide](https://downloads.regulations.gov/FDA-2022-N-1961-0046/attachment_1.pdf). The falcon project aims to build and open-source a catalog of harmonized templates for generating tables, listings, and graphs (TLGs) in clinical study reporting. Details on package usage and the variety of functions currently available in the package are available on [the falcon website](https://pharmaverse.github.io/falcon/).

## Installation

You can install the latest development version of `falcon` directly from GitHub and its dependencies from CRAN by running the following:

```r
if (!require("formatters")) install.packages("formatters")
if (!require("rtables")) install.packages("rtables")
if (!require("rlistings")) install.packages("rlistings")
if (!require("tern")) install.packages("tern")

if (!require("remotes")) install.packages("remotes")
remotes::install_github("pharmaverse/falcon")
```

See the [Getting Started page](https://pharmaverse.github.io/falcon/quarto/getting_started.html) on the falcon website for additional details on getting started with the `falcon` package.

## Usage

In the following example, Table 2 (Baseline Demographic and Clinical Characteristics) from the [FDA Safety Tables and Figures Integrated Guide](https://downloads.regulations.gov/FDA-2022-N-1961-0046/attachment_1.pdf) is generated using the `make_table_02` function from the `falcon` package.

First we will load the `falcon` package and use the [`scda`](https://github.com/insightsengineering/scda) package to load an example ADSL dataset from the [`scda.2022`](https://github.com/insightsengineering/scda.2022) package. The `falcon` package works with standard CDISC datasets and variable names while allowing users to set custom variable names & labels where necessary.

```r
library(falcon)
adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
```

With data now loaded, the `make_table_02` function can be used to generate the FDA standard table.

```r
make_table_02(
  df = adsl,
  vars = c("SEX", "AGE", "RACE", "COUNTRY"),
  lbl_vars = c("Sex", "Age, years", "Race", "Country of Participation")
)
```

```
                                                  A: Drug X            B: Placebo         C: Combination      Total Population 
Characteristic                                     (N=134)              (N=134)              (N=132)              (N=400)      
———————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
Sex                                                                                                                            
  F                                                79 (59%)            82 (61.2%)            70 (53%)           231 (57.8%)    
  M                                                55 (41%)            52 (38.8%)            62 (47%)           169 (42.2%)    
Age, years                                                                                                                     
  Mean (SD)                                       33.8 (6.6)           35.4 (7.9)           35.4 (7.7)           34.9 (7.4)    
  Median (Min - Max)                          33.0 (21.0 - 50.0)   35.0 (21.0 - 62.0)   35.0 (20.0 - 69.0)   34.0 (20.0 - 69.0)
Race                                                                                                                           
  ASIAN                                           68 (50.7%)            67 (50%)            73 (55.3%)           208 (52%)     
  BLACK OR AFRICAN AMERICAN                       31 (23.1%)           28 (20.9%)           32 (24.2%)           91 (22.8%)    
  WHITE                                           27 (20.1%)           26 (19.4%)           21 (15.9%)           74 (18.5%)    
  AMERICAN INDIAN OR ALASKA NATIVE                  8 (6%)             11 (8.2%)             6 (4.5%)            25 (6.2%)     
  MULTIPLE                                            0                 1 (0.7%)                0                 1 (0.2%)     
  NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER           0                 1 (0.7%)                0                 1 (0.2%)     
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
```

For more information on the `make_table_02` function and parameters you can use to customize the output table, see the [FDA Table 2 page](https://pharmaverse.github.io/falcon/quarto/table-templates/template-table_02.html) on the falcon website.

## Related Packages

* [`tern`](https://insightsengineering.github.io/tern/main/) - analysis functions used to build standard tables.
* [`rtables`](https://insightsengineering.github.io/rtables/main/) - table engine used for standard tables.
* [`rlistings`](https://insightsengineering.github.io/rlistings/main/) - listing engine used for standard listings.
* [`gtsummary`](https://www.danieldsjoberg.com/gtsummary/) - table functions used to build select non-standard tables.
* [`Tplyr`](https://github.com/atorus-research/Tplyr) - table functions used to build select non-standard tables.

## Contact

We are reachable via the following channels for inquiries and support:

* [Slack](https://app.slack.com/client/T028PB489D3/C04MQS12MND) - Use this channel to message the falcon team directly with questions & feedback on the package. If you don't have access, use this [link](https://join.slack.com/t/pharmaverse/shared_invite/zt-yv5atkr4-Np2ytJ6W_QKz_4Olo7Jo9A) to join the pharmaverse Slack workspace
* [GitHub Issues](https://github.com/pharmaverse/falcon/issues/new/choose) - To report a bug, request a new feature or table, or ask a question, open a new issue on GitHub.

## Acknowledgment

This package is a result of an industry collaboration across several different companies. We would like to thank all of the developers and users who have contributed so far!

## Stargazers over time

[![](https://starchart.cc/pharmaverse/falcon.svg)](https://starchart.cc/pharmaverse/falcon)
