#' Exporter les dataframes au format .RData
#'
#' @param repertoire Caractères. Chemin vers le répertoire où les fichiers seront écrits.
#'
#' @return Les fichiers sont sauvegardés dans le répertoire choisi.
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
