# Rechercher les dataframes dont le nom contient un pattern

Cette fonction est utile pour explorer la base quand on a une idée de ce
que son nom peut contenir. Par exemple pour les tables liées au point on
peut chercher, parmi les noms des dataframes chargés, ceux contenant la
chaîne de caractères "point".

## Usage

``` r
expl_trouver_table(nom_contient)
```

## Arguments

- nom_contient:

  Chaine de caractères recherchés parmi les noms des tables.

## Value

Un vecteur caractères contenant les noms des tables.

## Examples

``` r
if (FALSE) { # \dontrun{
expl_trouver_table(nom_contient = "point")
} # }
```
