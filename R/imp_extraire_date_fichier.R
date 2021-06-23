#' Obtenir la date du dump SQL de la base Aspe
#'
#' @param fichier Le chemin vers le fichier.
#' @param date Date souhaitée, soit "creation", soit "modification" (par défaut).
#'
#' @return La date de création ou de modification.
#'
#'
#' @examples
#' \dontrun{
#' date-dump <- imp_extraire_date_fichier(fichier = "../raw_data/dump.sql",
#' date = "creation")
#' }
#'
#'
imp_extraire_date_fichier <- function(fichier, date = "modification") {

  x <- fichier %>%
    file.info()

  if (date == "modification")
  {
    x <- x$mtime
  }else{
    x <- x$ctime
  }

  x %>%
    format("%d/%m/%Y")

}
