# Table de passage entre les identifiants des espèces

Tableau indiquant les correspondances entre les identifiants esp_id de
la base Aspe, asp_code_alternatif à trois lettres, taxref, sandre et le
nom latin.

## Usage

``` r
data(data_passerelle_taxo)
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 266
rows and 5 columns.

## Examples

``` r
# \donttest{
data(data_passerelle_taxo)
data_passerelle_taxo# }
#> # A tibble: 266 × 5
#>    esp_code_sandre esp_code_alternatif esp_code_taxref esp_id esp_nom_latin     
#>    <chr>           <chr>                         <dbl>  <int> <chr>             
#>  1 3277            ECR                          184448     79 Astacidea         
#>  2 3286            CAT                          418786     53 Caridina typus    
#>  3 3227            OZI                              NA     NA NA                
#>  4 2870            0811A300                     777681     NA NA                
#>  5 3282            CRG                           18422     75 Crangon crangon   
#>  6 5202            HYC                              NA     NA NA                
#>  7 2110            CCO                           67058     56 Cyprinus carpio   
#>  8 2111            CCU                           67058     57 Cyprinus carpio   
#>  9 3289            MAC                          348416    133 Macrobrachium     
#> 10 3291            MAA                          418790    132 Macrobrachium aus…
#> # ℹ 256 more rows
```
