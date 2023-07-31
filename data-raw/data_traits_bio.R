### Code pour assemblar la table de traits depuis https://www.freshwaterecology.info/ ----

# chargement packages
library(aspe)
library(dplyr)

# tableau de traits
# téléchargé depuis https://www.freshwaterecology.info/ en juillet 2023.
data_traits_bio <- readxl::read_xlsx("inst/extdata/freshwaterecology.info_species_traits.xlsx") %>%
  select(-Numéro) %>%
  rename(esp_nom_latin = Species,
         reference_species = `Espèce modèle`) %>%
  # recodage pour être en phase avec le réferentiel espèces de la base Aspe
  mutate(esp_nom_latin = case_when(
    esp_nom_latin == "Salmo trutta trutta" ~ "Salmo trutta",
    TRUE ~ esp_nom_latin))

# Vérifications ----
# Quelles espèces sont présentes dans la base sans correspondance avec la base de traits ?

## chargement des données Aspe
rdata_tables <-
  misc_nom_dernier_fichier(repertoire = "../../raw_data/rdata",
                           pattern = "^tables")

load(file = rdata_tables)

## assemblage du jeu de données
captures <- mef_creer_passerelle() %>% # création de la passerelle
  mef_ajouter_lots() %>% # ajout des lots
  mef_ajouter_esp() %>%
  group_by(esp_code_alternatif,
           esp_nom_latin,
           esp_nom_commun) %>%
  summarise(effectif = sum(lop_effectif, na.rm = TRUE)) %>%
  ungroup() %>%
  # recodages (temporaire ; à supprimer pour l'essentiel quand le référentiel taxo Aspe sera Ok)
  mutate(esp_nom_latin = case_when(
    esp_nom_latin == "Leuciscus cephalus" ~ "Squalius cephalus",
    esp_nom_latin == "Atherinapresbyter" ~ "Atherina presbyter",
    esp_nom_latin == "Gymnocephalus cernuus" ~ "Gymnocephalus cernua",
    esp_nom_latin == "Carassius auratus auratus" ~ "Carassius auratus",
    TRUE ~ esp_nom_latin))

# jointure entre données Aspe et tableau de traits
taxons_sans_traits <- captures %>%
  anti_join(y = data_traits_bio) %>%
  arrange(-effectif) %>%
  filter(!str_detect(esp_nom_commun, "indétermi|Ecrevis|Crab|Hybrid"))

data_traits_bio <- data_traits_bio %>%
  left_join(captures) %>%
  select(esp_code_alternatif,
         esp_nom_latin,
         esp_nom_commun,
         `acid tolerance`:`reproduction (fiBS)`) %>%
  filter(!is.na(esp_code_alternatif))




# si le dataframe test ne montre aucun taxon inattendu c'est Ok
usethis::use_data(data_traits_bio, overwrite = T)

