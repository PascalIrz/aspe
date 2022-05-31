#' Rechercher les dataframes dont le nom contient un pattern
#'
#' Cette fonction est utile pour explorer la base quand on a une idée de ce que son nom
#'     peut contenir. Par exemple pour les tables liées au point on peut chercher, parmi les noms
#'     des dataframes chargés, ceux contenant la chaîne de caractères "point".
#'
#' @param nom_contient Chaine de caractères recherchés parmi les noms des tables.
#'
#' @return Un vecteur caractères contenant les noms des tables.
#' @export
#'
#' @importFrom stringr str_subset
#' @importFrom purrr map
#'
#' @examples
#' \dontrun{
#' expl_trouver_table(nom_contient = "point")
#' }
expl_trouver_table <- function(nom_contient) {

  ######################################
  lister_dfs <- function()

  {
    objets <- ls(envir = globalenv())

    test_1obj <- function(obj) {
      is.data.frame(get(obj))
    }

    test <- map(.x = objets,
                .f = test_1obj)

    test %>%
      unlist()

  }

  #################################
  # Liste des dataframes
  mes_dfs <- ls(envir = globalenv())[lister_dfs()]

  # parmi les dfs, ceux dont le nom correspondent au pattern recherché
  mes_dfs %>%
    str_subset(pattern = nom_contient)

}
