# Scinder le dump en deux parties pour les traiter séparément et éviter de saturer la mémoire vive

ATTENTION : Si le chemin d'accès au fichier est trop long, il est
possible que la fonction retourne une erreur : Error in gzfile(file,
"wb") : argument 'description' incorrect In if (!nzchar(file))
stop("'file' must be non-empty string") : a condition a une longueur \>
1 et seul le premier élément est utilisé Dans ce cas, déplacez le dump
pour accourcir le chemin d'accès.

## Usage

``` r
imp_scinder_dump(fichier_dump, repertoire_sortie = NA)
```

## Arguments

- fichier_dump:

  Le chemin vers le fichier d'extension .sql (décompressé) ou .sql.gz
  (archive).

- repertoire_sortie:

  Le chemin vers le répertoire de sortie (qui doit avoir été créé
  auparavant). Par défaut c'est celui qui contient le dump.

## Value

Deux fichiers au format .RData contenant l'un les lignes de la table
mesure_individuelle et l'autre tout le reste du dump

## Examples

``` r
if (FALSE) { # \dontrun{
imp_scinder_dump(fichier_dump = "../raw_data/dump.sql")
} # }
```
