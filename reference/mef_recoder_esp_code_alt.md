# Recodage des codes taxons 'esp_code_alternatif'

Recodage des codes taxons 'esp_code_alternatif'

## Usage

``` r
mef_recoder_esp_code_alt(df, type_recodage = "especes")
```

## Arguments

- df:

  Dataframe contenant la variable esp_code_alternatif'.

- type_recodage:

  Caractère, soit "especes" (par défaut), soit "ipr". Dans le premier
  cas, les codes taxons de sous-espèces ou écotype sont recodés à
  l'espèce. Dans le second cas, les codes taxons sont recodés selon la
  taxonomie de l'IPR, ici conformément au script
  'IPR_v1.0.3_calc_consult.R' téléchargé depuis
  <https://seee.eaufrance.fr/> le 24/04/2023.

## Value

Le dataframe mis à jour.

## Examples

``` r
if (FALSE) { # \dontrun{
# Calcul des captures par espèces pour chaque opération de pêche
# chargement des packages
library(dplyr)
library(aspe)

# chargement des données (à adapter)
load(file = "raw_data/tables_sauf_mei_2023_04_07_09_39_32.RData")

# création du tableau
captures <- mef_creer_passerelle() %>%
 mef_ajouter_lots() %>%
 mef_ajouter_esp() %>%
 mef_recoder_esp_code_alt() %>%
 group_by(ope_id, esp_code_alternatif) %>%
 summarise(effectif = sum(lop_effectif)) %>%
 ungroup()
} # }
```
