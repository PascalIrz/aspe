### Code to compute individuals' size-weight relationships ----

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


## assembly of dataset
tp_data <- mef_creer_passerelle() %>% # création de la passerelle
  mef_ajouter_lots() %>% # ajout des lots
  mef_ajouter_type_lot() %>% # ajout du type de lot
  filter(tyl_libelle == "N") %>%  # type de lot correspondant aux mesures individuelles
  mef_ajouter_type_longueur() %>% # ajout du type de longueur
  mef_ajouter_esp() %>% # ajout des codes et noms espèces
  mef_ajouter_mei() %>% # ajout mesures individuelles
  filter(mei_taille > 0 & # taille positive
           mei_poids > 0 & # poids positifs
           mei_mesure_reelle == "t") %>% # mesure réelle et non obtenue en "dégroupant" des lots
  select(mei_id,
         lop_id,
         tlo_libelle,
         mei_taille,
         mei_poids,
         esp_code_alternatif) %>%
  # mutate(esp_code_alternatif = case_when(
  #   esp_code_alternatif == "BRX" ~ "BRE",
  #   esp_code_alternatif == "CAD" ~ "CAA",
  #   TRUE ~esp_code_alternatif
  # )) %>%
  distinct() # dédoublonnage

# Conversion des longueurs en *cm* :
tp_data <- tp_data %>%
  mutate(mei_taille = mei_taille / 10)


# Séparation du jeu de données selon le type de longueur mesurée :
tp_data_lt <- tp_data %>%
  filter(tlo_libelle == "Totale")

tp_data_lf <- tp_data %>%
  filter(tlo_libelle == "Fourche")


#### Pour les longueurs totales

resume <- aspeQual::qtp_resume_donnees(df = tp_data_lt,
                                       seuil_poids_absolu = 5)


# Les espèces pour lesquelles seuls quelques individus passent le seuil du poids minimum
# ne peuvent faire l'objet d'une analyse fiable.
# Sélectionnons par exemple les espèces avec au minimum 20 individus dépassant le seuil.
mes_especes <- resume %>%
  filter(n_sup_seuil > 19) %>%
  pull(esp_code_alternatif) %>%
  as.character()

# Sur ces espèces, on peut appliquer la fonction `qtp_calcul()`.
# Ici elle est employée avec ses options par défaut, ce qui implique que les individus
# pesant moins de 5g sont écartés ainsi que ceux présentant des valeurs extrêmes de taille ou de poids.
tp_lt <- aspeQual::qtp_calcul(df = tp_data_lt,
                    especes = mes_especes)

# Certains des r2 ajustés ne font pas rêver.
# On va considérer que s'il est inférieur à 0.8, la relation n'est pas utilisable.
tp_lt <- tp_lt %>%
  filter(r2_ajuste > 0.8) %>%
  mutate(tlo_libelle = "Totale")


#### Pour les longueurs fourche
# On répète les opérations détaillées pour les longueurs totales.
resume <- aspeQual::qtp_resume_donnees(df = tp_data_lf,
                             seuil_poids_absolu = 5)

# Espèces avec au minimum 20 individus dépassant le seuil de 5g :
mes_especes <- resume %>%
  filter(n_sup_seuil > 19) %>%
  pull(esp_code_alternatif) %>%
  as.character()


# Application de la fonction `qtp_calcul()` aux espèces sélectionnées.
tp_lf <- aspeQual::qtp_calcul(df = tp_data_lf,
                    especes = mes_especes) %>%
  filter(r2_ajuste > 0.8) %>% # Suppression des r2 ajustés inférieurs à 0.8
  mutate(tlo_libelle = "Fourche")

#### Assemblage des deux tables
tp_aspe <- rbind(tp_lf, tp_lt)
rownames(tp_aspe) <- NULL


### Fishbase
especes <- tp_data %>%
  select(esp_code_alternatif) %>%
  mef_ajouter_esp() %>%
  select(esp_code_alternatif, esp_nom_latin) %>%
  distinct() %>%
  mutate(esp_nom_latin = str_replace(esp_nom_latin, # suppression du contenu entre parenthèses
                                     pattern = " \\s*\\([^\\)]+\\)",
                                     replacement = ""),
         esp_nom_latin_n_mots = str_count(esp_nom_latin, "\\S+"), # calcul du nb de mots
         esp_nom_latin = ifelse(esp_nom_latin_n_mots == 1, # suppression des mots au-delà du 2e
                                yes = word(esp_nom_latin, 1, 1, sep = " "),
                                no =  word(esp_nom_latin, 1, 2, sep = " ")),
         esp_nom_latin = case_when(
           esp_nom_latin == "Blicca" ~ "Blicca bjoerkna", # détermination au genre
           esp_nom_latin == "Abramis" ~ "Abramis brama",
           esp_nom_latin == "Barbus" ~ "Barbus barbus",
           esp_nom_latin == "Carassius" ~ "Carassius carassius",
           esp_nom_latin == "Coregonus" ~ "Coregonus lavaretus",
           esp_nom_latin == "Cyprinidae" ~ "Rutilus rutilus",
           esp_nom_latin == "Gobio" ~ "Gobio gobio",
           esp_nom_latin == "Lampetra" ~ "Lampetra fluviatilis",
           esp_nom_latin == "Micropterus" ~ "Micropterus salmoides",
           esp_nom_latin == "Phoxinus" ~ "Phoxinus phoxinus",
           esp_nom_latin == "Liza aurata" ~ "Chelon auratus", # espèce renommée
           esp_nom_latin == "Gobio occitaniae" ~ "Gobio gobio", # recodage par espèce proche
           esp_nom_latin == "Cobitis bilineata" ~ "Cobitis taenia", # idem
           esp_nom_latin == "Proterorhinus semilunaris" ~ "Proterorhinus marmoratus", # idem
           esp_nom_latin == "Pungitius pungitius" ~ "Gasterosteus aculeatus", # idem
           TRUE ~ esp_nom_latin),
         esp_nom_latin = str_squish(esp_nom_latin)) %>% # suppression des espaces qui trainent
  select(-esp_nom_latin_n_mots)



# Ensuite on collecte les paramètres depuis Fishbase.
# Les données taguées douteuses sont supprimées, sauf pour *Telestes souffia* car il n'y a qu'une donnée sur Fishbase.
# Faute de mieux on la conserve.
tp_fb <- especes %>%
  pull(esp_nom_latin) %>%
  unique() %>%
  rfishbase::length_weight() %>%
  filter(is.na(EsQ) | Species == "Telestes souffia") %>% # suppression données taguées douteuses
  select(esp_nom_latin = Species,
         tlo_libelle = Type,
         a,
         b,
         r2_ajuste = CoeffDetermination,
         n_ind = Number,
         taille_mini = LengthMin,
         taille_maxi = LengthMax,
         lieu = Locality) %>%
  mutate(tlo_libelle = case_when(tlo_libelle == "TL" | is.na(tlo_libelle) ~ "Totale",
                                 tlo_libelle == "FL" ~ "Fourche")) %>%
  filter(tlo_libelle %in% c("Totale", "Fourche")) %>% # on ne garde que les longueurs fourche ou totale
  aspeQual::qtp_nettoyer_fb_lieu() # nettoyage du champ "lieu"


# A partir de ce tableau, on agrège par espèce et type de longueur.
# NB La relation taille - poids étant de type puissance, on retient
# pour les paramètres $a$ et $b$ "moyens" respectivement les moyennes
# géométrique et arithmétique (méthode retenue par Fishbase).
tp_fb <- tp_fb %>%
  group_by(esp_nom_latin, tlo_libelle) %>%
  summarise(a = exp(mean(log(a))), # moyenne géométrique
            b = mean(b), # moyenne arithmétique
            n_etudes = n(), # nb d'études
            source = "Fishbase") %>%
  ungroup() %>%
  full_join(y = especes) %>%
  select(esp_code_alternatif,
         esp_nom_latin,
         tlo_libelle,
         a,
         b,
         source,
         n_etudes) %>%
  filter(!is.na(a))


# Mise en forme du tableau `tp_aspe` pour qu'il puisse être superposé avec `tp_fb` (colonnes dans le même ordre).
tp_aspe <- tp_aspe %>%
  mutate(source = "ASPE",
         n_etudes = 1) %>%
  left_join(y = ref_espece %>%
              select(esp_code_alternatif, esp_nom_latin)) %>%
  select(names(tp_fb))

# Les deux tableaux sont superposés.
data_taille_poids <- rbind(tp_fb, tp_aspe) %>%
  arrange(esp_code_alternatif, tlo_libelle) %>%
  ungroup()

# Pour contrôler si le tableau `tp` contient au moins une relation taille-poids
# pour chacune des espèces de poisson de la base Aspe, on peut chercher les `esp_code_alternatif`
# présents dans `tp_data` mais qui seraient absents de `tp`.

esp_sans_tp <- setdiff(unique(tp_data$esp_code_alternatif),
                       unique(data_taille_poids$esp_code_alternatif))

ref_espece %>%
  filter(esp_code_alternatif %in% esp_sans_tp) %>%
  select(esp_code_alternatif, esp_nom_commun, esp_nom_latin) %>%
  DT::datatable(rownames = FALSE)


# A ce stade, on dispose donc d'un tableau contenant *a minima* une relation de conversion
# taille - poids pour chacune des espèces de poissons (plus pour quelques crustacés) recensées dans la base Aspe.
# Pour certaines espèces comme *Barbus meridionalis* on dispose de 4 relations, soit
# deux issues de Fishbase (Lt et Lf) et deux issues de Aspe.

## Sauvegarde

usethis::use_data(data_taille_poids, overwrite = T)
