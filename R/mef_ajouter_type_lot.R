#' Ajouter le type de lot à la passerelle
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
#' mef_ajouter_type_lot()
#' }
mef_ajouter_type_lot <- function(passerelle)

{
  passerelle %>%
    left_join(y = ref_type_lot %>%
                select(tyl_id,
                       tyl_libelle))
}
