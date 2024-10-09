#' Exporter les dataframes au format .RData
#'
#' @param repertoire Caractères. Chemin vers le répertoire où les fichiers seront écrits.
#' @param n_fichiers_mei Entier. Nombre de fichiers pour découper le dataframe des mesures individuelles.
#'
#' @return Les fichiers sont sauvegardés dans le répertoire choisi. Si aucun chemin n'est indiqué,
#'     ça sera dans un sous-répertoire "processed_data" du répertoire de travail qui est créé au besoin.
#'     Par défaut (n_fichiers_mei = 1) les fichiers sont au nombre de deux, l'un pour les mesures individuelles et l'autre pour les
#'     autres tables. Ils sont respectivement nommés mei_aaaa_mm_jj_hh_mm_ss (d'après les dates et heures
#'     de la sauvegarde), et tables_sauf_mei_aaaa_mm_jj_hh_mm_ss. Si n_fichiers_mei est supérieur à 1, il faudra
#'     ultérieurement empiler (ex avec rbind) les différents dataframes mei pour reconstituer la table complète.
#' @export
#'
#' @importFrom stringr str_replace str_replace_all
#' @importFrom dplyr mutate slice
#' @importFrom utils head
#'
#' @examples
#' \dontrun{
#' export_tables_rdata()
#' }
export_tables_rdata <- function(repertoire = NA, n_fichiers_mei = 1)

{

  # création du nom et répertoire de sortie s'ils ne sont pas indiqués
  if(is.na(repertoire))
  {

    if (!dir.exists("processed_data"))
    {
      dir.create("processed_data")
    }

    repertoire <- "processed_data/"

  }
  ################# tables sauf mei
  # nommage des fichiers. Pour éviter les risques d'écraser d'anciens fichiers,
  # nommage par date et heure par défaut

  fichier_tables_sauf_mei <- paste0(repertoire, "/tables_sauf_mei ", Sys.time(), ".RData") %>%
    str_replace(" CEST", "") %>%
    str_replace_all("-", "_") %>%
    str_replace_all(" ", "_") %>%
    str_replace_all(":", "_")

  # sauvegarde des tables sauf mei
  save(list = setdiff(ls(envir = globalenv()), "mesure_individuelle"),
       file = fichier_tables_sauf_mei)

  ############## mesures individuelles
  # constitution d'un tableau avec les index de début et fin des "tranches" de mei
  cuts <- round(nrow(mesure_individuelle) / n_fichiers_mei) * (1:n_fichiers_mei)
  cuts <- c(0, cuts)

  cuts <- data.frame(debut = cuts, fin = lead(cuts, 1)) %>%
    mutate(debut = 1 + debut) %>%
    head(-1) %>%
    mutate(fin = ifelse(is.na(fin), nrow(mesure_individuelle), fin))

  cuts[nrow(cuts), ncol(cuts)] <- nrow(mesure_individuelle)

  # itération sur les tranches
  for(n in 1:n_fichiers_mei)

  {

    # nommage comme ci-dessus
    fichier_mei <- paste0(repertoire, "/mei ", n, "_", Sys.time(), ".RData") %>%
      str_replace(" CEST", "") %>%
      str_replace_all("-", "_") %>%
      str_replace_all(" ", "_") %>%
      str_replace_all(":", "_")

    temp_df <- mesure_individuelle %>%
      slice(cuts$debut[n]:cuts$fin[n])

    # sauvegarde table mesure_individuelle
    save(temp_df, file = fichier_mei)
  }

}
