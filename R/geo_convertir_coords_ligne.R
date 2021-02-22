#' Convertir les coordonnées d'une ligne de dataframe dans un autre CRS
#'
#' @param ligne_liste Une ligne d'un dataframe qui a été convertie en liste
#' @param var_x Caractère. Nom de la colonne qui contient la longitude.
#' @param var_y Caractère. Nom de la colonne qui contient la latitude.
#' @param var_crs_initial Caractère. Nom de la colonne qui contient le numéro EPSG du CRS de chacune
#'     des observations (par exemple des stations ou des points).
#' @param crs_sortie Numérique entier. Le numéro EPSG du CRS de sortie. Par défaut
#'     c'est en WGS84 (crs = 4326).
#'
#' @return Un dataframe à deux colonnes et une seule ligne contenant les coordonnées
#'     dans le CRS de sortie.
#' @noRd
#'
#' @importFrom dplyr mutate
#' @importFrom sf st_as_sf st_crs st_transform
#'
#' @examples
#' \dontrun{
#' geo_convertir_coords_ligne(ligne_liste = station[1], var_x = "sta_coordonnees_x",
#'     var_y = "sta_coordonnees_y", var_crs_initial = "typ_code_epsg", crs_sortie = 4326)
#' }
#'
geo_convertir_coords_ligne <- function(ligne_liste,
                                   var_x,
                                   var_y,
                                   var_crs_initial,
                                   crs_sortie = 4326)

{

  val_var_crs_initial <- ligne_liste[[1]][var_crs_initial] %>% unlist()

  prov <- ligne_liste[[1]][c(var_x, var_y, var_crs_initial)] %>%
    as.data.frame() %>%
    mutate(crs_sortie = crs_sortie) %>%
    sf::st_as_sf(coords = c(var_x, var_y), crs = var_crs_initial)

  sf::st_crs(prov) <- val_var_crs_initial

  prov <- prov %>%
    sf::st_transform(crs = crs_sortie)

  coords <- sf::st_coordinates(prov)

  coords

}
