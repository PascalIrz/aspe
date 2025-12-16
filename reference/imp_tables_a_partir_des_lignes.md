# Importer des tables à partir des lignes du dump de la base Aspe

Importer des tables à partir des lignes du dump de la base Aspe

## Usage

``` r
imp_tables_a_partir_des_lignes(lignes_dump, tables_a_extraire = NA)
```

## Arguments

- lignes_dump:

  Nom de la liste contenant les lignes du dump.

- tables_a_extraire:

  Un vecteur contenant les noms des tables à extraire. Par défaut toutes
  les tables sont extraites, ce qui peut prendre du temps inutilement.

## Value

Les dataframes correspondant à chacune des tables de la base.

## Examples

``` r
if (FALSE) { # \dontrun{
imp_tables_a_partir_des_lignes(lignes_dump = lignes_autres_tables)
} # }

```
