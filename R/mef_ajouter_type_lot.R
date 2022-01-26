#' Ajouter le type de lot à la passerelle
#'
#'     NB Les tables "lot_poissons" et "ref_type_lot" doivent avoir été chargées auparavant.
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
    left_join(y = lot_poissons %>%
                select(lop_id,
                       tyl_id = lop_tyl_id)) %>%
    left_join(y = ref_type_lot %>%
                select(tyl_id,
                       tyl_libelle))
}
