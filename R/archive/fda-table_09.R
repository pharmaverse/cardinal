#' FDA Table 9: All Individual Subject Deaths, Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Table 9, a listing of all individual subject deaths for the safety
#' population, combining death information from `adae` with dosing duration derived
#' from `adex`.
#'
#' @param adae (`data.frame`)\cr dataset (typically ADAE) required to build the listing.
#' @param adex (`data.frame`)\cr dataset (typically ADEX) required to build the listing.
#'
#' @details
#' * `adae` must contain `USUBJID`, `TRT01A`, `AGE`, `SEX`, `DTHADY`, `DTHCAUS`, `SAFFL`, and `DTHFL`.
#' * `adex` must contain `USUBJID`, `AVAL`, `TRTSDT`, `TRTEDT`, `SAFFL`, and `PARAMCD`.
#' * Only deaths in the safety population are retained (`SAFFL == "Y"` and `DTHFL == "Y"`),
#'   keeping one row per unique subject.
#' * Dosing duration (`DOSDUR`, in days) is derived from `adex` as `TRTEDT - TRTSDT + 1`
#'   for total dose records (`PARAMCD == "TDOSE"`).
#' * A listing has no ARD; the underlying combined dataset is returned as the result.
#'
#' @return A `gtsummary` listing object created with [`crane::tbl_listing()`].
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE) && requireNamespace("crane", quietly = TRUE)
#' library(dplyr)
#'
#' tbl <- make_table_09(adae = pharmaverseadam::adae, adex = pharmaverseadam::adex)
#' tbl
#'
#' @importFrom dplyr filter select distinct mutate left_join arrange all_of everything
#' @importFrom crane tbl_listing
#' @importFrom gtsummary modify_header modify_column_alignment
#' @export
make_table_09 <- function(adae, adex) {
  stopifnot(is.data.frame(adae), is.data.frame(adex))

  # deaths
  adae <- adae |>
    dplyr::filter(
      # safety population
      SAFFL == "Y",
      # deaths
      DTHFL == "Y"
    ) |>
    # select variables from `adae` to include in final result
    dplyr::select(USUBJID, TRT01A, AGE, SEX, DTHADY, DTHCAUS) |>
    # keep one row per unique ID
    dplyr::distinct(USUBJID, DTHCAUS, DTHADY, .keep_all = TRUE)

  # dosing
  adex <- adex |>
    dplyr::filter(
      # safety population
      SAFFL == "Y",
      # total dosages
      PARAMCD == "TDOSE"
    ) |>
    # select variables from `adex` to include in final result
    dplyr::select(USUBJID, AVAL, TRTSDT, TRTEDT) |>
    dplyr::mutate(
      # derive dosage duration
      DOSDUR = (TRTEDT - TRTSDT + 1) |> as.character()
    )

  # combine all data
  data <- dplyr::left_join(adae, adex, by = "USUBJID") |>
    dplyr::select(TRT01A, USUBJID, AGE, SEX, DOSDUR, DTHADY, DTHCAUS) |>
    dplyr::arrange()

  crane::tbl_listing(data) |>
    # set table header labels
    gtsummary::modify_header(
      TRT01A = "**Treatment Arm**",
      USUBJID = "**Unique  \n Subject ID**",
      AGE = "**Age**",
      SEX = "**Sex**",
      DOSDUR = "**Dosing**  \n **Duration**  \n **(Days)**",
      DTHADY = "**Study**  \n **Day of**  \n **Death**",
      DTHCAUS = "**Cause of Death**"
    ) |>
    # align all columns left
    gtsummary::modify_column_alignment(dplyr::everything(), align = "left")
}
