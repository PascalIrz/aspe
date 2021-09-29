#' Filtrer un dataframe pour ne conserver que les objets présents un nombre
#'     minimum d'années
#'
#' @param df Dataframe qui doit contenir un champ d'identifiant des observations (ex : pop_id).
#' @param nb_mini_annees Nombre entier indiquant le seuil de sélection (nb mini d'années
#'     de données sur le point). Par défaut sa valeur est 1 donc tous les points avec
#'     au moins une donnée sont sélectionnées.
#' @param var_id Caractère. Nom de la variable d'identification des observations.
#'     Par exemple si la variable d'identification des objets est "pop_id", seuls seront conservés
#'     les points pour lesquels il y a plus de nb_mini_annees années de données. Si la variable
#'     d'identification est "sta_id", seuls seront conservées les stations pour lesquels il y a
#'     plus de nb_mini_annees années de données.
#'
#' @return Dataframe filtré, c'est-à-dire exourgé des objets qui n'ont pas assez d'années
#'     de données.
#' @export
#'
#' @examples
#' \dontrun{
#' data_22_filtre <- mef_filtrer_nb_mini_annees(df = data_22, nb_mini_annees = 1, var_id = "sta_id")
#' }
mef_filtrer_nb_mini_annees <- function(df, nb_mini_annees, var_id)

  {

  var_ids <- df %>%
    group_by(get(!!var_id)) %>%
    summarise(n = n_distinct(annee)) %>%
    ungroup() %>%
    filter(n >= nb_mini_annees) %>%
    set_names(c(var_id, "n")) %>%
    pull(get(!!var_id)) %>%
    as.character()

  df %>%
    filter(get(!!var_id) %in% var_ids)

  # var_ids <- df %>%
  #   group_by(!!var_id) %>%
  #     summarise(n = n_distinct(annee)) %>%
  #   ungroup() %>%
  #   filter(n >= nb_mini_annees) %>%
  #   pull(!!var_id) %>%
  #   as.character()
  #
  # df %>%
  #   filter(var_id %in% var_ids)

  }
