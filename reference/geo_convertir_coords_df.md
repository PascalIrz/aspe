# Extraire des coordonnées homogénéisées à partir d'un dataframe contenant des coordonnées en différents CRS

Les observations (lignes du df) sont reprojetées dans le CRS de sortie.

## Usage

``` r
geo_convertir_coords_df(
  df,
  var_x,
  var_y,
  var_id,
  var_crs_initial,
  crs_sortie = 4326
)
```

## Arguments

- df:

  Dataframe contenant au moins trois colonnes pour les coordonnées et le
  système de coordonnées (CRS)

- var_x:

  Colonne qui contient la longitude.

- var_y:

  Colonne qui contient la latitude.

- var_id:

  Colonne qui contient les identifiants des objets (=lignes) de df.

- var_crs_initial:

  Colonne qui contient le numéro EPSG du CRS de chacune des observations
  (par exemple des stations ou des points).

- crs_sortie:

  Numérique entier. Le numéro EPSG du CRS de sortie. Par défaut c'est en
  WGS84 (crs = 4326).

## Value

Un dataframe à deux colonnes contenant les coordonnées dans le CRS de
sortie.

## Details

Le dataframe d'entrée doit comprendre des colonnes indiquant longitude,
latitude, code EPSG du système de coordonnées, identifiant de
l'observation.

## Examples

``` r
if (FALSE) { # \dontrun{
# Comme la table station de la base Aspe ne comprend pas le code EPSG mais un code de CRS interne,
# il faut le rajouter avant la conversion.
data <- station %>%
  left_join(y = ref_type_projection, by = c("sta_typ_id" = "typ_id"))

coords_wgs84 <- geo_convertir_coords_df (df = data,
    var_x = sta_coordonnees_x,
    var_y = sta_coordonnees_y,
    var_id = sta_id,
    var_crs_initial = typ_code_epsg)
} # }
```
