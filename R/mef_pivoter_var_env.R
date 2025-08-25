#' Pivoter le dataframe pour regrouper les variables environnementales sur 2 colonnes
#'
#'
#' @param df Dataframe avec les variables distance_mer, temp_janvier, etc.
#'
#' @return Le dataframe pivoté, en forme pour les graphiques avec ggplot2.
#' @export
#'
#' @importFrom tidyr pivot_longer
#'
#' @examples
#' \dontrun{
#' df_long <- operation_ipr %>%
#' mutate(distance_mer = NA) %>%
#'   select(ope_id = opi_ope_id,
#'          distance_mer,
#'          starts_with("opi_param")) %>%
#'   rename(temp_janvier = opi_param_tjanvier) %>%
#'   select(-opi_param_bassin) %>%
#'   mef_pivoter_var_env()
#' }
mef_pivoter_var_env <- function(df)

{

df %>%
  pivot_longer(
    cols = distance_mer:temp_janvier,
    names_to = "parametre",
    values_to = "valeur_parametre",
    values_drop_na = TRUE
  )

}

