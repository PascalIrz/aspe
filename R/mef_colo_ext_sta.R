#' Mettre en forme le tableau des captures sur un point en vue de visualiser la dynamique
#'     du peuplement. Permet d'identifier les taxons qui apparaissent ou disparaissent
#'     ainsi que les abondances.
#'
#' @param df Dataframe contenant les captures et contenant les champs sta_id, pop_libelle,
#'     annee, esp_code_alternatif, effectif.
#' @param id_station Caractère. Identifiant du point au sens du champ pop_id de la base Aspe.
#'
#' @return Un dataframe pour un point de prélèvement qui est mis en forme pour produire un
#'     graphique avec la fonction gg_colo_ext_sta().
#' @export
#'
#' @importFrom dplyr filter pull left_join mutate arrange select group_by case_when lag
#' @importFrom tidyr expand
#'
#' @examples
#' \dontrun{
#' colo_ext_ma_station <- captures %>%
#'     mef_colo_ext_sta(id_station = "22980"))
#' }
mef_colo_ext_sta <- function(df, id_station)

{

  selection <- df %>%
    filter(sta_id == id_station) %>%
    droplevels()

  libelle <- selection %>%
    pull(pop_libelle) %>%
    .[1]

  selection <- selection %>%
    expand(annee, esp_code_alternatif, pop_id) %>%
    left_join(selection) %>%
    mutate(effectif = ifelse(is.na(effectif), 0, effectif)) %>%
    arrange(esp_code_alternatif, annee) %>%
    select(pop_id, pop_libelle, annee, esp_code_alternatif, effectif) %>%
    group_by(esp_code_alternatif) %>%
    mutate(col_ext = case_when(effectif > 0 & lag(effectif, 1) == 0 ~ "colonisation",
                               effectif == 0 & lag(effectif, 1) > 0 ~ "extinction",
                               TRUE ~ "statu quo"),
           taille = case_when(col_ext == "extinction" ~ 10,
                              effectif == 0 ~ NA_real_,
                              TRUE ~ effectif^0.5),
           type_point = col_ext == "extinction")

  selection

}
