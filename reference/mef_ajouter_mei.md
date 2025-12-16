# Ajouter les mesures individuelles à la passerelle

Ajouter les mesures individuelles à la passerelle

## Usage

``` r
mef_ajouter_mei(df)
```

## Arguments

- df:

  Dataframe "passerelle" mettant en correspondance les identifiants des
  différentes tables. df doit contenir le champ "lop_id" qui sert à la
  jointure avec la table mesure_individuelle.

## Value

La passerelle complétée.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- passerelle %>%
mef_ajouter_mei()
} # }
```
