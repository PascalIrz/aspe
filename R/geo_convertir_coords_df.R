#' Extraire des coordonnées homogénéisées à partir d'un dataframe contenant des coordonnées en différents CRS
#'
#' Les observations (lignes du df) sont reprojetées dans le CRS de sortie.
#'
#' Le dataframe d'entrée doit comprendre des colonnes indiquant longitude, latitude,
#'     code EPSG du système de coordonnées, identifiant de l'observation.
#'
#' @param df Dataframe contenant au moins trois colonnes pour les coordonnées et le
#'     système de coordonnées (CRS)
#' @param var_x Colonne qui contient la longitude.
#' @param var_y Colonne qui contient la latitude.
#' @param var_crs_initial Colonne qui contient le numéro EPSG du CRS de chacune
#'     des observations (par exemple des stations ou des points).
#' @param crs_sortie Numérique entier. Le numéro EPSG du CRS de sortie. Par défaut
#'     c'est en WGS84 (crs = 4326).
#' @param var_id Colonne qui contient les identifiants des objets (=lignes) de df.
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
#' # Comme la table station de la base Aspe ne comprend pas le code EPSG mais un code de CRS interne,
#' # il faut le rajouter avant la conversion.
#' data <- station %>%
#'   left_join(y = ref_type_projection, by = c("sta_typ_id" = "typ_id"))
#'
#' coords_wgs84 <- geo_convertir_coords_df (df = data,
#'     var_x = sta_coordonnees_x,
#'     var_y = sta_coordonnees_y,
#'     var_id = sta_id,
#'     var_crs_initial = typ_code_epsg)
#' }
geo_convertir_coords_df <- function(df,
                                    var_x,
                                    var_y,
                                    var_id,
                                    var_crs_initial,
                                    crs_sortie = 4326)
{
  # gestion quotations
  var_x <- deparse(substitute(var_x))
  var_y <- deparse(substitute(var_y))
  var_id <- enquo(var_id)
  var_crs_initial <- enquo(var_crs_initial)

  # vecteur des codes EPSG des CRS
  crss <- df %>%
    pull(!!var_crs_initial) %>%
    as.integer() %>%
    unique

  # création du dataframe vide
  converted_coords <- data.frame()

  # alimentation du dataframe
  # boucle sur les CRS. Pour chacun on effectue la conversion puis le tout est empilé
  # pas réussi à le faire avec purrr::map() ou apply()
  for (crs in crss)

  {
    sel_coords <- df %>%
      filter(typ_code_epsg == crs)

    coords <- sel_coords %>%
      st_as_sf(coords = c(var_x, var_y),
               crs = crs) %>%
      st_transform(crs = crs_sortie) %>%
      st_coordinates()

    ids <- sel_coords %>%
      select(!!var_id)

    sel_coords <- ids %>%
      cbind(coords)

    converted_coords <- converted_coords %>%
      rbind(sel_coords)

  }

  converted_coords

}
