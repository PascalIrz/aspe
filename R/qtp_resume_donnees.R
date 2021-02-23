#' Résumer le contenu du tableau de données avant de construire la relation taille - poids.
#'
#' @param df Dataframe contenant les données.
#' @param seuil_poids_absolu Numérique. Poids minimum pour qu'un individu ne soit pas exclus,
#'     en grammes.
#'
#' @return Un dataframe de résumé.
#' @export
#'
#' @importFrom dplyr group_by summarise arrange
#'
#' @examples
#' \dontrun{
#' qtp_resume_donnees (df = tp_data,
#' seuil_poids_absolu = 10)
#' }
qtp_resume_donnees <- function(df, seuil_poids_absolu) {

  df %>%
    group_by(esp_code_alternatif) %>%
      summarise(taille_mini = min(mei_taille),
                taille_maxi = max(mei_taille),
                poids_moyen = mean(mei_poids),
                n_sup_seuil = sum(mei_poids > seuil_poids_absolu)) %>%
     arrange(n_sup_seuil)

}
