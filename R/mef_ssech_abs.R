#' Sous-échantillonner parmi les absences
#'
#' La comparaison entre les sites de présence et d'absence d'une espèce n'a de sens quer si leur nombre
#'     est comparable. IL ne sert à rien d'avoir l'altitude de 100 000 sites où le saumon est absent
#'     si l'on n'a que 1000 sites où il est présent. On allège donc le dataframe en tirant aléatoirement
#'     autant d'opérations d'absence qu'il y a de présence.
#'

#' @param df Dataframe avec les variables valeur_parametre, esp_code_alternatif, presence, parametre, n.
#' @param seed Numérique. La racine du générateur de nombres aléatoires pour le tirage.
#' @return Un dataframe issu de df mais avec moins de lignes.
#' @export
#'
#' @importFrom dplyr group_by ungroup left_join select mutate
#' @importFrom tidyr nest unnest
#' @importFrom purrr map2
#' @importFrom utils data
#'
#' @examples
#' \dontrun{
#' df_allege <- mef_ssech_abs(df = df_pres_abs_env)
#' }
mef_ssech_abs <- function(df, seed = 123)

{
  set.seed = seed

  pres_abs_env <- df %>%
    mef_compter_pres_abs_env()

  # split des données en dataframes selon espece x presence / absence
  df_nested <- df %>%
    group_by(esp_code_alternatif,
             presence,
             parametre) %>%
      nest() %>%
    ungroup() %>%
    left_join(
      y = pres_abs_env %>%
        select(esp_code_alternatif,
               parametre,
               presences),
      by = c("esp_code_alternatif", "parametre")
    )

  # sous-échantillonnage
  df_ssech <- df_nested %>%
    mutate(ssech = map2(
      .x = data,
      .y = presences,
      .f = sample_n,
      replace = TRUE
    ))

  # assemblage
  df <- df_ssech %>%
    select(-data) %>%
    unnest(ssech)

  # allègement du dataframe
  df <- df %>%
    select(-presences,
           -effectif) %>%
    mutate(parametre = as.factor(parametre),
           annee = as.integer(annee))

  df


}
