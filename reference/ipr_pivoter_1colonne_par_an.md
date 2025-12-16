# Convertir une table des IPR du format long au format large

On appelle format large la présentation des données avec une colonne par
année. S'il y a plusieurs valeurs de l'IPR pour un même point une année
donnée, la valeur retournée sera la moyenne.

## Usage

``` r
ipr_pivoter_1colonne_par_an(ipr_df)
```

## Arguments

- ipr_df:

  Le dataframe au format long contenant les IPR, issi de la fonction
  extraire-ipr()

## Value

Un dataframe contenant les mêmes données, mais agencé avec une colonne
par année.

## Examples

``` r
if (FALSE) { # \dontrun{
ipr_large_df <- ipr_pivoter_1colonne_par_an(ipr_df = mon_df_ipr)
} # }
```
