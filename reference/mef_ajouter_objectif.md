# Ajouter à la passerelle l'objectif de l'opération

Par objectif, on entent la contribution à un réseau (DCE, RCS, RRP,
etc.), le suivi de poopulations, des études, du suivi de restauration,
etc. Les modalités sont précisées dans la table ref_objectif.

## Usage

``` r
mef_ajouter_objectif(df)
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
mef_ajouter_objectif()
} # }
```
