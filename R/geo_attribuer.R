#' Rajouter à l'objet sf des points de prélèvement les départements et (ou) les bassins auxquels
#'     ils appartiennent.
#' @param points_geo Objet sf des points qui se verront attribuer des poilygones.
#'     points_geo doit avoir un CRS.
#' @param poly_sf Objet sf des polygones à attribuer (ex: départements, secteurs hydro).
#' @param crs_sortie Numérique. Identifiant EPSG du CRS de sortie. Par défaut, c'est celui de
#'     points_geo.
#'
#' @return L'bjet sf des points de prélèvement complété des informations sur les départements
#'     et les bassins.
#' @export
#'
#' @importFrom dplyr left_join select
#' @importFrom sf st_crs st_transform st_join
#'
#' @examples
#' \dontrun{
#' points_geo <- points_geo %>%
#' geo_attribuer(poly_sf = secteurs_hydro_carthage)
#' }
geo_attribuer <-
  function(points_geo,
           poly_sf,
           crs_sortie = NA)

   {
    if (is.na(crs_sortie)) {
      crs_sortie <- st_crs(points_geo)

    } else {
      points_geo <- points_geo %>%
        st_transform(crs = crs_sortie)

            }

    # if (!is.na(depts_geo)) {
    #   if (sf::st_crs(depts_geo) != crs_sortie)  {
    #     depts_geo <- depts_geo %>% st_transform(crs = crs_sortie)
    #   }
    #
    #   points_geo <- points_geo %>%
    #     st_join(depts_geo)
    #
    # }


      if (sf::st_crs(poly_sf) != crs_sortie)

        {

        poly_sf <- poly_sf %>% st_transform(crs = crs_sortie)

        }

      points_geo <- points_geo %>%
        st_join(poly_sf)



    points_geo

  }
