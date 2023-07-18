### Code to prepare the internal data of the package ----


# The aim is to get a set of dataframes, as light as possible, allowing the vignettes and tests to work.
# This script is based on a raw copy of the ASPE SQL data tables previously parsed into R dataframes.
# The sensitive taxa of the ASPE database are removed.

# load packages ----
library(aspe)
library(dplyr)

# load comprehensive dataset ----
## all tables but individual measurements ----
rdata_tables <-
  misc_nom_dernier_fichier(repertoire = "../../raw_data/rdata",
                           pattern = "^tables")

load(file = rdata_tables)

## individual measurements ----
rdata_mei <-
  misc_nom_dernier_fichier(repertoire = "../../raw_data/rdata",
                           pattern = "^mei")

load(file = rdata_mei)

# remove sensitive taxa ----

# The aim here is to remove the vulnerable crayfishes entries from tables `lot_poissons`,
# `pathologie_lot` and `mesure_individuelle`, corresponding to the batches,
# batch pathologies and the individual measurements, respectively.

# The 3-letters codes for the vulnerable crayfishes are "APT", "ASA", "APP",
# but the species are identified by an internal code that has to be retrieved from table `ref_espece`.

crayfishes <- c("APT", "ASA", "APP")

# get the corresponding taxa ids
crayfish_codes <- ref_espece %>%
  filter(esp_code_alternatif %in% crayfishes) %>%
  pull(esp_id)

# Then we get the Ids of all the batches for these species, which are used for filtering.

crayfish_lop <- lot_poissons %>%
  filter(lop_esp_id %in% crayfish_codes) %>%
  pull(lop_id)

lot_poissons <- lot_poissons %>%
  filter(!lop_esp_id %in% crayfish_codes)

pathologie_lot <- pathologie_lot %>%
  filter(!pal_lop_id %in% crayfish_lop)

mesure_individuelle <- mesure_individuelle %>%
  filter(!mei_lop_id %in% crayfish_lop)

# restrict dataset in time and space ----

passerelle <- mef_creer_passerelle()

# filter the dataset to keep only surveys
# after 2006
# in 2 departements
# within the rhp network

# a restricted dataset
data <- passerelle %>%
  mef_ajouter_dept() %>%
  mef_ajouter_objectif() %>%
  mef_ajouter_ope_date() %>%
  filter(stringr::str_detect(obj_libelle, 'RHP'),
    annee > 2006,
    dept == "22") %>%
  mef_ajouter_lots() %>%
  mef_ajouter_mei()

my_stas <- unique(data$sta_id)
my_pops <- unique(data$pop_id)
my_opes <- unique(data$ope_id)
my_pres <- unique(data$pre_id)
my_lops <- unique(data$lop_id)
my_meis <- unique(data$mei_id)

# filtering the tables
station <- station %>%
  filter(sta_id %in% my_stas)

point_prelevement <- point_prelevement %>%
  filter(pop_id %in% my_pops)

operation <- operation %>%
  filter(ope_id %in% my_opes)

operation_ipr <- operation_ipr %>%
  filter(opi_ope_id %in% my_opes)

operation_description_peche <- operation_description_peche %>%
  filter(odp_ope_id %in% my_opes)

operation_donnees_environnementales <- operation_donnees_environnementales %>%
  filter(ode_ope_id %in% my_opes)

operation_objectif <- operation_objectif %>%
  filter(opo_ope_id %in% my_opes)

prelevement_elementaire <- prelevement_elementaire %>%
  filter(pre_id %in% my_pres)

lot_poissons <- lot_poissons %>%
  filter(lop_id %in% my_lops)

mesure_individuelle <- mesure_individuelle %>%
  filter(mei_id %in% my_meis)

# save data (see https://r-pkgs.org/data.html#sec-data-sysdata)
usethis::use_data(station,
                  point_prelevement,
                  operation,
                  operation_description_peche,
                  operation_donnees_environnementales,
                  operation_ipr,
                  operation_objectif,
                  prelevement_elementaire,
                  lot_poissons,
                  mesure_individuelle,
                  ref_espece,
                  ref_logique_3,
                  ref_logique_4,
                  ref_moyen_prospection,
                  ref_objectif,
                  ref_protocole,
                  ref_type_longueur,
                  ref_type_lot,
                  ref_type_prelevement_elementaire,
                  ref_type_projection,
                  classe_ipr,
                  internal = TRUE,
                  overwrite = TRUE)
