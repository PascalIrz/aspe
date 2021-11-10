#' Calculer les relations taille-poids sur un ensemble d'espèces
#'
#' @param df Dataframe contenant les données.
#' @param especes Vecteur texte contenant les codes espèces et trois lettres.
#' @param seuil_densite Numérique. Seuil de densité de probabilité probabilité au sens
#'     de ggplot2::gemp_density(). Par défaut il est de 1p1000.
#' @param seuil_poids_absolu Numérique. Poids minimum pour qu'un individu ne soit pas exclus,
#'     en grammes.
#'
#' @return Un dataframe contenant pour chaque espèce les coefficients et un résumé de la régression.
#' @export
#'
#' @importFrom purrr map reduce
#' @importFrom dplyr mutate_at vars arrange
#'
#' @examples
#' \dontrun{
#' qtp_calcul (df = tp_data,
#' especes = c("GAR", "SAN", "BRE"),
#' seuil_poids_absolu = 10)
#' }
qtp_calcul <- function(df, especes, seuil_densite = 0.001, seuil_poids_absolu = 5)

{

  map(.x = especes,
      .f = qtp_calcul_1sp,
      df = df,
      seuil_densite = seuil_densite,
      seuil_poids_absolu = seuil_poids_absolu) %>%
    reduce(rbind) %>%
    mutate_at(vars(-esp_code_alternatif),
              as.numeric) %>%
    arrange(-n_ind)

}




