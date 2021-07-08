#' Ajouter le code espèce à 3 lettres à la passerelle.
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
#' mef_ajouter_esp_code_alternatif()
#' }
mef_ajouter_esp_code_alternatif <- function(passerelle)

{
  passerelle %>%
    left_join(y = ref_espece %>%
                select(esp_id,
                       esp_code_alternatif))

}
