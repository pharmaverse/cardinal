# This only creates the basis of the test, please edit manually if necessary.
withr::with_tempfile("code", {
  for (ff in list.files("quarto/catalog", pattern = "index.qmd", full.names = TRUE, recursive = TRUE)) {
    function_name <- basename(dirname(ff))

    knitr::purl(ff, code, documentation = 0)
    template_full <- readLines(code)

    end <- grep("^tbl$", template_full)
    template_body <- template_full[4:(end - 1)]
    # add indentation at the start of each line
    template_body <- paste0("  ", template_body)
    template_body <- paste(template_body, collapse = "\n")

    template_test <- readLines(fs::path_package("cardinal", "template_test.R"))
    res <- glue::glue(paste(template_test, collapse = "\n"),
      function_name = function_name,
      template_body = template_body,
      .open = "<<", .close = ">>"
    )

    writeLines(res, file.path("tests", "testthat", paste0("test-", function_name, ".R")))
  }
})
