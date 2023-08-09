# Listes rouges des poissons et des crustacés

## Les données sont téléchargées depuis [https://inpn.mnhn.fr/espece/listerouge/fr/poissons_eau_douce_metropole_2019](https://inpn.mnhn.fr/espece/listerouge/fr/poissons_eau_douce_metropole_2019).

poissons <- read_csv2("inst/extdata/2019_fish_RL_mainland_FR__202173.csv") %>%
  rename(esp_code_taxref = CD_REF) %>%
  left_join(data_passerelle_taxo) %>%
  filter(!NOMS_COMMUNS == "Saumon de l'Allier") %>% # sous-espèce de TRF
  select(esp_nom_latin,
         esp_code_taxref,
         esp_code_alternatif,
         endemisme = ENDEMISME,
         statut_lr_fr = STATUT,
         tendance_lr_fr = TENDANCE,
         statut_lr_int = STATUT_I,
         statut_lr_eu = STATUT_EU
  ) %>%
  mutate_at(vars(starts_with("statut_lr")),
            fct_relevel,
            c("DD", "LC", "NT", "VU", "EN", "CR", "EX")) %>%
  filter(!is.na(esp_code_alternatif))

ecrevisses <- read_csv2("inst/extdata/2012_crustacea_RL_mainland_FR_202245.csv") %>%
  rename(esp_code_taxref = CD_REF) %>%
  right_join(data_passerelle_taxo) %>%
  filter(!is.na(CD_NOM)) %>%
  select(esp_nom_latin,
         esp_code_taxref,
         esp_code_alternatif,
         endemisme = ENDEMISME,
         statut_lr_fr = STATUT,
         tendance_lr_fr = TENDANCE,
         statut_lr_int = STATUT_I,
         statut_lr_eu = STATUT_EU
  ) %>%
  mutate_at(vars(starts_with("statut_lr")),
            as.factor) %>%
  mutate_at(vars(starts_with("statut_lr")),
            fct_relevel,
            c("DD", "LC", "NT", "VU", "EN", "CR", "EX")) %>%
  filter(!is.na(esp_code_alternatif))

data_liste_rouge <- rbind(poissons,
                          ecrevisses)


usethis::use_data(data_liste_rouge, overwrite = T)

