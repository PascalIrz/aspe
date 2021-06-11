#' Produire le graphique de la dynamique du peuplement pour chacun des points de prélèvement
#'     du dataframe.
#'
#' @param df Le dataframe contenant les données, mises en forme par la fonction mef_colo_ext_pops().
#'
#' @return Une liste contenant les graphiques produits avec ggplot2.
#' @export
#'
#' @importFrom ggplot2 ggplot aes geom_point labs scale_color_manual guides theme scale_x_continuous
#' @importFrom scales pretty_breaks
#' @importFrom dplyr pull filter
#' @importFrom stats na.omit
#' @importFrom purrr map
#'
#' @examples
#' \dontrun{
#' mes_graphiques <- gg_colo_ext_pops(df = mon_df)
#' mes_graphiques[[1]]
#' }
gg_colo_ext_pops <- function(df)

{
  create_graph <- function(pop, df) {
    df_pop <- df %>%
      filter(pop_id == pop)

    libelle <- df_pop %>%
      pull(pop_libelle) %>%
      na.omit() %>%
      .[1]

    ggplot(
      data = df_pop,
      aes(
        x = annee,
        y = esp_code_alternatif,
        size = diam_point,
        color = col_ext,
        shape = type_point
      )
    ) +
      geom_point() +
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
      guides(shape = FALSE, size = FALSE) +
      theme(legend.position = "bottom") +
      scale_x_continuous(breaks = scales::pretty_breaks())
  }


  graphs <- map(
    .x = df %>% pull(pop_id) %>% unique(),
    .f = create_graph,
    df = df
  )

  if (length(graphs) == 1) {
    graphs[[1]]
  } else {
    graphs
  }


}
