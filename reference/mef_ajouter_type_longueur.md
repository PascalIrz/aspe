# Ajouter le type de longueur à la passerelle

ex : totale, fourche.

## Usage

``` r
mef_ajouter_type_longueur(df)
```

## Arguments

- df:

  Dataframe "passerelle" mettant en correspondance les identifiants des
  différentes tables. df doit contenir une variable "lop_id"
  (identifiant du lot).

## Value

La passerelle complétée.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- passerelle %>%
mef_ajouter_type_longueur()
} # }
```
