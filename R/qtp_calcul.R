#' Calculer l'équation taille-poids pour une espèce
#'
#' @param df Dataframe contenant les données
#' @param code_espece Texte. Code à trois lettres de l'espèce.
#' @param seuil_densite Numérique. Seuil probabilité associé aux intervalles de taille.
#'     Par défaut il est de 1%.
#' @param seuil_poids_absolu Numérique. Poids en-deça duquel les observations seront éliminées.
#'     Par défaut il est de 5g car les balances de terrain permettent difficilement de
#'     descendre en-dessous.
#'
#' @return Les coefficients du modèle ainsi que les gammes de taille et de poids retenues,
#'     le coefficient de détermination du modèle et le nombre d'individus pris en compte.
#'
#' @export
#'
#' @importFrom dplyr filter rename
#'
#' @examples
#' \dontrun{
#' qtp_calcul (df = tp_data,
#' code_espece = "VAN")
#' }
qtp_calcul <- function(df, code_espece, seuil_densite = 0.01, seuil_poids_absolu = 5) {

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
    filter(mei_taille > seuils_taille[1] &
             mei_taille < seuils_taille[2]) %>%
    filter(mei_poids > seuils_poids[1] &
             mei_poids < seuils_poids[2]) %>%
    filter(mei_poids > seuil_poids_absolu)

  mod <- lm(log(mei_poids) ~ log(mei_taille), data = df)

  dist_cook <- cooks.distance(mod)
  seuil_cook <- 4 / nrow(tp_esp)

  df <- df %>%
    cbind(dist_cook) %>%
    filter(dist_cook < seuil_cook)

  mod <- lm(log(mei_poids) ~ log(mei_taille), data = df)

  alpha <- mod$coefficients["(Intercept)"]
  beta <- mod$coefficients["log(mei_taille)"]
  r2 <- summary(mod)$adj.r.squared
  n_ind <- nrow(tp_esp)

  resultat <- cbind(code_espece, alpha, beta, r2, n_ind, seuils_taille[1], seuils_taille[2], seuils_poids[1], seuils_poids[2]) %>%
    as.data.frame() %>%
    rename(taille_mini = V6, taille_maxi = V7, poids_mini = V8, poids_maxi = V9)

  resultat

}

qtp_calcul (df = tp_data,
            code_espece = "VAN",
            seuil_densite = 0.01,
            seuil_poids_absolu = 5)
