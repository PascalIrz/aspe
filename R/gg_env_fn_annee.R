#' Produire le graphique de l'évolution temporelle d'un facteur environnemental moyen comparé
#'     entre les sites de présence et d'absence des espèces.
#'
#' @param df Le dataframe contenant les données avec les variables presence, parametre,
#'     valeur_parametre, annee
#' @param parametre Le paramètre (ex : "altitude") représenté.
#' @param annee_debut Année mini à représenter.
#' @param annee_fin Année maxi à représenter.
#'
#' @return Le graphique ggplot2.
#' @export
#'
#' @importFrom dplyr pull filter
#' @importFrom ggplot2 ggplot geom_smooth facet_wrap
#'
#' @examples
gg_env_fn_annee <-
  function(df,
           parametre,
           annee_debut = 1995,
           annee_fin = NA) {
    if (is.na(annee_fin))
    {
      annee_fin <- df %>%
        pull(annee) %>%
        max(na.rm = TRUE)
    }

    df %>%
      filter(parametre == !!parametre,
             annee >= annee_debut,
             annee <= annee_fin) %>%
      ggplot(aes(x = annee, y = valeur_parametre,
                 col = presence)) +
      geom_smooth(method = "lm", se = TRUE) +
      facet_wrap( ~ esp_code_alternatif)
  }
