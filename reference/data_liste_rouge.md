# Données sur le statut liste rouge des espèces de poissons

Tableau avec en lignes desespèces de poissons et en colonnes les données
sur le statut liste rouge de ces espèces.

## Usage

``` r
data(data_liste_rouge)
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 106
rows and 8 columns.

## Examples

``` r
# \donttest{
data(data_liste_rouge)
data_liste_rouge# }
#> # A tibble: 106 × 8
#>    esp_nom_latin      esp_code_taxref esp_code_alternatif endemisme statut_lr_fr
#>    <chr>                        <dbl> <chr>               <chr>     <fct>       
#>  1 Apricaphanius ibe…          958733 APE                 Non       RE          
#>  2 Valencia hispanica           68817 CPV                 Non       RE          
#>  3 Acipenser sturio             66775 EST                 Non       CR          
#>  4 Alosa alosa                  66967 ALA                 Non       CR          
#>  5 Anguilla anguilla            66832 ANG                 Non       CR          
#>  6 Cottus petiti               159453 CHP                 Oui       CR          
#>  7 Barbatula leoparda          920139 LOL                 Oui       EN          
#>  8 Misgurnus fossilis           67534 LOE                 Non       EN          
#>  9 Petromyzon marinus           66315 LPM                 Non       EN          
#> 10 Squalius laietanus          459646 CHC                 Non       EN          
#> # ℹ 96 more rows
#> # ℹ 3 more variables: tendance_lr_fr <chr>, statut_lr_int <fct>,
#> #   statut_lr_eu <fct>
```
