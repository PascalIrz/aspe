#' Ajouter le type de longueur à la passerelle
#'
#' ex : totale, fourche.
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
#' mef_ajouter_type_longueur()
#' }
mef_ajouter_type_longueur <- function(passerelle)

{
  passerelle %>%
    left_join(lot_poissons %>%
                select(lop_id,
                       tlo_id = lop_tlo_id)) %>%
    left_join(y = ref_type_longueur %>%
                select(tlo_id,
                       tlo_libelle))
}
