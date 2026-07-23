# cardinal 0.2.0

* Initial release.
* Added `make_table_02()` to produce FDA Table 2 (Baseline Demographic and Clinical Characteristics, Safety Population). The function filters for the safety population, builds a `gtsummary` table with continuous (mean/SD, median/range) and categorical (n/%) summaries by treatment arm, and optionally returns the intermediate ARD (`return_ard = TRUE`).
* Moved `dplyr` from `Suggests` to `Imports` to support `make_table_02()`.
