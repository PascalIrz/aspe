#' Extraire les notes IPR à partir d'une table passerelle
#'
#' @param passerelle Dataframe mettant en correspondance les identifiants des différentes tables
#' @param date_debut Date de début de la période à extraire au format jj/mm/aaaa
#' @param date_fin Date de fin de la période à extraire au format jj/mm/aaaa. Par défaut c'est la
#'     date du jour où la fonction est exécutée.
#'
#' @return Dataframe avec la valeur de l'IPR, station, date + quelques informations complémentaires
#' @export
#'
#' @importFrom lubridate ymd_hms dmy
#'
#' @examples
#' \dontrun{
#' mon_df_ipr <- extraire_ipr(passerelle = passerelle,
#' date_debut = '01/01/2020',
#' date_fin = '31/07/2020')
#' }
#'
extraire_ipr <- function(passerelle, date_debut, date_fin = Sys.Date())

{

  passerelle %>%
    left_join(y = operation %>% select(ope_id, ope_date)) %>% # récupération de la date
    mutate(ope_date = as.character(ope_date), # mise au format de la date
           annee = lubridate::ymd_hms(ope_date), # création variable année
           annee = lubridate::year(annee),
           ope_date = ymd_hms(ope_date)) %>%
    filter(ope_date <= dmy(date_fin) & ope_date >= dmy(date_debut)) %>%
    left_join(y = operation_ipr %>% select(ope_id = opi_ope_id, ipr = opi_ipr)) %>% # récupération IPR
    filter(!is.na(ipr)) %>% # filtrage des IPR non vides
    left_join(y = point_prelevement %>% select(pop_id, pop_libelle_wama)) %>% # récupération libellé point
    left_join(y = station %>% select(sta_id, sta_libelle_sandre, sta_com_code_insee)) %>%
    mutate(dept = str_sub(sta_com_code_insee, start = 1, end = 2), # création variable dept
           classe_ipr = cut(ipr, # discrétisation IPR
                            breaks = c(-99, 7, 16, 25, 36, 1e6),
                            labels = c("Très bon", "Bon", "Moyen", "Médiocre", "Mauvais"))) %>%
    select(libelle_station = sta_libelle_sandre, # sélection et ordonancement des colonnes
           dept,
           sta_id,
           libelle_point = pop_libelle_wama,
           pop_id,
           ope_id,
           annee,
           date_operation = ope_date,
           ipr,
           classe_ipr) %>%
    distinct() # suppression des doublons

}
