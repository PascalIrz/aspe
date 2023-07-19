## Protection réglementaire

# La liste des espèces de poissons protégées sur l'ensemble du territoire national est donnée
# par l'arrêté du 8 décembre 1988 fixant la liste des espèces de poissons protégées sur l'ensemble
# du territoire national.
# Celle des écrevisses l'est par l'arrêté du 21 juillet 1983 relatif à la protection des écrevisses autochtones.

library(tidyverse)

data_protection_especes <- readxl::read_xlsx("inst/extdata/species_protection_status.xlsx")

usethis::use_data(data_protection_especes, overwrite = T)

