#' Produire le barplot des métriques IPR en fonction de l'année sur une station
#'
#'
#' @param df Le dataframe contenant les données nécessaires, dont les variables désignées par
#'     les arguments ci-dessous var_ ainsi que la variable **annee**.
#' @param var_station Caractère. Nom de la variable qui contient l'identifiant de la station.
#'     Par défaut prend la valeur "sta_id" pour une identification par ce champ dans la table
#'     "station" de la base.
#' @param station Caractère. Identifiant de la station.
#' @param var_metrique Caractère. Nom de la variable qui contient l'identifiant des métriques.
#' @param metriques_selection Vecteur caractères. Noms des métriques à représenter.
#'     Par défaut prend la valeur "opi_ipr" pour le champ IPR ainsi nommé dans la table "operation_ipr".
#' @param var_valeur_metrique Caractère. Nom de la variable qui contient les valeurs des métriques.
#' @param classes Caractère. Peut prendre les valeurs "IPR" (par défaut) ou "metriques". Pour l'IPR les
#'     seuils des classes de qualité sont 0, 5, 16, 25, 36. Comme l'IPR est la somme des 7 métriques, les seuils
#'     sont divisés par 7 si l'on représente les métriques individuelles.
#' @param palette_couleurs Vecteur caractères. Palette de 8 couleurs pour les 7 métriques + l'IPR agrégé.
#'     Par défaut empruntée à RColorBrewer::brewer.pal(n = 8, name = "Dark2").
#'
#' @return La graphique ggplot2.
#' @export
#'
#' @importFrom dplyr filter
#' @importFrom purrr set_names
#' @importFrom ggplot2 ggplot aes labs geom_rect scale_fill_manual geom_bar guide_legend
#' @importFrom ggplot2 scale_colour_manual scale_y_continuous expansion
#'
#' @examples
#' \dontrun{
#' df %>%
#' gg_ipr_metrique(
#'   var_station = "Sta_Ann",
#'   station = "Barr",
#'   var_metrique = "IPR_metriq",
#'   var_valeur_metrique = "valeur",
#'   metriques_selection = c("NER", "NEL", "NTE"),
#'   classes = "metriques"
#'   )
#' }
gg_ipr_metrique <- function(df,
                            var_station = "sta_id",
                            station,
                            var_metrique,
                            var_valeur_metrique,
                            metriques_selection = "opi_ipr",
                            classes = "IPR",
                            palette_couleurs = c("#1B9E77",
                                                 "#D95F02",
                                                 "#7570B3",
                                                 "#E7298A",
                                                 "#66A61E",
                                                 "#E6AB02",
                                                 "#A6761D",
                                                 "#666666"))

{
  # palette de couleurs pour les barres

  palette_couleurs <- palette_couleurs %>%
    set_names(df %>%
                pull(get(var_metrique)) %>%
                unique())

  palette_couleurs <- scale_colour_manual(name = var_metrique,
                                          values = palette_couleurs)

  # sélection des données
  df <- df %>%
    filter(
      get(var_station) == station,
      get(var_metrique) %in% metriques_selection,
      !is.na(get(var_valeur_metrique))
    )

  # valeur maxi
  maxi <- df %>%
    pull(get(var_valeur_metrique)) %>%
    max(na.rm = TRUE)

  # limites de classes théoriques ; si pas IPR on divise par 7
  limites_inf <- c(0, 5, 16, 25, 36)

  if (classes != "IPR")
  {
    limites_inf <- limites_inf / 7
  }

  # # nombre de classes
  n_cat <- sum(limites_inf < maxi)

  # limites de classes tenant compte de la distribution des données
  limites_fin <- c(limites_inf[1:(n_cat)], maxi)

  # # dataframe avec les limites des rectangles d'arrière-plan
  rects <-
    data.frame(
      ystart = limites_fin[1:(length(limites_fin) - 1)],
      yend = limites_fin[2:(length(limites_fin))],
      col = c("Excellent",
              "Bon",
              "M\u00e9diocre",
              "Mauvais",
              "Tr\u00e8s mauvais")[1:n_cat]
    )

  rects[nrow(rects), "yend"] <- Inf

  # graphique
  g <-
    ggplot() +
    geom_rect(
      data = rects,
      aes(
        xmin = -Inf,
        xmax = Inf,
        ymin = ystart,
        ymax = yend,
        fill = col
      ),
      alpha = 0.2
    ) +
    scale_fill_manual(
      values = c(
        "Excellent" = "blue",
        "Bon" = "green",
        "M\u00e9diocre" = "yellow",
        "Mauvais" = "orange",
        "Tr\u00e8s mauvais" = "red"
      ),
      guide = guide_legend(reverse = TRUE)
    ) +

    geom_bar(
      data = df,
      aes(
        x = as.factor(annee),
        y = get(var_valeur_metrique),
        col = get(var_metrique)
      ),
      stat = "identity",
      position = "dodge2",
      fill = "gray90",
      size = 2
    ) +
    labs(
      x = "Ann\u00e9e",
      y = "Valeur",
      title = station,
      fill = "Classe",
      col = "M\u00e9trique"
    ) +
    palette_couleurs +
    scale_y_continuous(expand = expansion(mult = c(0, 0.05)))

  g

}

