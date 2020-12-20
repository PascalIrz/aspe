#' Lire les lignes du dump SQL de la base Aspe
#'
#' @param fichier_dump Le chemin vers le fichier d'extension .sql (décompressé) ou
#'     .sql.gz (archive).
#'
#' @return Une liste de chaînes de caractères avec autant d'éléments que de lignes sur le dump.
#' @export
#'
#'
#' @examples
#'
#' \dontrun{
#' lignes_dump <- lire_lignes_dump_sql (fichier_dump = "../raw_data/dump.sql")
#' }
#'
#'
lire_lignes_dump_sql <- function(fichier_dump) {

  # lecture brute du fichier texte

  readLines(fichier_dump, encoding = "UTF-8")

}
