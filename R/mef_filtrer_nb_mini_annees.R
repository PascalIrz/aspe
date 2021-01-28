#' Filtrer un dataframe pour ne conserver que les stations présentes un nombre
#'     minimum d'années.
#'
#' @param df Dataframe qui doit contenir le champ "sta_id".
#' @param nb_mini_annees Nombre entier indiquant le seuil de sélection (nb mini d'années
#'     de données sur la station). Par défaut sa valeur est 1 donc toutes les stations avec
#'     au moins une donnée sont sélectionnées.
#'
#' @return Dataframe filtré, c'est-à-dire exourgé des stations qui n'ont pas assez d'années
#'     de données.
#' @export
#'
#' @examples
#' \dontrun{
#' data_22_filtre <- mef_filtrer_nb_mini_annees(df = data_22, nb_mini_annees = 1)
#' }
mef_filtrer_nb_mini_annees <- function(df, nb_mini_annees) {

  stations_id <- df %>%
    group_by(sta_id) %>%
    summarise(n = n_distinct(annee)) %>%
    ungroup() %>%
    filter(n >= nb_mini_annees) %>%
    pull(sta_id) %>%
    as.character()

  df %>%
    filter(sta_id %in% stations_id)

}
