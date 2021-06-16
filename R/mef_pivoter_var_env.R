#' Title
#'
#' @param df
#'
#' @return
#' @export
#'
#' @examples
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

