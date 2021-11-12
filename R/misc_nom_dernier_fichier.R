#' Obtenir le nom du plus récent des fichiers
#'
#' @description Recherche dans un répertoire, parmi les fichiers dont le nom correspond au pattern,
#'     celui qui est le dernier créé.
#'
#' @param repertoire Chaîne de caractère. Chemin vers le répertoire à explorer.
#' @param pattern Chaîne de caractère (exprtession régulière) à retrouver dans le nom du fichier.
#' @param recursive Booléen (TRUE ou FALSE). Indique si la recherche inclut les sous-répertoire.
#'     La valeur par défaut est FALSE donc les sous-répertoires sont exclus de la recherche.
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
misc_nom_dernier_fichier <-
  function(repertoire, pattern, recursive = FALSE) {
    list.files(
      path = repertoire,
      pattern = pattern,
      full.names = TRUE,
      recursive = recursive
    ) %>%
      file.info() %>%
      filter(ctime == max(ctime)) %>%
      rownames()

}
