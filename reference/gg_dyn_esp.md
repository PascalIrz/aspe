# Produire un graphique de synthèse de la dynamique d'une population sur une localité

Représentation pour une espèce sur une station ou un point de
prélèvement.

## Usage

``` r
gg_dyn_esp(
  df,
  var_id_espece,
  var_id_station,
  espece_sel,
  station_sel = NULL,
  seuil = 0,
  graph_long_mediane = TRUE,
  graph_effectif = TRUE,
  graph_mois = TRUE
)
```

## Arguments

- df:

  Dataframe contenant les données, avec les variables permettant
  d'identifier l'espèce et la station/point, ainsi que "mei_taille",
  "ope_date", "mois" et "annee".

- var_id_espece:

  Variable servant à identifier les espèces.

- var_id_station:

  Variable servant à identifier les stations ou points.

- espece_sel:

  Caractère. Espèce sélectionnée.

- station_sel:

  Caractère. Point ou station sélectionné.

- seuil:

  Numérique entre 0 et 1. Seuil de pourcentile pour exclure des
  histogrammes les rares individus de longueur extrême. Par défaut fixé
  à 0 donc toutes les observations sont conservées. S'il est fixé à
  0.01, les 1% des longueurs les plus élevées sont exclus des
  histogrammes. Ces individus sont en revanche conservés sur les autres
  graphiques.

- graph_long_mediane:

  Booléen. Afficher le diagramme des longueurs médianes ? Par défaut
  TRUE.

- graph_effectif:

  Booléen. Afficher le diagramme des longueurs effectifs ? Par défaut
  TRUE.

- graph_mois:

  Booléen. Afficher le diagramme du mois de prospection ? Par défaut
  TRUE.

## Value

Le graphique ggplot2 avec les distributions en taille par année et
l'évolution temporelle de la longueur médiane et des effectifs capturés.

## Examples

``` r
if (FALSE) { # \dontrun{
# chargement packages
library(tidyverse)
library(aspe)

# chargement données
load("raw_data/aspe_mei.RData") # mesures individuelles
load("raw_data/aspe_sauf_mei.RData") # autres tables

# assemblage du dataframe
data <- mef_creer_passerelle() %>%
  mef_ajouter_lots() %>%
  mef_ajouter_esp() %>% # pour avoir les noms communs des espèces
  mef_ajouter_ope_date() %>% # pour avoir l'année et le mois
  mef_ajouter_libelle() %>%
  mef_ajouter_mei() %>%
  select(pop_libelle,
         annee,
         ope_date,
         esp_nom_commun,
         lop_effectif,
         mei_taille)

# graphique
gg_dyn_esp(df = data,
               var_id_espece = esp_nom_commun,
               var_id_station = pop_libelle,
               espece_sel = "Goujon commun",
               station_sel = "La Moder à Drusenheim")
} # }


```
