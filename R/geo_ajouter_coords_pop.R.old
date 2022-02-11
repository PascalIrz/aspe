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
#' geo_ajouter_coords_pop()
#' }
geo_ajouter_coords_pop <- function(passerelle)

{
  passerelle %>%
    left_join(y = point_prelevement %>%
                select(pop_id,
                       pop_coordonnees_x,
                       pop_coordonnees_y,
                       typ_id = pop_typ_id)) %>%
    left_join(y = ref_type_projection %>%
                select(typ_id,
                       typ_libelle,
                       typ_code_epsg))

}
