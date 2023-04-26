#' Mettre un dataframe au format pour ls graphiques en radar.
#'
#' La fonction radarchart() du package {fmsb} nécessite en entrée un dataframe
#'     au format spécifique.
#'
#' @param metriques_df Un dataframe contenant les métriques par station et par année,
#'     produit par la fonction ipr_extraire_metriques().
#' @param pop_id Numérique entier. Identifiant du point de prélèvement (pop_id).
#' @export
#'
#' @return Un dataframe mis en forme.
#'
#' @importFrom tibble column_to_rownames
#' @importFrom dplyr filter mutate pull select
#'
#' @examples
#' \dontrun{
#' mef_ipr_radar <- ipr_mef_radar(metriques_df = metriques_22, pop_id = 41964)
#' }
mef_ipr_radar <- function(metriques_df, pop_id) {

  pop_data <- metriques_df %>%
    filter(pop_id == !!pop_id) %>% #
    mutate(annee_car = as.character(annee)) %>%
    distinct() %>%
    column_to_rownames(var = "annee_car")

  mon_titre <- pop_data %>% # titre pour le graphique, en concaténant le nom de la station et l'année
    pull(pop_libelle) %>%
    as.character() %>%
    .[1]

  pop_data <- pop_data %>%
    select(annee, ner:dti) # sélection des colonnes nécessaires pour le graphique

  maxi <- pop_data %>% # valeur maximale pour les axes
    select(-annee) %>%
    max() %>%
    ceiling()

  bornes_inf <- rep(x = 0, times = 7)
  bornes_sup <- rep(x = maxi, times = 7)

  rbind(bornes_sup, bornes_inf, pop_data) %>%
    select(-annee)

}

