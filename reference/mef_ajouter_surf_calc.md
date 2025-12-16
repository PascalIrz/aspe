# Rajouter la superficie échantillonnée calculée pour chaque opération à la passerelle

Rajouter la superficie échantillonnée calculée pour chaque opération à
la passerelle

## Usage

``` r
mef_ajouter_surf_calc(df)
```

## Arguments

- df:

  Dataframe "passerelle" mettant en correspondance les identifiants des
  différentes tables. df doit contenir une variable "ope_id"
  (identifiant de l'opération de pêche).

## Value

La passerelle à laquelle a été ajoutée la superficie échantillonnée qui
est une valeur calculée stockée dans le champ ope_surf_calculee de la
table operation.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- mef_ajouter_surf_calc(df = passerelle)
} # }
```
