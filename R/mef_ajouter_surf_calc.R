#' Rajouter la superficie échantillonnée calculée pour chaque opération à la passerelle
#'
#' @param df Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'     df doit contenir une variable "ope_id" (identifiant de l'opération de pêche).
#'
#' @return La passerelle à laquelle a été ajoutée la superficie échantillonnée qui est une valeur calculée
#'     stockée dans le champ ope_surf_calculee de la table operation.
#' @export
#'
#' @importFrom dplyr left_join select
#'
#' @examples
#' \dontrun{
#' passerelle <- mef_ajouter_surf_calc(df = passerelle)
#' }
mef_ajouter_surf_calc <- function(df)

{
  df %>%
    left_join(y = operation %>%
                select(ope_id,
                       ope_surface_calculee))

}
