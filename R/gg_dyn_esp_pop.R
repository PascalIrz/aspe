#' Produire un graphique de synthèse de la dynamique d'une population
#'
#' Représentation pour une espèce sur un point de prélèvement.
#'
#' @param df Dataframe contenant les données, avec les variables "pop_id", "pop_libelle",
#'     esp_nom_commun", "mei_taille" et "annee".
#' @param point Caractère. Nom du point dans le champ "pop_libelle".
#' @param espece Caractère. Nom de l'espèce dans le champ "esp_nom_commun".
#'
#' @return Le graphique ggplot2 avec les distributions en taille par année et l'évolution
#'     temporelle de la longueur médiane et des effectifs capturés.
#' @export
#'
#' @importFrom dplyr filter group_by summarise
#' @importFrom ggplot2 ggplot aes geom_histogram facet_wrap geom_vline theme element_text
#' @importFrom ggplot2 element_blank labs geom_line scale_x_continuous coord_flip guide_axis
#' @importFrom ggpubr ggarrange
#' @importFrom stats median
#'
#' @examples
#' \dontrun{
#' gg_dyn_esp_pop(df = data,
#'                point = "DROME A CHABRILLAN ",
#'                espece = "Barbeau fluviatile")
#' }
gg_dyn_esp_pop <- function(df, point, espece)

{

  data_pop <- df %>%
    filter(pop_libelle == point) %>%
    filter(esp_nom_commun == espece)

  stats <- data_pop %>%
    group_by(annee) %>%
    summarise(mediane = median(mei_taille),
              effectif = n())

  # gamme_annee <- c(min_annee = min(stats$annee),
  #                  max_annee = max(stats$annee))

  g1 <- ggplot(data = data_pop,
               aes(x = mei_taille)) +
    geom_histogram() +
    facet_wrap(~annee,
               ncol = 1,
               strip.position = "left",
               as.table = FALSE) +
    geom_vline(data = stats,
               aes(xintercept = mediane,
                   col = "red")) +
    theme(legend.position = "none",
          plot.title = element_text(size = 10),
          axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          strip.text.y = element_text(size = 7)) +
    labs(x = "Longueur(mm)",
         y = "Effectif",
         title = paste(espece,
                       point,
                       sep = " - "))


  g2 <- ggplot(data = stats,
               aes(x = annee)) +
    geom_bar(aes(y = mediane),
              fill = "red",
              stat = "identity") +
    labs(x = "",
         y = "Long. med.") +
    scale_y_continuous(guide = guide_axis(n.dodge = 2)) +
    theme(axis.text.y = element_text(angle = 90,
                                     hjust = 0.5),
          axis.title = element_text(size = 10)) +
    coord_flip()


  g3 <- ggplot(data = stats,
               aes(x = annee)) +
    geom_bar(aes(y = effectif),
              fill = "blue",
              stat = "identity") +
    labs(x = "",
         y = "Effectif") +
    scale_y_continuous(guide = guide_axis(n.dodge = 2)) +
    theme(axis.text.y = element_text(angle = 90,
                                     hjust = 0.5),
 #         axis.text.x = element_blank(),
          axis.title = element_text(size = 10)) +
    coord_flip()



  ggarrange(g1, g2, g3,
                    nrow = 1,
                    widths = c(4, 1, 1))

}
