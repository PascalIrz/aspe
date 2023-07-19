#' Charger un extrait de la base Aspe qui permet d'effectuer des tests
#'
#' Ces données servent aussi aux vignettes.
#'
#' @return Les dataframes dans l'environnement de travail.
#' @export
#'
#' @importFrom purrr map
#'
#' @examples
#' \dontrun{
#' # chargement des données
#' misc_charger_donnees_test()
#'
#' # vérification que les dataframes sont bien accessibles
#' ls()
#'
#' # assemblage du jeu de données
#' passerelle <- aspe::mef_creer_passerelle()
#' }
misc_charger_donnees_test <- function(){
  all_dfs <- list.files(path = "../data",
                        full.names = TRUE)

  data_dfs <- list.files(path = "../data",
                         full.names = TRUE,
                         pattern = "^data_")

  test_dfs <- setdiff(all_dfs, data_dfs)

  map(.x = test_dfs,
      .f = load,
      envir = .GlobalEnv)
}
