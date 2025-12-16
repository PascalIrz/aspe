# Sous-échantillonner parmi les absences

La comparaison entre les sites de présence et d'absence d'une espèce n'a
de sens quer si leur nombre est comparable. IL ne sert à rien d'avoir
l'altitude de 100 000 sites où le saumon est absent si l'on n'a que 1000
sites où il est présent. On allège donc le dataframe en tirant
aléatoirement autant d'opérations d'absence qu'il y a de présence.

## Usage

``` r
mef_ssech_abs(df, seed = 123)
```

## Arguments

- df:

  Dataframe avec les variables valeur_parametre, esp_code_alternatif,
  presence, parametre, n.

- seed:

  Numérique. La racine du générateur de nombres aléatoires pour le
  tirage.

## Value

Un dataframe issu de df mais avec moins de lignes.

## Examples

``` r
if (FALSE) { # \dontrun{
df_allege <- mef_ssech_abs(df = df_pres_abs_env)
} # }
```
