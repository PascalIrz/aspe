# Sélectionner et nommer les colonnes au format requis en entrée de la macro Excel de calcul de l'indice

Sélectionner et nommer les colonnes au format requis en entrée de la
macro Excel de calcul de l'indice

## Usage

``` r
ipr_renommer_pour_macro(data, fichier_macro)
```

## Arguments

- data:

  Le dataframe contenant les données, issu de la fonction
  formater_pour_macro().

- fichier_macro:

  Caractère. Chemin vers le fichier Excel de la macro.

## Value

Le dataframe

## Examples

``` r
if (FALSE) { # \dontrun{
data_macro <- ipr_renommer_pour_macro(data = data_macro,
fichier_macro = "raw_data/CalculIPRv1.3.xls")
} # }
```
