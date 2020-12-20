#' Importer des tables à partir des lignes du dump de la base Aspe
#'
#' @param lignes_dump Nom de la liste contenant les lignes du dump.
#' @param tables_a_extraire Un vecteur contenant les noms des tables à extraire.
#'     Par défaut toutes les tables sont extraites, ce qu ipeut prendre du temps
#'     unutilement.
#' @return Les dataframes correspondant à chacune des tables de la base.
#' @export
#'
#' @import dplyr
#' @importFrom utils type.convert
#' @importFrom stringi stri_detect_fixed
#' @importFrom stringr str_replace_all str_subset str_sub str_split
#' @importFrom purrr set_names map reduce
#'
#' @examples
#' \dontrun{
#' importer_dump_sql(fichier_dump = "../raw_data/dump.sql")
#' }
#'
#'
importer_tables_a_partir_des_lignes <- function(lignes_dump, tables_a_extraire = NA) {

  # déclaration de noms de variables pour éviter des warnings en compilant le package
  index_ligne_debut <- index_ligne_fin <- nom_table <- NULL

  options(stringsAsFactors = F)

  # Si l'utilisateur ne précise pas quelles tables sont à extraire, elles le seront toutes
  if(is.na(tables_a_extraire))
    {
    tables_a_extraire <- extraire_noms_tables(lignes_dump = lignes_dump)
    }

  # début de table
  lignes_debut <- paste0("-- Data for Name: ", tables_a_extraire, "; Type: TABLE DATA;")

  # On va constituer un dataframe avec tout le nécessaire pour spliter ensuite en tables
  caracteristiques_tables <- data.frame(nom_table = tables_a_extraire, ligne_debut = lignes_debut)

  # Fonction qui retourne le numéro de la ligne du dump où se trouve une chaîne de caractères
  trouver_index_ligne_debut <- function(ligne, df_tables, lignes_dump)

  {

    prov <- list()
    prov[[1]] <- df_tables[ligne, "nom_table"]
    prov[[2]] <- df_tables[ligne, "ligne_debut"]
    prov[[3]] <- which(stringi::stri_detect_fixed(lignes_dump, prov[[2]]))

    prov %>% unlist()

  }

  # Application de la fonction pour chacune des tables ; ATTENTION CA PREND 5'-10'
  # on n'utilise pas map_df qui nécessiterait de nommer les colonnes de chaque objet => fait en une seule fois à la fin
  caracteristiques_tables <- purrr::map(.x = 1:nrow(caracteristiques_tables),
                                        .f = trouver_index_ligne_debut,
                                        lignes_dump = lignes_dump,
                                        df_tables = caracteristiques_tables) %>%
    purrr::reduce(rbind)  %>%
    as.data.frame()

  if(length(caracteristiques_tables) == 1) {caracteristiques_tables <- t(caracteristiques_tables)}

  caracteristiques_tables <- caracteristiques_tables %>%
    as.data.frame() %>%
    purrr::set_names(c("nom_table", "contenu_ligne_debut", "index_ligne_debut")) %>%
    dplyr::mutate(index_ligne_debut = as.integer(index_ligne_debut)) %>%
    dplyr::arrange(index_ligne_debut) %>%
    dplyr::filter(!is.na(index_ligne_debut))

  # recherche des numéros de lignes de fin de chaque table, repérées par "\."
  vecteur_index_lignes_fin <- which(stringi::stri_detect_fixed(lignes_dump, "\\."))

  # Fonction qui, pour un numéro de ligne de début, va trouver la ligne de fin qui lui correspond
  # trouver_index_fin <- function(vecteur_index_lignes_fin, ligne_debut)
  #
  # {
  #
  #   which(vecteur_index_lignes_fin > ligne_debut) %>%
  #     min() %>%
  #     vecteur_index_lignes_fin[.]
  #
  # }

  # application sur le dataframe
  caracteristiques_tables <- caracteristiques_tables %>%
    group_by(nom_table) %>% # nécessaire car la fonction trouver_index_fin n'accepte pas les vecteurs en entrée
    mutate(index_ligne_fin = trouver_index_fin(vecteur_index_lignes_fin = vecteur_index_lignes_fin,
                                               ligne_debut = index_ligne_debut)) %>%
    mutate(index_ligne_fin = index_ligne_fin - 1,
           index_ligne_debut = index_ligne_debut + 3)

  # A ce stade on a tous les éléments géométriques pour séparer le vecteur "lignes_dump" en tables

  # Fonction qui extrait les lignes d'une table, les sépare en colonnes puis nomme les colonnes
  extraire_table <- function(numero_table, lignes_dump, caracteristiques_tables)

  {

    index_ligne_debut <- caracteristiques_tables[numero_table,] %>%
      pull(index_ligne_debut)

    index_ligne_fin <- caracteristiques_tables[numero_table,] %>%
      pull(index_ligne_fin)

    nom_table <- caracteristiques_tables[numero_table,] %>%
      pull(nom_table)

    table <- lignes_dump[index_ligne_debut:index_ligne_fin] # sélection des lignes de la table

    # vecteur contenant les noms des colonnes
    noms_col <- lignes_dump[index_ligne_debut] %>%
      stringr::str_extract_all(pattern = "\\([^()]+\\)") %>% # extraction de ce qui est entre les parenthèses
      stringr::str_sub(start = 2, end = nchar(.)-1) %>%  # suppression des parenthèses
      stringr::str_split(", ") %>% # scission
      unlist()

    # séparation des colonnes pour chaque ligne (séparateur tabulation "\t")
    table <- strsplit(table[2:length(table)], "\t", fixed = TRUE )

    # empilage, passage en dataframe et remplacement des valeurs manquantes "\N" par des NA
    table <- do.call(rbind, table) %>%
      as.data.frame() %>%
      replace(., . == "\\N", NA) %>% # gestion des valeurs manquantes
      dplyr::mutate_all(type.convert) # permet de convertir chaque colonne en son format "natif" car jusque-là tt est en texte

    # renommage des colonnes
    # Il y a qq cas où il y a des colonnes avec des noms dans la requête mais sans données
    # donc qui sont omises du dump => pas possible de simplement faire names(table) <- noms_col
    names(table) <- noms_col[1:ncol(table)]

    # nommage de la table + export dans l'environnement global
    assign(x = nom_table,
           value = table,
           envir = globalenv())

  }

  # test
  # extraire_table (numero_table = 22,
  #                 lignes_dump = lignes_dump,
  #                 caracteristiques_tables = caracteristiques_tables)

  # Application de la fonction extraire_table() à chacune des tables et création des dataframes correspondants
  # ATTENTION CA PREND ENVIRON 5'

  purrr::map(.x = 1:nrow(caracteristiques_tables),
             .f = extraire_table,
             lignes_dump = lignes_dump,
             caracteristiques_tables = caracteristiques_tables)

  # suppression des objets non utiles pour ne conserver que les dataframes
  mes_df <- ls()[sapply(ls(), function(i) class(get(i))) == "data.frame"]

  rm(list = ls()[! ls() %in% mes_df])

}

