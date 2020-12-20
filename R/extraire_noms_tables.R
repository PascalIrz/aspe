#' Extraire les noms des tables à partir des lignes du dump
#'
#' @param lignes_dump Nom de la liste qui contient les lignes du dump.
#'
#' @return Un vecteur caractères contenant les noms des tables.
#' @export
#'
#' @import dplyr
#' @importFrom stringi stri_detect_fixed
#' @importFrom stringr str_replace_all str_subset
#'
#' @examples
#'
#' \dontrun{
#' extraire_noms_tables (lignes_dump = mes_lignes_du_dump)
#' }
#'
#'
extraire_noms_tables <- function(lignes_dump) {

  options(stringsAsFactors = F)
  # ------------------------------------------------------------
  # NOMS DES TABLES
  # ------------------------------------------------------------
  # Les noms des tables sont repérés car ils suivent "CREATE TABLE"
  # on ne récupère pas les tables temporaires préfixées par temp_ et batch_
  noms_tables <- lignes_dump[which(stringi::stri_detect_fixed(lignes_dump, "CREATE TABLE"))] %>%
    stringr::str_replace_all(pattern = "CREATE TABLE ", replacement = "") %>%
    stringr::str_replace_all(pattern = " \\(", replacement = "") %>%
    stringr::str_subset("^temp_", negate = TRUE) %>%
    stringr::str_subset("^batch_", negate = TRUE)


}
