#' Formater le tableau des captures sur un ensemble de points
#'
#' L'objectif est de visualiser la dynamique du peuplement. Permet d'identifier les taxons
#'     qui apparaissent ou disparaissent ainsi que les abondances.
#'
#' @param df Dataframe contenant les captures et contenant les champs pop_id, pop_libelle,
#'     annee, esp_code_alternatif, effectif.
#'
#' @return Un dataframe pour un ensemble de points de prélèvement qui est mis en forme
#'     pour produire des graphiques avec la fonction gg_colo_ext_pop().
#' @export
#'
#' @importFrom dplyr pull
#' @importFrom purrr map reduce
#'
#' @examples
#' \dontrun{
#' colo_ext_mon_point <- captures %>%
#'     mef_colo_ext_pops()
#' }
mef_colo_ext_pops <- function(df)

{
  mes_pops <- df %>%
    pull(pop_id) %>%
    unique()

  capt_mef_colo_ext <- map(.x = mes_pops,
                           .f = mef_colo_ext_pop,
                           df = df) %>%
    reduce(rbind)

  capt_mef_colo_ext

}
