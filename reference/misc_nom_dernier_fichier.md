# Obtenir le nom du plus récent des fichiers

Recherche dans un répertoire, parmi les fichiers dont le nom correspond
au pattern, celui qui est le dernier créé.

## Usage

``` r
misc_nom_dernier_fichier(repertoire = NULL, pattern, recursive = FALSE)
```

## Arguments

- repertoire:

  Chaîne de caractère. Chemin vers le répertoire à explorer. Par défaut
  c'est le répertoire de travail.

- pattern:

  Chaîne de caractère (exprtession régulière) à retrouver dans le nom du
  fichier.

- recursive:

  Booléen (TRUE ou FALSE). Indique si la recherche inclut les
  sous-répertoire. La valeur par défaut est FALSE donc les
  sous-répertoires sont exclus de la recherche.

## Value

Le nom du plus récent des fichiers respectant la condition indiquée au
pattern.

## Examples

``` r
if (FALSE) { # \dontrun{
mon_fichier <- misc_nom_dernier_fichier(repertoire = "raw_data", pattern = "RData$")
} # }
```
