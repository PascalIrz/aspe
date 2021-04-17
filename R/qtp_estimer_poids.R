#' Calculer les poids manquants à partir des longueurs
#'
#' Pour une espèce et un type de longueur.
#'
#' @param df_biometrie Dataframe contenant les données de biométrie avec en particulier
#'     les champs esp_code_alternatif, tlo_id, mon_lop_poids_est et mei_taille.
#' @param espece Caractère. Code espèce en trois lettres.
#' @param type_longueur Numérique.
#'     1 = Longueur fourche
#'     2 = Longueur totale
#' @param df_taille_poids Dataframe contenant les paramètres de la relation taille-poids.
#'     Il doit avoir les champs code_espece a et b.
#'
#' @return Un dataframe complété dans le champ mon_lop_poids_est pour l'espèce considérée
#'     avec le type de longueur considéré.
#' @export
#'
#' @importFrom dplyr filter pull mutate
#'
#' @examples
#' \dontrun{
#' essai <- qtp_calculer_poids(df = lop_poids_est, espece = "GOU",
#' type_longueur = 2, df_taille_poids = tp)
#' }
qtp_estimer_poids <- function(df_biometrie, espece, type_longueur = 2, df_taille_poids)

{

  relation_existe <- df_taille_poids %>%
    filter(code_espece == espece, tlo_id == type_longueur) %>%
    nrow()

  selection <- df_biometrie %>%
    filter(esp_code_alternatif == espece,
           tlo_id == type_longueur)

  if(relation_existe == 1)

  {

  mon_a <- df_taille_poids %>%
    filter(code_espece == espece,
           tlo_id == type_longueur) %>%
    pull(a)

  mon_b <- df_taille_poids %>%
    filter(code_espece == espece,
           tlo_id == type_longueur) %>%
    pull(b)

  selection <- selection %>%
    mutate(mon_lop_poids_est = mon_a * mei_taille ^ mon_b)

  }

  selection

}
