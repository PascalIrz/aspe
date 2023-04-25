#' Rajouter le libellé du site
#'
#' Rajoute à un dataframe le libellé du site, qui peut être le point ou la station.
#'
#' Cette fonction nécessite que les dataframes de la base Aspe soient chargés dans l'environnement.
#'
#' @param df Dataframe qui, selon le choix de l'argument "origine_libelle", doit contenir les variables
#'     "sta_id" et/ou "pop_id".
#' @param origine_libelle Caractère. Peut prendre les valeurs "point_wama", "station_sandre", ou "auto"
#'     car la base Aspe contient différents champs indiquant la localisation. La valeur par défaut est "auto",
#'     qui assure que le champ ne reste jamais vide (nécessaire pour certains traitements). Dans ce cas,
#'     le champ retourné est nommé "pop_libelle" et sa valeur est par priorités décroissantes
#'     "pop_libelle", "sta_libelle_sandre" et enfin "pop_id".
#' @return Le dataframe auquel ont été ajoutés les libellés.
#' @export mef_ajouter_libelle mef_ajouter_libelle_site
#'
#' @importFrom dplyr left_join select mutate_at mutate vars
#' @importFrom stringi stri_trans_general
#' @importFrom stringr str_to_lower
#'
#' @examples
#' \dontrun{
#' # chargement des packages
#'library(dplyr)
#'library(aspe)
#'
#' # chargement des données (à adapter)
#'load(file = "raw_data/tables_sauf_mei_2023_04_07_09_39_32.RData")
#'
#' # création du tableau
#' aspe_df <- mef_creer_passerelle() %>%
#'   mef_ajouter_libelle_site(origine_libelle = "station_sandre")
#' }
mef_ajouter_libelle_site <- function(df, origine_libelle = "auto")

{

  # gestion des cas où l'utisateur a mis des majuscules ou des accents
  origine_libelle <- str_to_lower(origine_libelle) %>%
    stri_trans_general(id = "Latin-ASCII")

  if(!(origine_libelle %in% c("point_wama", "station_sandre", "auto")))

  {

    stop("L'argument 'origine_libelle' est 'point_wama', 'station_sandre', ou 'auto'.")

  }else{

    if(origine_libelle == "point_wama") {
      df <- df %>%
        left_join(y = point_prelevement %>%
                    select(pop_id,
                           pop_libelle_wama))
    }

    if(origine_libelle == "station_sandre") {
      df <- df %>%
        left_join(y = station %>%
                    select(sta_id,
                           sta_libelle_sandre)) # %>%
       # mutate(sta_libelle_sandre = as.character(sta_libelle_sandre))
    }

    if(origine_libelle == "auto") {

      df <- df %>%
        left_join(y = point_prelevement %>%
                    select(pop_id,
                           pop_libelle = pop_libelle_wama)) %>%
        left_join(y = station %>%
                    select(sta_id,
                           sta_libelle_sandre)) %>%
        mutate_at(vars(pop_libelle,
                       sta_libelle_sandre),
                  as.character) %>%
        mutate(pop_libelle = ifelse(is.na(pop_libelle),
                                    sta_libelle_sandre,
                                    pop_libelle)) %>%
        mutate(pop_libelle = ifelse(is.na(pop_libelle),
                                    pop_id,
                                    pop_libelle)) %>%
        select(-sta_libelle_sandre)
    }

    df

  }

}
