# Produire le graphique de la dynamique du peuplement pour chacun des points de prélèvement du dataframe

Produire le graphique de la dynamique du peuplement pour chacun des
points de prélèvement du dataframe

## Usage

``` r
gg_colo_ext_pops(df, interactif = FALSE, largeur = 6, hauteur = 5, ...)
```

## Arguments

- df:

  Le dataframe contenant les données, mises en forme par la fonction
  [`mef_colo_ext_pops()`](https://pascalirz.github.io/aspe/reference/mef_colo_ext_pops.md)

- interactif:

  Valeur logique définissant le type de graphique produit: statique
  (FALSE) ou interactif (TRUE)

- largeur, hauteur:

  dimensions des graphiques interactifs

- ...:

  arguments passés à la fonction
  [`ggiraph::opts_sizing()`](https://davidgohel.github.io/ggiraph/reference/opts_sizing.html)

## Value

Une liste contenant les graphiques produits avec ggplot2.

## Examples

``` r
if (FALSE) { # \dontrun{
mes_graphiques <- gg_colo_ext_pops(df = mon_df)
mes_graphiques[[1]]
} # }
```
