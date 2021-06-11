#' Extraire les métriques individuelles observées, théoriques et leur contribution
#'     à l'indice IPR agrégé.
#'
#' @param passerelle Le dataframe passerelle.
#'
#' @return Le dataframe passerelle complété par les métriques.
#' @export
#'
#' @importFrom lubridate year ymd_hms
#' @importFrom stringr str_replace
#'
#' @examples
#' \dontrun{
#' metriques <- ipr_extraire_metriques(passerelle = ma_passerelle)
#' }
ipr_extraire_metriques <- function(passerelle)

{

  passerelle %>%
    left_join(y = operation_ipr %>% # ajout table operation_ipr
                rename(ope_id = opi_ope_id)) %>%
    left_join(y = station %>% # ajout libellé station
                select(sta_id, sta_libelle_sandre)) %>%
    select(sta_libelle_sandre, ope_date, sta_id, # sélection des colonnes
           ends_with("theorique"),
           ends_with("observe"),
           opi_ner:opi_ipr) %>%
    mutate(annee = lubridate::ymd_hms(ope_date) %>% # création variable annee
             lubridate::year()) %>%
    select(-ope_date) %>%
    distinct() %>%
    group_by(sta_id, sta_libelle_sandre, annee) %>%
    slice(1) %>% # si plusieurs opérations dans un même année, on retient la dernière
    ungroup() %>%
    mutate(titre = paste0(sta_libelle_sandre, " - ", annee)) %>% # création titre station - annee
    rename_at(.vars = vars(starts_with("opi_")), # simplification des noms des métriques
              .funs = ~str_replace(., pattern = "opi_", replacement = ""))

}
