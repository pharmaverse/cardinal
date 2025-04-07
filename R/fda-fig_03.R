#' FDA Figure 3: Time to Adverse Event Leading to Treatment Discontinuation, Safety Population, Trial X
#'
#' @details
#' * `df` must contain the variables specified by `arm_var`, `id_var`, `saffl_var`, `trtsdtm_var`, `trtedtm_var` and
#'   `dcsreas_var`.
#' * Flag variables (i.e. `XXXFL`) are expected to have two levels: `"Y"` (true) and `"N"` (false). Missing values in
#'   flag variables are treated as `"N"`.
#' * It is assumed that every record for a unique patient in `df` has the same treatment start and end datetime.
#' * Values in the "Number at risk" table are the number of patients at risk for each arm with treatment duration equal
#'   to
#'   or greater than the given time (times corresponding to the figure's x-ticks labels).
#' * Values in the "Cumulative Number of Patients with Event" table are the cumulative number of patients given time to
#'   AEs leading to treatment discontinuation for each arm throughout the trial (times corresponding to the figure's
#'   x-ticks labels).
#' * Records with missing treatment start and/or end datetime are excluded from all calculations.
#'
#' @inheritParams argument_convention
#' @param dcsreas_var (`character`)\cr reason for treatment discontinuation variable used to split figure into lines.
#' @param add_table (`flag`)\cr whether tables should be printed under the plot.
#' @param annotations (named `list` of `character`)\cr list of annotations to add to the figure. Valid annotation types
#'   are `title`, `subtitles`, and `caption`. Each name-value pair should use the annotation type as name and the
#'   desired string as value.
#'
#' @return A `ggplot2` object.
#'
#' @examples
#' adsl <- random.cdisc.data::cadsl
#'
#' fig <- make_fig_03(df = adsl, dcsreas_var = "DCSREAS")
#' fig
#'
#' @export
make_fig_03 <- function(df,
                        arm_var = "ARM",
                        id_var = "USUBJID",
                        saffl_var = "SAFFL",
                        trtsdtm_var = "TRTSDTM",
                        trtedtm_var = "TRTEDTM",
                        u_trtdur = "days",
                        dcsreas_var = "DCSREAS",
                        x_lab = paste0("Time from first dose (", u_trtdur, ")"),
                        y_lab = "Cumulative Incidence (%)\nAEs Leading to Treatment\nDiscontinuation",
                        xticks = NA,
                        ggtheme = NULL,
                        add_table = TRUE,
                        annotations = NULL) {
  assert_subset(c(arm_var, id_var, saffl_var, trtsdtm_var, trtedtm_var, dcsreas_var), names(df))
  assert_choice(u_trtdur, c("days", "weeks", "months", "years"))
  assert_flag_variables(df, saffl_var)

  df <- df %>%
    filter(.data[[saffl_var]] == "Y") %>%
    df_explicit_na() %>%
    mutate(
      TRTDUR = lubridate::interval(lubridate::ymd_hms(.data[[trtsdtm_var]]), lubridate::ymd_hms(.data[[trtedtm_var]])),
      TRTDUR = TRTDUR %>% as.numeric(u_trtdur),
      AVALU = u_trtdur,
      STATUS = case_when(.data[[dcsreas_var]] == "ADVERSE EVENT" ~ 1, TRUE ~ 0)
    ) %>%
    filter(!is.na(TRTDUR)) %>%
    select(all_of(c(id_var, arm_var)), TRTDUR, STATUS) %>%
    distinct() %>%
    arrange(desc(TRTDUR))

  max_time <- max(df$TRTDUR)

  fit <- ggsurvfit::survfit2(ggsurvfit::Surv(TRTDUR, STATUS) ~ ARM, data = df)

  survival_plot <- ggsurvfit::ggsurvfit(fit, type = "risk", linetype_aes = TRUE) +
    scale_color_manual(values = c("blue", rep("darkgrey", length(levels(df[[arm_var]])) - 1)))

  g <- survival_plot +
    labs(
      title = annotations[["title"]],
      subtitle = annotations[["subtitles"]],
      caption = annotations[["caption"]],
      x = x_lab,
      y = y_lab
    ) +
    theme(
      legend.position = "bottom",
      legend.title = element_blank(),
      plot.margin = unit(c(0.05, 0.05, 0, 0.025), "npc")
    )

  if (any(!is.na(xticks))) {
    g <- g +
      scale_x_continuous(breaks = xticks, limits = c(min(xticks), max(c(xticks, max_time))))
  }

  if (!is.null(ggtheme)) g <- g + ggtheme

  if (add_table) {
    # following 2 lines replace `g_legend <- cowplot::get_legend(g)` which is currently broken
    legend_pos <- paste0("guide-box-", ifelse(is.null(ggtheme), "bottom", ggtheme$legend.position))
    g_legend <- cowplot::get_plot_component(g, legend_pos, return_all = TRUE)

    g <- g + theme(legend.position = "none")

    xtick_lbls <- ggplot_build(g)$layout$panel_params[[1]]$x$breaks
    xtick_lbls <- xtick_lbls[!is.na(xtick_lbls)]
    xlims <- ggplot_build(g)$layout$panel_params[[1]]$x$limits
    arm_colors <- c(rep("darkgrey", length(levels(df[[arm_var]])) - 1), "blue")

    tbl_n <- expand.grid(
      x = xtick_lbls,
      arm = rev(levels(df[[arm_var]])),
      n = 0
    )

    g_tbl <- ggplot(tbl_n, aes(x = x, y = arm)) +
      suppressWarnings(theme(
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.background = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_text(color = arm_colors),
        panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5),
        plot.margin = unit(c(0.1, 0.05, 0, 0.025), "npc")
      )) +
      labs(title = "Number at risk") +
      scale_x_continuous(breaks = xtick_lbls, limits = c(min(xlims, xtick_lbls), max(xlims, xtick_lbls)))

    for (i in seq_len(nrow(tbl_n))) {
      tbl_n$n[i] <- sum(df$ARM == tbl_n$arm[i] & df$TRTDUR >= tbl_n$x[i])
      colors <- ifelse(tbl_n$arm[i] == levels(df[[arm_var]])[1], "blue", "darkgrey")
      g_tbl <- g_tbl +
        annotate("text", label = as.character(tbl_n$n[i]), x = tbl_n$x[i], y = tbl_n$arm[i], color = colors)
    }

    tbl_n_cum <- expand.grid(
      x = xtick_lbls,
      arm = rev(levels(df[[arm_var]])),
      n = 0
    )

    g_tbl_cum <- ggplot(tbl_n_cum, aes(x = x, y = arm)) +
      suppressWarnings(theme(
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.background = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_text(color = arm_colors),
        panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5),
        plot.margin = unit(c(0.1, 0.05, 0, 0.025), "npc")
      )) +
      labs(title = "Cumulative Number of Patients with Event") +
      scale_x_continuous(breaks = xtick_lbls, limits = c(min(xlims, xtick_lbls), max(xlims, xtick_lbls)))

    for (i in seq_len(nrow(tbl_n_cum))) {
      tbl_n_cum$n[i] <- sum(df$ARM == tbl_n_cum$arm[i] & df$TRTDUR <= tbl_n_cum$x[i] & df$STATUS == 1)
      colors <- ifelse(tbl_n_cum$arm[i] == levels(df[[arm_var]])[1], "blue", "darkgrey")
      g_tbl_cum <- g_tbl_cum +
        annotate("text", label = as.character(tbl_n_cum$n[i]), x = tbl_n_cum$x[i], y = tbl_n_cum$arm[i], color = colors)
    }

    if (!is.null(ggtheme)) {
      g_tbl <- g_tbl + ggtheme
      g_tbl_cum <- g_tbl_cum + ggtheme
    }

    cowplot::plot_grid(
      g,
      g_tbl,
      g_tbl_cum,
      g_legend,
      align = "v",
      axis = "l",
      ncol = 1,
      rel_heights = c(0.75, 0.25, 0.25, 0.1)
    )
  } else {
    g
  }
}
