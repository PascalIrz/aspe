#' Rajouter à l'objet sf des points de prélèvement les départements et (ou) les bassins auxquels
#'     ils appartiennent.
#'
#' @param points_geo Objet sf des points de prélèvement.
#' @param depts_geo Objet sf des polygones des départements.
#' @param bv_geo Objet sf des polygones des bassins versants (secteurs hydro ou autre).
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
#' geo_attr_dept_bv(depts_geo = shp_geoportail, bv_geo = secteurs_hydro_carthage)
#' }
geo_attr_dept_bv <-
  function(points_geo,
           depts_geo = NA,
           bv_geo = NA,
           crs_sortie = NA)

  {
    if (is.na(crs_sortie)) {
      crs_sortie <- st_crs(points_geo)

    } else {
      points_geo <- points_geo %>%
        st_transform(crs = crs_sortie)

    }

    if (!is.na(depts_geo)) {
      if (sf::st_crs(depts_geo) != crs_sortie)  {
        depts_geo <- depts_geo %>% st_transform(crs = crs_sortie)
      }

      points_geo <- points_geo %>%
        st_join(depts_geo)

    }

    if (!is.na(bv_geo)) {
      if (!is.na(bv_geo) &
          sf::st_crs(bv_geo) != crs_sortie)  {
        bv_geo <- bv_geo %>% st_transform(crs = crs_sortie)
      }

      points_geo <- points_geo %>%
        st_join(bv_geo)

    }

    points_geo

  }
