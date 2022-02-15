#' Ajouter un arrière plan de classes à un ggplot
#'
#' @param graphique Graphique ggplot.
#' @param df_classes Dataframe contenant les limites de classes comme classe_ipr.
#'
#' @return Le graphique complété par son arrière-plan coloré.
#'
#' @examples
#' \dontrun{
#' ggplot(data = data) %>%
#'   gg_ajouter_arriere_plan_int()
#' }
gg_ajouter_arriere_plan_int <- function(graphique, df_classes)

{

  graphique <- graphique +
    geom_rect(data = df_classes,
              aes(ymin = classe_borne_inf,
                  ymax = classe_borne_sup,
                  fill = classe_libelle),
              xmin = -Inf,
              xmax = Inf,
              alpha = 0.3) +
    scale_fill_manual(values = df_classes$classe_couleur) +
    scale_y_continuous(trans = "reverse",
                       expand = expansion(mult = c(0.05, 0.01)))

  graphique
}

