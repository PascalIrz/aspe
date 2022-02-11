#' Graphique de la série chronologique des IPR
#'
#' La fonction utilise les référentiel "classe_ipr" et "classe_ipe_plus" de la base Aspe qui doivent
#'     donc être chargés auparavant et complétés par les codes couleurs avec ipr_completer_classes_couleur().
#'     Comme
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
#' @param indice Caractère. Peut prendre la valeur "IPR" ou bien "IPR+" selon le jeu de métriques.
#' @param type_graphique Caractère. Peut prendre les valeurs "courbes" ou "barres" selon le type
#'     de graphique souhaité.
#'
#' @return Un graphique ggplot2.
#' @export
#'
#' @importFrom ggplot2 ggplot aes scale_fill_manual scale_y_continuous expansion geom_vline
#' @importFrom ggplot2 geom_line geom_bar facet_wrap labs guides guide_legend theme geom_rect
#' @importFrom dplyr enquo filter
#' @importFrom stringr str_wrap
#'
#' @examples
#' \dontrun{
#' classe_ipr <- classe_ipr %>%
#'   ipr_completer_classes_couleur()
#'
#' ipr_data %>%
#'   gg_ipr_station(var_id_sta = pop_libelle,
#'     station_sel = mes_pops,
#'     nb_colonnes = 4,
#'     max_axe_y = 60,
#'     inv_y = FALSE)
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
                           indice = "IPR",
                           type_graphique = "courbes")

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
  # référentiel des classes (on remplace les NA par des zéros, divise les seuils des classes
  # par le nb de métriques et si IPR applique la distinction au seuil de 500m)
  # if(indice == "IPR")
  # {
  df_classes <- classe_ipr %>%
    replace(is.na(.), 0) %>%
    mutate(classe_borne_inf = cli_borne_inf / 7,
           classe_borne_sup = cli_borne_sup / 7,
           classe_borne_sup = ifelse(cli_classe == 5 & max_axe_y > (99 / 7),
                                     yes = max_axe_y,
                                     no = classe_borne_sup),
           classe_libelle = cli_libelle)

     if(sup_500m) {
       df_classes <- df_classes %>%
         filter(cli_altitude_max != 500)
     } else {
       df_classes <- df_classes %>%
         filter(cli_altitude_min != 500)
     }

  # }

  # if(indice == "IPR+")
  # {
  #   df_classes <- classe_ipr_plus %>%
  #     replace(is.na(.), 0) %>%
  #     mutate(classe_borne_inf = cip_borne_inf / 11,
  #            classe_borne_sup = cip_borne_sup / 11,
  #            classe_libelle = cip_libelle)
  # }
  #
  # if(!indice %in% c("IPR", "IPR+"))
  # {
  #   stop("La valeur de l'argument 'indice' doit \u00eatre soit 'IPR' soit 'IPR+'")
  # }



  # graphique
  plot_ipr_station <-
    df_metriques %>%
    ggplot() +
    # arrière-plan
    geom_rect(data = df_classes,
              aes(ymin = classe_borne_inf,
                  ymax = classe_borne_sup,
                  fill = classe_libelle),
              xmin = -Inf,
              xmax = Inf,
              alpha = 0.3) +
    scale_fill_manual(values = df_classes$classe_couleur) +
    scale_y_continuous(trans = "reverse",
                       expand = expansion(mult = c(0.05, 0.01)))


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
