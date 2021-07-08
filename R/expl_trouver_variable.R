#' Rechercher les variables dont le nom contient un pattern
#'
#' @param nom_contient Chaine de caractères recherchés parmi les noms des variables
#'     des différentes tables.
#'
#' @return Un dataframe indiquant les noms de variables contenant la chaine recherchée
#'     ainsi que leur table d'appartenance.
#' @export
#'
#' @importFrom purrr map
#' @importFrom stringr str_subset str_replace_all
#' @importFrom dplyr mutate
#'
#' @examples
#' \dontrun{
#' expl_trouver_variable(nom_contient = "ope")
#' }
expl_trouver_variable <- function(nom_contient) {

  # collecte de tous les objets de l'environnement
  all_obj <- ls(envir = globalenv()) %>%
    map(.f = get)
  # test pour trouver ceux qui sont des dataframes
  test_df <- map(.x = all_obj,
                 .f = is.data.frame) %>%
    as.data.frame %>%
    t()
  # sélection et nommage des dataframes
  dfs <- all_obj[test_df]
  dfs_names <- all_names[test_df]

  # collecte des noms des colonnes
  dfs_col_names <- map(.x = dfs,
                       .f = colnames)

  names(dfs_col_names) <- dfs_names

  # sélection de ceux qui contiennent la chaine de caractère recherchée
  dfs_select <- map(.x = dfs_col_names,
                    .f = str_subset,
                    pattern = nom_contient) %>%
    unlist

  df <- names(dfs_select)
  names(dfs_select) <- NULL

  # mise en forme
  data.frame(table = df,
             variable = dfs_select) %>%
    mutate(table = str_replace_all(table,
                                   pattern = "[:digit:]",
                                   replacement = ""))

}
