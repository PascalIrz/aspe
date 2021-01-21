#' Produire l'histogramme de distribution des longueurs individuelles pour une opération
#'     de pêche.
#'
#' @param indiv_df Le dataframe contanant les données nécessaires.
#' @param operation L'identifiant de l'opération de pêche.
#' @param especes Vecteur caractères. Identifiants des codes espèces en trois lettres.
#'     Classiquement une seule espèce est désignée mais on peut préférer regrouper des
#'     sous-espèces avec des identifiants différents ou conserver les identifications
#'     au genre.
#' @param type_longueur Vecteur caractères. Intitulé(s) du ou des type(s) de longueur
#'     à prendre en compte pour construire l'histogramme. Trois modalités sont proposées,
#'     qui correspondent aux modélités du champ tlo_libelle de la table ref_type_longueur.
#'
#' @return L'histogramme. C'est un objet de classe ggplot qui peut donc être repris par la
#'     suite pour en modifier la mise en forme.
#' @export
#'
#' @importFrom ggplot2 aes geom_histogram labs
#' @importFrom dplyr filter pull
#'
#' @examples
#' \dontrun{
#' grapher_histo_longueur (indiv_df = data_ind_56,
#' operation = 6313,
#' especes = "GOU",
#' type_longueur = c("Fourche", "Estimée d'après le poids")
#' }
grapher_histo_longueur <- function(indiv_df, operation, especes,
                                   type_longueur = c("Totale", "Fourche",
                                                     "Estimée d'après le poids"))

{

  data_graph <- indiv_df %>%
    filter(ope_id == operation &
             esp_code_alternatif %in% especes &
             tlo_libelle %in% type_longueur)

  station <- data_graph %>%
    pull(sta_libelle_sandre) %>%
    as.character() %>%
    .[1]

  date <- data_graph %>%
    pull(ope_date) %>%
    format(format = '%d/%m/%Y') %>%
    .[1]

  titre <- paste(station, ' le ', date)

  soustitre <- paste(type_longueur, collapse = ", ")
  soustitre <- paste0('Type(s) de longueur(s) : ', soustitre)



  data_graph %>%
    ggplot(aes(x = mei_taille)) +
    geom_histogram() +
    labs(title = titre, subtitle = soustitre, x = 'Longueur (mm)', y = 'Effectif')


}
