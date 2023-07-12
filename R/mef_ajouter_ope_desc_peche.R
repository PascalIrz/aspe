#' Rajouter à la passerelle les variables de description de la pêche pour chaque opération (quand disponible).
#'
#' Ces variables sont issues de la table "operation_description_peche".
#'
#' @param df Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'
#' @return La passerelle à laquelle ont été ajoutés les variables environnementales
#' @export
#'
#' @importFrom dplyr left_join select mutate_all
#'
#' @examples
#' \dontrun{
#' passerelle <- mef_ajouter_ope_desc_peche(df = passerelle)
#' }
mef_ajouter_ope_desc_peche <- function(df)

{

  ope_dp <- df %>%
    left_join(    # jointure table operation_description_peche
      y = operation_description_peche %>%
        select(ope_id = odp_ope_id,
               odp_duree_peche,
               odp_longueur,
               odp_largeur_lame_eau,
               odp_temperature_instantanee,
               odp_conductivite,
               odp_tension:odp_nombre_epuisettes
               ) %>%
        mutate_all(function(x) ifelse(x == 0, NA, x)) # indeed zeros are missing values
        )

  ope_dp

}
