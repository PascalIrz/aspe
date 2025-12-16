# Données sur la protection réglementaire des espèces (poissons et écrevisses)

Tableau avec une ligne par espèce protégée et une colonne indiquant le
texte de référence.

## Usage

``` r
data(data_protection_especes)
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 30
rows and 2 columns.

## Examples

``` r
# \donttest{
data("data_protection_especes")
data_protection_especes# }
#> # A tibble: 30 × 2
#>    esp_code_alternatif texte_protection                                         
#>    <chr>               <chr>                                                    
#>  1 LPP                 Arrêté du 8 décembre 1988 fixant la liste des espèces de…
#>  2 LPM                 Arrêté du 8 décembre 1988 fixant la liste des espèces de…
#>  3 LPR                 Arrêté du 8 décembre 1988 fixant la liste des espèces de…
#>  4 GRC                 Arrêté du 8 décembre 1988 fixant la liste des espèces de…
#>  5 COR                 Arrêté du 8 décembre 1988 fixant la liste des espèces de…
#>  6 SAT                 Arrêté du 8 décembre 1988 fixant la liste des espèces de…
#>  7 TRF                 Arrêté du 8 décembre 1988 fixant la liste des espèces de…
#>  8 TRC                 Arrêté du 8 décembre 1988 fixant la liste des espèces de…
#>  9 TRL                 Arrêté du 8 décembre 1988 fixant la liste des espèces de…
#> 10 TRM                 Arrêté du 8 décembre 1988 fixant la liste des espèces de…
#> # ℹ 20 more rows
```
