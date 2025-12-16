# Rajouter à l'objet sf des points de prélèvement les départements et (ou) les bassins auxquels ils appartiennent.

Rajouter à l'objet sf des points de prélèvement les départements et (ou)
les bassins auxquels ils appartiennent.

## Usage

``` r
geo_attribuer(points_geo, poly_sf, crs_sortie = NA)
```

## Arguments

- points_geo:

  Objet sf des points qui se verront attribuer des poilygones.
  points_geo doit avoir un CRS.

- poly_sf:

  Objet sf des polygones à attribuer (ex: départements, secteurs hydro).

- crs_sortie:

  Numérique. Identifiant EPSG du CRS de sortie. Par défaut, c'est celui
  de points_geo.

## Value

L'bjet sf des points de prélèvement complété des informations sur les
départements et les bassins.

## Examples

``` r
if (FALSE) { # \dontrun{
points_geo <- points_geo %>%
geo_attribuer(poly_sf = secteurs_hydro_carthage)
} # }
```
