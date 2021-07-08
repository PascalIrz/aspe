#' Rechercher les dataframes dont le nom contient un pattern
#'
#' @param nom_contient Chaine de caractères recherchés parmi les noms des tables.
#'
#' @return Un vecteur caractères contenant les noms des tables.
#' @export
#'
#' @importFrom stringr str_subset
#'
#' @examples
#' \dontrun{
#' expl_trouver_table(nom_contient = "op")
#' }
expl_trouver_table <- function(nom_contient) {

  ls(envir = globalenv()) %>%
    str_subset(pattern = nom_contient)

}
