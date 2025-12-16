# Ajouter à la passerelle la qualification de la donnée

ex : Correcte / Incorrecte / Incertaine.

## Usage

``` r
mef_ajouter_qualification(df)
```

## Arguments

- df:

  Dataframe "passerelle" mettant en correspondance les identifiants des
  différentes tables. df doit contenir une variable "ope_id"
  (identifiant de l'opération de pêche).

## Value

La passerelle complétée.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- passerelle %>%
mef_ajouter_qualification()
} # }
```
