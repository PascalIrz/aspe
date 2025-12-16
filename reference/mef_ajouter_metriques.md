# Ajouter à une passerelle les métriques IPR observées, théoriques et leur contribution à l'indice IPR agrégé

Ajouter à une passerelle les métriques IPR observées, théoriques et leur
contribution à l'indice IPR agrégé

## Usage

``` r
mef_ajouter_metriques(df)
```

## Arguments

- df:

  Dataframe qui doit comprendre une colonnes "ope_id" (identifiant de
  l'opération de pêche).

## Value

Le dataframe passerelle complété par les métriques.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle_avec_metriques <- mef_ajouter_metriques(df = ma_passerelle)
} # }
```
