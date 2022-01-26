#' Ajouter à la passerelle l'objectif de l'opération.
#'
#' Par objectif, on entent la contribution à un réseau (DCE, RCS, RRP, etc.), le suivi de poopulations,
#'     des études, du suivi de restauration, etc. Les modalités sont précisées dans la table ref_objectif.
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
#' mef_ajouter_objectif()
#' }
mef_ajouter_objectif <- function(passerelle)

{
  passerelle %>%
    left_join(y = operation_objectif %>%
                select(ope_id = opo_ope_id,
                       obj_id = opo_obj_id)) %>%
    left_join(y = ref_objectif %>%
                select(obj_id,
                       obj_libelle))

}
