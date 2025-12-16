# Dénombrer le nb d'opérations avec chaque paramètre environnemental renseigné pour chacune des espèces

Dénombrer le nb d'opérations avec chaque paramètre environnemental
renseigné pour chacune des espèces

## Usage

``` r
mef_compter_pres_abs_env(df)
```

## Arguments

- df:

  Dataframe avec les variables valeur_parametre, esp_code_alternatif,
  presence, parametre, annee, n.

## Value

Un dataframe de 4 colonnes correspondant à l'espèce, au paramètre et aux
nombres de présence et d'absence.

## Examples

``` r
if (FALSE) { # \dontrun{
df_nb_pres_abs_par_parametre_env <- mef_compter_pres_abs_env(df = df_captures_et_env)
} # }
```
