#' Exporter les dataframes au format .RData
#'
#' @param repertoire Caractères. Chemin vers le répertoire où les fichiers seront écrits.
#'
#' @return Les fichiers sont sauvegardés dans le répertoire choisi. Si aucun chemin n'est indiqué,
#'     ça sera dans un sous-répertoire "processed_data" du répertoire de travail qui est créé au besoin.
#'     Les fichiers sont au nombre de deux, l'un pour les mesures individuelles et l'autre pour les
#'     autres tables. Ils sont respectivement nommés mei_aaaa_mm_jj_hh_mm_ss (d'après les dates et heures
#'     de la sauvegarde), et tables_sauf_mei_aaaa_mm_jj_hh_mm_ss.
#' @export
#'
#' @importFrom stringr str_replace str_replace_all
#'
#' @examples
#' \dontrun{
#' exp_tables_rdata()
#' }
exp_tables_rdata <- function(repertoire = NA)

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

  # nommage des fichiers. Pour éviter les risques d'écraser d'anciens fichiers,
  # nommage par date et heure par défaut
  fichier_mei <- paste0(repertoire, "mei ", Sys.time(), ".RData") %>%
    str_replace(" CEST", "") %>%
    str_replace_all("-", "_") %>%
    str_replace_all(" ", "_") %>%
    str_replace_all(":", "_")

  fichier_tables_sauf_mei <- paste0(repertoire, "tables_sauf_mei ", Sys.time(), ".RData") %>%
    str_replace(" CEST", "") %>%
    str_replace_all("-", "_") %>%
    str_replace_all(" ", "_") %>%
    str_replace_all(":", "_")

# sauvegarde table mesure_individuelle
  save(mesure_individuelle, file = fichier_mei)
# sauvegarde du reste
  save(setdiff(ls(), "mesure_individuelle"),
       file = fichier_tables_sauf_mei)

}
