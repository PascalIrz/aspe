#' Produire le graphique des distributions comparées des paramètres environnementaux
#'     entre les sites de présence et d'absence d'une espèce.
#'
#' @param df Le dataframe contenant les données environnementales et les présences / absences des
#'     espèces, par opération, avec les champs parametre, valeur_parametre, esp_code_alternatif,
#'     presence.
#' @param espece Caractère. Code trois lettres de l'espèce (ex : "BRO" pour le brochet).
#' @param parametres Vecteur caractère listant des paramètres environnementaux
#'     à représenter. Par défaut toutes les modalités de la variale "parametre" sont représentées.
#' @param quantile_max Numérique sur l'intervalle 0-1. Sert à exclure les valeurs extrêmes
#'     si nécessaire pour les représentations graphiques. Par exemple quantile_max = 0.99 signifie
#'     que les 1p100 des valeurs les plus élevées sont exclues.
#' @param log Vecteur caractère listant celles des variables environnementales pour lesquelles
#'     l'axe des absisses est en échelle log. Par défaut ce sont les variables surface_bv,
#'     distance_source et pente.
#' @param coul_pres Caractère. Couleur ou code hexadécimal couleur pour les présences.
#' @param coul_abs Caractère. Couleur ou code hexadécimal couleur pour les absences.
#'
#' @return Une liste contenant un graphique par paramètre environnemental.
#' @export
#'
#' @importFrom dplyr pull filter
#' @importFrom ggplot2 ggplot aes geom_density labs scale_x_continuous scale_fill_manual scale_x_log10
#' @importFrom purrr map
#' @importFrom stats quantile
#'
#' @examples
#' \dontrun{
#' mes_graphiques <- gg_density_env_esp(df = mon_df, espece = "BRO", quantile_max = 0.95,
#' log = c('surface_bv', 'distance_source'))
#' mes_graphiques[[1]]
#' }
gg_density_env_esp <-
  function(df,
           espece,
           parametres = NA,
           quantile_max = 0.99,
           log = c('surface_bv', 'distance_source', 'pente'),
           coul_pres = "blue",
           coul_abs = "red")

  {
    # liste des paramètres à considérer
    if (is.na(parametres))
    {
      parametres <- df %>%
        pull(parametre) %>%
        unique() %>%
        as.character
    }

    # Fonction pour un paramètre
    gg_density_env_pres_abs <- function(parametre, df, espece)

    {
      data <- df %>%
        filter(esp_code_alternatif == espece,
               parametre == !!parametre)  # bang bang force l'évaluation en premier lieu / synonymie

      x_max <- data %>%
        pull(valeur_parametre) %>%
        quantile(probs = c(quantile_max))

      plot <-
        ggplot(data = data,
               aes(x = valeur_parametre,
                   fill = presence)) +
        geom_density(alpha = 0.3) +
        labs(
          x = parametre,
          y = "densite",
          title = espece,
          fill = ""
        ) +
        scale_x_continuous(limits = c(NA, x_max)) +
        scale_fill_manual(values = c(coul_abs, coul_pres))

      if (!!parametre %in% log) { # Passage en échelle log pour certains des paramètres
        plot <- plot +
          scale_x_log10(labels = function(x) format(x, scientific = FALSE))
      }

      plot

    }

    # application à un ensemble de paramètres
    map(
      .x = parametres,
      .f = gg_density_env_pres_abs,
      df = df,
      espece = espece
    )
  }
