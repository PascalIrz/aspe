# Ajouter à la passerelle les numéros de départements.

Si le code commune de la station est renseigné dans la table station,
ses deux premiers caractères indiquent le département. S'il est manquant
mais renseigné dans la table point_prelevement, c'est cette information
qui est utilisée. Malgré tout l'information est manquantes dans certains
cas

## Usage

``` r
mef_ajouter_dept(df)
```

## Arguments

- df:

  Dataframe "passerelle" mettant en correspondance les identifiants des
  différentes tables. La passerelle doit comprendre des colonnes
  "sta_id" et "pop_id".

## Value

La passerelle complétée par le département.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- passerelle %>%
mef_ajouter_dept()
} # }
```
