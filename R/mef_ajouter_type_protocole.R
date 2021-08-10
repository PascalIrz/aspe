#' Ajouter le type de protocole à la passerelle
#'     ex : Indice Abondance Saumon.
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
#' mef_ajouter_type_protocole()
#' }
mef_ajouter_type_protocole <- function(passerelle)

{
  passerelle %>%
    left_join(y = ref_protocole %>%
                select(pro_id,
                       pro_libelle))
}
