#' Homogénéiser les systèmes de coordonnées
#'
#' La base Aspe comprend deux systèmes de coordonnées : Lambert II étendu et
#'     Lambert 93. Il s'agit ici d'homogénéiser.
#'
#' @param df Le dataframe contenant des coordonnées (longitude et latitude)
#'     ainsi qu'une colonne avec le système de coordonnées identifié par son code ESPG.
#' @param crs_initial Caractère. Nom de la colonne qui contient le numéro EPSG du CRS de chacune
#'     des observations (par exemple des stations ou des points).
#' @param x Caractère. Nom de la colonne qui contient la longitude.
#' @param y Caractère. Nom de la colonne qui contient la latitude.
#' @param crs_sortie Numérique entier. Le numéro EPSG du CRS de sortie. Par défaut
#'     c'est en WGS84 (crs = 4326).
#'
#' @return Le dataframe spatial (classe sf) dans le CRS choisi en sortie. Par défaut
#'     c'est en WGS84 (crs = 4326).
#'
#' @export
#'
#' @examples
#'
#' \dontrun{
#' homogeneiser_coordonnees(df = station, crs_initial = "typ_code_epsg",
#'     x = "sta_coordonnees_x", y = "sta_coordonnees_y", crs_sortie = 4326)
#' }
homogeneiser_coordonnees <- function(df, crs_initial, x, y, crs_sortie = 4326) {

df %>%
    group_by(crs_initial) %>%
    sf::st_as_sf(coords = c(x, y), crs = crs_initial) %>%
    sf::st_transform(crs = crs_sortie)

}
