#' FDA Figure 1: Time to Permanent Discontinuation of Study Drug, Safety Population, Pooled Analyses
#'
#' @description
#' Creates FDA Figure 1 showing time to permanent discontinuation of study drug for the safety
#' population, with an optional "Number of Patients" table below the plot.
#'
#' @param df (`data.frame`)\cr dataset (typically ADSL) required to build the figure.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split figure into lines.
#'   Defaults to `"TRT01A"`.
#' @param id_var (`character`)\cr name of the subject identifier variable. Defaults to `"USUBJID"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param trtsdtm_var (`character`)\cr name of the treatment start datetime variable.
#'   Defaults to `"TRTSDTM"`.
#' @param trtedtm_var (`character`)\cr name of the treatment end datetime variable.
#'   Defaults to `"TRTEDTM"`.
#' @param u_trtdur (`character`)\cr unit for treatment duration. One of `"days"`, `"weeks"`,
#'   `"months"`, or `"years"`. Defaults to `"days"`.
#' @param x_lab (`character`)\cr x-axis label. Defaults to `"Time from first dose (<u_trtdur>)"`.
#' @param y_lab (`character`)\cr y-axis label. Defaults to `"Percent of Patients (%)"`.
#' @param xticks (`numeric` or `NA`)\cr x-axis tick mark positions. Defaults to `NA` (auto).
#' @param ggtheme (`ggplot2::theme` or `NULL`)\cr ggplot2 theme to apply. Defaults to `NULL`.
#' @param add_table (`flag`)\cr whether to add a "Number of Patients" table below the plot.
#'   Defaults to `TRUE`.
#' @param annotations (named `list` of `character`)\cr list of annotations to add to the figure.
#'   Valid types are `title`, `subtitles`, and `caption`.
#'
#' @details
#' * `df` must contain the variables specified by `arm_var`, `id_var`, `saffl_var`, `trtsdtm_var`,
#'   and `trtedtm_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#'   Missing values in flag variables are treated as `"N"`.
#' * Records with missing treatment start and/or end datetime are excluded from all calculations.
#' * Values in the "Number of Patients" table are the number of patients with treatment duration
#'   equal to or greater than the given time.
#'
#' @return A `ggplot2` object.
#'
#' @examplesIf requireNamespace("pharmaverseadam", quietly = TRUE) && requireNamespace("dplyr", quietly = TRUE) && requireNamespace("ggplot2", quietly = TRUE)
#' library(dplyr)
#'
#' adsl <- pharmaverseadam::adsl |>
#'   filter(TRT01A != "Screen Failure")
#'
#' fig <- make_fig_01(df = adsl)
#' fig
#'
#' @importFrom dplyr filter mutate select distinct arrange all_of
#' @importFrom lubridate interval ymd_hms
#' @importFrom ggplot2 ggplot aes geom_line labs theme element_blank scale_x_continuous ggplot_build annotate unit element_rect
#' @importFrom cowplot get_plot_component plot_grid
#' @export
make_fig_01 <- function(df,
                         arm_var = "TRT01A",
                         id_var = "USUBJID",
                         saffl_var = "SAFFL",
                         trtsdtm_var = "TRTSDTM",
                         trtedtm_var = "TRTEDTM",
                         u_trtdur = "days",
                         x_lab = paste0("Time from first dose (", u_trtdur, ")"),
                         y_lab = "Percent of Patients (%)",
                         xticks = NA,
                         ggtheme = NULL,
                         add_table = TRUE,
                         annotations = NULL) {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(arm_var, id_var, saffl_var, trtsdtm_var, trtedtm_var) %in% names(df)))
  stopifnot(u_trtdur %in% c("days", "weeks", "months", "years"))

  df <- df |>
    dplyr::filter(.data[[saffl_var]] == "Y") |>
    dplyr::mutate(
      TRTDUR = as.numeric(
        lubridate::interval(
          lubridate::ymd_hms(.data[[trtsdtm_var]]),
          lubridate::ymd_hms(.data[[trtedtm_var]])
        ),
        u_trtdur
      )
    ) |>
    dplyr::filter(!is.na(TRTDUR)) |>
    dplyr::select(dplyr::all_of(c(id_var, arm_var)), TRTDUR) |>
    dplyr::distinct() |>
    dplyr::arrange(desc(TRTDUR))

  df$PT_PCT <- seq_len(nrow(df)) / nrow(df) * 100
  max_time <- max(df$TRTDUR)

  g <- ggplot2::ggplot(
    data = df,
    ggplot2::aes(x = TRTDUR, y = PT_PCT, group = .data[[arm_var]], color = .data[[arm_var]])
  ) +
    ggplot2::geom_line() +
    ggplot2::labs(
      title = annotations[["title"]],
      subtitle = annotations[["subtitles"]],
      caption = annotations[["caption"]],
      x = x_lab,
      y = y_lab
    ) +
    ggplot2::theme(
      legend.position = "bottom",
      legend.title = ggplot2::element_blank(),
      plot.margin = ggplot2::unit(c(0.05, 0.05, 0, 0.025), "npc")
    )

  if (any(!is.na(xticks))) {
    g <- g + ggplot2::scale_x_continuous(
      breaks = xticks,
      limits = c(min(xticks), max(c(xticks, max_time)))
    )
  }

  if (!is.null(ggtheme)) g <- g + ggtheme

  if (add_table) {
    legend_pos <- paste0("guide-box-", ifelse(is.null(ggtheme), "bottom", ggtheme$legend.position))
    g_legend <- cowplot::get_plot_component(g, legend_pos, return_all = TRUE)

    g <- g + ggplot2::theme(legend.position = "none")

    xtick_lbls <- ggplot2::ggplot_build(g)$layout$panel_params[[1]]$x$breaks
    xtick_lbls <- xtick_lbls[!is.na(xtick_lbls)]
    xlims <- ggplot2::ggplot_build(g)$layout$panel_params[[1]]$x$limits

    tbl_n <- expand.grid(x = xtick_lbls, arm = rev(levels(df[[arm_var]])), n = 0)

    g_tbl <- ggplot2::ggplot(tbl_n, ggplot2::aes(x = x, y = arm)) +
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank(),
        axis.title.y = ggplot2::element_blank(),
        axis.ticks.x = ggplot2::element_blank(),
        axis.ticks.y = ggplot2::element_blank(),
        panel.background = ggplot2::element_blank(),
        axis.text.x = ggplot2::element_blank(),
        panel.border = ggplot2::element_rect(color = "black", fill = NA, linewidth = 0.5),
        plot.margin = ggplot2::unit(c(0.1, 0.05, 0, 0.025), "npc")
      ) +
      ggplot2::labs(title = "Number of Patients") +
      ggplot2::scale_x_continuous(
        breaks = xtick_lbls,
        limits = c(min(xlims, xtick_lbls), max(xlims, xtick_lbls))
      )

    for (i in seq_len(nrow(tbl_n))) {
      tbl_n$n[i] <- sum(df[[arm_var]] == tbl_n$arm[i] & df$TRTDUR >= tbl_n$x[i])
      g_tbl <- g_tbl +
        ggplot2::annotate("text", label = as.character(tbl_n$n[i]), x = tbl_n$x[i], y = tbl_n$arm[i])
    }

    if (!is.null(ggtheme)) g_tbl <- g_tbl + ggtheme

    cowplot::plot_grid(g, g_tbl, g_legend, align = "v", axis = "l", ncol = 1, rel_heights = c(0.7, 0.25, 0.1))
  } else {
    g
  }
}
