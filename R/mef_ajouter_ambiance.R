#' Ajouter à la passerelle, quand le prélèvement élémentaire est une ambiance, ses données
#'
#'     Le type de prélèvement doit donc être indiqué dans le data frame (Groupe de points,
#'     Passage ou Ambiance). On applique mef_ajouter_ambiance() après mef_ajouter_type_prelevement().
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
#' mef_ajouter_type_prelevement() %>%
#' mef_ajouter_ambiance()
#' }
mef_ajouter_ambiance <- function(passerelle)

{
  passerelle %>%
    left_join(y = ambiance %>%
                rename(pre_id = amb_id))
}
