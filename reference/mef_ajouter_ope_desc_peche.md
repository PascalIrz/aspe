# Rajouter à la passerelle les variables de description de la pêche pour chaque opération (quand disponible).

Ces variables sont issues de la table "operation_description_peche".

## Usage

``` r
mef_ajouter_ope_desc_peche(df)
```

## Arguments

- df:

  Dataframe "passerelle" mettant en correspondance les identifiants des
  différentes tables.

## Value

La passerelle à laquelle ont été ajoutés les variables environnementales

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- mef_ajouter_ope_desc_peche(df = passerelle)
} # }
```
