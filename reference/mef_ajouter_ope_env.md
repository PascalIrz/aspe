# Rajouter les variables environnementales pour chaque opération à la passerelle (quand disponible)

Ces variables sont en premier lieu renseignées depuis la table
"operation_ipr", faute de quoi elles sont complétées depuis la table
"point_prelevement".

## Usage

``` r
mef_ajouter_ope_env(df)
```

## Arguments

- df:

  Dataframe "passerelle" mettant en correspondance les identifiants des
  différentes tables.

## Value

La passerelle à laquelle ont été ajoutés les variables
environnementales.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- mef_ajouter_ope_env(df = passerelle)
} # }
```
