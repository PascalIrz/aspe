#' Filtrer un dataframe pour ne conserver que les points présents un nombre
#'     minimum d'années.
#'
#' @param df Dataframe qui doit contenir le champ "pop_id".
#' @param nb_mini_annees Nombre entier indiquant le seuil de sélection (nb mini d'années
#'     de données sur le point). Par défaut sa valeur est 1 donc tous les points avec
#'     au moins une donnée sont sélectionnées.
#'
#' @return Dataframe filtré, c'est-à-dire exourgé des points qui n'ont pas assez d'années
#'     de données.
#' @export
#'
#' @examples
#' \dontrun{
#' data_22_filtre <- mef_filtrer_nb_mini_annees(df = data_22, nb_mini_annees = 1)
#' }
mef_filtrer_nb_mini_annees <- function(df, nb_mini_annees) {

  pop_ids <- df %>%
    group_by(pop_id) %>%
      summarise(n = n_distinct(annee)) %>%
    ungroup() %>%
    filter(n >= nb_mini_annees) %>%
    pull(pop_id) %>%
    as.character()

  df %>%
    filter(pop_id %in% pop_ids)

}
