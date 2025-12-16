# Ajouter le code EPSG du CRS à un dataframe

Ajouter le code EPSG du CRS à un dataframe

## Usage

``` r
geo_ajouter_crs(df, var_id_crs)
```

## Arguments

- df:

  Le dataframe de données.

- var_id_crs:

  Caractère. Le nom de la variable qui contient l'identifiant du CRS au
  sens de la variable "typ_id" du dataframe "ref_type_projection" de la
  base Aspe. selon la

## Value

Le dataframe complété.

## Examples

``` r
if (FALSE) { # \dontrun{
pop <- point_prelevement %>%
geo_ajouter_crs(var_id_crs = pop_typ_id)
} # }
```
