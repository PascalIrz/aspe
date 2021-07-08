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
expl_trouver_variable <-
  function(nom_contient) {

    # collecte de tous les objets de l'environnement
    fun <- function(envir = parent.frame()) ls(envir = envir)

    all_names <- fun(.GlobalEnv)

    all_obj <- map(.x = all_names,
                   .f = get)
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

    # noms des variables contenant la chaine recherchée
    variables <- dfs_col_names %>%
      unlist()

    selection <- variables %>%
      str_detect(nom_contient)

    selected_variables <- variables[selection]

    # mise en forme et nettoyage
    df <- names(selected_variables) # les noms sont ceux des dataframes

    final <- data.frame(table = df,
                        variable = selected_variables) %>%
      mutate(table = str_replace_all(table,
                                     pattern = "[:digit:]",
                                     replacement = ""))

    rownames(final) <- NULL

    final

  }
