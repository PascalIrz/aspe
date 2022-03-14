#' Ajouter à un dataframe de présences les lignes des absences (avec effectif et densité nuls)
#'
#' La fonction fait appel au dataframe "operation" de la base Aspe qui doit impérativement avoir
#'     été chargé auparavant.
#'
#' @param df Dataframe avec les variables ope_id, esp_code_alternatif, effectif, dens_ind_1000m2 et annee.
#' @param var_id Nom de la variable contenant les identifiants des observations (ex : ope_id), sans guillements.
#' @param var_taxon Nom de la variable contenant les identifiants des taxons (ex : esp_code_alternatif),
#'     sans guillements.
#' @param var_effectif Nom de la variable contenant les effectifs (ex : lop_effectif), sans guillements.
#'
#' @return Le dataframe avec des lignes supplémentaires pour chacune des espèces absentes à chacune
#'     des opérations.
#' @export
#'
#' @importFrom dplyr select left_join enquo
#' @importFrom tidyr complete
#'
#' @examples
#' \dontrun{
#' df_complet <- mef_ajouter_abs(df = df_presences,
#' var_id = ope_id,
#' var_taxon = esp_code_alternatif,
#' var_effectif = effectif)
#' }
mef_ajouter_abs <- function(df, var_id, var_taxon, var_effectif)

{
  var_id <- enquo(var_id)
  var_taxon <- enquo(var_taxon)
  var_effectif <- enquo(var_effectif)

  df %>%
    droplevels() %>% # à retirer à terme
    select(!!var_id, !!var_taxon, !!var_effectif) %>%
    complete(!!var_id,!!var_taxon) %>%
    left_join(y =  df %>%
                select(!!var_id,
                       annee) %>%
                distinct()) %>%
    left_join(y = operation %>%
                select(ope_id,
                       pop_id = ope_pop_id))

}
