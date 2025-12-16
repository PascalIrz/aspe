# Ajouter le type de lot à la passerelle

    NB Les tables "lot_poissons" et "ref_type_lot" doivent avoir été chargées auparavant.

## Usage

``` r
mef_ajouter_type_lot(df)
```

## Arguments

- df:

  Dataframe "passerelle" mettant en correspondance les identifiants des
  différentes tables. df doit contenir une variable "lop_id"
  (identifiant du lot).

## Value

La passerelle complétée.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- passerelle %>%
mef_ajouter_type_lot()
} # }
```
