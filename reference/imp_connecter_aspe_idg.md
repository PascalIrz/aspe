# Démarre une connexion à ASPE sur la BDD IDG (OFB)

Fonction pour se connecter à la BDD ASPE en utilisant les paramètres de
connexion stockés dans l'environnement R (fichier `.Renviron`).

## Usage

``` r
imp_connecter_aspe_idg()
```

## Value

Connexion. Renvoie une erreur si connexion impossible.

## Examples

``` r
if (FALSE) { # \dontrun{
bdd_aspe <- imp_connecter_aspe_idg()

} # }
```
