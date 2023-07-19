## Traits poissons

# Ce tableau a été constitué "à la main" par T. Oberdorff (IRD) et T. Vigneron (OFB). Il reste perfectible.

data_traits_bio <- readxl::read_xlsx("inst/extdata/species_traits.xlsx")



usethis::use_data(data_traits_bio, overwrite = T)

