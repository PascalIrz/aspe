#' Exporter tous les dataframes de l'environnement en csv
#'
#' @param repertoire Texte. Chemin vers le répertoire où les fichiers csv seront stockés.
#'
#' @return Les fichiers csv
#' @export
#'
#' @importFrom purrr map
#'
#' @examples
#' \dontrun{
#' export_tables_csv(repertoire = "../output")
#' }
export_tables_csv <- function(repertoire = NA)

{

  if(is.na(repertoire)) repertoire <- getwd()

  ######################################
  lister_dfs <- function()

  {
    objets <- ls(globalenv())

    test_1obj <- function(obj) {
      is.data.frame(get(obj))
    }

    test <- map(.x = objets,
                .f = test_1obj)

    test %>%
      unlist()

  }
  #######################################

  exporter_df <- function(df_nom)

  {
    df <- get(df_nom, envir = globalenv())

    write.csv2(df,
               file = paste0(repertoire, "/", df_nom, ".csv"))

  }
  #################################

  map(.x = mes_dfs,
      .f = exporter_df)

}

