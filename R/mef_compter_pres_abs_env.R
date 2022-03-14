#' Dénombrer le nb d'opérations avec chaque paramètre environnemental renseigné pour chacune
#'     des espèces
#'
#' @param df Dataframe avec les variables valeur_parametre, esp_code_alternatif, presence, parametre, annee, n.
#'
#' @return Un dataframe de 4 colonnes correspondant à l'espèce, au paramètre et aux nombres de présence et d'absence.
#' @export
#'
#' @importFrom dplyr filter group_by ungroup tally left_join mutate
#' @importFrom tidyr pivot_wider
#'
#' @examples
#' \dontrun{
#' df_nb_pres_abs_par_parametre_env <- mef_compter_pres_abs_env(df = df_captures_et_env)
#' }
mef_compter_pres_abs_env <- function(df)

{

  pres_abs_env <- df  %>%
    filter(!is.na(valeur_parametre)) %>%
    group_by(esp_code_alternatif, presence, parametre, annee) %>%
    tally() %>%
    mutate(presence = ifelse(is.na(presence), FALSE, presence)) %>%
    ungroup() %>%
    pivot_wider(
      id_cols = esp_code_alternatif:annee,
      names_from = presence,
      values_from = n
    ) %>%
    rename(presences = `TRUE`, absences = `FALSE`)

  pres_abs_env

}

