#' Rajouter la date de chaque opération à la passerelle.
#'
#' @param passerelle Dataframe mettant en correspondance les identifiants des différentes tables
#' @param date_debut Date de début de la période à extraire au format jj/mm/aaaa
#' @param date_fin Date de fin de la période à extraire au format jj/mm/aaaa. Par défaut c'est la
#'     date du jour où la fonction est exécutée.
#'
#' @return La passerelle à laquelle ont été ajoutés la date et l'année.
#' @export
#'
#' @importFrom lubridate ymd_hms dmy
#'
#' @examples
#' \dontrun{
#' passerelle <- ajouter_ope_date(passerelle = passerelle,
#' date_debut = '01/01/2020',
#' date_fin = '31/07/2020')
#' }
ajouter_ope_date <- function(passerelle, date_debut, date_fin = Sys.Date())

{

  passerelle %>%
    left_join(y = operation %>% select(ope_id, ope_date)) %>% # récupération de la date
    mutate(ope_date = as.character(ope_date), # mise au format de la date
           annee = lubridate::ymd_hms(ope_date), # création variable année
           annee = lubridate::year(annee),
           ope_date = ymd_hms(ope_date))

}
