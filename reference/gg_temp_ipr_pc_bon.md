# Produire un graphique du pourcentage de stations en bon état au plan IPR sur un jeu de stations, en fonction de l'année

Produire un graphique du pourcentage de stations en bon état au plan IPR
sur un jeu de stations, en fonction de l'année

## Usage

``` r
gg_temp_ipr_pc_bon(ipr_df, titre = NA)
```

## Arguments

- ipr_df:

  Dataframe contenant les données, issu de la fonction extraire_ipr().

- titre:

  Caractère. Titre du graphique.

## Value

Le graphique issu de ggplot2.

## Examples

``` r
if (FALSE) { # \dontrun{
gg_temp_ipr_pc_bon(ipr_df = data_56,
titre = "Morbihan")
} # }
```
