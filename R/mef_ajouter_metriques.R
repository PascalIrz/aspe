#' Ajouter à une passerelle les métriques IPR observées, théoriques et leur contribution
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
#' passerelle_avec_metriques <- mef_ajouter_metriques(passerelle = ma_passerelle)
#' }
mef_ajouter_metriques <- function(passerelle)

{

  passerelle %>%
    left_join(y = operation_ipr %>% # ajout table operation_ipr
                select(ope_id = opi_ope_id,
                       ends_with("theorique"),
                       ends_with("observe"),
                       opi_ner:opi_dti)) %>%
    rename_at(.vars = vars(starts_with("opi_")), # simplification des noms des métriques
              .funs = ~str_replace(., pattern = "opi_", replacement = ""))

}
