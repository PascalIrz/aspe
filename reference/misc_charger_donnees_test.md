# Charger un extrait de la base Aspe qui permet d'effectuer des tests

Ces données servent aussi aux vignettes.

## Usage

``` r
misc_charger_donnees_test()
```

## Value

Les dataframes dans l'environnement de travail.

## Examples

``` r
if (FALSE) { # \dontrun{
# chargement des données
misc_charger_donnees_test()

# vérification que les dataframes sont bien accessibles
ls()

# assemblage du jeu de données
passerelle <- aspe::mef_creer_passerelle()
} # }
```
