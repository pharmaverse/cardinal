#' FDA Figure 14: Mean and 95% Confidence Interval of Systolic Blood Pressure Over Time
#' by Treatment Arm, Safety Population, Trial X
#'
#' @details
#' * `df` must contain the variables `AVAL` and `PARAMCD`, and the variables specified by `arm_var`,
#'   `saffl_var`, `visit_var`, and `add_cond`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * It is assumed that `df` contains one unique record per patient.
#'
#' @inheritParams argument_convention
#' @param add_table (`flag`)\cr whether "Mean Value" and "Number of Patients" tables should be printed under the plot
#' @param visit_var (`character`)\cr visit variable to put on the x-axis
#' @param paramcd_val (`character`)\cr value of `PARAMCD` to plot
#' @param add_cond (`expr`)\cr expression that provides additional filters for the analysis
#'   (for instance on `ATPT` or `VSPOS`)
#' @param annotations (named `list` of `character`)\cr list of annotations to add to the figure. Valid annotation types
#'   are `title`, `subtitles`, and `caption`. Each name-value pair should use the annotation type as name and the
#'   desired string as value.
#'
#' @return A `ggplot2` object.
#'
#' @examples
#' advs <- random.cdisc.data::cadvs
#'
#' fig <- make_fig_14(
#'   df = advs,
#'   add_cond = bquote("ONTRTFL == 'Y' | ABLFL == 'Y'"),
#'   add_table = TRUE,
#'   yticks = c(135, 140, 145, 150, 155, 160)
#' )
#' fig
#'
#' @export
make_fig_14 <- function(df,
                        arm_var = "ARM",
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
  checkmate::assert_subset(c(arm_var, saffl_var, visit_var), names(df))
  assert_flag_variables(df, saffl_var)

  df <- df %>%
    as_tibble() %>%
    filter(
      .data[[saffl_var]] == "Y",
      PARAMCD == {{ paramcd_val }},
      !is.na(AVAL)
    ) %>%
    df_explicit_na()

  if (!(is.null({{ add_cond }}))) {
    df <- df %>%
      filter(!!rlang::parse_expr(add_cond))
  }

  if (is.null({{ y_lab }})) {
    y_param <- unique(df$PARAM)
    y_avalu <- unique(df$AVALU)

    y_lab <- paste0("Mean Value (95% CI)", "\n", y_param, " (", y_avalu, ")")
  }

  df <- df %>%
    group_by(!!sym(arm_var), !!sym(visit_var), .drop = TRUE) %>%
    summarise(
      mean = mean(AVAL, na.rm = TRUE),
      sd = sd(AVAL, na.rm = TRUE),
      n = n()
    ) %>%
    mutate(
      se = sd / sqrt(n),
      lower_ci = mean - qt(1 - (0.05 / 2), n - 1) * se,
      upper_ci = mean + qt(1 - (0.05 / 2), n - 1) * se
    ) %>%
    ungroup()

  g <-
    ggplot(
      data = df,
      aes(
        x = !!sym(visit_var),
        y = mean,
        group = .data[[arm_var]],
        color = .data[[arm_var]]
      )
    ) +
    geom_point(position = position_dodge(width = 0.5)) +
    geom_line(position = position_dodge(width = 0.5)) +
    geom_errorbar(
      aes(
        ymin = lower_ci,
        ymax = upper_ci
      ),
      position = position_dodge(width = 0.5)
    ) +
    labs(
      title = annotations[["title"]],
      subtitle = annotations[["subtitle"]],
      caption = annotations[["caption"]],
      x = x_lab,
      y = y_lab
    ) +
    theme(
      legend.position = "bottom",
      legend.title = element_blank(),
      plot.margin = unit(c(0.05, 0.05, 0, 0.025), "npc")
    )

  if (any(!is.na(yticks))) {
    g <- g +
      scale_y_continuous(breaks = yticks, limits = c(min(yticks), max(yticks)))
  }

  if (!is.null(ggtheme)) g <- g + ggtheme

  if (add_table) {
    # following 2 lines replace `g_legend <- cowplot::get_legend(g)` which is currently broken
    legend_pos <- paste0("guide-box-", ifelse(is.null(ggtheme), "bottom", ggtheme$legend.position))
    g_legend <- cowplot::get_plot_component(g, legend_pos, return_all = TRUE)

    g <- g + theme(legend.position = "none")

    tbl_n <- df %>%
      mutate(meanr = sprintf("%.1f", mean)) %>%
      arrange(desc(!!sym(arm_var)))

    g_tbl1 <- ggplot(tbl_n, aes(x = !!sym(visit_var), y = !!sym(arm_var))) +
      theme(
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.background = element_blank(),
        axis.text.x = element_blank(),
        panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5),
        plot.margin = unit(c(0.1, 0.05, 0, 0.025), "npc"),
        plot.title = element_text(size = 10)
      ) +
      labs(title = "Mean Value")

    for (i in seq_len(nrow(tbl_n))) {
      g_tbl1 <- g_tbl1 +
        annotate("text", label = as.character(tbl_n$meanr[i]), x = tbl_n[[visit_var]][i], y = tbl_n[[arm_var]][i])
    }

    g_tbl2 <- ggplot(tbl_n, aes(x = !!sym(visit_var), y = !!sym(arm_var))) +
      theme(
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.background = element_blank(),
        axis.text.x = element_blank(),
        panel.border = element_rect(color = "black", fill = NA, linewidth = 0.2),
        plot.margin = unit(c(0.1, 0.05, 0, 0.025), "npc"),
        plot.title = element_text(size = 10)
      ) +
      labs(title = "Number of Patients with Data")

    for (i in seq_len(nrow(tbl_n))) {
      g_tbl2 <- g_tbl2 +
        annotate("text", label = as.character(tbl_n$n[i]), x = tbl_n[[visit_var]][i], y = tbl_n[[arm_var]][i])
    }

    cowplot::plot_grid(
      g,
      g_tbl1,
      g_tbl2,
      g_legend,
      align = "v",
      axis = "l",
      ncol = 1,
      rel_heights = c(0.60, 0.15, 0.15, 0.1)
    )
  } else {
    g
  }
}
