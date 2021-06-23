#' Sous-échantillonner le df environnement et occurrences
#'
#' La comparaison entre les sites de présence et d'absence d'une espèce n'a de sens que si leur nombre
#'     est comparable. IL ne sert à rien d'avoir l'altitude de 100 000 sites où le saumon est absent
#'     si l'on n'a que 100 sites où il est présent. On allège donc le dataframe en tirant aléatoirement
#'     autant un nombre d'opérations déterminé par le minimum du nb d'absences et de celui de présences.
#'     Le sous-échantillonnage est contraint par année.
#'
#'
#' @param df Dataframe avec les variables valeur_parametre, esp_code_alternatif, presence, parametre, n.
#' @param seed Numérique. La racine du générateur de nombres aléatoires pour le tirage.
#' @return Un dataframe issu de df mais avec moins de lignes.
#' @export
#'
#' @importFrom dplyr group_by ungroup left_join select mutate filter
#' @importFrom tidyr nest unnest
#' @importFrom purrr map2
#' @importFrom utils data
#'
#' @examples
#' \dontrun{
#' df_allege <- mef_ssech_esp_env(df = df_pres_abs_env)
#' }
mef_ssech_esp_env <- function(df, seed = 123)

{
  set.seed = seed

  pres_abs_env <- df %>%
    mef_compter_pres_abs_env() %>%
    mutate(n_ssech = ifelse(absences < presences, absences, presences)) %>%
    filter(n_ssech > 0) # sinon le sample_n bloque

  # split des données en dataframes selon espece x presence / absence
  # le right_join exclut les cas où n_ssech est NA
  df_nested <- df %>%
    right_join(y = pres_abs_env %>%
                 select(esp_code_alternatif, parametre, annee)) %>%
    group_by(esp_code_alternatif,
             presence,
             parametre,
             annee) %>%
    nest() %>%
    ungroup() %>%
    left_join(
      y = pres_abs_env %>%
        select(esp_code_alternatif,
               parametre,
               n_ssech,
               annee),
      by = c("esp_code_alternatif", "parametre", "annee")
    )

  # sous-échantillonnage
  df_ssech <- df_nested %>%
    mutate(ssech = map2(
      .x = data,
      .y = n_ssech,
      .f = sample_n,
      replace = FALSE
    ))

  # assemblage
  df <- df_ssech %>%
    select(-data) %>%
    unnest(ssech)

  # allègement du dataframe
  df <- df %>%
    select(-n_ssech) %>%
    mutate(parametre = as.factor(parametre),
           annee = as.integer(annee))

  df


}
