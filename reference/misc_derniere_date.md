# Obtenir la date maxi saisie dans la base Aspe

Cette fonction extrait l'ensemble des champs contenant la chaîne de
caractère "date" dans l'ensemble des dataframes, en prend le max et
omettant les dates ultérieures à la date système.

## Usage

``` r
misc_derniere_date()
```

## Value

La date maximale trouvée

## Examples

``` r
if (FALSE) { # \dontrun{
date_max <- misc_derniere_date()
} # }
```
