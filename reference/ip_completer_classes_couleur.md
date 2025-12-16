# Ajouter les codes couleurs aux classes IPR

Ajouter les codes couleurs aux classes IPR

## Usage

``` r
ip_completer_classes_couleur(
  df_classes_ip,
  var_numero_classe = cli_classe,
  var_libelle_classe = cli_libelle
)
```

## Arguments

- df_classes_ip:

  Dataframe contenant les intitulés des classes, typiquement le
  dataframe classe_ipr de la base Aspe.

- var_numero_classe:

  Variable contenant les numéros de classes de 1 (meilleur état) à 5 (le
  pire).

- var_libelle_classe:

  Variable contenant les libellés de classes.

## Value

Le dataframe complété. La colonne ajoutée est "classe_couleur".

## Examples

``` r
if (FALSE) { # \dontrun{
classe_ipr_plus <- classe_ipr_plus %>%
  ip_completer_classes_couleur(var_numero_classe = cip_classe,
                               var_libelle_classe = cip_libelle)
} # }
```
