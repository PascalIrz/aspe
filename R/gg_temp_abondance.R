#' Graphique de la série chronologique des abondances ou densités par espèce
#'
#'
#' @param df Dataframe contenant les données. Il doit contenir au moins lz variable "annee" ainsi
#'     que deux autres, l'une pour l'espèce et l'autre pour l'abondance ou la densité.
#' @param var_espece Nom de la variable contenant les identifiants des espèces.
#' @param var_abondance Nom de la variable contenant les valeurs d'abondance ou de densité
#' @param nb_colonnes Entier. Nombre (maxi) de colonnes de graphiques s'il y a plusieurs stations.
#'     Par défaut nb_colonnes = 4.
#'
#' @return Un graphique ggplot2.
#' @export
#'
#' @importFrom ggplot2 ggplot aes  geom_line labs facet_wrap  vars
#' @importFrom dplyr enquo filter group_by summarise pull mutate
#' @importFrom forcats fct_reorder
#'
#' @examples
#' \dontrun{
#' dept_densites_an %>%
#' filter(dept == mon_dept) %>%
#'   gg_temp_abondance(var_espece = esp_nom_commun,
#'                     var_abondance = densite_qd_pres_moy)
#' }
gg_temp_abondance <- function(df,
                              var_espece,
                              var_abondance,
                              nb_colonnes = 6)

{
  var_espece <- enquo(var_espece)
  var_abondance <- enquo(var_abondance)

  # vecteur des espèces avec au moins une densité non nulle
  mes_especes <- df %>%
    group_by(!!var_espece) %>%
    summarise(somme = sum(!!var_abondance)) %>%
    filter(somme > 0) %>%
    pull(!!var_espece)

  # filtrage des données et ordonnancement des espèces par abondance
  densites <- df %>%
    filter(!!var_espece %in% mes_especes) %>%
    mutate(!!var_espece := as.factor(!!var_espece)) %>%
    mutate(!!var_espece := fct_reorder(.f = !!var_espece,
                                       .x = !!var_abondance,
                                       .fun = sum,
                                       .desc = T))

  # graphique
  densites %>%
    ggplot(aes(x = annee,
               y = !!var_abondance)) +
    geom_line(size = 0.5) +
    labs(x = "",
         y = "") +
    facet_wrap(vars(!!var_espece),
               scales = "free_y",
               ncol = nb_colonnes)

}
