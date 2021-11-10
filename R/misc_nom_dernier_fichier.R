#' Obtenir le nom du plus récent des fichiers
#'
#' @param repertoire Chaîne de caractère. Chemin vers le répertoire à explorer.
#' @param pattern Chaîne de caractère (exprtession régulière) à retrouver dans le nom du fichier.
#' @param recursive Booléen (TRUE ou FALSE). Indique si la recherche inclut les sous-répertoire.
#'     La valeur par défaut est FALSE donc les sous-répertoires sont exclus de la recherche.
#'     Pour rappel les caractères ^ et $ sont respectivement les balises de début et de fin de chaîne.
#'
#' @return Le nom du plus récent des fichiers respectant la condition indiquée au pattern.
#' @export
#'
#' @importFrom dplyr filter
#'
#' @examples
#' \dontrun{
#' mon_fichier <- misc_nom_dernier_fichier(repertoire = "raw_data", pattern = "RData$")
#' }
misc_nom_dernier_fichier <- function(repertoire, pattern, recursive = FALSE) {

  list.files(path = repertoire,
             pattern = pattern,
             full.names = TRUE,
             recursive = recursive) %>%
    file.info() %>%
    filter(ctime == max(ctime)) %>%
    rownames()

}
