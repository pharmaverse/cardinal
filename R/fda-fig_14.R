#' FDA Figure 14: Mean and 95% Confidence Interval of Systolic Blood Pressure Over Time
#'   by Treatment Arm, Safety Population, Trial X
#'
#' @description
#' Creates FDA Figure 14 showing mean systolic blood pressure with 95% confidence intervals
#' over time by treatment arm, with optional "Mean Value" and "Number of Patients" tables
#' below the plot.
#'
#' @param df (`data.frame`)\cr vital signs dataset (typically ADVS) required to build the figure.
#' @param arm_var (`character`)\cr name of the treatment arm variable used to split figure into lines.
#'   Defaults to `"TRT01A"`.
#' @param saffl_var (`character`)\cr name of the safety flag variable. Defaults to `"SAFFL"`.
#' @param visit_var (`character`)\cr visit variable to put on the x-axis. Defaults to `"AVISIT"`.
#' @param paramcd_val (`character`)\cr value of `PARAMCD` to filter on. Defaults to `"SYSBP"`.
#' @param add_cond (`character` or `NULL`)\cr character string containing an R expression to
#'   apply as an additional filter. Defaults to `NULL`.
#' @param x_lab (`character`)\cr x-axis label. Defaults to `""`.
#' @param y_lab (`character` or `NULL`)\cr y-axis label. If `NULL`, derived from `PARAM` and `AVALU`.
#' @param yticks (`numeric` or `NA`)\cr y-axis tick mark positions. Defaults to `NA` (auto).
#' @param ggtheme (`ggplot2::theme` or `NULL`)\cr ggplot2 theme to apply. Defaults to `NULL`.
#' @param add_table (`flag`)\cr whether to add "Mean Value" and "Number of Patients" tables below
#'   the plot. Defaults to `TRUE`.
#' @param annotations (named `list` of `character`)\cr list of annotations to add to the figure.
#'   Valid types are `title`, `subtitles`, and `caption`.
#'
#' @details
#' * `df` must contain `AVAL`, `PARAMCD`, `PARAM`, `AVALU`, and the variables specified by `arm_var`,
#'   `saffl_var`, and `visit_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false).
#'   Missing values in flag variables are treated as `"N"`.
#' * Mean and 95% CI are computed per arm and visit using t-distribution critical values.
#'
#' @return A `ggplot2` object.
#'
#' @examplesIf requireNamespace("random.cdisc.data", quietly = TRUE)
#' library(dplyr)
#'
#' advs <- random.cdisc.data::cadvs
#'
#' fig <- make_fig_14(
#'   df = advs,
#'   arm_var = "ARM",
#'   add_cond = "ONTRTFL == 'Y' | ABLFL == 'Y'",
#'   add_table = TRUE,
#'   yticks = c(135, 140, 145, 150, 155, 160)
#' )
#' fig
#'
#' @importFrom dplyr filter mutate group_by summarise ungroup sym all_of
#' @importFrom ggplot2 ggplot aes geom_point geom_line geom_errorbar labs theme
#' @importFrom ggplot2 element_blank scale_y_continuous ggplot_build annotate unit element_rect
#' @importFrom ggplot2 element_text position_dodge
#' @importFrom cowplot get_plot_component plot_grid
#' @export
make_fig_14 <- function(df,
                        arm_var = "TRT01A",
                        saffl_var = "SAFFL",
                        visit_var = "AVISIT",
                        paramcd_val = "SYSBP",
                        add_cond = NULL,
                        x_lab = "",
                        y_lab = NULL,
                        yticks = NA,
                        ggtheme = NULL,
                        add_table = TRUE,
                        annotations = NULL) {
  stopifnot(is.data.frame(df))
  stopifnot(all(c(arm_var, saffl_var, visit_var, "AVAL", "PARAMCD") %in% names(df)))

  df <- df |>
    dplyr::filter(
      .data[[saffl_var]] == "Y",
      PARAMCD == paramcd_val,
      !is.na(AVAL)
    )

  if (!is.null(add_cond)) {
    df <- df |> dplyr::filter(!!rlang::parse_expr(add_cond))
  }

  if (is.null(y_lab)) {
    y_param <- unique(df$PARAM)
    y_avalu <- unique(df$AVALU)
    y_lab <- paste0("Mean Value (95% CI)", "\n", y_param, " (", y_avalu, ")")
  }

  df_sum <- df |>
    dplyr::group_by(.data[[arm_var]], .data[[visit_var]], .drop = TRUE) |>
    dplyr::summarise(
      mean = mean(AVAL, na.rm = TRUE),
      sd = sd(AVAL, na.rm = TRUE),
      n = dplyr::n(),
      .groups = "drop"
    ) |>
    dplyr::mutate(
      se = sd / sqrt(n),
      lower_ci = mean - qt(1 - (0.05 / 2), n - 1) * se,
      upper_ci = mean + qt(1 - (0.05 / 2), n - 1) * se
    )

  g <- ggplot2::ggplot(
    data = df_sum,
    ggplot2::aes(
      x = .data[[visit_var]],
      y = mean,
      group = .data[[arm_var]],
      color = .data[[arm_var]]
    )
  ) +
    ggplot2::geom_point(position = ggplot2::position_dodge(width = 0.5)) +
    ggplot2::geom_line(position = ggplot2::position_dodge(width = 0.5)) +
    ggplot2::geom_errorbar(
      ggplot2::aes(ymin = lower_ci, ymax = upper_ci),
      position = ggplot2::position_dodge(width = 0.5)
    ) +
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

  if (any(!is.na(yticks))) {
    g <- g + ggplot2::scale_y_continuous(breaks = yticks, limits = c(min(yticks), max(yticks)))
  }

  if (!is.null(ggtheme)) g <- g + ggtheme

  if (add_table) {
    legend_pos <- paste0("guide-box-", ifelse(is.null(ggtheme), "bottom", ggtheme$legend.position))
    g_legend <- cowplot::get_plot_component(g, legend_pos, return_all = TRUE)

    g <- g + ggplot2::theme(legend.position = "none")

    tbl_n <- df_sum |>
      dplyr::mutate(meanr = sprintf("%.1f", mean)) |>
      dplyr::arrange(desc(.data[[arm_var]]))

    g_tbl1 <- ggplot2::ggplot(tbl_n, ggplot2::aes(x = .data[[visit_var]], y = .data[[arm_var]])) +
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank(),
        axis.title.y = ggplot2::element_blank(),
        axis.ticks.x = ggplot2::element_blank(),
        axis.ticks.y = ggplot2::element_blank(),
        panel.background = ggplot2::element_blank(),
        axis.text.x = ggplot2::element_blank(),
        panel.border = ggplot2::element_rect(color = "black", fill = NA, linewidth = 0.5),
        plot.margin = ggplot2::unit(c(0.1, 0.05, 0, 0.025), "npc"),
        plot.title = ggplot2::element_text(size = 10)
      ) +
      ggplot2::labs(title = "Mean Value")

    for (i in seq_len(nrow(tbl_n))) {
      g_tbl1 <- g_tbl1 +
        ggplot2::annotate(
          "text",
          label = as.character(tbl_n$meanr[i]),
          x = tbl_n[[visit_var]][i], y = tbl_n[[arm_var]][i]
        )
    }

    g_tbl2 <- ggplot2::ggplot(tbl_n, ggplot2::aes(x = .data[[visit_var]], y = .data[[arm_var]])) +
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank(),
        axis.title.y = ggplot2::element_blank(),
        axis.ticks.x = ggplot2::element_blank(),
        axis.ticks.y = ggplot2::element_blank(),
        panel.background = ggplot2::element_blank(),
        axis.text.x = ggplot2::element_blank(),
        panel.border = ggplot2::element_rect(color = "black", fill = NA, linewidth = 0.2),
        plot.margin = ggplot2::unit(c(0.1, 0.05, 0, 0.025), "npc"),
        plot.title = ggplot2::element_text(size = 10)
      ) +
      ggplot2::labs(title = "Number of Patients with Data")

    for (i in seq_len(nrow(tbl_n))) {
      g_tbl2 <- g_tbl2 +
        ggplot2::annotate(
          "text",
          label = as.character(tbl_n$n[i]),
          x = tbl_n[[visit_var]][i], y = tbl_n[[arm_var]][i]
        )
    }

    cowplot::plot_grid(
      g, g_tbl1, g_tbl2, g_legend,
      align = "v", axis = "l", ncol = 1,
      rel_heights = c(0.60, 0.15, 0.15, 0.1)
    )
  } else {
    g
  }
}
