# Ajouter à un dataframe les probabilités de présence des taxons IPR

Ces probabilités sont issues de Oberdorff et al. (2002) Development and
validation of a fish‐based index for the assessment of ‘river health’in
France. Freshwater Biology, 47(9), 1720-1734).

## Usage

``` r
mef_ajouter_proba_presence_ipr(df)
```

## Arguments

- df:

  Dataframe qui doit comprendre les colonnes "ope_id" et "esp_id".

## Value

Le dataframe complété avec les probabilités de présence.

## Details

Comme les codes taxonomiques actuels diffèrent de ceux de l'IPR, il peut
être nécessaire, avant d'utiliser la fonction
'mef_ajouter_proba_presence_ipr()', d'appliquer le référentiel
taxonomique IPR au dataframe au moyen de la fonction
'mef_recoder_esp_code_alt()'.

Le dataframe 'probabilite_presence_ipr' doit auparavant être chargé.

## Examples

``` r
if (FALSE) { # \dontrun{
df <- df %>%
mef_ajouter_proba_presence_ipr()
} # }
```
