# Aggréger les richesses par entité hydrographique

Calculer à partir des données Aspe le nombre d'espèces différentes
recensées par Zone HYdro, Sous-secteur Hydro, Secteur Hydro ou Région
hydro.

## Usage

``` r
geo_aggr_richesse(
  ope_geo_data,
  echelle = c("Zone_Hydro", "Sous_Secteur_Hydro", "Secteur_Hydro", "Region_Hydro"),
  bassin_geo_poly
)
```

## Arguments

- ope_geo_data:

  Objet de classe sf contenant les captures par opération.

- echelle:

  Caractère. Au choix entre "ZoneHydro", "SousSecteurHydro",
  "SecteurHydro" et "RegionHydro".

- bassin_geo_poly:

  Objet de classe sf contenant les polygones délimitant les entités
  hydrographiques.

## Value

Un dataframe avec les richesses par entité hydrographique.

## Details

Comme la fonction effectue une jointure entre les inventaires et les
entités hydrographiques, il faut que les deux objets géographiques aient
au moins un nom de champ en commun.

## Examples

``` r
if (FALSE) { # \dontrun{
richesse_par_unite_spatiale <- geo_aggr_richesse(ope_geo_data = data_geo,
echelle = "Secteur_Hydro",
bassin_geo_poly = bv_simp)
} # }
```
