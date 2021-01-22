#' Scinder le dump en deux parties pour les traiter séparément et éviter de
#'     saturer la mémoire vive.
#'
#' ATTENTION : Si le chemin d'accès au fichier est trop long, il est possible que
#'     la fonction retourne une erreur :
#'     Error in gzfile(file, "wb") : argument 'description' incorrect
#      De plus : Warning message:
#'     In if (!nzchar(file)) stop("'file' must be non-empty string") :
#'     a condition a une longueur > 1 et seul le premier élément est utilisé
#'     Dans ce cas, déplacez le dump pour accourcir le chemin d'accès.
#'
#' @param fichier_dump Le chemin vers le fichier d'extension .sql (décompressé) ou
#'     .sql.gz (archive).
#' @param repertoire_sortie Le chemin vers le répertoire de sortie (qui doit avoir
#'     été créé auparavant). Par défaut c'est celui qui contient le dump.
#'
#' @return Deux fichiers au format .RData contenant l'un les lignes de la table
#'     mesure_individuelle et l'autre tout le reste du dump
#' @export
#'
#' @examples
#' \dontrun{
#' imp_scinder_dump(fichier_dump = "../raw_data/dump.sql")
#' }
#'
imp_scinder_dump <- function(fichier_dump, repertoire_sortie = NA) {

lignes <- imp_lire_lignes_dump(fichier_dump)

# Extraction des noms des tables
noms_tables <- imp_extraire_noms_tables(lignes_dump = lignes)

# Nom de la table recherchée
ma_table <- "mesure_individuelle"

# Chaîne de caractère caractéristique du début d'une table
contenu_ligne_debut_mi <- paste0("-- Data for Name: ",
                                 ma_table,
                                 "; Type: TABLE DATA;")

# Recherche du numéro de la ligne qui contient cette chaîne
index_debut_mi <- lignes %>%
  stringi::stri_detect_fixed(pattern = contenu_ligne_debut_mi) %>%
  which()

# recherche des numéros de lignes de fin de chaque table, repérées par "\."
vecteur_index_lignes_fin <- lignes %>%
  stringi::stri_detect_fixed(pattern = "\\.") %>%
  which()

# Recherche parmi les numéros des lignes de fin de table de celle correspondant à la fin de mi
index_fin_mi <- aspe::imp_trouver_index_fin(vecteur_index_lignes_fin = vecteur_index_lignes_fin,
                                        ligne_debut = index_debut_mi)

# Sauvegarde au format RData de la table mi # le répertoire par défaut est celui où est stocké le dump
if(is.na(repertoire_sortie))
          {
  a <- fichier_dump %>% str_split("\\/") %>% unlist()
  repertoire_sortie <- a[1:(length(a) - 1)] %>%
    paste(sep = "/")
          }

fichier <- paste0(repertoire_sortie, "/lignes_table_mesure_individuelle.RData")
lignes_table_mi <- lignes[index_debut_mi:index_fin_mi]
save(lignes_table_mi, file = fichier)
rm(lignes_table_mi)

# Sauvegarde au format RData du reste de la base
fichier <- paste0(repertoire_sortie, "/lignes_autres_tables.RData")
lignes_autres_tables <- lignes[-(index_debut_mi:index_fin_mi)]
save(lignes_autres_tables, file = fichier)

}

