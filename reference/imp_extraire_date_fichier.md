# Obtenir la date du dump SQL de la base Aspe

Obtenir la date du dump SQL de la base Aspe

## Usage

``` r
imp_extraire_date_fichier(fichier, date = "modification")
```

## Arguments

- fichier:

  Le chemin vers le fichier.

- date:

  Date souhaitée, soit "creation", soit "modification" (par défaut).

## Value

La date de création ou de modification.

## Examples

``` r
if (FALSE) { # \dontrun{
date-dump <- imp_extraire_date_fichier(fichier = "../raw_data/dump.sql",
date = "creation")
} # }

```
