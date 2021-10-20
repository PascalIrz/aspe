#' Ajouter le code espèce à 3 lettres à la passerelle.
#'
#' Il s'agit des codes "historiques" hérités du Conseil Supérieur de la Pêche.
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'     La passerelle doit comprendre un champ avec le code taxon esp_id (typiquement, on utilise donc
#'     mef_ajouter_esp_code_alternatif() après mef_ajouter_lots())
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
#' mef_ajouter_esp_code_alternatif()
#' }
mef_ajouter_esp_code_alternatif <- function(passerelle)

{
  passerelle %>%
    left_join(y = ref_espece %>%
                select(esp_id,
                       esp_code_alternatif))

}
