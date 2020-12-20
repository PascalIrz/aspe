#' Trouver la ligne de fin qui correspond à une table désignée par sa ligne de début.
#'
#' Par expemple pour trouver le numéro de la ligne de fin d'une table qui débuterait à la ligne 6517552
#'
#' @param vecteur_index_lignes_fin Vecteur contenant les numéros de toutes les lignes contenant la séquence caractéristique
#'     de la fin d'une table
#' @param ligne_debut Numéro de la ligne de début de la table.
#'
#' @return Le numéro de la ligne de fin de la table.
#' @export
#'
#' @examples
#' \dontrun{
#' trouver_index_fin(vecteur_index_lignes_fin = mon_vecteur, ligne_debut = 6517552)
#' }
trouver_index_fin <- function(vecteur_index_lignes_fin, ligne_debut)

{

  which(vecteur_index_lignes_fin > ligne_debut) %>%
    min() %>%
    vecteur_index_lignes_fin[.]

}
