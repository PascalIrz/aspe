#' Convertir une table des IPR du format long au format large
#'
#' On appelle format large la présentation des données avec une colonne par année.
#'     S'il y a plusieurs valeurs de l'IPR pour un même point une année donnée,
#'     la valeur retournée sera la moyenne.
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
#' ipr_large_df <- ipr_pivoter_1colonne_par_an(ipr_df = mon_df_ipr)
#' }
ipr_pivoter_1colonne_par_an <- function(ipr_df)

{

  ipr_df %>%
    select(annee, ipr, pop_id) %>%
    distinct() %>%
    pivot_wider(names_from = annee,
                values_from = ipr,
                names_sort = TRUE,
                values_fn = mean)

}
