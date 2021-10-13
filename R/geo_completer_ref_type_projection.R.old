#' Compléter le référentiel des systèmes de coordonnées.
#'
#' Dans la table `ref_type_projection`, pour le Lambert II étendu, le code EPSG (27572) est manquant.
#'     Cette fonction sert à le compléter.
#'
#' @param ref_type_projection Le dataframe contenant le référentiel des systèmes de coordonnées
#'     de la base Aspe.
#'
#' @return Le dataframe contenant le référentiel des systèmes de coordonnées
#'     de la base Aspe, mais complété.
#' @export
#'
#' @importFrom dplyr mutate
#'
#' @examples
#' \dontrun{
#' ref_type_projection <- ref_type_projection %>%
#' geo_completer_ref_type_projection()
#' }
geo_completer_ref_type_projection <- function(ref_type_projection)

  {

ref_type_projection <- ref_type_projection %>%
  mutate(typ_code_epsg = ifelse((is.na(typ_code_epsg) & typ_libelle_sandre == "Lambert II Etendu"),
                                yes = 27572,
                                no = typ_code_epsg))
}
