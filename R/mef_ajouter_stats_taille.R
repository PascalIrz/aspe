#' Ajouter les tailles (longueurs) mini, maxi, médiane et moyenne pour chaque espèce à
#'     chaque opération
#'
#' La fonction fait appel à de nombreux dataframes de la base Aspe qui doivent impérativement avoir
#'     été chargés auparavant (mesure_individuelle, lots, operation, etc.). Elle n'opère pas de distinction
#'     entre longueur totale et longueur fourche.
#'
#' @param df Dataframe avec des variables espèce (esp_code_alternatif) et opération (ope_id).
#'
#' @return La passerelle à laquelle ont été ajoutés les statistiques de tailles.
#' @export
#'
#' @importFrom stats median
#' @importFrom dplyr select distinct right_join rename group_by summarise ungroup starts_with
#'
#' @examples
#' \dontrun{
#' passerelle <- mef_ajouter_stats_taille(passerelle = passerelle)
#' }
mef_ajouter_stats_taille <- function(df)

{

  longueurs <- mef_creer_passerelle() %>%
    mef_ajouter_lots() %>%
    select(ope_id, lop_id, esp_code_alternatif) %>%
    distinct() %>%
    right_join(y = mesure_individuelle %>%
                 rename(lop_id = mei_lop_id)) %>%
    group_by(ope_id, esp_code_alternatif) %>%
      summarise(
        taille_max = max(mei_taille, na.rm = TRUE),
        taille_min = min(mei_taille, na.rm = TRUE),
        taille_moy = mean(mei_taille, na.rm = TRUE),
        taille_med = median(mei_taille, na.rm = TRUE)
      ) %>%
    ungroup() %>%
    select(ope_id,
           esp_code_alternatif,
           starts_with("taille_"))

  df <- df %>%
    left_join(longueurs)

  df

}


