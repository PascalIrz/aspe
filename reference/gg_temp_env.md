# Produire le graphique de l'évolution temporelle de facteurs environnementaux moyens comparés entre les sites de présence et d'absence des espèces

Produire le graphique de l'évolution temporelle de facteurs
environnementaux moyens comparés entre les sites de présence et
d'absence des espèces

## Usage

``` r
gg_temp_env(
  df,
  parametres = NA,
  log_y = c("surface_bv", "distance_source", "pente", "largeur"),
  annee_debut = 1995,
  annee_fin = NA,
  y_libre = FALSE,
  coul_pres = "blue",
  coul_abs = "red"
)
```

## Arguments

- df:

  Le dataframe contenant les données avec les variables presence,
  parametre, valeur_parametre, annee

- parametres:

  Vecteur caractères. Les paramètre (ex : "altitude") représentés.

- log_y:

  Vecteur caractères. Les paramètre (ex : "altitude") représentés en
  échelle log. Par défaut, sa valeur est c('surface_bv',
  'distance_source', 'pente', 'largeur'), ce qui correspond aux
  paramètres dont la distribution de rapproche d'une log-normale.

- annee_debut:

  Entier. Année mini à représenter.

- annee_fin:

  Entier. Année maxi à représenter.

- y_libre:

  TRUE/FALSE (valeur par défaut). Les axes des ordonnées peuvent (TRUE)
  différer selon les espèces, ce qui permet un "zoom", ou bien être les
  mêmes pour toutes, ce qui permet de les comparer les unes aux autres.

- coul_pres:

  Caractère. Couleur ou code hexadécimal couleur pour les présences.

- coul_abs:

  Caractère. Couleur ou code hexadécimal couleur pour les absences.

## Value

Une liste dont les éléments sont des graphiques ggplot2 (un par
paramètre).

## Examples

``` r
if (FALSE) { # \dontrun{
mes_graphiques <- gg_temp_env(df = mon_df, log_y = c('surface_bv', 'distance_source'))
mes_graphiques[[1]]
} # }
```
