# Ajouter les lots de poissons capturés à la passerelle

Ajouter les lots de poissons capturés à la passerelle

## Usage

``` r
mef_ajouter_lots(df)
```

## Arguments

- df:

  Dataframe "passerelle" mettant en correspondance les identifiants des
  différentes tables. df doit contenir une variable "pre_id"
  (identifiant du prélèvement élémentaire).

## Value

La passerelle complétée.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- passerelle %>%
mef_ajouter_lots()
} # }
```
