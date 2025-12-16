# Stoppe une connexion à ASPE sur la BDD IDG (OFB)

Fonction stoppe la connexion à la BDD

## Usage

``` r
imp_deconnecter_aspe_idg(conn)
```

## Arguments

- conn:

  nom de la connexion (objet) à stopper.

## Value

Aucune valeur.

## Examples

``` r
if (FALSE) { # \dontrun{
bdd_aspe <- imp_connecter_aspe_idg()

imp_deconnecter_aspe_idg(conn = bdd_aspe)
} # }
```
