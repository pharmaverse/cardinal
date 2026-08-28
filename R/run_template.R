#' Run a Table or Figure Template Script
#'
#' @description
#' Source one of the self-contained template scripts shipped in
#' `inst/templates` and return the object it builds. Each template is a plain
#' R script that produces a `tbl` object (and, where relevant, an `ard`),
#' so the same script can be run here for testing, copied into the catalog,
#' or handed to a user as a starting point.
#'
#' Keeping the full script as the single source of truth avoids drifting
#' between what is tested and what is published in the catalog.
#'
#' @param name (`character(1)`)\cr
#'   template name without extension, e.g. `"fda-table_07"`. Must match a file
#'   `inst/templates/<name>.R`.
#' @param envir (`environment`)\cr
#'   environment in which the script is evaluated. A fresh child of the caller
#'   is used by default so template objects do not leak into the caller.
#'
#' @returns the environment the template was evaluated in, invisibly. Template
#'   objects (such as `tbl` and `ard`) are available as bindings in it.
#'
#' @examples
#' \dontrun{
#' env <- run_template("fda-table_07")
#' env$tbl
#' }
#'
#' @export
run_template <- function(name, envir = new.env(parent = parent.frame())) {
  path <- system.file("templates", paste0(name, ".R"), package = "cardinalfda")
  if (!nzchar(path)) {
    stop("No template found for '", name, "' in inst/templates.", call. = FALSE)
  }
  sys.source(path, envir = envir, keep.source = TRUE)
  invisible(envir)
}
