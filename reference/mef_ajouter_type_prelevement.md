# Ajouter à la passerelle le type de prélèvement élémentaire

Par type de prélèvement, on entend les modalités du tpe_libelle de la
table ref_type_prelevement_elementaire

## Usage

``` r
mef_ajouter_type_prelevement(df)
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
mef_ajouter_type_prelevement()
} # }
```
