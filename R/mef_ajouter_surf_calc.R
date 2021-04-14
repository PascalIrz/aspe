#' Rajouter la superficie échantillonnée calculée pour chaque opération à la passerelle.
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'
#' @return La passerelle à laquelle ont été ajoutés la superficie échantillonnée qui est une valeur calculée
#'     stockée dans le champ ope_surf_calculee de la table operation.
#' @export
#'
#' @importFrom dplyr left_join select
#'
#' @examples
#' \dontrun{
#' passerelle <- mef_ajouter_surf_calc(passerelle = passerelle)
#' }
mef_ajouter_surf_calc <- function(passerelle)

{

  passerelle %>%
    left_join(y = operation %>% select(ope_id, ope_surface_calculee))

}
