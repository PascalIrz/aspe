#' Graphique de la série chronologique de métriques de diversité à l'échelle du peuplement sur une station ou un groupe de stations
#'
#' Cette fonction peut renvoyer soit:
#'   (i) un dataframe avec les métriques calculées (Richesse taxonomique, Effectif total, Indices de Shannon et Equitabilité),
#'   (ii) ou à un graphique \code{ggplot2} en treillis avec les différentes métriques, pour une station ou un groupe de stations.
#'
#' @param df_captures Dataframe contenant les données des effectifs capturés par taxons. Il doit contenir les variables "effectif" et "annee", ainsi que
#'     trois variables pour d'identifier les stations (ou points de prélèvement) pour les calculs.
#' @param var_id_sta Variable servant à identifier les stations ou points.
#'     Cette variable donnera les étiquettes des lignes du graphique.
#' @param var_metrique_div Variable donnant le nom de la colonne des métriques (ex : metriques_div).
#' @param station_sel Vecteur caractère indiquant les points ou stations à sélectionner.
#' @param nb_colonnes Entier. Nombre de colonnes du graphique utilisé pour dans le cas d'un graphique pour une station. Par défaut nb_colonnes = 2.
#' @param id_sta_max_caract Entier. Nombre maximum de caractères dans l'identifiant de la station, au-delà duquel il sera
#'     découpé pour tenir sur plusieurs lignes. Par défaut c'est 25 caractères.
#' @param print.metrique Valeur logique. Si TRUE, le dataframe des métriques est retourné. Si FALSE (par défaut), le graphique \code{ggplot2} est retourné.
#'
#' @return Un graphique \code{ggplot2} ou un dataframe.
#' @export
#'
#' @importFrom dplyr enquo filter mutate group_by summarise ungroup rename vars pull
#' @importFrom tidyr pivot_longer
#' @importFrom forcats fct_relevel
#' @importFrom ggplot2 ggplot aes geom_line geom_point scale_x_continuous labs theme element_text facet_wrap facet_grid
#' @importFrom stringr str_wrap
#'
#' @examples
#' \dontrun{
#' # preparation donnees
#' captures <-
#'   mef_creer_passerelle() %>% # création passerelle
#'   mef_ajouter_ope_date() %>%  # ajout date et année
#'   mef_ajouter_lots() %>%  # ajout des lots (effectif par espèce)
#'   mef_ajouter_surf_calc() %>%  # ajout surfaces prospectées pour calcul des densités
#'   mef_ajouter_libelle() %>% # ajout libellé du point de prélèvement
#'   group_by(
#'     sta_id,
#'     pop_id,
#'     ope_id,
#'     ope_date,
#'     annee,
#'     esp_code_alternatif,
#'     ope_surface_calculee,
#'     pop_libelle
#'   ) %>%
#'   summarise(effectif = sum(lop_effectif, na.rm = TRUE)) %>%
#'   ungroup() %>%
#'   mef_ajouter_type_protocole() %>%
#'   filter(pro_libelle %in% c("Pêche complète à un ou plusieurs passages",
#'                             "Pêche partielle par points (grand milieu)",
#'                             "Pêche par ambiances",
#'                             "Pêche partielle sur berge"))
#' # graphiques ggplot
#' gg_temp_indic_div(df_captures = captures,
#'                     var_id_sta = pop_libelle,
#'                     var_metrique_div = metrique_div,
#'                     station_sel =c("LA BERENCE A GAVRAY", "La Berre à Portel-des-Corbières"),
#'                     print.metrique = F)
#'
#' gg_temp_indic_div(df_captures = captures,
#'                     var_id_sta = pop_libelle,
#'                     var_metrique_div = metrique_div,
#'                     station_sel =c("La Berre à Portel-des-Corbières"),
#'                     nb_colonnes = 2,
#'                     print.metrique = F)
#'
#' # dataframe des metriques
#' gg_temp_indic_div(df_captures = captures,
#'                     var_id_sta = pop_libelle,
#'                     var_metrique_div = metrique_div,
#'                     station_sel =c("LA BERENCE A GAVRAY", "La Berre à Portel-des-Corbières"),
#'                     print.metrique = T)
#'
#' gg_temp_indic_div(df_captures = captures,
#'                     var_id_sta = pop_libelle,
#'                     var_metrique_div = metrique_div,
#'                     station_sel =c("La Berre à Portel-des-Corbières"),
#'                     nb_colonnes = 2,
#'                     print.metrique = T)
#' }

gg_temp_indic_div <- function(df_captures,
                              var_id_sta,
                              var_metrique_div,
                              station_sel = NULL,
                              nb_colonnes = 2,
                              id_sta_max_caract = 25,
                              print.metrique = F)
{

  # mise en forme des étiquettes inspirée de https://stackoverflow.com/a/57086284
  int_breaks <- function(x, n = 5){
    if (length(unique(x)) > 1) {
      pretty(x, n)[round(pretty(x, n), 1) %% 1 == 0]
    } else {
      round(unique(x)) + c(-1, 0, 1)
    }
  }

  int_limits <- function(x) {
    if (length(unique(x)) > 1) {
      range(x)
    } else {
      range(int_breaks(x))
    }
  }


  # gestion évaluation
  var_id_sta <- dplyr::enquo(var_id_sta)
  var_metrique_div <- dplyr::enquo(var_metrique_div)

  # sélection des données
  if (!is.null(station_sel))
  {
    df_captures <-
      df_captures %>%
      dplyr::filter(!!var_id_sta %in% station_sel)
  }

  # fonctions calculs indices div.
  richesse_cal <-
    function(df_effectif) {
      richesse_spe <- length(df_effectif[df_effectif != 0])
      return(richesse_spe)
    }
  shannon_cal <-
    function(df_effectif) {
      richesse_spe <- length(df_effectif[df_effectif != 0])
      if(richesse_spe > 1){
        p_i <- df_effectif[df_effectif != 0]/sum(df_effectif)
        shannon_ind <- -sum(p_i * log(p_i))}
      else
      { shannon_ind <- NA }
      return(shannon_ind)
    }
  simpson_cal <-
    function(df_effectif) {
      richesse_spe <- length(df_effectif[df_effectif != 0])
      if(richesse_spe > 1){
        data_non_zero <- df_effectif[df_effectif != 0]
        simpson_ind <- 1 - ( sum(data_non_zero * (data_non_zero - 1)) / (sum(data_non_zero) * (sum(data_non_zero)-1)) )}
      else {
        simpson_ind <- NA }
      return(simpson_ind)
    }

  # passage de la variable d'identification de la station en facteur et découpage si dépasse id_sta_max_caract caractères

  df_metriques_div <-
    df_captures %>%
    dplyr::mutate(
      !!var_id_sta := stringr::str_wrap(!!var_id_sta, width = id_sta_max_caract),
      !!var_id_sta := as.factor(!!var_id_sta)
    ) %>%
    dplyr::group_by(!!var_id_sta, annee) %>%
    dplyr::summarise(`Effectif total` = sum(effectif),
                     `Richesse taxonomique` = richesse_cal(effectif),
                     `Shannon diversite` = shannon_cal(effectif),
                     #Simpson = simpson_cal(effectif),
                     `Equitabilite (Pielou)` =  `Shannon diversite` / log(`Richesse taxonomique`)) %>%
    dplyr::ungroup()

  # df format long
  df_metriques_div_long <-
    df_metriques_div %>%
    tidyr::pivot_longer(-c(!!var_id_sta, annee),
                        names_to = "indices",
                        values_to = "valeur") %>%
    dplyr::rename(!! var_metrique_div := 'indices') %>%
    dplyr::ungroup() %>%
    dplyr::mutate(!! var_metrique_div := forcats::fct_relevel(!! var_metrique_div, 'Richesse taxonomique' , "Effectif total", 'Shannon diversite', "Equitabilite (Pielou)"))

  # graphique de base
  plot_indic_div_station <-
    ggplot2::ggplot(
      data = df_metriques_div_long,
      ggplot2::aes(x = annee,
                   y = valeur,
                   fill = !! var_metrique_div)) +
    ggplot2::geom_line(lty=2) +
    ggplot2::geom_point(size = 2, shape = 21) +
    ggplot2::scale_x_continuous(
      breaks = int_breaks,
      limits = int_limits
    ) +
    ggplot2::labs(title = "Evolution des m\u00e9triques de diversit\u00e9",
                  x = "",
                  y = "") +
    ggplot2::theme(legend.position = "none",
                   strip.text.x = ggplot2::element_text(size = 8),
                   axis.text.x = ggplot2::element_text(angle = 45, hjust = 1)) +
    ggplot2::facet_wrap(facets = dplyr::vars(!!var_metrique_div),
                        scales = "free")

  # # Gestion du nombre de colonnes du graphique. Par défaut c'est 7 mais modifiable dans le cas où une seule station
  if((df_metriques_div_long %>%
      dplyr::pull(!! var_id_sta) %>%
      unique() %>%
      length()) == 1) {

    plot_indic_div_station <-
      plot_indic_div_station +
      ggplot2::labs(title = df_metriques_div_long %>% dplyr::pull(!!var_id_sta)) +
      ggplot2::facet_wrap(facets = dplyr::vars(!!var_metrique_div),
                          scales = "free",
                          ncol = nb_colonnes)

  } else {

    plot_indic_div_station <-
      plot_indic_div_station +
      ggplot2::facet_grid(cols = dplyr::vars(!!var_id_sta),
                          rows = dplyr::vars(!!var_metrique_div),
                          scales = "free")

  }

  # affichage
  if(print.metrique == T) {
    return(df_metriques_div)
  } else {
    plot_indic_div_station
  }

}
