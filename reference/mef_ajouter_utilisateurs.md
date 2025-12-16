# Ajouter à la passerelle les utilisateurs sur les opérations

Ces utilisateurs sont le créateur et la personne qui a effectué la
dernière modification. Ils sont identifiés par leur adresse email.

## Usage

``` r
mef_ajouter_utilisateurs(df)
```

## Arguments

- df:

  Dataframe "passerelle" mettant en correspondance les identifiants des
  différentes tables.

## Value

La passerelle complétée.

## Examples

``` r
if (FALSE) { # \dontrun{
passerelle <- mef_creer_passerelle() %>%
mef_ajouter_utilisateurs()
} # }
```
