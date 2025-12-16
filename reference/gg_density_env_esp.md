# Produire le graphique des distributions comparées des paramètres environnementaux entre les sites de présence et d'absence d'une espèce.

Produire le graphique des distributions comparées des paramètres
environnementaux entre les sites de présence et d'absence d'une espèce.

## Usage

``` r
gg_density_env_esp(
  df,
  espece,
  parametres = NA,
  quantile_max = 0.99,
  log = c("surface_bv", "distance_source", "pente", "largeur"),
  coul_pres = "blue",
  coul_abs = "red"
)
```

## Arguments

- df:

  Le dataframe contenant les données environnementales et les présences
  / absences des espèces, par opération, avec les champs parametre,
  valeur_parametre, esp_code_alternatif, presence.

- espece:

  Caractère. Code trois lettres de l'espèce (ex : "BRO" pour le
  brochet).

- parametres:

  Vecteur caractère listant des paramètres environnementaux à
  représenter. Par défaut toutes les modalités de la variale "parametre"
  sont représentées.

- quantile_max:

  Numérique sur l'intervalle 0-1. Sert à exclure les valeurs extrêmes si
  nécessaire pour les représentations graphiques. Par exemple
  quantile_max = 0.99 signifie que les 1p100 des valeurs les plus
  élevées sont exclues.

- log:

  Vecteur caractère listant celles des variables environnementales pour
  lesquelles l'axe des absisses est en échelle log. Par défaut ce sont
  les variables surface_bv, distance_source, pente et largeur.

- coul_pres:

  Caractère. Couleur ou code hexadécimal couleur pour les présences.

- coul_abs:

  Caractère. Couleur ou code hexadécimal couleur pour les absences.

## Value

Une liste contenant un graphique par paramètre environnemental.

## Examples

``` r
if (FALSE) { # \dontrun{
mes_graphiques <- gg_density_env_esp(df = mon_df, espece = "BRO", quantile_max = 0.95,
log = c('surface_bv', 'distance_source'))
mes_graphiques[[1]]
} # }
```
