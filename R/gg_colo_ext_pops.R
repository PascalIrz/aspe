#' Produire le graphique de la dynamique du peuplement pour chacun des points de prélèvement
#'     du dataframe.
#'
#' @param df Le dataframe contenant les données, mises en forme par la fonction \code{\link[=mef_colo_ext_pops]{mef_colo_ext()}}
#' @param interactif Valeur logique définissant le type de graphique produit: statique (FALSE) ou interactif (TRUE)
#' @param largeur,hauteur dimensions des graphiques interactifs
#' @param ... arguments passés à la fonction \code{ggiraph::opts_sizing()}
#'
#' @return Une liste contenant les graphiques produits avec ggplot2.
#' @export
#'
#' @importFrom ggplot2 ggplot aes labs scale_color_manual guides theme scale_x_continuous element_text element_blank
#' @importFrom scales pretty_breaks
#' @importFrom dplyr pull filter rowwise ungroup
#' @importFrom stats na.omit
#' @importFrom purrr map
#' @importFrom ggiraph geom_point_interactive girafe opts_sizing
#'
#' @examples
#' \dontrun{
#' mes_graphiques <- gg_colo_ext_pops(df = mon_df)
#' mes_graphiques[[1]]
#' }
gg_colo_ext_pops <- function(df, interactif = FALSE, largeur = 6, hauteur = 5, ...)

{
  # based on https://stackoverflow.com/a/57086284
  int_breaks <- function(x, n = 5){
    if (length(unique(x)) > 1) {
      pretty(x, n)[round(pretty(x, n), 1) %% 1 == 0]
    } else {
      round(unique(x)) + c(-1, 0, 1)
    }
  }

  int_limits <- function(x) {
    if (length(unique(x)) > 1) {
      range(x)
    } else {
      range(int_breaks(x))
    }
  }

  create_graph <- function(pop, df, interactive) {
    df_pop <- df %>%
      filter(pop_id == pop) %>%
      rowwise() %>%
      mutate(
        hover = shiny::HTML(
          paste0(
            esp_code_alternatif, " (", annee, ")<br>",
            "Effectif: ", effectif
            )
          )
      ) %>%
      ungroup()

    libelle <- df_pop %>%
      pull(pop_libelle) %>%
      na.omit() %>%
      .[1]

    gg <- ggplot(
      data = df_pop,
      aes(
        x = annee,
        y = esp_code_alternatif,
        size = diam_point,
        color = col_ext,
        shape = type_point
      )
    ) +
      geom_point_interactive(
        aes(
          tooltip = hover
        )
        ) +
      labs(
        x = "",
        y = "",
        col = "",
        title = libelle
      ) +
      scale_color_manual(
        values = c(
          "colonisation" = "#00B81F",
          "extinction" = "red",
          "statu quo" = "darkblue"
        ),
        na.value = "grey10"
      ) +
      scale_x_continuous(
        breaks = int_breaks,
        limits = int_limits
      ) +
      guides(shape = FALSE, size = FALSE) +
      theme(
        legend.position = "none",
        axis.text.y = element_text(hjust = 0),
        axis.ticks.y = element_blank(),
        panel.background = element_blank(),
        panel.grid = element_blank()
      )

    if (interactive) {
      girafe(
        ggobj = gg,
        width_svg = largeur,
        height_svg = hauteur,
        options = list(
          opts_sizing(...)
        )
        )
    } else {
      gg
    }
  }


  graphs <- df %>%
    pull(pop_id) %>%
    unique() %>%
    map(
      .f = create_graph,
      df = df,
      interactive = interactif
      ) %>%
    set_names(unique(df$pop_id))

  if (length(graphs) == 1) {
    graphs[[1]]
  } else {
    graphs
  }


}
