# Ajouter le type de protocole à la passerelle

ex : Indice Abondance Saumon. Nécessite d'avoir chargé les tables
"operation" et "ref_protocole".

## Usage

``` r
mef_ajouter_type_protocole(df)
```

## Arguments

- df:

  Dataframe "passerelle" mettant en correspondance les identifiants des
  différentes tables.

## Value

La passerelle complétée.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- passerelle %>%
mef_ajouter_type_protocole()
} # }
```
