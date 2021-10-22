#' Obtenir les commentaires qui donnent la signification des champs des tables
#'
#' @param fichier_dump Le chemin vers le fichier d'extension .sql (décompressé) ou
#'     .sql.gz (archive).
#'
#' @return Un dataframe avec pour chacun des champs sa table d'appartenance et sa signification.
#' @export
#'
#' @importFrom stringr str_replace str_subset str_sub str_extract
#'
#' @examples
#' \dontrun{
#' expl_commentaires_champs(fichier_dump = "../raw_data/dump.sql")
#' }
#'
#'
expl_commentaires_champs <- function(fichier_dump) {

  lignes_dump <- imp_lire_lignes_dump(fichier_dump)

  # sélection des lignes contenant les commentaires des champs
  mes_lignes <- lignes_dump %>%
    stringr::str_subset(pattern = 'COMMENT ON COLUMN') %>%
    str_replace("COMMENT ON COLUMN ", "")

  # noms de la table = préfixe du nom complet du champ
  nom_table <- mes_lignes %>%
    str_extract("[^\\.]*")

  # nom du champ
  nom_var <- mes_lignes %>%
    str_replace("[^\\.]*", "") %>%
    str_replace("\\.", "") %>%
    str_extract("[^ IS ]*")

  # commentaire sur le champ
  comm_var <- mes_lignes %>%
    str_replace("[^ IS ]*", "") %>%
    str_replace(" IS ", "") %>%
    str_sub(start = 2, end = -3) %>%
    str_replace("''", "'")

  # assemblage du résultat ; suppression des champs des tables temporaires
  data.frame(nom_table,
             nom_var,
             comm_var) %>%
    filter(!str_detect(nom_table, "^temp_"))
}
