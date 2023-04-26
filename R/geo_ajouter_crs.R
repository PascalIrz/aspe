#' Ajouter le code EPSG du CRS à un dataframe
#'
#' @param df Le dataframe de données.
#' @param var_id_crs Caractère. Le nom de la variable qui contient l'identifiant du CRS
#'     au sens de la variable "typ_id" du dataframe "ref_type_projection" de la base Aspe.
#'     selon la
#'
#' @return Le dataframe complété.
#' @export
#'
#' @importFrom dplyr rename left_join enquo
#'
#' @examples
#' \dontrun{
#' pop <- point_prelevement %>%
#' geo_ajouter_crs(var_id_crs = pop_typ_id)
#' }
geo_ajouter_crs <- function(df, var_id_crs)

{

  var_id_crs <- enquo(var_id_crs)

  df %>%
    rename(typ_id = !!var_id_crs) %>%
    left_join(y = ref_type_projection %>%
                select(typ_id,
                       typ_code_epsg))

}
