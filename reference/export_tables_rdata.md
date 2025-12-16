# Exporter les dataframes au format .RData

Exporter les dataframes au format .RData

## Usage

``` r
export_tables_rdata(repertoire = NA, n_fichiers_mei = 1)
```

## Arguments

- repertoire:

  Caractères. Chemin vers le répertoire où les fichiers seront écrits.

- n_fichiers_mei:

  Entier. Nombre de fichiers pour découper le dataframe des mesures
  individuelles.

## Value

Les fichiers sont sauvegardés dans le répertoire choisi. Si aucun chemin
n'est indiqué, ça sera dans un sous-répertoire "processed_data" du
répertoire de travail qui est créé au besoin. Par défaut (n_fichiers_mei
= 1) les fichiers sont au nombre de deux, l'un pour les mesures
individuelles et l'autre pour les autres tables. Ils sont respectivement
nommés mei_aaaa_mm_jj_hh_mm_ss (d'après les dates et heures de la
sauvegarde), et tables_sauf_mei_aaaa_mm_jj_hh_mm_ss. Si n_fichiers_mei
est supérieur à 1, il faudra ultérieurement empiler (ex avec rbind) les
différents dataframes mei pour reconstituer la table complète.

## Examples

``` r
if (FALSE) { # \dontrun{
export_tables_rdata()
} # }
```
