#' Ajouter les mesures individuelles à la passerelle
#'
#' @param df Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'     df doit contenir le champ "lop_id" qui sert à la jointure avec la table mesure_individuelle.
#'
#' @return La passerelle complétée.
#' @export
#'
#' @importFrom dplyr left_join rename
#'
#' @examples
#' \dontrun{
#' passerelle <- passerelle %>%
#' mef_ajouter_mei()
#' }
mef_ajouter_mei <- function(df)

{
  df %>%
    left_join(y = mesure_individuelle %>%
                rename(lop_id = mei_lop_id))
}
