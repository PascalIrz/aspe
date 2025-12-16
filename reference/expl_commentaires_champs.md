# Obtenir les commentaires qui donnent la signification des champs des tables

Obtenir les commentaires qui donnent la signification des champs des
tables

## Usage

``` r
expl_commentaires_champs(fichier_dump)
```

## Arguments

- fichier_dump:

  Le chemin vers le fichier d'extension .sql (décompressé) ou .sql.gz
  (archive).

## Value

Un dataframe avec pour chacun des champs sa table d'appartenance et sa
signification.

## Examples

``` r
if (FALSE) { # \dontrun{
expl_commentaires_champs(fichier_dump = "../raw_data/dump.sql")
} # }

```
