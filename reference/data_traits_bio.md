# Données sommaires sur les espèces de poissons

Tableau d'une centaine de lignes correspondant aux espèces de poissons
référencées par leur code à trois lettres et de colonnes précisant le
statut de ces espèces ainsi que leur principaux habitats.

## Usage

``` r
data(data_traits_bio)
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 87
rows and 20 columns.

## Examples

``` r
# \donttest{
data(data_traits_bio)
data_traits_bio# }
#> # A tibble: 87 × 20
#>    esp_code_alternatif esp_nom_latin           esp_nom_commun   `acid tolerance`
#>    <chr>               <chr>                   <chr>            <chr>           
#>  1 BRE                 Abramis brama           Brème commune    intol           
#>  2 SPI                 Alburnoides bipunctatus Spirlin          intol           
#>  3 ABL                 Alburnus alburnus       Ablette          tol             
#>  4 ALA                 Alosa alosa             Grande alose     intol           
#>  5 ALF                 Alosa fallax            Alose feinte     intol           
#>  6 CDR                 Ambloplites rupestris   Crapet de roche  NA              
#>  7 PCH                 Ameiurus melas          Poisson-chat     tol             
#>  8 BBB                 Ameiurus nebulosus      Barbotte brune   tol             
#>  9 ANG                 Anguilla anguilla       Anguille europé… tol             
#> 10 ASP                 Leuciscus aspius        Aspe             intol           
#> # ℹ 77 more rows
#> # ℹ 16 more variables: `feeding habitat` <chr>, habitat <chr>,
#> #   `habitat (fiBS)` <chr>, `habitat degradation tolerance` <chr>,
#> #   `oxygen tolerance` <chr>, `reproduction habitat` <chr>,
#> #   `rheophily (habitat)` <chr>, salinity <chr>, `spawning habitat` <chr>,
#> #   `temperature tolerance` <chr>, `toxicity tolerance` <chr>,
#> #   `water quality tolerance` <chr>, migration <chr>, …
```
