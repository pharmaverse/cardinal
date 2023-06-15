# falcon 0.1.0.9018

### New Features
* Added new functions for creating standard FDA tables: `make_table_02`, `make_table_05`, `make_table_06`, `make_table_07`, `make_table_08`, `make_table_09`, `make_table_13`, `make_table_14`, `make_table_20`, `make_table_32`, `make_table_33`.
* Added helper functions used within table functions:
  * `basic_table_annot` for adding basic table annotations (titles, footnotes, column counts).
  * `split_cols_by_arm` for splitting columns by arm with option to add overall column.
  * `alt_counts_df_preproc` for pre-processing the `alt_counts_df` dataset.
  * `assert_flag_variables` (internal) for asserting that flag variables in the data are correctly formatted.

### Miscellaneous
* Initialized the package.
* Developed Quarto website.
