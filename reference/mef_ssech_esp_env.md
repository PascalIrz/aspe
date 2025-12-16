# Sous-échantillonner le df environnement et occurrences

La comparaison entre les sites de présence et d'absence d'une espèce n'a
de sens que si leur nombre est comparable. IL ne sert à rien d'avoir
l'altitude de 100 000 sites où le saumon est absent si l'on n'a que 100
sites où il est présent. On allège donc le dataframe en tirant
aléatoirement autant un nombre d'opérations déterminé par le minimum du
nb d'absences et de celui de présences. Le sous-échantillonnage est
contraint par année.

## Usage

``` r
mef_ssech_esp_env(df, seed = 123)
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
df_allege <- mef_ssech_esp_env(df = df_pres_abs_env)
} # }
```
