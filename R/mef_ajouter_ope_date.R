#' Rajouter à la passerelle la date et l'année de chaque opération.
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'
#' @return La passerelle à laquelle ont été ajoutés la date et l'année.
#' @export
#'
#' @importFrom lubridate ymd_hms dmy
#'
#' @examples
#' \dontrun{
#' passerelle <- mef_ajouter_ope_date(passerelle = passerelle)
#' }
mef_ajouter_ope_date <- function(passerelle)

{

  passerelle %>%
    left_join(y = operation %>% select(ope_id, ope_date)) %>% # récupération de la date
    mutate(ope_date = as.character(ope_date), # mise au format de la date
           annee = lubridate::ymd_hms(ope_date), # création variable année
           annee = lubridate::year(annee),
           ope_date = ymd_hms(ope_date))

}
