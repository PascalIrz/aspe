# Graphique de la série chronologique des IPR

La fonction utilise les référentiel "classe_ipr" et "classe_ipr_plus" de
la base Aspe qui doivent donc être chargés auparavant et complétés par
les codes couleurs avec ipr_completer_classes_couleur().

## Usage

``` r
gg_temp_metriq(
  df_metriques,
  var_id_sta,
  var_nom_metrique,
  var_valeur_metrique,
  station_sel = NA,
  sup_500m = FALSE,
  nb_colonnes = 5,
  max_axe_y = 10,
  inv_y = TRUE,
  annee_facteur = FALSE,
  type_graphique = "courbes",
  df_classes = classe_ipr
)
```

## Arguments

- df_metriques:

  Dataframe contenant les données IPR. Il doit contenir des variables
  "ipr" et "annee" ainsi qu'une variable permettant d'identifier la
  station ou le point de prélèvement.

- var_id_sta:

  Variable servant à identifier les stations ou points. Cette variable
  donnera les étiquettes du graphique.

- var_nom_metrique:

  Variable contenant les noms des métriques (ex : dio, dti).

- var_valeur_metrique:

  Variable numérique contenant les valeurs des métriques.

- station_sel:

  Vecteur caractère indiquant les points ou stations à sélectionner.

- sup_500m:

  Booléen. Indique si les stations sont situées à des altitudes
  inférieures (sup_500m = FALSE, par défaut) ou bien supérieures à 500m
  car les seuils de classe se qualité varient selon l'altitude. Comme ce
  paramètre est unique pour l'ensemble des stations (ou points)
  représentées, il importe de s'assurer qu'elles sont toutes soit
  au-dessus, soit en-dessous de 500m.

- nb_colonnes:

  Entier. Nombre (maxi) de colonnes de graphiques s'il y a plusieurs
  stations. Par défaut nb_colonnes = 5.

- max_axe_y:

  Numérique. Limite supérieure de l'axe des ordonnées. Par défaut
  max_axe_y = 40.

- inv_y:

  Booléen. Indique l'axe des ordonnées pointe vers le bas (TRUE, par
  défaut) ou vers le haut. NB pour l'IPR, plus l'indice est faible plus
  la qualité est élevée. C'est l'inverse pour l'IPR+.

- annee_facteur:

  Booléen. Indique si la variable annee doit être transformée en
  facteur. Parfois utile pour la mise en forme de l'axe des abscisses
  (années).

- type_graphique:

  Caractère. Peut prendre les valeurs "courbes" ou "barres" selon le
  type de graphique souhaité.

- df_classes:

  Dataframe contenant les limites de classes. Exemple : classe_ipr.

## Value

Un graphique ggplot2.

## Examples

``` r
if (FALSE) { # \dontrun{
classe_ipr <- classe_ipr %>%
  ipr_completer_classes_couleur()

ipr_data %>%
  gg_temp_metriq(var_id_sta = pop_libelle,
                 station_sel = mes_pops,
                 var_nom_metrique = metrique,
                 var_valeur_metrique = valeur,
                 nb_colonnes = 4,
                 max_axe_y = 15,
                 inv_y = FALSE,
                 type_graphique = "barres",
                 df_classes = classe_ipr)
} # }
```
