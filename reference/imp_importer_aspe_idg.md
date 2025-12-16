# Importer les tables ASPE à partir de la BDD IDG (OFB). Par défaut elles le sont toutes.

Importer les tables ASPE à partir de la BDD IDG (OFB). Par défaut elles
le sont toutes.

## Usage

``` r
imp_importer_aspe_idg(conn, tab_excl = NA, tab_select = NA, ...)
```

## Arguments

- conn:

  connexion à la BDD

- tab_excl:

  Vecteur caractère indiquant les éventuelles tables à ne pas importer.

- tab_select:

  Vecteur caractère indiquant les tables à importer. Prime sur tab_excl.

- ...:

  autre

## Value

Les dataframes correspondant à chacune des tables de la base (sauf
celles expurgées au préalable)

## Examples

``` r
if (FALSE) { # \dontrun{
bdd_aspe <- imp_connecter_aspe_idg()

imp_importer_aspe_idg(conn = bdd_aspe)

imp_deconnecter_aspe_idg(conn = bdd_aspe)
} # }
```
