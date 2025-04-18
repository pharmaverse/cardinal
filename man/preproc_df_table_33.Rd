% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fda-table_33.R
\name{preproc_df_table_33}
\alias{preproc_df_table_33}
\title{Pre-Process Data for Table 33 Creation}
\usage{
preproc_df_table_33(
  df,
  denominator = NULL,
  id_var = "USUBJID",
  arm_var = "ARM",
  saffl_var = "SAFFL",
  subset = "PARAMCD \%in\% c('DIABP', 'SYSBP') & AVISITN >= 1"
)
}
\arguments{
\item{subset}{(\code{string})\cr selection of both PARAMCD and definition of baseline.}
}
\description{
Pre-Process Data for Table 33 Creation
}
\keyword{internal}
