# Filtrer les prélèvements

Filtrer les prélèvements

## Usage

``` r
mef_filtrer_id(
  df,
  tb,
  var_id,
  var_sta = NULL,
  var_pro = NULL,
  min_obs,
  max_na_cons = NULL,
  max_pro = NULL,
  max_chg = NULL
)
```

## Arguments

- df:

  data frame

- tb:

  data frame

- var_id:

  variable(s) identifiant les prélèvements

- var_sta:

  variable identifiant les points de prélèvements (optionnelle)

- var_pro:

  variable identifiant le protocole de pêche (optionnelle)

- min_obs:

  numerique définissant le nombre minimal d'observations par prélèvement

- max_na_cons:

  numerique définissant le nombre maximal de valeurs manquantes
  consécutives par prélèvement

- max_pro:

  numerique définissant le nombre maximal de protocoles de pêche par
  prélèvement

- max_chg:

  numerique définissant le nombre maximal de changement de protocole de
  pêche par prélèvement

## Value

df

## Examples

``` r
if (FALSE) { # \dontrun{
df <- mef_creer_passerelle() %>%
mef_ajouter_ope_date() %>%
mef_ajouter_ope_saison() %>%
mef_ajouter_type_protocole()
tb <- def_attribut_id (df,
var_id = c(pop_id,saison),
var_tmp = annee,
var_pro = pro_libelle)
df_id <- mef_filtrer_id(df,
tb,
var_id = c(pop_id, saison),
var_sta = pop_id,
var_pro = pro_libelle,
min_obs = 10,
max_na_cons = 3,
max_pro = 1)
df_id <- mef_filtrer_id(df,
tb,
var_id = pop_id,
min_obs = 10,
max_na_cons = 3)
} # }
```
