# Graphique de la série chronologique des abondances ou densités par espèce

Graphique de la série chronologique des abondances ou densités par
espèce

## Usage

``` r
gg_temp_abondance(df, var_espece, var_abondance, nb_colonnes = 6)
```

## Arguments

- df:

  Dataframe contenant les données. Il doit contenir au moins lz variable
  "annee" ainsi que deux autres, l'une pour l'espèce et l'autre pour
  l'abondance ou la densité.

- var_espece:

  Nom de la variable contenant les identifiants des espèces.

- var_abondance:

  Nom de la variable contenant les valeurs d'abondance ou de densité

- nb_colonnes:

  Entier. Nombre (maxi) de colonnes de graphiques s'il y a plusieurs
  stations. Par défaut nb_colonnes = 4.

## Value

Un graphique ggplot2.

## Examples

``` r
if (FALSE) { # \dontrun{
dept_densites_an %>%
filter(dept == mon_dept) %>%
  gg_temp_abondance(var_espece = esp_nom_commun,
                    var_abondance = densite_qd_pres_moy)
} # }
```
