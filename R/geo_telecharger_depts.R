#' Télécharger les contours des départements
#'
#' Cette fonction télécharge depuis la plateforme data.gouv.fr une couche simplifiée
#'     des contours des départements et la décompresse.
#'
#' @param url URL de téléchargement.
#' @param repertoire Chemin vers le répertoire où le fichier sera stocké.
#'
#' @importFrom utils download.file unzip
#'
#' @return Le shapefile des contours de départements.
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://www.data.gouv.fr/fr/datasets/r/3096e551-c68d-40ce-8972-a228c94c0ad1"
#' geo_telecharger_depts(url = url, repertoire = "raw_data")
#' }
geo_telecharger_depts <- function(url, repertoire) {

  # Téchargement du shapefile des contours des départements
  fichier_destination <- paste0(repertoire, "/departements.zip")

  download.file(url = url,
                destfile = fichier_destination,
                mode = "wb")

  unzip(zipfile = fichier_destination,
        exdir = "raw_data")

}
