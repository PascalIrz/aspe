#' Produire un graphique du pourcentage de stations en bon état au plan IPR sur un jeu de
#'     stations, en fonction de l'année
#'
#' @param ipr_df Dataframe contenant les données, issu de la fonction extraire_ipr().
#' @param titre Caractère. Titre du graphique.
#'
#' @return Le graphique issu de ggplot2.
#' @export
#'
#' @importFrom scales number_format
#' @importFrom ggplot2 aes geom_bar ggplot labs scale_x_continuous scale_y_continuous theme
#' @importFrom forcats fct_recode
#'
#' @aliases ipr_grapher_pc_bon
#'
#' @examples
#' \dontrun{
#' gg_temp_ipr_pc_bon(ipr_df = data_56,
#' titre = "Morbihan")
#' }
gg_temp_ipr_pc_bon <- function(ipr_df, titre = NA)

{

  premiere_annee <- min(ipr_df$annee)
  derniere_annee <- max(ipr_df$annee)

  pc_bon <- ipr_df %>%
    mutate(cli_libelle = fct_recode(cli_libelle,
                                    bon = "Excellent",
                                    bon = "Bon",
                                    pas_bon = "M\u00e9diocre",
                                    pas_bon = "Mauvais",
                                    pas_bon = "Tr\u00e8s mauvais")) %>%
    group_by(annee, cli_libelle) %>%
    summarise(n_pop = n_distinct(pop_id)) %>%
    ungroup() %>%
    pivot_wider(id_cols = annee,
                names_from = cli_libelle,
                values_from = n_pop) %>%
    mutate(pc_bon = 100 * bon / (bon + pas_bon))

  # -----------------------------------------------------------
  # Production du graphique
  # -----------------------------------------------------------

  ggplot(data = pc_bon, aes(x = annee, y = pc_bon)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(limits = c(0, NA)) +
    geom_bar(stat = "identity") +
    labs(y = "Pourcentage de stations en bon \u00e9tat d\'apr\u00e8s l\'IPR",
         title = titre) +
    scale_x_continuous(labels = scales::number_format(accuracy = 1, big.mark = ''),
                       breaks = seq(premiere_annee, derniere_annee, 2),
                       limits = c(premiere_annee - 0.5, derniere_annee + 0.5))

}


