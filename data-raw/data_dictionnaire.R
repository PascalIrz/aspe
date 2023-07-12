## Dictionnaire de données

# Le intitulés détaillés des champs sont stockés dans le dump de la base sous forme de commentaires.
# Ils peuvent être extraits par la fonction `expl_commentaires_champs()` du package `aspe`.

# recherche du nom du fichier le plus récent au format .gz dans le répertoire des données brutes
dump <- aspe::misc_nom_dernier_fichier(repertoire = "../../raw_data",
                                       pattern = "gz$")

# extraction des commentaires
data_dictionnaire <- expl_commentaires_champs(fichier_dump = dump)

DT::datatable(data_dictionnaire,
              rownames = FALSE)

usethis::use_data(data_dictionnaire, overwrite = T)

