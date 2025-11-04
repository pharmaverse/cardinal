#######################################################################
# A few questions were asked in the chat during the workshop. Below we
# have some code to get you started. We suggest you explore {gtsummary}
# resources for more information. The useful_links.qmd file will help.
#######################################################################

# Install packages
if (!require("pharmaverseadam")) install.packages("pharmaverseadam")
if (!require("gtsummary")) install.packages("gtsummary")
if (!require("labelled")) install.packages("labelled")
if (!require("crane")) install.packages("crane")

# Load packages
library(dplyr)
library(pharmaverseadam)
library(gtsummary)
library(crane)

# Optional - Apply theme for more compact table display
theme_gtsummary_compact()

# Table setup
adsl <- adsl |>
  filter(
    SAFFL == "Y", # filter for safety population
    TRT01A != "Screen Failure" # filter out treatment
  )

tbl <-
  adsl |>
  tbl_summary(
    # select variables
    include = c(SEX, AGE, AGEGR1, ETHNIC, RACE),
    # stratify by treatment
    by = TRT01A,
    # use type "continuous2" for continuous variables
    type = all_continuous() ~ "continuous2",
    # specify statistics to display
    statistic = list(
      all_continuous() ~ c("{mean} ({sd})", "{median} ({min}, {max})"),
      all_categorical() ~ "{n} ({p}%)"
    ),
    # update AGEGR1 label
    label = AGEGR1 ~ "Age Group, Years"
  ) |>
  # add overall column
  add_overall(last = TRUE)

tbl

#### How to modify any 0 (0%) in a table to just (0)? ----

# Using the modify_post_fmt_fn():

tbl <- tbl |>
  # instruct the function to replace and (0%) in the table to (0).
  modify_post_fmt_fun(
    fmt_fun = ~ifelse(. == "0 (0%)", "0", .),
    columns = all_stat_cols()
  )

tbl


#### Handling missing values? ----
# By default, all levels of a factor will be displayed in the table, even if unobserved.

# convert the `SEX` variable to factor
# adding a level with no observations for demonstration
adsl$SEX <- factor(adsl$SEX, levels = c("F", "M", "Missing"))

tbl <-
  adsl |>
  tbl_summary(
    # select variables
    include = c(SEX, AGE, AGEGR1, ETHNIC, RACE),
    # stratify by treatment
    by = TRT01A,
    # use type "continuous2" for continuous variables
    type = all_continuous() ~ "continuous2",
    # specify statistics to display
    statistic = list(
      all_continuous() ~ c("{mean} ({sd})", "{median} ({min}, {max})"),
      all_categorical() ~ "{n} ({p}%)"
    ),
    # update AGEGR1 label
    label = AGEGR1 ~ "Age Group, Years"
  ) |>
  # add overall column
  add_overall(last = TRUE)

tbl
