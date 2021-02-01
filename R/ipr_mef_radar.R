#' Mettre un dataframe au format pour ls graphiques en radar.
#'   La fonction radarchart() du package {fmsb} nécessite en entrée un dataframe
#'   au format spécifique.
#' @param metriques_df Un dataframe contenant les métriques par station et par année,
#'     produit par la fonction ipr_extraire_metriques().
#' @param station_id Numérique entier. Identifiant de la station (sta_id).
#' @export
#'
#' @return Un dataframe mis en forme.
#'
#' @importFrom tibble column_to_rownames
#'
#' @examples
#' \dontrun{
#' ipr_mef_radar <- ipr_mef_radar(metriques_df = metriques_22, station_id = 10708)
#' }
ipr_mef_radar <- function(metriques_df, station_id) {

  data_sta <- metriques_df %>%
    filter(sta_id == station_id) %>%
    mutate(annee_car = as.character(annee)) %>%
    column_to_rownames(var = "annee_car")

  mon_titre <- data_sta %>% # titre pour le graphique, en concaténant le nom de la station et l'année
    pull(sta_libelle_sandre) %>%
    as.character() %>%
    .[1]

  data_sta <- data_sta %>%
    select(annee, ner:dti) # sélection des colonnes nécessaires pour le graphique

  maxi <- data_sta %>% # valeur maximale pour les axes
    select(-annee) %>%
    max() %>%
    ceiling()

  bornes_inf <- rep(x = 0, times = 7)
  bornes_sup <- rep(x = maxi, times = 7)

  rbind(bornes_sup, bornes_inf, data_sta) %>%
    select(-annee)

}
