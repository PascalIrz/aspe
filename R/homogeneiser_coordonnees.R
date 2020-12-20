#' Homogénéiser les systèmes de coordonnées
#'
#' La base Aspe comprend deux systèmes de coordonnées : Lambert II étendu et
#'     Lambert 93. Il s'agit ici d'homogénéiser.
#'
#' @param df Le dataframe contenant des coordonnées (sta_coordonnees_x et sta_coordonnees_y)
#'     ainsi qu'une colonne avec le système de coordonnées
#' @param crs_sortie Numérique. Le numéro EPSG du CRS de sortie. Les principaux sont :
#'     Lambert II Etendu : crs = 27572
#'     RGF93 / Lambert 93 : crs = 2154
#'
#' @return Le dataframe spatial (classe sf) dans le CRS choisi en sortie. Par défaut
#'     c'est en WGS84 (crs = 4326).
#' @export
#'
#' @examples
#'
#' \dontrun{
#' homogeneiser_coordonnees(df = station, crs_sortie = 4326)
#' }
homogeneiser_coordonnees <- function(df, crs_sortie = 4326) {

  df_l2 <- df %>%
    filter(typ_libelle_sandre == "Lambert II Etendu") %>%
    sf::st_as_sf(coords = c("sta_coordonnees_x", "sta_coordonnees_y"), crs = 27572) %>%
    sf::st_transform(crs_sortie)

  df_l93 <- df %>%
    filter(typ_libelle_sandre == "RGF93 / Lambert 93") %>%
    sf::st_as_sf(coords = c("sta_coordonnees_x", "sta_coordonnees_y"), crs = 2154) %>%
    sf::st_transform(crs_sortie)

  rbind(df_l2, df_l93)

}
