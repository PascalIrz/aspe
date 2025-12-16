# Filtrer les opérations de pêche

Filtrer les opérations de pêche

## Usage

``` r
mef_filtrer_ope_id(
  df,
  var_id,
  var_tmp,
  var_surf = NULL,
  var_pro = NULL,
  var_pds = NULL,
  var_mei = NULL,
  var_pas = NULL,
  var_date = NULL,
  default = FALSE
)
```

## Arguments

- df:

  data frame

- var_id:

  variable(s) identifiant les prélèvements

- var_tmp:

  variable identifiant la date de prélèvement

- var_surf:

  variable identifiant la surface de pêche (optionnelle)

- var_pro:

  variable identifiant le protocole de pêche (optionnelle)

- var_pds:

  variable identifiant la présence d'information sur les poids
  (optionnelle)

- var_mei:

  variable identifiant la présence d'information sur les mesures
  individuelles (optionnelle)

- var_pas:

  variable identifiant le numéro du passage de pêche (optionnelle)

- var_date:

  variable identifiant une date additionnelle de pêche (optionnelle)

- default:

  logique

## Value

df

## Examples

``` r
if (FALSE) { # \dontrun{
df <- mef_creer_passerelle() %>%
mef_ajouter_ope_date() %>%
mef_ajouter_surf_calc() %>%
mef_ajouter_type_protocole() %>%
mef_filtrer_ope_id(var_id = pop_id,
var_tmp = annee,
var_surf = ope_surface_calculee,
var_pro = pro_libelle,
default=TRUE)
df <- mef_creer_passerelle() %>%
mef_ajouter_ope_date() %>%
mef_ajouter_surf_calc() %>%
mef_ajouter_type_protocole() %>%
mef_ajouter_poids() %>%
mef_filtrer_ope_id(var_id = pop_id,
var_tmp = annee,
var_surf = ope_surface_calculee,
var_pds = lop_poids)
df <- df %>%
mef_filtrer_ope_id(var_id = pop_id,
var_tmp = annee,
var_pro = pro_libelle,
default=TRUE)
} # }
```
