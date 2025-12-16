# Gérer les limites de classes d'indices sur classe_ipr

Gérer les limites de classes d'indices sur classe_ipr

## Usage

``` r
gg_gerer_seuils_classes_ipr_int(df_classes, metriques = FALSE, sup_500m)
```

## Arguments

- df_classes:

  Dataframe d'entrée, en général classe_ipr

- metriques:

  Booléen. Si TRUE, on considère qu'il s'agit des métriques et non de
  l'indice agrégé. Les seuils sont donc divisés par 7 (le nombre des
  métriques dans l'IPR).

- sup_500m:

  Booléen. TRUE si les stations sont au-dessus de 500m d'altitude, ce
  qui change un seuil de classe IPR.

## Value

Le dataframe filtré selon l'altitude

## Examples

``` r
if (FALSE) { # \dontrun{
classe_classes_ipr <- classe_ipr %>%
  gg_gerer_seuils_classes_ipr_int()
} # }
```
