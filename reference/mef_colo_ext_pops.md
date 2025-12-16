# Formater le tableau des captures sur un ensemble de points

L'objectif est de visualiser la dynamique du peuplement. Permet
d'identifier les taxons qui apparaissent ou disparaissent ainsi que les
abondances.

## Usage

``` r
mef_colo_ext_pops(df, id_point = NULL)
```

## Arguments

- df:

  Dataframe contenant les captures et contenant les champs pop_id,
  pop_libelle, annee, esp_code_alternatif, effectif.

- id_point:

  Caractère. Identifiant du ou des point(s) au sens du champ pop_id de
  la base Aspe. Par défaut, tous les identifiants présents dans le
  tableau df sont pris en compte.

## Value

Un dataframe pour un ensemble de points de prélèvement qui est mis en
forme pour produire des graphiques avec la fonction gg_colo_ext_pop().

## Examples

``` r
if (FALSE) { # \dontrun{
colo_ext_mon_point <- captures %>%
    mef_colo_ext_pops()
} # }
```
