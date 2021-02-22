#' Produire l'histogramme des longueurs ou des masses d'une espèce.
#'
#' @param df Dataframe contenant les données
#' @param code_espece Texte. Code à trois lettres de l'espèce.
#' @param variable Texte. La variable à représenter, soit "mei_taille", soit "mei_poids".
#' @param x_min Minimum de l'axe des abscisses.
#' @param x_max Maximum de l'axe des abscisses.
#'
#' @return Un graphique ggplot.
#' @export
#'
#' @importFrom dplyr filter
#' @importFrom ggplot2 ggplot aes geom_histogram geom_density labs scale_x_continuous
#'
#' @examples
#' \dontrun{
#' qtp_histo (df = tp_data,
#' code_espece = "ROT",
#' variable = "mei_taille",
#' x_max = 500)
#' }
#'
qtp_histo <- function(df,
                      code_espece,
                      variable = "mei_taille",
                      x_min = NA,
                      x_max = NA)

{

  data_esp <- df %>%
    filter(esp_code_alternatif == code_espece,
           mei_taille > 0,
           mei_poids > 0)

  n_ind <- nrow(data_esp) %>%
    format(big.mark = " ")

  titre <- paste0(code_espece, " : ", n_ind, " individus")

  etiquette_x <- ifelse(variable == "mei_poids", "Poids", "Longueur")

  ggplot(data = data_esp, aes(x = get(variable))) +
    geom_histogram(aes(y = ..density..), alpha = 0.5) +
    geom_density(color = "blue", size = 1) +
    labs(x = etiquette_x,
         y = "Densit\u00e9 de probabilit\u00e9",
         title = titre) +
    scale_x_continuous(limits = c(x_min, x_max))

}
