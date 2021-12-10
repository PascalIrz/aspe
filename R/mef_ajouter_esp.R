#' Ajouter à un df "passerelle le code espèce à 3 lettres, son nom commun et scientifique.
#'
#' Les codes sont "historiques", hérités du Conseil Supérieur de la Pêche.
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'     La passerelle doit comprendre un champ avec le code taxon esp_id (typiquement, on utilise donc
#'     mef_ajouter_esp() après mef_ajouter_lots())
#'
#' @return La passerelle complétée.
#' @export
#'
#' @importFrom dplyr left_join select
#'
#' @examples
#' \dontrun{
#' passerelle <- mef_creer_passerelle() %>%
#' mef_ajouter_lots() %>%
#' mef_ajouter_esp()
#' }
mef_ajouter_esp <- function(passerelle)

{
  passerelle %>%
    left_join(y = ref_espece %>%
                select(esp_id,
                       esp_code_alternatif,
                       esp_nom_commun,
                       esp_nom_latin))

}
