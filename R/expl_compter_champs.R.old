#' Sommer les champs contenus dans les différents dataframes d'un fichier .RData
#'
#' @param rdata Caractère. Chemin vers le fichier .RData
#'
#' @return La somme du nombre de champs dans chacun des dataframes
#' @export
#'
#' @importFrom purrr map reduce
#'
#' @examples
#' \dontrun{
#' expl_compter_champs('processed_data/toutes_tables_aspe_sauf_mei.RData')
#' [1] 748
#' }
expl_compter_champs <- function(rdata)

{

  load(rdata)

  map(.x = ls(),
      .f = function(x) {get(x) %>% ncol()}) %>%
    reduce(sum)

}
