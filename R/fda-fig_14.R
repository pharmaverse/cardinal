#' Figure 14. Mean and 95% Confidence Interval of Systolic Blood Pressure Over Time
#' by Treatment Arm, Safety Population, Trial X
#'
#' @details
#' * `df` must contain the variables `AVAL`, `PARAMCD`, `AVISITN`, `AVISIT`,
#'   and the variables specified by `arm_var`, `id_var`, `saffl_var`, and `add_cond`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * Records with missing treatment start and/or end datetime are excluded from all calculations.
#'
#' @inheritParams argument_convention
#' @param add_table (`flag`)\cr whether "Number of Patients" table should be printed under the plot.
#' @param add_cond (`expr`)\cr expression that provide additional filters for the analysis
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
#' fig <- make_fig_14(df = advs)
#' fig
#'
#' @export
make_fig_14 <- function(df,
                        arm_var = "ARM",
                        id_var = "USUBJID",
                        saffl_var = "SAFFL",
                        paramcd_val,
                        add_cond = NULL,
                        x_lab = "",
                        y_lab = "Systolic Blood Pressure (Pa)",
                        yticks = NA,
                        add_table = TRUE,
                        annotations = NULL){
  checkmate::assert_subset(c(arm_var, id_var, saffl_var), names(df))
  assert_flag_variables(df, saffl_var)

  df <- df %>%
    as_tibble() %>%
    filter(
      .data[[saffl_var]] == "Y",
      PARAMCD == {{paramcd_val}}
    ) %>%
    df_explicit_na()

  if (!(is.null({{add_cond}}))) {
    df <- df %>%
      filter(!!rlang::parse_expr(add_cond))
  }

  df <- df %>%
    group_by(!!rlang::sym(arm_var), AVISIT, AVISITN, .drop = TRUE) %>%
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
        x = AVISITN,
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
      width = 1.5,
      position = position_dodge(width = 0.5)
    ) +
    labs(
      title = annotations[["title"]],
      subtitle = annotations[["subtitle"]],
      caption = annotations[["caption"]],
      x = x_lab,
      y = y_lab
    ) +
    theme_bw() +
    theme(
      legend.position = "bottom",
      legend.title = element_blank(),
      plot.margin = unit(c(0.05, 0.05, 0, 0.025), "npc"),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      axis.line.x = element_line(),
      axis.line.y = element_line(),
      panel.border = element_blank(),
      panel.background = element_blank()
    ) +
    scale_x_continuous(breaks = df$AVISITN, labels = df$AVISIT)

  if (any(!is.na(yticks))) {
    g <- g +
      scale_y_continuous(
        breaks = yticks,
        limits = c(
          min(yticks),
          max(yticks)
        )
      )
  }

  if (add_table) {
    g_legend <- cowplot::get_legend(g)
    g <- g + theme(legend.position = "none")

    xtick_lbls <- ggplot_build(g)$layout$panel_params[[1]]$x$breaks
    xtick_lbls <- xtick_lbls[!is.na(xtick_lbls)]
    xlims <- ggplot_build(g)$layout$panel_params[[1]]$x$limits

    tbl_n <- expand.grid(
      x = xtick_lbls,
      arm = rev(levels(df[[arm_var]])),
      # arm = df$n,
      n = 0
    )

    # g_tbl1 <- ggplot(tbl_n, aes(x = x, y = arm)) +
    #   theme(
    #     axis.title.x = element_blank(),
    #     axis.title.y = element_blank(),
    #     axis.ticks.x = element_blank(),
    #     axis.ticks.y = element_blank(),
    #     panel.background = element_blank(),
    #     axis.text.x = element_blank(),
    #     panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5),
    #     plot.margin = unit(c(0.1, 0.05, 0, 0.025), "npc")
    #   ) +
    #   labs(title = "Number of Patients with Data") +
    #   scale_x_continuous(breaks = xtick_lbls, limits = c(min(xlims, xtick_lbls), max(xlims, xtick_lbls)))
    #
    # for (i in seq_len(nrow(tbl_n))) {
    #   tbl_n$n[i] <- (tbl_n$mean[i])
    #   g_tbl1 <- g_tbl1 +
    #     annotate("text", label = as.character(tbl_n$n[i]), x = tbl_n$x[i], y = tbl_n$arm[i])
    # }


    g_tbl2 <- ggplot(tbl_n, aes(x = x, y = arm)) +
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
      labs(title = "Number of Patients with Data") +
      scale_x_continuous(breaks = xtick_lbls, limits = c(min(xlims, xtick_lbls), max(xlims, xtick_lbls)))

    for (i in seq_len(nrow(tbl_n))) {
      tbl_n$n[i] <- sum(df$ARM == tbl_n$arm[i])
      g_tbl2 <- g_tbl2 +
        annotate("text", label = as.character(tbl_n$n[i]), x = tbl_n$x[i], y = tbl_n$arm[i])
    }

    cowplot::plot_grid(
      g,
      # g_tbl1,
      g_tbl2,
      g_tbl2,
      g_legend,
      align = "v",
      axis = "l",
      ncol = 1,
      rel_heights = c(0.70, 0.13, 0.13, 0.04)
    )
  } else {
    g
  }

  # return(df)
  return(tbl_n)
}

advs <- random.cdisc.data::cadvs

advs <- advs %>%
  mutate(
    AVISIT = case_when(
      AVISIT == "BASELINE" ~ "Baseline",
      AVISIT == "WEEK 1 DAY 8" ~ "Week 2",
      AVISIT == "WEEK 2 DAY 15" ~ "Week 3",
      AVISIT == "WEEK 3 DAY 22" ~ "Week 5",
      AVISIT == "WEEK 4 DAY 29" ~ "Week 10",
      AVISIT == "WEEK 5 DAY 36" ~ "Week 12"
    ),
    AVISITN = case_when(
      AVISITN == 0 ~ 0,
      AVISITN == 1 ~ 2,
      AVISITN == 2 ~ 3,
      AVISITN == 3 ~ 5,
      AVISITN == 4 ~ 10,
      AVISITN == 5 ~ 12
    )
  )

fig <- make_fig_14(
  df = advs,
  paramcd_val = "SYSBP",
  add_cond = expr("ONTRTFL == 'Y' | ABLFL == 'Y'"),
  add_table = TRUE
)
fig
