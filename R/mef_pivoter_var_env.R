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
#' df_long <- mef_pivoter_var_env(df_court)
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

