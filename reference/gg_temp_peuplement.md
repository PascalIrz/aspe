# Graphique pour représenter l'évolution des effectifs de taxons au cours du temps

La fonction permet de visualiser la dynamique des taxons dans le
peuplement sur une station. Les taxons sont représentés par des points,
proportionnels aux effectifs capturés. Les protocoles utilisés sont
également représentés. La fonction nécessite que le dataframe
"ref_espece" de la base ASPE soit chargé.

## Usage

``` r
gg_temp_peuplement(
  df,
  var_id_sta = pop_id,
  var_libelle_sta = pop_libelle,
  var_especes = esp_code_alternatif,
  interactif = FALSE,
  largeur = 6,
  hauteur = 5,
  taxons_ipr = "plain",
  longueur_libelle = 20,
  ...
)
```

## Arguments

- df:

  Dataframe contenant les données des effectifs capturés pour les
  taxons. Il doit contenir des variables "effectif" et "annee" ainsi
  qu'une variable permettant d'identifier la station ou le point de
  prélèvement. Il doit également contenir une variable 'pro_libelle'
  correspondant aux protocoles (à ajouter avec la
  [`aspe::mef_ajouter_type_protocole()`](https://pascalirz.github.io/aspe/reference/mef_ajouter_type_protocole.md)).

- var_id_sta:

  Nom de la variable servant à identifier les stations ou points. Cette
  variable donnera les étiquettes du graphique.

- var_libelle_sta:

  Nom de la variable servant à identifier les libellés des stations ou
  points. Cette variable donnera les étiquettes du graphique.

- var_especes:

  Variable indiquant l'espèce ou le code espèce.

- interactif:

  Valeur logique: statique (FALSE) produit avec `ggplot2` ou interactif
  (TRUE) produit avec `ggiraph`.

- largeur, hauteur:

  Numériques. Dimensions des graphiques interactifs.

- taxons_ipr:

  Caractère. Indique comment distinguer sur le graphique les noms des
  espèces participant à l'IPR. Peut prendre les valeurs "bold",
  "italic", "bold.italic", ou par défaut "plain".

- longueur_libelle:

  Numérique. longueur maximale (en nombre de caractères) du titre du
  graphique

- ...:

  arguments passés à la fonction
  [`ggiraph::opts_sizing()`](https://davidgohel.github.io/ggiraph/reference/opts_sizing.html)

## Value

Retourne une liste de graphiques pour les stations ou points, graphiques
statiques `ggplot2` ou interactifs `ggiraph`.

## Examples

``` r
if (FALSE) { # \dontrun{
captures <- data %>%
 group_by(
   sta_id,
   pop_id,
   ope_id,
   ope_date,
   annee,
   esp_code_alternatif,
   ope_surface_calculee,
   pop_libelle
 ) %>%
 summarise(effectif = sum(lop_effectif, na.rm = TRUE)) %>%
 ungroup() %>%
 mef_ajouter_type_protocole() %>%
 filter(pro_libelle %in% c("Pêche complète à un ou plusieurs passages",
                           "Pêche partielle par points (grand milieu)",
                           "Pêche par ambiances",
                           "Pêche partielle sur berge"))

id_sta_sel <- captures %>% filter(!is.na(sta_id)) %>% pull(sta_id) %>% unique() %>% sample(5)

captures_sel <- captures %>% filter(sta_id %in% id_sta_sel)

graph_interactif <- gg_temp_peuplement(captures_sel, interactif = T)
graph_interactif[[1]]

graph_static <- gg_temp_peuplement(captures_sel, interactif = F)
graph_static[[1]]

} # }
```
