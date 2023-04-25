#' Recodage des codes taxons 'esp_code_alternatif'
#'
#' @param df Dataframe contenant la variable esp_code_alternatif'.
#' @param type_recodage Caractère, soit "especes" (par défaut), soit "ipr".
#'     Dans le premier cas, les codes taxons de sous-espèces ou écotype sont recodés à l'espèce.
#'     Dans le second cas, les codes taxons sont recodés selon la taxonomie de l'IPR, ici
#'     conformément au script 'IPR_v1.0.3_calc_consult.R'
#'     téléchargé depuis [https://seee.eaufrance.fr/](https://seee.eaufrance.fr/) le 24/04/2023.
#'
#' @return Le dataframe mis à jour.
#' @export
#'
#' @importFrom stringr str_to_lower
#' @importFrom stringi stri_trans_general
#' @importFrom dplyr mutate case_when
#'
#' @examples
#' \dontrun{
#' # Calcul des captures par espèces pour chaque opération de pêche

#' # chargement des packages
#'library(dplyr)
#'library(aspe)
#'
#' # chargement des données (à adapter)
#'load(file = "raw_data/tables_sauf_mei_2023_04_07_09_39_32.RData")
#'
#' # création du tableau
#'captures <- mef_creer_passerelle() %>%
#'  mef_ajouter_lots() %>%
#'  mef_ajouter_esp() %>%
#'  mef_recoder_esp_code_alt() %>%
#'  group_by(ope_id, esp_code_alternatif) %>%
#'  summarise(effectif = sum(lop_effectif)) %>%
#'  ungroup()
#' }
mef_recoder_esp_code_alt <- function(df, type_recodage = "especes") {

  # gestion des cas où l'utisateur a mis des majuscules ou des accents
  type_recodage <- str_to_lower(type_recodage) %>%
    stri_trans_general(id = "Latin-ASCII")

  if(!(type_recodage %in% c("ipr", "especes")))

  {

    stop("type_recodage est soit 'ipr' soit 'especes'")

  }else{
    # recodage à l'espèce (fusion des sous-espèces de truite commune et carpe commune)
    df <- df %>%
      mutate(esp_code_alternatif = case_when(
        esp_code_alternatif %in% c("CCU", "CMI") ~ "CCO",
        esp_code_alternatif %in% c("TRL", "TRM") ~ "TRF",
        TRUE ~ esp_code_alternatif
      ))

    # recadage selon la taxonomie IPR (fusion des néotaxons + d'espèces écologiquement proches)
    if(type_recodage == "ipr" ) {

      df <- df %>%
        mutate(esp_code_alternatif = case_when(
          esp_code_alternatif == "BRB" ~ "BRE",
          esp_code_alternatif == "CHP" ~ "CHA",
          esp_code_alternatif == "VAR" ~ "VAN",
          esp_code_alternatif %in% c("CAS", "CAG", "CAD", "CAA") ~ "CAX",
          esp_code_alternatif %in% c("GOL", "GOO", "GOU") ~ "GOX",
          esp_code_alternatif %in% c("VAI", "VAC", "VAB") ~ "PHX",
          TRUE ~ esp_code_alternatif
        ))

    }

    df

  }

}
