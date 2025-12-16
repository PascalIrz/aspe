# Graphique de la série chronologique de métriques de diversité à l'échelle du peuplement sur une station ou un groupe de stations

Cette fonction peut renvoyer soit: (i) un dataframe avec les métriques
calculées (Richesse taxonomique, Effectif total, Indices de Shannon et
Equitabilité), (ii) ou à un graphique `ggplot2` en treillis avec les
différentes métriques, pour une station ou un groupe de stations.

## Usage

``` r
gg_temp_indic_div(
  df_captures,
  var_id_sta,
  var_metrique_div,
  station_sel = NULL,
  nb_colonnes = 2,
  id_sta_max_caract = 25,
  print_metrique = F
)
```

## Arguments

- df_captures:

  Dataframe contenant les données des effectifs capturés par taxons. Il
  doit contenir les variables "effectif" et "annee", ainsi que trois
  variables pour d'identifier les stations (ou points de prélèvement)
  pour les calculs.

- var_id_sta:

  Variable servant à identifier les stations ou points. Cette variable
  donnera les étiquettes des lignes du graphique.

- var_metrique_div:

  Variable donnant le nom de la colonne des métriques (ex :
  metriques_div).

- station_sel:

  Vecteur caractère indiquant les points ou stations à sélectionner.

- nb_colonnes:

  Entier. Nombre de colonnes du graphique utilisé pour dans le cas d'un
  graphique pour une station. Par défaut nb_colonnes = 2.

- id_sta_max_caract:

  Entier. Nombre maximum de caractères dans l'identifiant de la station,
  au-delà duquel il sera découpé pour tenir sur plusieurs lignes. Par
  défaut c'est 25 caractères.

- print_metrique:

  Valeur logique. Si TRUE, le dataframe des métriques est retourné. Si
  FALSE (par défaut), le graphique `ggplot2` est retourné.

## Value

Un graphique `ggplot2` ou un dataframe.

## Examples

``` r
if (FALSE) { # \dontrun{
# preparation donnees
captures <-
  mef_creer_passerelle() %>% # création passerelle
  mef_ajouter_ope_date() %>%  # ajout date et année
  mef_ajouter_lots() %>%  # ajout des lots (effectif par espèce)
  mef_ajouter_surf_calc() %>%  # ajout surfaces prospectées pour calcul des densités
  mef_ajouter_libelle() %>% # ajout libellé du point de prélèvement
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
# graphiques ggplot
gg_temp_indic_div(df_captures = captures,
                    var_id_sta = pop_libelle,
                    var_metrique_div = metrique_div,
                    station_sel =c("LA BERENCE A GAVRAY", "La Berre à Portel-des-Corbières"),
                    print_metrique = F)

gg_temp_indic_div(df_captures = captures,
                    var_id_sta = pop_libelle,
                    var_metrique_div = metrique_div,
                    station_sel =c("La Berre à Portel-des-Corbières"),
                    nb_colonnes = 2,
                    print_metrique = F)

# dataframe des metriques
gg_temp_indic_div(df_captures = captures,
                    var_id_sta = pop_libelle,
                    var_metrique_div = metrique_div,
                    station_sel =c("LA BERENCE A GAVRAY", "La Berre à Portel-des-Corbières"),
                    print_metrique = T)

gg_temp_indic_div(df_captures = captures,
                    var_id_sta = pop_libelle,
                    var_metrique_div = metrique_div,
                    station_sel =c("La Berre à Portel-des-Corbières"),
                    nb_colonnes = 2,
                    print_metrique = T)
} # }
```
