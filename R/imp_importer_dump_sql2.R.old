#' Importer le dump SQL de la base Aspe
#'
#' @param fichier_dump Le chemin vers le fichier d'extension .sql (décompressé) ou
#'     .sql.gz (archive).
#'
#' @return Les dataframes correspondant à chacune des tables de la base.
#' @export
#'
#' @importFrom utils type.convert
#' @importFrom stringi stri_detect_fixed
#' @importFrom stringr str_replace_all str_subset str_sub str_split
#' @importFrom purrr set_names map reduce
#'
#' @examples
#'
#' \dontrun{
#' imp_importer_dump_sql(fichier_dump = "../raw_data/dump.sql")
#' }
#'
#'
imp_importer_dump_sql2 <- function(fichier_dump) {

  # déclaration de noms de variables pour éviter des warnings en compilant le package
  tables_a_extraire <- index_ligne_debut <- index_ligne_fin <- nom_table <- NULL

  # lecture brute du fichier texte

  lignes_dump <- imp_lire_lignes_dump(fichier_dump)

  options(stringsAsFactors = F)

  noms_tables <- imp_extraire_noms_tables2(lignes_dump = lignes_dump)

  imp_tables_a_partir_des_lignes2(lignes_dump = lignes_dump,
                                 tables_a_extraire = noms_tables)
}




