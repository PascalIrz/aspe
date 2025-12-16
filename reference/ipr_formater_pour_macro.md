# Mettre les données nécessaires au calcul de l'IPR au format requis en entrée de la macro Excel de calcul de l'indice

Mettre les données nécessaires au calcul de l'IPR au format requis en
entrée de la macro Excel de calcul de l'indice

## Usage

``` r
ipr_formater_pour_macro(
  passerelle,
  date_debut,
  date_fin = format(Sys.Date(), "%d/%m/%Y")
)
```

## Arguments

- passerelle:

  Dataframe mettant en correspondance les identifiants des différentes
  tables.

- date_debut:

  Date de début de la période à extraire au format jj/mm/aaaa.

- date_fin:

  Date de fin de la période à extraire au format jj/mm/aaaa. Par défaut
  c'est la date du jour où la fonction est exécutée.

## Value

Un dataframe au format souhaité, mais dont les colonnes doivent ensuite
être renommées avec la fonction renommer_pour_macro().

## Examples

``` r
if (FALSE) { # \dontrun{
data_macro <- ipr_formater_pour_macro(passerelle = passerelle, date_debut = '01/01/2020')
} # }
```
