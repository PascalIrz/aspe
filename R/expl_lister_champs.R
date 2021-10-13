#' Lister les champs contenus dans les différents dataframes d'un fichier .RData
#'
#' @param rdata Caractère. Chemin vers le fichier .RData
#'
#' @return Un dataframe avec pour chacun des champs (colonnes) son nom et celui de la table
#'     qui le contient
#' @export
#'
#' @examples
#' \dontrun{
#' synthese <- expl_lister_champs('processed_data/toutes_tables_aspe_sauf_mei.RData')
#' }
expl_lister_champs <- function(rdata)

{

  load(rdata)

  map(.x = ls(),
      .f = function(x)

      {

        champs <- get(x) %>% colnames()
        table <- rep(x, length(champs))
        data.frame(champs, table)

      }

  ) %>%

    reduce(rbind)

}
