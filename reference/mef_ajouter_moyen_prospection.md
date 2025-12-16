# Ajouter à la passerelle le moyen de prospection

Ex : A pied / En bateau. Les modalités sont précisées dans la table
ref_moyen_prospection.

## Usage

``` r
mef_ajouter_moyen_prospection(df)
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
mef_ajouter_moyen_prospection()
} # }
```
