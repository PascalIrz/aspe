#' Produire un graphique de synthèse de la dynamique d'une population
#'
#' Représentation pour une espèce sur un point de prélèvement.
#'
#' @param df Dataframe contenant les données, avec les variables "pop_id", "pop_libelle",
#'     esp_nom_commun", "mei_taille" et "annee".
#' @param libelle_point Caractère. Nom du point dans le champ "pop_libelle".
#' @param nom_espece Caractère. Nom de l'espèce dans le champ "esp_nom_commun".
#' @param seuil Numérique entre 0 et 1. Seuil de pourcentile pour exclure des histogrammes les rares
#'     individus de longueur extrême. Par défaut fixé à 0 donc toutes les observations sont conservées.
#'     S'il est fixé à 0.01, les 1% des longueurs les plus élevées sont exclus des histogrammes. Ces
#'     individus sont en revanche conservés sur les autres graphiques.
#'
#' @return Le graphique ggplot2 avec les distributions en taille par année et l'évolution
#'     temporelle de la longueur médiane et des effectifs capturés.
#' @export
#'
#' @importFrom dplyr filter group_by summarise
#' @importFrom ggplot2 ggplot aes geom_histogram facet_wrap geom_vline theme element_text
#' @importFrom ggplot2 element_blank labs geom_line scale_x_continuous coord_flip guide_axis
#' @importFrom ggpubr ggarrange
#' @importFrom stats median quantile
#' @importFrom lubridate month
#'
#' @examples
#' \dontrun{
#' gg_dyn_esp_pop(df = data,
#'                libelle_point = "DROME A CHABRILLAN ",
#'                esp_nom = "Barbeau fluviatile")
#' }
gg_dyn_esp_pop <- function(df, libelle_point, nom_espece, seuil = 0)

{
  # Sélection des données
  data_pop <- df %>%
    filter(pop_libelle == libelle_point &
           esp_nom_commun == nom_espece &
           mei_taille > 0) %>%
    mutate(mois = month(ope_date))

  # stats pour produire les graphiques
  stats <- data_pop %>%
    group_by(annee) %>%
    summarise(mediane = median(mei_taille),
              effectif = n(),
              mois = max(mois))

  # code espèce 3 lettres correspondant au nom commun
  esp_code <- ref_espece %>%
    filter(esp_nom_commun == nom_espece) %>%
    pull(esp_code_alternatif)

  # seuil pour exclure les tailles extremes
  seuil <- quantile(data_pop$mei_taille,
                    probs = (1 - seuil))

  # histogramme treillis par année
  g1 <- ggplot(data = data_pop %>%
                 filter(mei_taille <= seuil),
               aes(x = mei_taille)) +
    geom_histogram() +
    facet_wrap(
      ~ annee,
      ncol = 1,
      strip.position = "left",
      as.table = FALSE
    ) +
    geom_vline(data = stats,
               aes(xintercept = mediane,
                   col = "red")) +
    theme(
      legend.position = "none",
      plot.title = element_text(size = 10),
      axis.text.y = element_blank(),
      axis.ticks.y = element_blank(),
      strip.text.y.left = element_text(size = 7,
                                  angle = 0)
    ) +
    labs(x = "Longueur (mm)",
         y = "Effectif",
         title = paste(nom_espece,
                       libelle_point,
                       sep = " - "))

  # graphique longueur médiane
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

  # graphique effectifs
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
          axis.title = element_text(size = 10)) +
    coord_flip()

  # graphique mois d'échantillonnage
  g4 <- ggplot(data = stats,
               aes(x = annee)) +
    geom_bar(aes(y = mois),
             fill = "darkgreen",
             stat = "identity") +
    labs(x = "",
         y = "Mois") +
    scale_y_continuous(labels = c(3, 6, 9),
                       breaks = c(3, 6, 9),
                       guide = guide_axis(n.dodge = 2)) +
    theme(axis.text.y = element_text(angle = 90,
                                     hjust = 0.5),
          axis.title = element_text(size = 10)) +
    coord_flip()


  # assemblage des graphiques
  ggarrange(g1, g2, g3, g4,
            nrow = 1,
            widths = c(4, 1, 1, 1))

}
