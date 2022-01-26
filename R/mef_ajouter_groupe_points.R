#' Ajouter à la passerelle, quand le prélèvement élémentaire est un passage, le numéro de passage
#'
#'     Le type de prélèvement doit donc être indiqué dans le data frame (Groupe de points,
#'     Passage ou Ambiance). On applique mef_ajouter_groupe_points() après mef_ajouter_type_prelevement().
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
#' mef_ajouter_groupe_points()
#' }
mef_ajouter_groupe_points <- function(passerelle)

{
  passerelle %>%
    left_join(y = groupe_points %>%
                rename(pre_id = grp_id))

}
