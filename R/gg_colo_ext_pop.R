#' Produire le graphique de la dynamique du peuplement en un point de prélèvement.
#'
#' @param df Le dataframe contenant les données, mises en forme par la fonction mef_colo_ext_pops().
#'
#' @return Le graphique produit avec ggplot2.
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
#' gg_colo_ext_pop(df = colo_ext_ma_station)
#' }
gg_colo_ext_pop <- function(df)

{
  create_graph <- function(i, df) {
    df.i <- filter(df, pop_id == i)

    libelle <- df.i %>%
      pull(pop_libelle) %>%
      na.omit() %>%
      .[1]

    ggplot(
      data = df.i,
      aes(
        x = annee,
        y = esp_code_alternatif,
        size = taille,
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
