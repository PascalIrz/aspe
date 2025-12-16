# Mettre un dataframe au format pour ls graphiques en radar.

La fonction radarchart() du package `fmsb` nécessite en entrée un
dataframe au format spécifique.

## Usage

``` r
mef_ipr_radar(metriques_df, pop_id)
```

## Arguments

- metriques_df:

  Un dataframe contenant les métriques par station et par année, produit
  par la fonction ipr_extraire_metriques().

- pop_id:

  Numérique entier. Identifiant du point de prélèvement (pop_id).

## Value

Un dataframe mis en forme.

## Examples

``` r
if (FALSE) { # \dontrun{
mef_ipr_radar <- ipr_mef_radar(metriques_df = metriques_22, pop_id = 41964)
} # }
```
