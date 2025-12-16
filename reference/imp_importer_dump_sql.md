# Importer le dump SQL de la base Aspe

Importer le dump SQL de la base Aspe

## Usage

``` r
imp_importer_dump_sql(fichier_dump)
```

## Arguments

- fichier_dump:

  Le chemin vers le fichier d'extension .sql (décompressé) ou .sql.gz
  (archive).

## Value

Les dataframes correspondant à chacune des tables de la base.

## Examples

``` r
if (FALSE) { # \dontrun{
imp_importer_dump_sql(fichier_dump = "../raw_data/dump.sql")
} # }

```
