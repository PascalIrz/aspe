#' Produire le graphique de l'évolution temporelle d'un facteur environnemental moyen comparé
#'     entre les sites de présence et d'absence des espèces.
#'
#' @param df Le dataframe contenant les données avec les variables presence, parametre,
#'     valeur_parametre, annee
#' @param parametres Vecteur caractères. Les paramètre (ex : "altitude") représentés.
#' @param log_y Vecteur caractères. Les paramètre (ex : "altitude") représentés en échelle log.
#'     Par défaut, sa valeur est c('surface_bv', 'distance_source', 'pente', 'largeur'), ce qui
#'     correspond aux paramètres dont la distribution de rapproche d'une log-normale.
#' @param annee_debut Entier. Année mini à représenter.
#' @param annee_fin Entier. Année maxi à représenter.
#' @param y_libre TRUE/FALSE (valeur par défaut). Les axes des ordonnées peuvent (TRUE) différer
#'     selon les espèces, ce qui permet un "zoom", ou bien être les mêmes pour toutes, ce qui permet
#'     de les comparer les unes aux autres.
#'
#' @return LeUne liste dont les éléments sont des graphiques ggplot2 (un par paramètre).
#' @export
#'
#' @importFrom dplyr pull filter
#' @importFrom ggplot2 ggplot geom_smooth facet_wrap scale_y_log10
#'
#' @examples
#' \dontrun{
#' mes_graphiques <- gg_env_fn_annee2(df = mon_df, log_y = c('surface_bv', 'distance_source'))
#' mes_graphiques[[1]]
#' }
gg_env_fn_annee2 <-
  function(df,
           parametres = NA,
           log_y = c('surface_bv', 'distance_source', 'pente', 'largeur'),
           annee_debut = 1995,
           annee_fin = NA,
           y_libre = FALSE) {

    if(is.na(parametres)){
      parametres <- df %>%
        pull(parametre) %>%
        as.character() %>%
        unique()
    }

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

        gg <- df %>%
          filter(parametre == !!parametre,
                 annee >= annee_debut,
                 annee <= annee_fin) %>%
          ggplot(aes(x = annee,
                     y = valeur_parametre,
                     col = presence)) +
          labs(title = parametre) +
          geom_smooth(method = "lm", se = TRUE) +
          facet_wrap( ~ esp_code_alternatif)

        if (!!parametre %in% log_y) { # Passage en échelle log pour certains des paramètres
          gg <- gg +
            scale_y_log10(labels = function(y) format(y, scientific = FALSE))
        }

        gg

      }

    map(.x = parametres,
        .f = gg_env_fn_annee,
        df = df)

  }
