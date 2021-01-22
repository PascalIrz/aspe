#' Produire un graphique en treilis de l'évolution de l'IPR sur un jeu de stations.
#'
#' @param ipr_df Dataframe contenant les données, issu de la fonction extraire_ipr().
#' @param stations_id Vecteur caractère contenant les identifiants (sta_id) des stations à
#'     représenter sur le graphique.
#' @param premiere_annee Numérique. Année de début de la période à représenter (incluse).
#'     Par défaut, c'est la première année de donnée sur l'ensemble des stations.
#' @param derniere_annee Numérique. Année de fin de la période à représenter (incluse).
#'     Par défaut, c'est la dernière année de donnée sur l'ensemble des stations.
#' @param titre Caractère. Titre du graphique.
#' @param palette Vecteur nommé de couleurs, contenant 5 éléments pour chacune des
#'     classes IPR. Par défaut, une palette est fournie.
#' @param nb_colonnes Nombre entier. Nombre de colonnes dans la sortie graphique.
#'
#' @return Le graphique issu de ggplot2.
#' @export
#'
#' @importFrom scales number_format
#' @importFrom ggplot2 aes facet_wrap geom_bar ggplot labs scale_fill_manual
#' @importFrom ggplot2 scale_x_continuous scale_y_continuous theme
#'
#' @examples
#' \dontrun{
#' ipr_grapher_plusieurs_stations (ipr_df = data_22,
#' stations_id = NA,
#' premiere_annee = 2010,
#' derniere_annee = NA,
#' titre = "Côtes d'Armor",
#' palette = NA)
#' }
ipr_grapher_plusieurs_stations <- function(ipr_df, stations_id = NA, premiere_annee = NA,
                                           derniere_annee = NA, titre = NA, palette = NA,
                                           nb_colonnes = 3)

{

  if (is.na(palette)) {

    palette <- c("Excellent" = "darkblue",
                 "Bon" = "darkgreen",
                 "Médiocre" = "yellow",
                 "Mauvais" = "orange",
                 "Très mauvais" = "red")
  }

  if (!is.na(stations_id)) ipr_df <- ipr_df %>% filter(sta_id %in% stations_id)

  if (!is.na(premiere_annee))
  {
    ipr_df <- ipr_df %>% filter(annee >= premiere_annee)
  } else{
    premiere_annee <- min(ipr_df$annee, na.rm = T)
  }

  if (!is.na(derniere_annee))
  {
    ipr_df <- ipr_df %>% filter(annee <= derniere_annee)
  } else{
    derniere_annee <- max(ipr_df$annee, na.rm = T)
  }

  ggplot(data = ipr_df,
         aes(x = annee, y = ipr, fill = classe_ipr)) +
    geom_bar(stat = "identity") +
    labs(x = "Année",
         y = "IPR",
         title = titre,
         fill = "Classe IPR") +
    scale_fill_manual(values = palette) +
    facet_wrap(~libelle_station,
               ncol = nb_colonnes,
               scales = 'free') +
    scale_x_continuous(labels = scales::number_format(accuracy = 1, big.mark = ''),
                       breaks = seq(premiere_annee, derniere_annee, 2),
                       limits = c(premiere_annee, derniere_annee)) +
    scale_y_continuous(limits = c(0, 40)) +
    theme(legend.position = "bottom")

}
