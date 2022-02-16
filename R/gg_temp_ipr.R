#' Graphique de la série chronologique des IPR
#'
#' La fonction utilise le référentiel "classe_ipr" de la base Aspe qui doit donc être
#'     chargé auparavant et complété par les codes couleurs avec ipr_completer_classes_couleur().
#'
#' @param df_ipr Dataframe contenant les données IPR. Il doit contenir des variables "ipr"
#'     et "annee" ainsi qu'une variable permettant d'identifier la station ou le point de
#'     prélèvement.
#' @param var_id_sta Nom de la variable servant à identifier les stations ou points.
#'     Cette variable donnera les étiquettes du graphique.
#' @param var_ipr Nom de la variable contenant les valeurs IPR.
#' @param station_sel Vecteur caractère indiquant les points ou stations à sélectionner.
#' @param sup_500m Booléen. Indique si les stations sont situées à des altitudes inférieures
#'     (sup_500m = FALSE, par défaut) ou bien supérieures à 500m car les seuils de classe
#'     se qualité varient selon l'altitude. Comme ce paramètre est unique pour l'ensemble des
#'     stations (ou points) représentées, il importe de s'assurer qu'elles sont toutes soit
#'     au-dessus, soit en-dessous de 500m.
#' @param nb_colonnes Entier. Nombre (maxi) de colonnes de graphiques s'il y a plusieurs stations.
#'     Par défaut nb_colonnes = 6.
#' @param max_axe_y Numérique. Limite supérieure de l'axe des ordonnées. Par défaut max_axe_y = 40.
#' @param inv_y Booléen. Indique l'axe des ordonnées pointe vers le bas (TRUE, par défaut) ou
#'     vers le haut.
#' @param annee_facteur Booléen. Indique si la variable annee doit être transformée en facteur.
#'     Parfois utile pour la mise en forme de l'axe des abscisses (années).
#' @param df_classe Dataframe contenant les limites de classes. Exemple : classe_ipr.
#'
#' @return Un graphique ggplot2.
#' @export
#'
#' @importFrom ggplot2 ggplot aes scale_fill_manual scale_y_continuous expansion geom_vline
#' @importFrom ggplot2 geom_line geom_point facet_wrap labs guides guide_legend theme coord_cartesian
#' @importFrom dplyr enquo filter
#' @importFrom stringr str_wrap
#'
#' @examples
#' \dontrun{
#' classe_ipr <- classe_ipr %>%
#'   ipr_completer_classes_couleur()
#'
#' ipr_data %>%
#'   gg_temp_ipr(var_id_sta = pop_libelle,
#'               var_ipr = ipr,
#'               station_sel = mes_pops,
#'               nb_colonnes = 4,
#'               max_axe_y = 60,
#'               inv_y = FALSE)
#' }
gg_temp_ipr <- function(df_ipr,
                           var_id_sta,
                           var_ipr,
                           station_sel = NA,
                           sup_500m = FALSE,
                           nb_colonnes = 6,
                           max_axe_y = 40,
                           inv_y = TRUE,
                           annee_facteur = FALSE,
                           df_classes = classe_ipr)

{
  # sélection des données
  var_id_sta <- enquo(var_id_sta)
  var_ipr <- enquo(var_ipr)

  if(!is.na(station_sel))
  {
    df_ipr <- df_ipr %>%
      filter(!!var_id_sta %in% station_sel)
  }

  # gestion de l'évaluation non standard en passant par création d'une variable. Pas trouvé mieux.
  # sinon bug avec le facet_wrap()
  df_ipr <- df_ipr %>%
    mutate(var_id = str_wrap(!!var_id_sta, 25), # au cas où intitulés trop longs
           var_id = as.factor(var_id))

  # année en facteur ?
  if(annee_facteur)
  {
    df_ipr <- df_ipr %>%
      mutate(annee = as.factor(annee))
  }

  # référentiel des classes (on remplace nes NA par des zéros)
  # df_classes <- classe_ipr %>%
  #   replace(is.na(.), 0)
  #
  # if(sup_500m) {
  #   df_classes <- df_classes %>%
  #     filter(cli_altitude_max != 500)
  # } else {
  #   df_classes <- df_classes %>%
  #     filter(cli_altitude_min != 500)
  # }

  df_classes <- df_classes %>%
    gg_gerer_seuils_classes_ipr_int(metriques = FALSE,
                                    sup_500m = sup_500m)

  plot_ipr_station <- ggplot(data = df_ipr) %>%
    gg_ajouter_arriere_plan_int(df_classes = df_classes) +
    # notes IPR
    geom_line(aes(x = annee,
                  y = !!var_ipr),
              show.legend = F,
              lty = 2) +
    geom_point(aes(x = annee,
                   y = !!var_ipr),
               size = 2.5,
               pch = 21,
               fill = "grey70") +
    # treillis
    facet_wrap(~var_id,
               ncol = nb_colonnes) +
    # mise en forme
    labs(title = "Evolution de l'indice IPR",
         x = "",
         y = "Indice Poisson Rivi\u00e8re") +
    guides(fill = guide_legend(title = "Classe IPR",
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
