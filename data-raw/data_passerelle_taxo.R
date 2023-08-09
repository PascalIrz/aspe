## Table de correspondance taxonomique

# Les données sont téléchargées depuis
# https://api.sandre.eaufrance.fr/referentiels/v1/apt.csv?compress=true&filter=<Filter><IS><Field>CodeAlternatifAp/OrgCdAlternatif</Field><Value>ASPE</Value></IS></Filter>
# et stockées dans inst/extdata

library(tidyverse)



# lecture
df <- readr::read_csv2("inst/extdata/APT_20230718_SANDRE.csv") %>%
  select(CdAppelTaxon,
         starts_with("OrgCdAlternatif"),
         starts_with("CdAlternatif")) %>%
  slice(-1)

organismes <- df %>%
  select(CdAppelTaxon,
         starts_with("OrgCdAlternatif")) %>%
  pivot_longer(cols = OrgCdAlternatif1:OrgCdAlternatif11,
               names_to = "variable",
               values_to = "organisme") %>%
  mutate(variable = str_replace(variable, pattern = "OrgCd", replacement = ""))

codes <- df %>%
  select(CdAppelTaxon,
         starts_with("CdAlternatif")) %>%
  pivot_longer(cols = CdAlternatif1:CdAlternatif11,
               names_to = "variable",
               values_to = "code") %>%
  mutate(variable = str_replace(variable, pattern = "Cd", replacement = ""))

passerelle_taxo <- organismes %>%
  left_join(codes) %>%
#  cbind(codes %>% select(-CdAppelTaxon)) %>%
  filter(organisme %in% c("ASPE", "TAXREF"))

mes_codes_sandre <- passerelle_taxo %>%
  filter(organisme == "ASPE") %>%
  pull(CdAppelTaxon) %>%
  unique()

passerelle_taxo <- passerelle_taxo %>%
  filter(CdAppelTaxon %in% mes_codes_sandre) %>%
  select(CdAppelTaxon, organisme, code) %>%
  pivot_wider(names_from = organisme,
              values_from = code) %>%
  rename(esp_code_sandre = CdAppelTaxon,
         esp_code_alternatif = ASPE,
         esp_code_taxref = TAXREF)

# jointure avec le ref_espece de la base aspe
data_passerelle_taxo <- passerelle_taxo %>%
  left_join(y = ref_espece %>%
              select(esp_id,
                     esp_code_alternatif,
                     esp_nom_latin)) %>%
  mutate(
    esp_code_taxref = case_when(
      is.na(esp_code_taxref) & esp_nom_latin == "Cyprinus carpio" ~ 67058,
      is.na(esp_code_taxref) & esp_code_alternatif == "GFL" ~ 70166,
      is.na(esp_code_taxref) & esp_code_alternatif == "MUC" ~ 69772,
      is.na(esp_code_taxref) & esp_code_alternatif == "CAA" ~ 67208,
      is.na(esp_code_taxref) & esp_code_alternatif == "VAX" ~ 194072,
      TRUE ~ as.double(esp_code_taxref)
    )
  ) %>%
  filter(esp_code_sandre != 2094) # pb de l'ancien code de l'aspe qui traine dans le référentiel


usethis::use_data(data_passerelle_taxo, overwrite = T)

