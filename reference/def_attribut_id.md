# Définir les attributs des prélèvements

Définir les attributs des prélèvements

## Usage

``` r
def_attribut_id(df, var_id, var_tmp, var_pro = NULL)
```

## Arguments

- df:

  dataframe

- var_id:

  variable(s) identifiant les prélèvements

- var_tmp:

  variable identifiant la date de prélèvement

- var_pro:

  variable identifiant le protocole de pêche (optionnelle)

## Value

tb data frame

## Examples

``` r
if (FALSE) { # \dontrun{
df <- mef_creer_passerelle() %>%
mef_ajouter_ope_date() %>%
mef_ajouter_type_protocole()
def_id <- def_attribut_id (var_id = pop_id,
var_tmp = annee,
var_pro = pro_libelle)
} # }
```
