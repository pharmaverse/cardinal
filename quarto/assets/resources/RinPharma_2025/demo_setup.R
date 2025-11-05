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
