#' Ajouter à un dataframe de présences les lignes des absences (avec effectif et densité nuls)
#'
#' La fonction fait appel au dataframe "operation" de la base Aspe qui doit impérativement avoir
#'     été chargé auparavant.
#'
#' @param df Dataframe avec les variables ope_id, esp_code_alternatif, effectif, dens_ind_1000m2 et annee.
#'
#' @return Le dataframe avec des lignes supplémentaires pour chacune des espèces absentes à chacune
#'     des opérations.
#' @export
#'
#' @importFrom dplyr select left_join
#' @importFrom tidyr complete
#'
#' @examples
#' \dontrun{
#' df_complet <- mef_ajouter_abs(df = df_presences)
#' }
mef_ajouter_abs <- function(df)

{

  df %>%
    droplevels() %>% # à retirer à terme
    select(ope_id, esp_code_alternatif, effectif, dens_ind_1000m2) %>%
    complete(ope_id,
             esp_code_alternatif,
             fill = list(effectif = 0,
                         dens_ind_1000m2 = 0)) %>%
    left_join(y =  df %>%
                select(ope_id, annee) %>%
                distinct()) %>%
    left_join(y = operation %>%
                select(ope_id, pop_id = ope_pop_id))


}
