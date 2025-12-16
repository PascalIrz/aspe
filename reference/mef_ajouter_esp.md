# Ajouter à un dataframe le code espèce à 3 lettres, son nom commun et scientifique

Les codes sont "historiques", hérités du Conseil Supérieur de la Pêche.

## Usage

``` r
mef_ajouter_esp(df)
```

## Arguments

- df:

  Dataframe "passerelle" mettant en correspondance les identifiants des
  différentes tables. La passerelle doit comprendre un champ avec le
  code taxon esp_id (typiquement, on utilise donc mef_ajouter_esp()
  après mef_ajouter_lots())

## Value

La passerelle complétée.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- mef_creer_passerelle() %>%
mef_ajouter_lots() %>%
mef_ajouter_esp()
} # }
```
