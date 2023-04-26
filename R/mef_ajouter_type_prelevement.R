#' Ajouter à la passerelle le type de prélèvement élémentaire
#'
#' Par type de prélèvement, on entend les modalités du tpe_libelle de la
#'     table ref_type_prelevement_elementaire
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'
#' @return La passerelle complétée.
#' @export
#'
#' @importFrom dplyr left_join select
#'
#' @examples
#' \dontrun{
#' passerelle <- passerelle %>%
#' mef_ajouter_type_prelevement()
#' }
mef_ajouter_type_prelevement <- function(passerelle)

{
  passerelle %>%
    left_join(y = prelevement_elementaire %>%
                select(pre_id,
                       tpe_id = pre_tpe_id)) %>%
    left_join(y = ref_type_prelevement_elementaire) %>%
    select(-tpe_ordre_affichage,
           -tpe_id)

}
