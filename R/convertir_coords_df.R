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
#' @importFrom purrr transpose reduce
#'
#' @export
#'
#' @examples
#' \dontrun{
#' coords_wgs84 <- convertir_coords_df (df = stations,
#'     var_x = "sta_coordonnees_x", var_y = "sta_coordonnees_y",
#'     var_crs_initial = "typ_code_epsg", crs_sortie = 4326)
#' }
#'
convertir_coords_df <- function(df,
                                var_x,
                                var_y,
                                var_crs_initial,
                                crs_sortie = 4326)
{

  data <- df %>% purrr::transpose()

  res <- list()

  for(i in 1:length(data)) {

    res[[i]] <- convertir_coords_ligne(ligne_liste = data[i],
                                       var_x = var_x,
                                       var_y = var_y,
                                       var_crs_initial = var_crs_initial)

  }

  res <- res %>%
    reduce(rbind) %>%
    as.data.frame()


}
