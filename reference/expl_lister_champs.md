# Lister les champs contenus dans les différents dataframes d'un fichier .RData

Lister les champs contenus dans les différents dataframes d'un fichier
.RData

## Usage

``` r
expl_lister_champs(rdata)
```

## Arguments

- rdata:

  Caractère. Chemin vers le fichier .RData

## Value

Un dataframe avec pour chacun des champs (colonnes) son nom et celui de
la table qui le contient

## Examples

``` r
if (FALSE) { # \dontrun{
synthese <- expl_lister_champs('processed_data/toutes_tables_aspe_sauf_mei.RData')
} # }
```
