#' Ajouter à la passerelle, quand le prélèvement élémentaire est un groupe de points, ses données
#'
#'     Le type de prélèvement doit donc être indiqué dans le data frame (Groupe de points,
#'     Passage ou Ambiance). On applique mef_ajouter_groupe_points() après mef_ajouter_type_prelevement().
#'
#' @param df Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'     df doit contenir le champ "pre_id" (identifiant du prélèvement individuel).
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
mef_ajouter_groupe_points <- function(df)

{
  df %>%
    left_join(y = groupe_points %>%
                rename(pre_id = grp_id))

}
