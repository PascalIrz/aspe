#' Calculer les seuils
#'
#' @param df Dataframe contenant les données.
#' @param code_espece Texte. Code espèce en trois lettres.
#' @param variable Texte. Variable, au choix "mei_taille" ou "mei_poids".
#' @param seuil_densite Numérique. Seuil de densité de probabilité probabilité au sens
#'     de ggplot2::gemp_density(). Par défaut il est de 1\%.
#'
#' @return Un vecteur contenant les seuils haut et bas, c'est-à-dire les tailles ou
#'     poids mini et maxi à retenir au seuil choisi.
#' @export
#'
#' @importFrom ggplot2 aes geom_density ggplot_build
#' @importFrom dplyr select filter pull
#'
#' @examples
#' \dontrun{
#' qtp_seuils (df = tp_data,
#' code_espece = "ROT",
#' variable = "mei_taille")
#' }
qtp_seuils <- function(df,
                       code_espece,
                       variable = "mei_taille",
                       seuil_densite = 0.01) {


  # graphique simplifié
  p <- ggplot(data = df, aes(x = get(variable))) +
    geom_density()

  # extraction des données du graphique
  p <- ggplot_build(p)

  densite <- p$data[[1]] %>%
    as.data.frame() %>%
    select(x, scaled)

  # valeurs extremes
  densite %>%
    filter(scaled > seuil_densite) %>%
    pull(x) %>%
    range() %>%
    round()

}
