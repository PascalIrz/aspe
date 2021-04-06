#' Créer un objet sf avec polygones du découpage hydrographique à partir de geo.data.gouv.fr
#'
#' @param url Texte. URL de téléchargement de la couche shapefile.
#' @param repertoire Texte. Chemin vers le répertoire de stockage et de décompression.
#'
#' @return Un objet sf multi polygones.
#' @export
#'
#' @importFrom sf read_sf
#' @importFrom utils download.file unzip
#'
#' @examples
#' \dontrun{
#' bv <- geo_creer_polygone_bassins(repertoire = "raw_data")
#' }
geo_creer_polygone_bassins <- function(url = NA, repertoire = "raw_data") {

  if(is.na(url))

  {

    url <- paste0("https://transcode.geo.data.gouv.fr/links/5e2a1e78fa4268bc2553885a/",
                  "downloads/5e2a2238770bbe77978b084b?format=SHP&projection=Lambert93")
  }

  if(!dir.exists(repertoire)) dir.create(repertoire)


  fichier_zip <- paste0(repertoire, "/bv.zip")

  download.file(url = url,
                destfile = fichier_zip,
                mode = "wb")

  unzip(zipfile = fichier_zip, exdir = repertoire)

  shp_bv <- paste0(repertoire, "/ZoneHydro_FXX.shp")

  bv <- sf::read_sf(shp_bv)

  bv

}
