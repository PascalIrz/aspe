#' Produire un graphique de synthèse de la dynamique d'une population sur une localité
#'
#' Représentation pour une espèce sur une station ou un point de prélèvement.
#'
#' @param df Dataframe contenant les données, avec les variables permettant d'identifier l'espèce et
#'     la station/point, ainsi que "mei_taille", "mois" et "annee".
#' @param var_id_espece Variable servant à identifier les espèces.
#' @param var_id_station Variable servant à identifier les stations ou points.
#' @param espece_sel Caractère. Espèce sélectionnée.
#' @param station_sel Caractère. Point ou station sélectionné.
#' @param seuil Numérique entre 0 et 1. Seuil de pourcentile pour exclure des histogrammes les rares
#'     individus de longueur extrême. Par défaut fixé à 0 donc toutes les observations sont conservées.
#'     S'il est fixé à 0.01, les 1% des longueurs les plus élevées sont exclus des histogrammes. Ces
#'     individus sont en revanche conservés sur les autres graphiques.
#' @param graph_long_mediane Booléen. Afficher le diagramme des longueurs médianes ? Par défaut TRUE.
#' @param graph_effectif Booléen. Afficher le diagramme des longueurs effectifs ? Par défaut TRUE.
#' @param graph_mois Booléen. Afficher le diagramme du mois de prospection ? Par défaut TRUE.
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
#' # chargement packages
#' library(tidyverse)
#' library(aspe)
#'
#' # chargement données
#' load("raw_data/aspe_mei.RData") # mesures individuelles
#' load("raw_data/aspe_sauf_mei.RData") # autres tables
#'
#' # assemblage du dataframe
#' data <- mef_creer_passerelle() %>%
#'   mef_ajouter_lots() %>%
#'   mef_ajouter_esp() %>% # pour avoir les noms communs des espèces
#'   mef_ajouter_ope_date() %>% # pour avoir l'année et le mois
#'   mef_ajouter_libelle() %>%
#'   mef_ajouter_mei() %>%
#'   select(pop_libelle,
#'          annee,
#'          ope_date,
#'          esp_nom_commun,
#'          lop_effectif,
#'          mei_taille)
#'
#' # graphique
#' gg_dyn_esp(df = data,
#'                var_id_espece = esp_nom_commun,
#'                var_id_station = pop_libelle,
#'                espece_sel = "Goujon commun",
#'                station_sel = "La Moder à Drusenheim")
#' }
#'
#'
#'
gg_dyn_esp <- function(df,
                       var_id_espece,
                       var_id_station,
                       espece_sel,
                       station_sel = NULL,
                       seuil = 0,
                       graph_long_mediane = TRUE,
                       graph_effectif = TRUE,
                       graph_mois = TRUE)

{
  # gestion évaluation
  var_id_espece <- enquo(var_id_espece)
  var_id_station <- enquo(var_id_station)

  # Sélection des données
  data_pop <- df %>%
    filter(!!var_id_espece == espece_sel &
             mei_taille > 0) %>%
    mutate(mois = month(ope_date))

  if (!is.null(station_sel))
  {
    data_pop <- data_pop %>%
      filter(!!var_id_station == station_sel)
  }

  # stats pour produire les graphiques
  stats <- data_pop %>%
    group_by(annee) %>%
    summarise(
      mediane = median(mei_taille),
      effectif = n(),
      mois = max(mois)
    )

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
    labs(
      x = "Longueur (mm)",
      y = "Effectif",
      title = paste(espece_sel,
                    station_sel,
                    sep = " - ")
    )

  # graphique longueur médiane

  if (graph_long_mediane)
  {
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
  }

  # graphique effectifs

  if (graph_effectif)
  {
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
  }

  # graphique mois d'échantillonnage

  if (graph_mois)
  {
    g4 <- ggplot(data = stats,
                 aes(x = annee)) +
      geom_bar(aes(y = mois),
               fill = "darkgreen",
               stat = "identity") +
      labs(x = "",
           y = "Mois") +
      scale_y_continuous(
        labels = c(3, 6, 9),
        breaks = c(3, 6, 9),
        guide = guide_axis(n.dodge = 2)
      ) +
      theme(axis.text.y = element_text(angle = 90,
                                       hjust = 0.5),
            axis.title = element_text(size = 10)) +
      coord_flip()
  }

  # assemblage des graphiques, selon le choix de ceux à afficher
  if (graph_long_mediane &
      graph_effectif &
      graph_mois)
    g <- ggarrange(g1, g2, g3, g4, nrow = 1, widths = c(4, 1, 1, 1))
  if (graph_long_mediane &
      graph_effectif &
      !graph_mois)
    g <- ggarrange(g1, g2, g3, nrow = 1, widths = c(4, 1, 1))
  if (graph_long_mediane &
      !graph_effectif &
      graph_mois)
    g <- ggarrange(g1, g2, g4, nrow = 1, widths = c(4, 1, 1))
  if (!graph_long_mediane &
      graph_effectif &
      graph_mois)
    g <- ggarrange(g1, g3, g4, nrow = 1, widths = c(4, 1, 1))
  if (graph_long_mediane &
      !graph_effectif &
      !graph_mois)
    g <- ggarrange(g1, g2, nrow = 1, widths = c(4, 1))
  if (!graph_long_mediane &
      graph_effectif &
      !graph_mois)
    g <- ggarrange(g1, g3, nrow = 1, widths = c(4, 1))
  if (!graph_long_mediane &
      !graph_effectif &
      graph_mois)
    g <- ggarrange(g1, g4, nrow = 1, widths = c(4, 1))
  if (!graph_long_mediane & !graph_effectif & !graph_mois)
    g <- g1

  g
}

