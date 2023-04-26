#' Ajouter à un dataframe les probabilités de présence des taxons IPR
#'
#' Ces probabilités sont issues de Oberdorff et al. (2002)
#' Development and validation of a fish‐based index for the assessment of ‘river health’in France.
#' Freshwater Biology, 47(9), 1720-1734).
#'
#' Comme les codes taxonomiques actuels diffèrent de ceux de l'IPR, il peut être nécessaire, avant d'utiliser
#' la fonction 'mef_ajouter_proba_presence_ipr()', d'appliquer le référentiel taxonomique IPR au dataframe
#' au moyen de la fonction 'mef_recoder_esp_code_alt()'.
#'
#' Le dataframe 'probabilite_presence_ipr' doit auparavant être chargé.
#'
#' @param df Dataframe qui doit comprendre les colonnes "ope_id" et "esp_id".
#'
#' @return Le dataframe complété avec les probabilités de présence.
#' @export
#'
#' @importFrom dplyr left_join select
#'
#' @examples
#' \dontrun{
#' df <- df %>%
#' mef_ajouter_proba_presence_ipr()
#' }
mef_ajouter_proba_presence_ipr <- function(df)

{

  df <- df %>%
    left_join(y = probabilite_presence_ipr %>%
                select(ope_id = ppi_opi_ope_id, # survey id is renamed to join fbi
                       esp_id = ppi_esp_id, # species id is renamed to join ref_espece
                       ppi_valeur_probabilite, # proba occurrence
                       ppi_param_effectif # observed catches
                )
              )

  df

}
