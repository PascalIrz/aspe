# Importer une table de correspondance entre les codes espèces 3 lettres Aspe et leurs codes Taxref

La donnée ne provient pas de la base ASPE, mais de l'API SANDRE. Les
données importées ont été filtrées afin de ne pas récupérer
l'intégralité du référentiel "Appellation de taxons". Seuls

## Usage

``` r
imp_corres_aspe_taxref(
  url =
    "https://api.sandre.eaufrance.fr/referentiels/v1/apt.csv?compress=true&filter=<Filter><IS><Field>CodeAlternatifAp/OrgCdAlternatif</Field><Value>ASPE</Value></IS></Filter>"
)
```

## Arguments

- url:

  Caractère. URL du jeu de données à télécharger. Par défaut
  "https://api.sandre.eaufrance.fr/referentiels/v1/apt.csv?compress=true&
  filter=CodeAlternatifAp/OrgCdAlternatifASPE"

## Value

Dataframe. Table de correspondence.

## Examples

``` r
if (FALSE) { # \dontrun{
taxref <- imp_corres_aspe_taxref()
} # }
```
