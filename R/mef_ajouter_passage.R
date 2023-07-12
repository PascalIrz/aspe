#' Ajouter à la passerelle, quand le prélèvement élémentaire est un passage, le numéro de passage
#'
#'     Le type de prélèvement doit donc être indiqué dans le data frame (Groupe de points,
#'     Passage ou Ambiance). On applique mef_ajouter_passage() après mef_ajouter_type_prelevement().
#'
#' @param df Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'     df doit contenir une variable "pre_id" (identifiant du prélèvement élémentaire).
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
#' mef_ajouter_passage()
#' }
mef_ajouter_passage <- function(df)

{
  df %>%
    left_join(y = passage %>%
                rename(pre_id = pas_id))

}
