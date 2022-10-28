#' Relations taille - poids
#'
#' Tableau des relations taille calculées depuis la base ASPE ainsi que celles
#'     issues de Fishbase. Pour ces dernières, les paramètres a et b ont été moyennés par espèce
#'     en distinguant longueur fourche et longueur totale.
#'     NB : Les unités sont les mêmes que dans la base de référence Fishbase,
#'     à savoir pour la taille (en fait la longueur), le cm, et pour le poids (en fait
#'     la masse), le gramme. Si l'on utilise les données de la base ASPE, il faut donc
#'     opérer une conversion de longueur car celles-ci sont en mm.
#'
#' @docType data
#'
#' @usage data(taille_poids)
#'
#' @keywords datasets
#'
#' @examples
#' \donttest{
#' data(taille_poids)
#' taille_poids}
"taille_poids"
