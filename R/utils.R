#' Taguer en dataframes ou non les objets dans globalEnv
#'
#' @return Booléen. Vecteur indiquant lesquels des objets sont des dataframes
#'
#' @noRd
#'
#' @examples
#' \dontrun{
#' # load some data
#' misc_charger_donnees_test()
#'
#' a <- 1
#' b <- "zegj"
#'
#' # tag the objects in the environment
#' tags <- lister_dfs()
#'
#' # assemble and view
#' data.frame(name = ls(),
#'            tags) %>%
#'            View
#' }
lister_dfs <- function()

{
  objets <- ls(envir = globalenv())

  test_1obj <- function(obj) {
    is.data.frame(get(obj))
  }

  test <- map(.x = objets,
              .f = test_1obj)

  test %>%
    unlist()

}


