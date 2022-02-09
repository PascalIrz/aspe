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
#' @param station_sel Vecteur caractère indiquant les points ou stations à sélectionner.
#' @param sup_500m Booléen. Indique si les stations sont situées à des altitudes inférieures
#'     (sup_500m = FALSE, par défaut) ou bien supérieures à 500m car les seuils de classe
#'     se qualité varient selon l'altitude. Comme ce paramètre est unique pour l'ensemble des
#'     stations (ou points) représentées, il importe de s'assurer qu'elles sont toutes soit
#'     au-dessus, soit en-dessous de 500m.
#' @param nb_colonnes Entier. Nombre (maxi) de colonnes de graphiques s'il y a plusieurs stations.
#'     Par défaut nb_colonnes = 6.
#' @param max_axe_y Numérique. Limite supérieure de l'axe des ordonnées. Par défaut max_axe_y = 40.
#'
#' @return Un graphique ggplot2.
#' @export
#'
#' @importFrom ggplot2 ggplot aes scale_fill_manual scale_y_continuous expansion geom_vline
#' @importFrom ggplot2 geom_line geom_point facet_wrap labs guides guide_legend theme
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
#'     max_axe_y = 60)
#' }
gg_ipr_station <- function(df_ipr,
                           var_id_sta,
                           station_sel,
                           sup_500m = FALSE,
                           nb_colonnes = 6,
                           max_axe_y = 40)

{
  # sélection des données
  var_id_sta <- enquo(var_id_sta)

  data_ipr_sel_station <- df_ipr %>%
    filter(!!var_id_sta %in% station_sel)

  # référentiel des classes (on remplace nes NA par des zéros)
  df_classes <- classe_ipr %>%
    replace(is.na(.), 0)

  if(sup_500m) {
    df_classes <- df_classes %>%
      filter(cli_altitude_max != 500)
  } else {
    df_classes <- df_classes %>%
      filter(cli_altitude_min != 500)
  }

  # graphique
  plot_ipr_station <-
    data_ipr_sel_station %>%
    ggplot() +
    # arrière-plan
    geom_rect(data = df_classes,
              aes(ymin = cli_borne_inf,
                  ymax = cli_borne_sup,
                  fill = cli_libelle),
              xmin = -Inf,
              xmax = Inf,
              alpha = 0.3) +
    scale_fill_manual(values = df_classes$cli_couleur) +
    scale_y_continuous(trans = "reverse",
                       expand = expansion(mult = c(0.05, 0.01))) +
    coord_cartesian(ylim = c(0, max_axe_y)) +
    # notes IPR
    geom_line(aes(x = annee,
                  y = ipr),
              show.legend = F,
              lty = 2) +
    geom_point(aes(x = annee,
                   y = ipr),
               size = 2.5,
               pch = 21,
               fill = "grey70") +
    # treillis
    facet_wrap(~str_wrap(pop_libelle, 25), # au cas où intitulés trop longs
               ncol = nb_colonnes) +
    # mise en forme
    labs(title = "Evolution de l'indice IPR",
         x = "",
         y = "Indice Poisson Rivi\u00e8re") +
    guides(fill = guide_legend(title = "Classe IPR",
                               override.aes = list(color = df_classes$cli_couleur,
                                                   fill = df_classes$cli_couleur,
                                                   shape = 15,
                                                   alpha = 0.6))) +
    theme(legend.position = "bottom",
          strip.text.x = element_text(size = 8),
          axis.text.x = element_text(angle = 45, hjust = 1))

  plot_ipr_station
}
