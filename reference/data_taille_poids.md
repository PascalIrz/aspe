# Relations taille - poids

Tableau des relations taille calculées depuis la base ASPE ainsi que
celles issues de Fishbase. Pour ces dernières, les paramètres a et b ont
été moyennés par espèce en distinguant longueur fourche et longueur
totale. NB : Les unités sont les mêmes que dans la base de référence
Fishbase, à savoir pour la taille (en fait la longueur), le cm, et pour
le poids (en fait la masse), le gramme. Si l'on utilise les données de
la base ASPE, il faut donc opérer une conversion de longueur car
celles-ci sont en mm.

## Usage

``` r
data(data_taille_poids)
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 204
rows and 7 columns.

## Examples

``` r
# \donttest{
data(data_taille_poids)
data_taille_poids# }
#> # A tibble: 204 × 7
#>    esp_code_alternatif esp_nom_latin   tlo_libelle       a     b source n_etudes
#>    <chr>               <chr>           <chr>         <dbl> <dbl> <chr>     <dbl>
#>  1 ABH                 Leucaspius del… Totale      0.00743  3.12 Fishb…        2
#>  2 ABL                 Alburnus albur… Totale      0.00711  3.14 Fishb…       19
#>  3 ALA                 Alosa alosa     Totale      0.00483  3.20 Fishb…        7
#>  4 ALF                 Alosa fallax    Totale      0.00514  3.09 Fishb…       13
#>  5 ANG                 Anguilla angui… Totale      0.00109  3.14 Fishb…       54
#>  6 APP                 Austropotamobi… Totale      0.0373   2.96 ASPE          1
#>  7 APR                 Zingel asper    Totale      0.0196   2.69 ASPE          1
#>  8 ASP                 Leuciscus aspi… Totale      0.00527  3.24 Fishb…        2
#>  9 ASP                 Leuciscus aspi… Totale      0.0246   2.58 ASPE          1
#> 10 BAF                 Barbus barbus   Fourche     0.0115   2.94 ASPE          1
#> # ℹ 194 more rows
```
