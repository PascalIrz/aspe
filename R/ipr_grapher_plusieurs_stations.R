#' Produire un graphique en treilis de l'évolution de l'IPR sur un jeu de stations.
#'
#' @param ipr_df Dataframe contenant les données, issu de la fonction extraire_ipr().
#' @param titre Caractère. Titre du graphique.
#' @param palette Vecteur nommé de couleurs, contenant 5 éléments pour chacune des
#'     classes IPR. Par défaut, une palette est fournie.
#' @param nb_colonnes Nombre entier. Nombre de colonnes dans la sortie graphique.
#' @param max_axe_y Numérique. Valeur maximale de l'axe des ordonnées (IPR = 40 par défaut).
#'     Ce paramètre peut être intéressant pour éviter que quelques valeurs très élevées
#'     nuisent à la lisibilité du graphique.
#'
#' @return Le graphique issu de ggplot2.
#' @export
#'
#' @importFrom scales number_format
#' @importFrom ggplot2 aes facet_wrap geom_bar ggplot labs scale_fill_manual
#' @importFrom ggplot2 scale_x_continuous theme coord_cartesian element_text
#'
#' @examples
#' \dontrun{
#' ipr_grapher_plusieurs_stations(ipr_df = data_56,
#' nb_mini_annees = 3,
#' titre = "Morbihan")
#' }
ipr_grapher_plusieurs_stations <- function(ipr_df,
                                           titre = NA, palette = NA,
                                           nb_colonnes = 3, max_axe_y = 40)
{

  # -----------------------------------------------------------
  # Palette de couleurs
  # -----------------------------------------------------------
  if (is.na(palette)) {

    palette <- c("Excellent" = "darkblue",
                 "Bon" = "darkgreen",
                 "M\\u00e9diocre" = "yellow",
                 "Mauvais" = "orange",
                 "Tr\\u00e8s mauvais" = "red")

  }

  premiere_annee <- min(ipr_df$annee)
  derniere_annee <- max(ipr_df$annee)

  # -----------------------------------------------------------
  # Production du graphique
  # -----------------------------------------------------------
  ggplot(data = ipr_df,
         aes(x = annee, y = ipr, fill = cli_libelle)) +
    geom_bar(stat = "identity") +
    labs(x = "Ann\u00e9e",
         y = "IPR",
         title = titre,
         fill = "Classe IPR") +
    scale_fill_manual(values = palette) +
    facet_wrap(~str_wrap(pop_libelle, 30), # pour le cas des stations à libellé trop long
               ncol = nb_colonnes,
               scales = 'free_x') +
    scale_x_continuous(labels = scales::number_format(accuracy = 1, big.mark = ''),
                       breaks = seq(premiere_annee, derniere_annee, 2),
                       limits = c(premiere_annee - 0.5, derniere_annee + 0.5)) +
    coord_cartesian(ylim = c(0, max_axe_y)) +
    theme(legend.position = "bottom",
          strip.text.x = element_text(size = 8))

}
