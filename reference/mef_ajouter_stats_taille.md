# Ajouter les tailles (longueurs) mini, maxi, médiane et moyenne pour chaque espèce à chaque opération

La fonction fait appel à de nombreux dataframes de la base Aspe qui
doivent impérativement avoir été chargés auparavant
(mesure_individuelle, lots, operation, etc.). Elle n'opère pas de
distinction entre longueur totale et longueur fourche.

## Usage

``` r
mef_ajouter_stats_taille(df)
```

## Arguments

- df:

  Dataframe avec des variables espèce (esp_code_alternatif) et opération
  (ope_id).

## Value

La passerelle à laquelle ont été ajoutés les statistiques de tailles.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- mef_ajouter_stats_taille(passerelle = passerelle)
} # }
```
