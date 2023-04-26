#' Ajouter à la passerelle le type de matériel employé
#'
#' ex : Héron
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
#' mef_ajouter_type_materiel()
#' }
mef_ajouter_type_materiel <- function(passerelle)

{
  passerelle %>%
    left_join(y = operation_description_peche %>%
                select(ope_id = odp_ope_id,
                       mom_id = odp_mom_id)) %>%
    left_join(y = ref_modele_materiel %>%
                select(mom_id,
                       mom_libelle)) %>%
    select(-mom_id)
}
