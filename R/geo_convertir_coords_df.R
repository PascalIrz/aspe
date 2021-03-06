#' Convertir un dataframe contenant des coordonnées dans un autre CRS
#'
#' @param df Dataframe contenant au moins trois colonnes pour les coordonnées et le
#'     système de coordonnées (CRS)
#' @param var_x Caractère. Nom de la colonne qui contient la longitude.
#' @param var_y Caractère. Nom de la colonne qui contient la latitude.
#' @param var_crs_initial Caractère. Nom de la colonne qui contient le numéro EPSG du CRS de chacune
#'     des observations (par exemple des stations ou des points).
#' @param crs_sortie Numérique entier. Le numéro EPSG du CRS de sortie. Par défaut
#'     c'est en WGS84 (crs = 4326).
#'
#' @return Un dataframe à deux colonnes contenant les coordonnées dans le CRS de sortie.
#'
#' @importFrom dplyr pull filter
#' @importFrom sf st_as_sf st_transform st_coordinates
#'
#' @export
#'
#' @examples
#' \dontrun{
#' coords_wgs84 <- geo_convertir_coords_df (df = stations,
#'     var_x = "sta_coordonnees_x", var_y = "sta_coordonnees_y",
#'     var_crs_initial = "typ_code_epsg", crs_sortie = 4326)
#' }
#'
geo_convertir_coords_df <- function(df,
                                    var_x,
                                    var_y,
                                    var_crs_initial,
                                    crs_sortie = 4326)
{

  crss <- df %>%
    pull(var_crs_initial) %>%
    as.integer() %>%
    unique

  converted_coords <- data.frame()

  for(crs in crss)

    {

    sel_coords <- df %>%
      filter(typ_code_epsg == crs)

    coords <- sel_coords %>%
      sf::st_as_sf(coords = c(var_x, var_y), crs = crs) %>%
      sf::st_transform(crs = crs_sortie) %>%
      sf::st_coordinates()

    ids <- sel_coords %>%
      select(pop_id)

    sel_coords <- ids %>%
      cbind(coords)

    converted_coords <- converted_coords %>%
      rbind(sel_coords)

    }

  converted_coords

}
