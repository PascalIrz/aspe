#' Produire l'histogramme de distribution des longueurs individuelles pour une opération
#'     de pêche
#'
#' @param indiv_df Le dataframe contanant les données nécessaires.
#' @param operation Entier. Identifiant de l'opération de pêche au sens du champ ope_id.
#' @param especes Vecteur caractères. Identifiants des codes espèces en trois lettres.
#'     Classiquement une seule espèce est désignée mais on peut préférer regrouper des
#'     sous-espèces avec des identifiants différents ou conserver les identifications
#'     au genre.
#' @param type_longueur Vecteur caractères. Intitulé(s) du ou des type(s) de longueur
#'     à prendre en compte pour construire l'histogramme. Trois modalités sont proposées,
#'     qui correspondent aux modélités du champ tlo_libelle de la table ref_type_longueur.
#' @param n_intervalles Nombre entier. Nombre d'intervalles de longueur sur l'axe des
#'     abscisses. La valeur par défaut est 30.
#'
#' @return L'histogramme. C'est un objet de classe ggplot qui peut donc être repris par la
#'     suite pour en modifier la mise en forme.
#' @export
#'
#' @aliases mei_grapher_histo_longueur
#'
#' @importFrom ggplot2 aes geom_histogram labs
#' @importFrom dplyr filter pull
#'
#' @examples
#' \dontrun{
#' gg_histo_longueur (indiv_df = data_ind_56,
#' operation = 6313,
#' especes = "GOU",
#' type_longueur = c("Fourche", "Estimée d'après le poids"),
#' n_intervalles = 25)
#' }
gg_histo_longueur <- function(indiv_df, operation, especes,
                              type_longueur = c("Totale", "Fourche",
                                                "Estim\\u00e9e d\\'apr\\u00e8s le poids"),
                              n_intervalles = 30)

{

  data_graph <- indiv_df %>%
    filter(ope_id == operation &
             esp_code_alternatif %in% especes &
             tlo_libelle %in% type_longueur)

  station <- data_graph %>%
    pull(pop_libelle) %>%
    as.character() %>%
    .[1]

  date <- data_graph %>%
    pull(ope_date) %>%
    format(format = '%d/%m/%Y') %>%
    .[1]

  titre <- paste(station, ' le ', date)

  legende <- paste(type_longueur, collapse = ", ")
  legende <- paste0('Type(s) de longueur(s) : ', legende)

  soustitre <- paste(especes, collapse = ", ")



  data_graph %>%
    ggplot(aes(x = mei_taille)) +
    geom_histogram(bins = n_intervalles) +
    labs(title = titre, subtitle = soustitre, caption = legende, x = 'Longueur (mm)', y = 'Effectif')


}
