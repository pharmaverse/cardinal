# cardinalfda 0.2.0.9003

 * Moved `dplyr` from `Suggests` to `Imports` to support `make_table_02()`.
 * FDA Table 9 (individual subject deaths) now builds its listing with `crane::tbl_listing()` instead of `gtsummary::as_gtsummary()`, so it is classed as a listing.
 * Added `run_template()` and moved each table's full script into `inst/templates/`, so the catalog scripts are the single source of truth and tests run them directly.

# cardinalfda 0.2.0

 * Initial release.
 * Added `make_table_02()` to produce FDA Table 2 (Baseline Demographic and Clinical Characteristics, Safety Population). The function filters for the safety population, builds a `gtsummary` table with continuous (mean/SD, median/range) and categorical (n/%) summaries by treatment arm, and optionally returns the intermediate ARD (`return_ard = TRUE`).
