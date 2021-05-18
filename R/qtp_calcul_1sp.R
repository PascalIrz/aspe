#' Calculer une équation taille-poids pour une espèce
#'
#' @param df Dataframe contenant les données.
#' @param code_espece Texte. Code espèce en trois lettres
#' @param seuil_densite Numérique. Seuil de densité au sens de aspe::qtp_seuils().
#'     Par défaut il est de 1p1000.
#' @param seuil_poids_absolu Numérique. Poids minimum pour qu'un individu ne soit pas exclus,
#'     en grammes.
#'
#' @return Une liste contenant les coefficients et un résumé de la régression.
#' @noRd
#'
#' @importFrom dplyr filter rename
#' @importFrom stats lm cooks.distance
#'
#' @examples
#' \dontrun{
#' qtp_calcul_1sp (df = tp_data,
#' code_espece = "ROT")
#' }
qtp_calcul_1sp <- function(df, code_espece, seuil_densite = 0.001, seuil_poids_absolu = 5)

  {

  df <- df %>%
    filter(esp_code_alternatif == code_espece &
             mei_taille > 0 &
             mei_poids > 0)


  seuils_taille <- qtp_seuils (df = df,
                               code_espece = code_espece,
                               variable = "mei_taille",
                               seuil_densite = seuil_densite)

  seuils_poids <- qtp_seuils (df = df,
                              code_espece = code_espece,
                              variable = "mei_poids",
                              seuil_densite = seuil_densite)

  df <- df %>%
    filter(mei_taille > seuils_taille[1],
           mei_taille < seuils_taille[2],
           mei_poids > seuils_poids[1],
           mei_poids < seuils_poids[2],
           mei_poids > seuil_poids_absolu)

  mod <- stats::lm(log(mei_poids) ~ log(mei_taille),
                   data = df)

  dist_cook <- stats::cooks.distance(mod)
  seuil_cook <- 4 / nrow(df)

  df <- df %>%
    cbind(dist_cook) %>%
    filter(dist_cook < seuil_cook)

  mod <- stats::lm(log(mei_poids) ~ log(mei_taille),
                   data = df)

  a <- mod$coefficients["(Intercept)"] %>% exp()
  b <- mod$coefficients["log(mei_taille)"]
  r2_ajuste <- summary(mod)$adj.r.squared
  n_ind <- nrow(df)

  resultat <- cbind(code_espece,
                    a,
                    b,
                    r2_ajuste,
                    n_ind,
                    seuils_taille[1],
                    seuils_taille[2],
                    seuils_poids[1],
                    seuils_poids[2]) %>%
    as.data.frame() %>%
    rename(taille_mini = V6,
           taille_maxi = V7,
           poids_mini = V8,
           poids_maxi = V9,
           esp_code_alternatif = code_espece)

  resultat

}
