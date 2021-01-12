#' Convertir une table des IPR du format long au format large, c'est-à-dire avec une colonne
#'     par année.
#' S'il y a plisueurs valeurs de l'IPR pour un même point une année donnée, la valeur retournée
#'     sera la moyenne
#'
#' @param ipr_df Le dataframe au format long contenant les IPR, issi de la fonction extraire-ipr()
#'
#' @return Un dataframe contenant les mêmes données, mais agencé avec une colonne par année.
#' @export
#'
#' @importFrom tidyr pivot_wider
#'
#' @examples
#' \dontrun{
#' ipr_large_df <- passer_ipr_large(ipr_df = mon_df_ipr)
#' }
passer_ipr_large <- function(ipr_df)

{

  ipr_df %>%
    select(libelle_station, libelle_point, dept, annee, ipr, pop_id) %>%
    filter(annee > 2009) %>%
    distinct() %>%
    pivot_wider(names_from = annee,
                values_from = ipr,
                names_sort = TRUE,
                values_fn = mean)

}
