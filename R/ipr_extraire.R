#' Extraire les notes IPR à partir d'une table passerelle
#'
#' @param passerelle Dataframe mettant en correspondance les identifiants des différentes tables.
#' @param date_debut Date de début de la période à extraire au format jj/mm/aaaa.
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
#' mon_df_ipr <- ipr_extraire(passerelle = passerelle,
#' date_debut = '01/01/2020',
#' date_fin = '31/07/2020')
#' }
#'
ipr_extraire <- function(passerelle, date_debut, date_fin = format(Sys.Date(), "%d/%m/%Y"))

{

  prov <- passerelle %>%
    mef_ajouter_ope_date() %>%
    filter(ope_date <= dmy(date_fin) & ope_date >= dmy(date_debut)) %>%
    left_join(y = operation_ipr %>%
                select(ope_id = opi_ope_id, ipr = opi_ipr, opi_param_alt)) %>% # récupération IPR
    filter(!is.na(ipr)) %>% # filtrage des IPR non vides
    left_join(y = point_prelevement %>%
                select(pop_id, pop_libelle_wama)) %>% # récupération libellé point
    left_join(y = station %>%
                select(sta_id, sta_libelle_sandre, sta_com_code_insee)) %>%
    mutate(dept = str_sub(sta_com_code_insee, start = 1, end = 2)) %>%  # création variable dept
    select(libelle_station = sta_libelle_sandre, # sélection et ordonancement des colonnes
           dept,
           sta_id,
           libelle_point = pop_libelle_wama,
           pop_id,
           ope_id,
           annee,
           date_operation = ope_date,
           ipr,
           opi_param_alt) %>%
    distinct() # suppression des doublons

  inf_500 <- prov %>%
    filter(opi_param_alt < 500)

  seuils_inf_500 <- classe_ipr %>%
    filter(!cli_altitude_min == 500 | is.na(cli_altitude_min)) %>%
    pull(cli_borne_inf) %>%
    c(1e6)

  labs_inf_500 <- classe_ipr %>%
    filter(!cli_altitude_min == 500 | is.na(cli_altitude_min)) %>%
    pull(cli_libelle)

  inf_500 <- inf_500 %>%
    mutate(classe_ipr = cut(ipr, # discrétisation IPR
                            breaks = seuils_inf_500,
                            labels = labs_inf_500))

  seuils_sup_500 <- classe_ipr %>%
    filter(cli_altitude_min == 500 | is.na(cli_altitude_min))  %>%
    pull(cli_borne_inf) %>%
    c(1e6)

  labs_sup_500 <- classe_ipr %>%
    filter(cli_altitude_min == 500 | is.na(cli_altitude_min)) %>%
    pull(cli_libelle)

  sup_500 <- prov %>%
    filter(opi_param_alt >= 500)

  sup_500 <- sup_500 %>%
    mutate(classe_ipr = cut(ipr, # discrétisation IPR
                            breaks = seuils_sup_500,
                            labels = labs_sup_500))

  bind_rows(inf_500, sup_500)

}
