#' Filtrer un jeu de données sur les années et les identifiants des stations.
#'
#' @param df Dataframe contenant les données, issu de la fonction extraire_ipr() ou au moins
#'     avec des colonnes "annee" et "sta_id".
#' @param stations_id Vecteur caractère contenant les identifiants (sta_id) des stations à
#'     représenter sur le graphique.
#' @param premiere_annee Numérique. Année de début de la période à représenter (incluse).
#'     Par défaut, c'est la première année de donnée sur l'ensemble des stations.
#' @param derniere_annee Numérique. Année de fin de la période à représenter (incluse).
#'     Par défaut, c'est la dernière année de donnée sur l'ensemble des stations.
#'
#' @return Le dataframe filtré.
#' @export
#'
#'
#' @examples
#' \dontrun{
#' ipr_depuis_2010 <- mef_filtrer_sta_annee(df = data_22,
#' premiere_annee = 2010)
#' }
mef_filtrer_sta_annee <- function(df, stations_id = NA, premiere_annee = NA,
                              derniere_annee = NA)

{

  # -----------------------------------------------------------
  # Filtrage des données selon les arguments
  # -----------------------------------------------------------
  # selon stations_id
  if (!is.na(stations_id)) df <- df %>% filter(sta_id %in% stations_id)

  # selon les années sélectionnées
  if (!is.na(premiere_annee))
  {
    df <- df %>% filter(annee >= premiere_annee)
  } else{
    premiere_annee <- min(df$annee, na.rm = T)
  }

  if (!is.na(derniere_annee))
  {
    df <- df %>% filter(annee <= derniere_annee)
  } else{
    derniere_annee <- max(df$annee, na.rm = T)
  }

  df

}





