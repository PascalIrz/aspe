# Rajouter à la passerelle la date et l'année de chaque opération.

Rajouter à la passerelle la date et l'année de chaque opération.

## Usage

``` r
mef_ajouter_ope_date(df)
```

## Arguments

- df:

  Dataframe "passerelle" mettant en correspondance les identifiants des
  différentes tables. df doit contenir une variable "ope_id"
  (identifiant de l'opération de pêche).

## Value

La passerelle à laquelle ont été ajoutés la date et l'année.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- mef_ajouter_ope_date(df = passerelle)
} # }
```
