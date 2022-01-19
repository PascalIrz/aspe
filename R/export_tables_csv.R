#' Exporter tous les dataframes de l'environnement au format .csv
#'
#' @param repertoire Caractères. Chemin vers le répertoire où les fichiers seront écrits.
#'
#' @return Les fichiers sont sauvegardés dans le répertoire choisi. Si aucun chemin n'est indiqué,
#'     ça sera dans un sous-répertoire "processed_data/csv" du répertoire de travail qui est créé au besoin.
#'
#' @export
#'
#' @importFrom purrr map2
#' @importFrom readr write_excel_csv2
#'
#' @examples
#' \dontrun{
#' export_tables_csv()
#' }
export_tables_csv <- function(repertoire = NA)

{

  # création du nom et répertoire de sortie s'ils ne sont pas indiqués
  if(is.na(repertoire))
  {

    if (!dir.exists("processed_data/csv"))
    {
      dir.create("processed_data/csv")
    }

    repertoire <- "processed_data/csv/"

  }

  # si le nom du répertoire ne se termine pas par un slash on le rajoute en vue de créer
  # les noms de fichiers
  if (str_detect(repertoire,
                 pattern = "/$",
                 negate = T))
  {
    repertoire <- paste0(repertoire, "/")
    }

  # identification des dataframes
  dfs <- ls()[sapply(ls(), function(x) class(get(x))) == 'data.frame']

  # création des noms de fichiers
  noms <- paste0(repertoire, dfs, ".csv")

  # création d'une liste contenant les dataframes
  dfs <- mget(dfs)

  # écriture des fichiers
  map2(.x = dfs,
       .y = noms,
       .f = write_excel_csv2,
  )


}
