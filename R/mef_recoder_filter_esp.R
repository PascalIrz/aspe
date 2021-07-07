#' Recodage des codes espèces et exclusion de taxons
#'
#' Par exemple les carpes cuir, miroir, etc. sont regroupées sous un unique code CCX.
#' Idem pour les vandoises en VAX.
# 'Dans l'ouest Finistère, il n'y a que de l'épinoche => recodage de l'épinochette sur cette zone.
#'
#' @param df Dataframe standardisé contenant les données.
#' @param esp_a_supprimer Vecteur texte contenant les codes à trois lettres des taxons à
#'     supprimer. Il contient nécessairement un champ "esp_code_alternatif".
#'
#' @return Le dataframe mis à jour.
#' @export
#'
#' @importFrom stringr str_replace
#'
#' @examples
#' \dontrun{
#' df_propre <- df_brut %>%
#' mef_recoder_filter_esp(esp_a_supprimer = c("OCV", "ASA"))
#' }
mef_recoder_filter_esp <- function(df, esp_a_supprimer = NA) {

  if (!is.na(esp_a_supprimer))

  {
    df <- df %>%
      filter(!esp_code_alternatif %in% esp_a_supprimer)
  }

  df %>%
    mutate(
      esp_code_alternatif = case_when(
        esp_code_alternatif == "CCU" ~ "CCX",
        esp_code_alternatif == "CMI" ~ "CCX",
        esp_code_alternatif == "CCO" ~ "CCX",
        esp_code_alternatif == "CAG" ~ "CAX",
        esp_code_alternatif == "CAD" ~ "CAX",
        esp_code_alternatif == "CAA" ~ "CAX",
        esp_code_alternatif == "VAN" ~ "VAX",
        esp_code_alternatif == "VAR" ~ "VAX",
        TRUE ~ esp_code_alternatif
      )
    )
}
