% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fda-table_09.R
\name{make_table_09_tplyr}
\alias{make_table_09_tplyr}
\alias{make_table_09_gtsum}
\alias{make_table_09}
\title{FDA Table 9: Patients With Serious Adverse Events by System Organ Class and Preferred Term,
Safety Population, Pooled Analyses}
\usage{
make_table_09_tplyr(
  adae,
  alt_counts_df = NULL,
  id_var = "USUBJID",
  arm_var = "ARM",
  saffl_var = "SAFFL",
  ser_var = "AESER",
  soc_var = "AESOC",
  pref_var = "AEDECOD",
  lbl_soc_var = "System Organ Class",
  lbl_pref_var = "Reported Term for Adverse Event",
  risk_diff_pairs = NULL,
  show_colcounts = TRUE,
  lbl_overall = NULL,
  prune_0 = TRUE,
  tplyr_raw = FALSE,
  annotations = NULL
)

make_table_09_gtsum(
  adae,
  alt_counts_df = NULL,
  show_colcounts = TRUE,
  saffl_var = "SAFFL",
  ser_var = "AESER",
  arm_var = "ARM",
  pref_var = "AEDECOD",
  id_var = "USUBJID",
  soc_var = "AESOC",
  lbl_pref_var = formatters::var_labels(adae, fill = TRUE)[pref_var],
  lbl_soc_var = formatters::var_labels(adae, fill = TRUE)[soc_var],
  lbl_overall = NULL,
  annotations = NULL,
  risk_diff = NULL
)

make_table_09(
  df,
  denominator = NULL,
  return_ard = TRUE,
  id_var = "USUBJID",
  arm_var = "ARM",
  saffl_var = "SAFFL",
  ser_var = "AESER",
  soc_var = "AESOC",
  pref_var = "AEDECOD",
  lbl_overall = NULL
)
}
\arguments{
\item{adae}{(\code{data.frame})\cr dataset (typically ADAE) required to build table.}

\item{alt_counts_df}{(\code{character})\cr alternative dataset (typically ADSL) used only to calculate column counts.}

\item{id_var}{(\code{character})\cr Name of the unique subject identifiers variable.}

\item{arm_var}{(\code{character})\cr Name of the treatment arm variable used to split table into columns.}

\item{saffl_var}{(\code{character})\cr safety population flag variable from \code{adae} to include in the table.}

\item{ser_var}{(\code{character})\cr serious Event variable from \code{adae} to include in the table.}

\item{soc_var}{(\code{character})\cr system organ class variable from \code{adae} to include in the table.}

\item{pref_var}{(\code{character})\cr Name of the preferred term variable from \code{adae} to include in the table.}

\item{lbl_soc_var}{(\code{character})\cr label corresponding to system organ class variable
\code{soc_var} to print in the table.}

\item{lbl_pref_var}{(\code{character})\cr Label corresponding to preferred term variable \code{pref_var} to print in the table.}

\item{risk_diff_pairs}{(\code{list} of \code{character} vectors)\cr Optional. List of character vectors. Each vector must be
of length 2 and contain the name of treatment arms to calculate risk difference and its 95\% CI for. Those names
must exist in the \code{arm_var} column of the dataset specified in \code{adae}.}

\item{show_colcounts}{(\code{flag})\cr Whether column counts should be printed. Boolean.}

\item{lbl_overall}{(\code{character})\cr Optional. If specified, an overall column will be added to the table with
the given value as the column label.}

\item{prune_0}{(\code{flag})\cr Whether all-zero rows should be removed from the table. Boolean.}

\item{tplyr_raw}{(\code{flag})\cr Boolean. Indicates whether the raw \code{tibble} created using \code{Tplyr} functions should be
returned or a presentation ready \code{gt_table} (default).}

\item{annotations}{(named \code{list} of \code{character})\cr list of annotations to add to the table. Valid
annotation types are \code{title}, \code{subtitles}, and a list of characters called \code{footnotes}.
Each name-value pair should use the annotation type as name and the desired string as the value.}

\item{risk_diff}{(\code{list} of \code{character} vectors)\cr List of character vectors. Each vector must be
of length 2 and contain the name of treatment arms to calculate risk difference and its 95\% CI for. Those names
must exist in the \code{arm_var} column of the dataset specified in \code{adae}.}

\item{df}{(\code{data.frame})\cr dataset required to build table.}

\item{denominator}{(\code{data.frame})\cr alternative dataset (typically ADSL) used only to calculate denominator counts.}

\item{return_ard}{(\code{flag})\cr whether an ARD should be returned. Defaults to \code{TRUE}.}
}
\value{
\itemize{
\item \code{make_table_09_tplyr()} returns a \code{gt_tbl} object when \code{tplyr_raw = FALSE} (default) and
a \code{tibble} object when \code{tplyr_raw = TRUE}.
}

\itemize{
\item \code{make_table_09_gtsum} returns a \code{gt} object.
}

A \code{gtsummary} table and, if \code{return_ard = TRUE}, an ARD.
If \code{return_ard = TRUE}, they will be returned as a list with named elements \code{table} and \code{ard}.
}
\description{
FDA Table 9: Patients With Serious Adverse Events by System Organ Class and Preferred Term,
Safety Population, Pooled Analyses
}
\details{
For \code{make_table_09_tplyr()}
\itemize{
\item \code{adae} must contain the variables specified by \code{id_var}, \code{arm_var}, \code{saffl_var}, \code{ser_var}, \code{soc_var}, and
\code{pref_var}.
\item If specified, \code{alt_counts_df} must contain the variables specified by \code{id_var}, \code{saffl_var}, and \code{arm_var}.
\item Flag variables are expected to have two levels: \code{"Y"} (true) and \code{"N"} (false). Missing values in
flag variables are treated as \code{"N"}.
\item Columns are split by the variable specified in \code{arm_var}. Overall population column is excluded by default
(see \code{lbl_overall} argument).
\item Numbers in the table represent the absolute numbers of patients and fraction of \code{N} (total number of patient in
the safety population.
\item All-zero rows are removed by default (see \code{prune_0} argument).
\item Risk difference is calculated by using the default functionality of \code{Tplyr::add_risk_diff()}
}
}
\section{Functions}{
\itemize{
\item \code{make_table_09_tplyr()}: Create FDA table 9 using functions from \code{Tplyr}.

\item \code{make_table_09_gtsum()}: Create FDA table 9 using functions from \code{gt}.

}}
\note{
\itemize{
\item \code{make_table_09_tplyr()} does not support annotations in case \code{tplyr_raw = TRUE}.
\item \code{make_table_09_tplyr()} raises a warning in case \code{pref_var} or \code{soc_var} is a factor. Those can safely be ignored.
\item \code{make_table_09_tplyr()} does not explicitly handle missings.
}
}
\examples{
adsl <- random.cdisc.data::cadsl
adae <- random.cdisc.data::cadae

# Basic table
make_table_09_tplyr(adae = adae, alt_counts_df = adsl)

# Activate risk difference column
rd_pairs <- list(c("A: Drug X", "B: Placebo"), c("A: Drug X", "C: Combination"))
make_table_09_tplyr(adae = adae, alt_counts_df = adsl, risk_diff_pairs = rd_pairs)

# Add overall column
make_table_09_tplyr(adae = adae, alt_counts_df = adsl, lbl_overall = "Total patients")

# Add titles and footnotes
annot <- list(
  title = "Table 9. Patients with Serious Adverse Events by SOC and PT, Safety Population,
    Pooled Analyses",
  subtitles = c("Only one title, but", "multiple subtitles possible"),
  main_footer = c("Main footer 1", "Main footer 2"),
  prov_footer = c("Some more information", "E.g. a source note")
)
make_table_09_tplyr(adae = adae, alt_counts_df = adsl, annotations = annot)

adsl <- random.cdisc.data::cadsl
adae <- random.cdisc.data::cadae

tbl <- make_table_09_gtsum(adae = adae, alt_counts_df = adsl)
tbl

annotations <- list(
  title = "Table 9. Patients With Serious Adverse Events",
  subtitle = "by System Organ Class and Preferred Term, Safety Population, Pooled Analyses",
  footnotes = list(
    "Duration = [e.g., X week double-blind treatment period or median and a range
    indicating pooled trial durations].",
    "Difference is shown between [treatment arms] (e.g., difference is shown
    between Drug Name dosage X vs. placebo)."
  )
)
risk_diff <- list(c("A: Drug X", "C: Combination"), c("A: Drug X", "B: Placebo"))
tbl <- make_table_09_gtsum(
  adae = adae, alt_counts_df = adsl, annotations = annotations,
  risk_diff = risk_diff
)
tbl

adsl <- random.cdisc.data::cadsl
adae <- random.cdisc.data::cadae

tbl <- make_table_09(df = adae, denominator = adsl)
tbl
}
