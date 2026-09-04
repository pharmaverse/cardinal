# cardinalfda 0.3.0

 * Removed the exported `make_table_02()`. FDA Table 2 is now built from `inst/templates/fda-table_02.R` and run via `run_template()`, matching the other tables.
 * Moved `dplyr` from `Suggests` to `Imports`.
 * FDA Table 9 (individual subject deaths) now builds its listing with `crane::tbl_listing()` instead of `gtsummary::as_gtsummary()`, so it is classed as a listing.
 * Added `run_template()` and moved each table's full script into `inst/templates/`, so the catalog scripts are the single source of truth and tests run them directly.
 * Catalog pages now source their code directly from `inst/templates/` and render the live table and ARD, so the published code cannot drift from what tests run and is easy to copy.
 * Added `inst/templates/` scripts for FDA Tables 2 and 9 so every catalog table has a single-source template.

# cardinalfda 0.2.0

 * Initial release.
 * Added `make_table_02()` to produce FDA Table 2 (Baseline Demographic and Clinical Characteristics, Safety Population). The function filters for the safety population, builds a `gtsummary` table with continuous (mean/SD, median/range) and categorical (n/%) summaries by treatment arm, and optionally returns the intermediate ARD (`return_ard = TRUE`).
