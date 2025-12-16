# Pivoter le dataframe pour regrouper les variables environnementales sur 2 colonnes

Pivoter le dataframe pour regrouper les variables environnementales sur
2 colonnes

## Usage

``` r
mef_pivoter_var_env(df)
```

## Arguments

- df:

  Dataframe avec les variables distance_mer, temp_janvier, etc.

## Value

Le dataframe pivoté, en forme pour les graphiques avec ggplot2.

## Examples

``` r
if (FALSE) { # \dontrun{
df_long <- mef_pivoter_var_env(df_court)
mes_graphiques[[1]]
} # }
```
