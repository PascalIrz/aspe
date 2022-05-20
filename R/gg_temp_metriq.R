#' Graphique de la série chronologique des IPR
#'
#' La fonction utilise les référentiel "classe_ipr" et "classe_ipr_plus" de la base Aspe qui doivent
#'     donc être chargés auparavant et complétés par les codes couleurs avec ipr_completer_classes_couleur().
#'
#' @param df_metriques Dataframe contenant les données IPR. Il doit contenir des variables "ipr"
#'     et "annee" ainsi qu'une variable permettant d'identifier la station ou le point de
#'     prélèvement.
#' @param var_id_sta Variable servant à identifier les stations ou points.
#'     Cette variable donnera les étiquettes du graphique.
#' @param var_nom_metrique Variable contenant les noms des métriques (ex : dio, dti).
#' @param var_valeur_metrique Variable numérique contenant les valeurs des métriques.
#' @param station_sel Vecteur caractère indiquant les points ou stations à sélectionner.
#' @param sup_500m Booléen. Indique si les stations sont situées à des altitudes inférieures
#'     (sup_500m = FALSE, par défaut) ou bien supérieures à 500m car les seuils de classe
#'     se qualité varient selon l'altitude. Comme ce paramètre est unique pour l'ensemble des
#'     stations (ou points) représentées, il importe de s'assurer qu'elles sont toutes soit
#'     au-dessus, soit en-dessous de 500m.
#' @param nb_colonnes Entier. Nombre (maxi) de colonnes de graphiques s'il y a plusieurs stations.
#'     Par défaut nb_colonnes = 5.
#' @param max_axe_y Numérique. Limite supérieure de l'axe des ordonnées. Par défaut max_axe_y = 40.
#' @param inv_y Booléen. Indique l'axe des ordonnées pointe vers le bas (TRUE, par défaut) ou
#'     vers le haut. NB pour l'IPR, plus l'indice est faible plus la qualité est élevée.
#'     C'est l'inverse pour l'IPR+.
#' @param annee_facteur Booléen. Indique si la variable annee doit être transformée en facteur.
#'     Parfois utile pour la mise en forme de l'axe des abscisses (années).
#' @param type_graphique Caractère. Peut prendre les valeurs "courbes" ou "barres" selon le type
#'     de graphique souhaité.
#' @param df_classes Dataframe contenant les limites de classes. Exemple : classe_ipr.
#'
#' @return Un graphique ggplot2.
#' @export
#'
#' @importFrom ggplot2 ggplot aes scale_fill_manual scale_y_continuous expansion geom_vline coord_cartesian
#' @importFrom ggplot2 geom_line geom_bar facet_wrap labs guides guide_legend theme geom_rect geom_point
#' @importFrom dplyr enquo filter
#' @importFrom stringr str_wrap
#'
#' @examples
#' \dontrun{
#' classe_ipr <- classe_ipr %>%
#'   ipr_completer_classes_couleur()
#'
#' ipr_data %>%
#'   gg_temp_metriq(var_id_sta = pop_libelle,
#'                  station_sel = mes_pops,
#'                  var_nom_metrique = metrique,
#'                  var_valeur_metrique = valeur,
#'                  nb_colonnes = 4,
#'                  max_axe_y = 15,
#'                  inv_y = FALSE,
#'                  type_graphique = "barres",
#'                  df_classes = classe_ipr)
#' }
gg_temp_metriq <- function(df_metriques,
                           var_id_sta,
                           var_nom_metrique,
                           var_valeur_metrique,
                           station_sel = NA,
                           sup_500m = FALSE,
                           nb_colonnes = 5,
                           max_axe_y = 10,
                           inv_y = TRUE,
                           annee_facteur = FALSE,
                           type_graphique = "courbes",
                           df_classes = classe_ipr)

{
  # sélection des données
  var_id_sta <- enquo(var_id_sta)
  var_nom_metrique <- enquo(var_nom_metrique)
  var_valeur_metrique <- enquo(var_valeur_metrique)

  if(!is.na(station_sel))
  {
    df_metriques <- df_metriques %>%
      filter(!!var_id_sta %in% station_sel)
  }

  # gestion de l'évaluation non standard en passant par création d'une variable. Pas trouvé mieux
  df_metriques <- df_metriques %>%
    mutate(var_id = str_wrap(!!var_id_sta, 25), # au cas où intitulés trop longs
           var_id = as.factor(var_id))

  # année en facteur ?
  if(annee_facteur)
  {
    df_metriques <- df_metriques %>%
      mutate(annee = as.factor(annee))
  }

  # gestion des seuils de classes de qualité
  df_classes <- df_classes %>%
    gg_gerer_seuils_classes_ipr_int(metriques = TRUE,
                                    sup_500m = sup_500m)

  # graphique
  plot_ipr_station <- ggplot(data = df_metriques) %>%
    gg_ajouter_arriere_plan_int(df_classes = df_classes)

    # métriques IPR
  if(type_graphique == "barres")

  {
    plot_ipr_station <- plot_ipr_station +
      geom_bar(
        data = df_metriques,
        aes(
          x = annee,
          y = !!var_valeur_metrique,
          col = !!var_nom_metrique
        ),
        stat = "identity",
        position = "dodge2",
        size = 2
    )

  }

  if(type_graphique == "courbes")

  {
    plot_ipr_station <- plot_ipr_station +
      geom_line(
        data = df_metriques,
        aes(
          x = annee,
          y = !!var_valeur_metrique,
          col = !!var_nom_metrique,
          group = !!var_nom_metrique
        ), size = 1
      ) +
      geom_point(
        data = df_metriques,
        aes(
          x = annee,
          y = !!var_valeur_metrique,
          col = !!var_nom_metrique,
          group = !!var_nom_metrique
        ),
        size = 2,
        shape = 16
      )

  }
  #  treillis
  plot_ipr_station <- plot_ipr_station +
    facet_wrap(~var_id,
               ncol = nb_colonnes) +
    # mise en forme
    labs(title = "Evolution des m\u00e9triques IPR",
         x = "",
         y = "") +
    guides(fill = guide_legend(title = "Classe",
                               override.aes = list(color = df_classes$classe_couleur,
                                                   fill = df_classes$classe_couleur,
                                                   shape = 15,
                                                   alpha = 0.6))) +
    theme(legend.position = "bottom",
          strip.text.x = element_text(size = 8),
          axis.text.x = element_text(angle = 45, hjust = 1))

  # orientation de l'axe des IPR selon l'argument inv_y
  if(inv_y) {

    plot_ipr_station <- plot_ipr_station +
      coord_cartesian(ylim = c(max_axe_y, 0))
  } else {
    plot_ipr_station <- plot_ipr_station +
      coord_cartesian(ylim = c(0, max_axe_y))
  }

  plot_ipr_station
}
